/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADM_helper;

import dBConn.Conn;
import org.json.JSONObject;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class ResponsibilityHelper {

    String hfc_cd;
    String role_cd;
    String status;
    String creator;
    boolean isCurPageExist;
    
    String[] systems;
    String[] modules;
    String[] pages;

    ArrayList<String> curPages;
    ArrayList<String> curModules;

    Conn con;

    public ResponsibilityHelper(String[] systems, String[] modules, String[] pages, String role_cd, String hfc_cd, String status, String creator) {
        this.systems = systems;
        this.modules = modules;
        this.pages = pages;
        this.role_cd = role_cd;
        this.hfc_cd = hfc_cd;
        this.creator = creator;
        this.status = status;
        this.con = new Conn();
        curPages = new ArrayList<String>();
        curModules = new ArrayList<String>();
        String query = "SELECT page_code, module_code FROM adm_responsibility "
                + "WHERE role_code = '" + role_cd + "' AND health_facility_code='" + hfc_cd + "';";

        ArrayList<ArrayList<String>> tempArr = con.getData(query);

        if (tempArr.size() > 0) {
            this.isCurPageExist = true;
            for (int i = 0; i < tempArr.size(); i++) {
                curPages.add(tempArr.get(i).get(0));
                curModules.add(tempArr.get(i).get(1));
            }
        } else {
            this.isCurPageExist = false;
        }
    }

    private ArrayList<Integer> getIndexDiffferenceToDelete() {

        ArrayList<Integer> arrDelete = new ArrayList<Integer>();
        boolean contains = false;

        for (int i = 0; i < curPages.size(); i++) {
            for (int j = 0; j < pages.length; j++) {
                if (curPages.get(i).equals(pages[j])) {
                    contains = true;
                    break;
                }
            }//end for loop
            if (!contains) {
                arrDelete.add(i);
            } else {
                contains = false;
            }
        }// end outer loop

        return arrDelete;
    }

    private ArrayList<Integer> getIndexDiffferenceToInsert() {

        ArrayList<Integer> arrInsert = new ArrayList<Integer>();
        boolean contains = false;

        for (int i = 0; i < pages.length; i++) {
            for (int j = 0; j < curPages.size(); j++) {
                if (pages[i].equals(curPages.get(j))) {
                    contains = true;
                    break;
                }
            }//end for loop
            if (!contains) {
                arrInsert.add(i);
            } else {
                contains = false;
            }
        }// end outer loop

        return arrInsert;
    }

    private JSONObject insertPages(ArrayList<Integer> ins) {
        JSONObject json = new JSONObject();
        boolean isSuccess = true;
        String msg = "";
        String query = "";
        if (ins.size() > 0) {
            RMIConnector rmi = new RMIConnector();
            for (int i = 0; i < ins.size(); i++) {
                query =  "INSERT INTO adm_responsibility(role_code, system_code, module_code, page_code, health_facility_code, status, created_by, created_date) "
                + "VALUES('" + role_cd + "', '" + systems[ins.get(i)] + "', '" + modules[ins.get(i)] + "', '" + pages[ins.get(i)] + "', '" + hfc_cd + "', '" + status + "', '" + creator + "', now())";
                
                isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
                
                if(!isSuccess){
                    msg = "Failed while inserting into adm_responsibility";
                    break;
                }
                
                query = "INSERT INTO adm_responsibility_detail(role_cd, system_cd, module_cd, page_cd, menu_cd, hfc_cd, status, created_by, created_date) "
                        + "SELECT '"+role_cd+"', system_cd, module_cd, page_cd, menu_cd, '"+hfc_cd+"', '"+status+"', '"+creator+"', now() FROM adm_menu WHERE module_cd='" + modules[ins.get(i)] + "' AND page_cd='" + pages[ins.get(i)] + "';";
                isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
                
                if(!isSuccess){
                    msg="Failed while inserting into adm_resposibility_detail";
                    break;
                }
                
            }//end for
                      
        }

        json.put("msg", msg);
        json.put("isValid", isSuccess);
        json.put("query", query);
        return json;
    }
    
    private JSONObject deletePages(ArrayList<Integer> del){
        JSONObject json = new JSONObject();
        boolean isSuccess = true;
        String msg = "";
        String query = "";
        if (del.size() > 0) {
            RMIConnector rmi = new RMIConnector();
            for (int i = 0; i < del.size(); i++) {
                query =  "DELETE FROM adm_responsibility WHERE role_code='"+role_cd+"' AND health_facility_code='"+hfc_cd+"' AND module_code='"+curModules.get(del.get(i))+"' AND page_code='"+curPages.get(del.get(i))+"';";
                
                isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
                
                if(!isSuccess){
                    msg = "Failed while deleting from adm_responsibility";
                    break;
                }
                
                query = "DELETE FROM adm_responsibility_detail WHERE hfc_cd='"+hfc_cd+"' AND role_cd='"+role_cd+"' AND module_cd='"+curModules.get(del.get(i))+"' AND page_cd='"+curPages.get(del.get(i))+"';";
                isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
                
                if(!isSuccess){
                    msg="Failed while deleting from adm_resposibility_detail";
                    break;
                }
                
            }//end for
                      
        }

        json.put("msg", msg);
        json.put("isValid", isSuccess);
        json.put("query", query);
        return json;
    }

    public JSONObject setAdmPage() {
        JSONObject json;

        // insert new pages to database
        json = insertPages(getIndexDiffferenceToInsert());
        if(!json.getBoolean("isValid")){
            return json;
        }

        //if got old pages, delete the differences.
        if(isCurPageExist){
            json = deletePages(getIndexDiffferenceToDelete());
            if(!json.getBoolean("isValid")){
                return json;
            }
        }
        
        String msg = "Success assigning pages to the role!";
        json.put("msg", msg);
        return json;
    }

}// end class
