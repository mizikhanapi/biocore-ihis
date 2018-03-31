/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADM_helper;

import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;
import org.json.JSONObject;

/**
 *
 * @author user
 */
public class Menu {

    String hfc_cd;
    String role_cd;
    Conn con;

    public Menu(String hfc_cd, String role_cd) {
        this.hfc_cd = hfc_cd;
        this.role_cd = role_cd;
        con = new Conn();
    }

    public StringBuilder printHTMLChild(String parent_cd, int level, String module_cd, String page_cd) {

        StringBuilder sb = new StringBuilder();

        int em = 3 * (level - 1);

        //                           0          1           2                   3          4
        String query = "SELECT me.menu_cd, me.menu_name, me.menu_level, me.parent_cd, rd.status "
                + "FROM adm_responsibility_detail rd "
                + "JOIN adm_menu me ON me.module_cd=rd.module_cd AND me.page_cd=rd.page_cd AND me.menu_cd=rd.menu_cd "
                + "WHERE me.status='0' AND me.menu_level=" + level + " AND me.parent_cd='" + parent_cd + "' AND rd.hfc_cd='" + hfc_cd + "' AND rd.role_cd='" + role_cd + "' AND rd.module_cd='" + module_cd + "' AND rd.page_cd='" + page_cd + "';";

        ArrayList<ArrayList<String>> arrData = con.getData(query);

        if (arrData.size() > 0) {
            for (ArrayList<String> arr1 : arrData) {
                String hiddenVal = String.join("|", arr1);
                String status = "<span class='text-primary'>Enabled</span>";
                String disabled_1 = "";
                String disabled_2 = "";
                if (!"0".equals(arr1.get(4))) {
                    status = "<span class='text-danger'>Disabled</span>";
                    disabled_2 = "disabled";
                } else {
                    disabled_1 = "disabled";
                }
                sb.append("<tr>");
                sb.append("<td>" + arr1.get(0) + "</td>");
                sb.append("<td><span style='padding-left:" + em + "em'>" + arr1.get(1) + "</span></td>");
                sb.append("<td>" + arr1.get(2) + "</td>");
                sb.append("<td>" + status + "</td>");
                sb.append("<td>");
                sb.append("<input type='hidden' id='MENU_hidden' value='" + hiddenVal + "'>");
                sb.append("<div style=\"display:inline-block; vertical-align: middle;\">");
                sb.append("<button id='MENU_btnEnable' class='btn btn-success' title='Enable Menu' " + disabled_1 + "><i class='fa fa-check-circle'></i></button> ");
                sb.append("<button id='MENU_btnDisable' class='btn btn-danger' title='Disable Menu' " + disabled_2 + "><i class='fa fa-minus-circle'></i></button>");
                sb.append("</div>");
                sb.append("</td>");
                sb.append("</tr>");

                String temp_parent_cd = arr1.get(0);
                int temp_level = Integer.parseInt(arr1.get(2)) + 1;

                sb.append(printHTMLChild(temp_parent_cd, temp_level, module_cd, page_cd).toString());
            }

        }

        return sb;
    }

    public JSONObject enableMenu(String module_cd, String page_cd, String menu_cd) {
        RMIConnector rmi = new RMIConnector();
        boolean isValid;

        String query = "UPDATE adm_responsibility_detail SET status='0' "
                + "WHERE module_cd='" + module_cd + "' AND page_cd='" + page_cd + "' AND menu_cd='" + menu_cd + "' AND role_cd='" + role_cd + "' AND hfc_cd='" + hfc_cd + "';";
        isValid = rmi.setQuerySQL(con.HOST, con.PORT, query);

        if (isValid) {
            query = "SELECT parent_cd FROM adm_menu "
                    + "WHERE module_cd='" + module_cd + "' AND page_cd='" + page_cd + "' AND menu_cd='" + menu_cd + "';";

            ArrayList<ArrayList<String>> arrList = con.getData(query);

            if (arrList.size() > 0) {
                return enableMenu(module_cd, page_cd, arrList.get(0).get(0));
                
            }

        }

        JSONObject json = new JSONObject();
        json.put("isValid", isValid);
        json.put("query", query);

        return json;
    }

    public JSONObject disableMenu(String module_cd, String page_cd, String menu_cd) {
        RMIConnector rmi = new RMIConnector();
        JSONObject json;
        boolean isValid;

        String query = "UPDATE adm_responsibility_detail SET status='1' "
                + "WHERE module_cd='" + module_cd + "' AND page_cd='" + page_cd + "' AND menu_cd='" + menu_cd + "' AND role_cd='" + role_cd + "' AND hfc_cd='" + hfc_cd + "';";
        isValid = rmi.setQuerySQL(con.HOST, con.PORT, query);

        if (isValid) {
            query = "SELECT menu_cd FROM adm_menu "
                    + "WHERE module_cd='" + module_cd + "' AND page_cd='" + page_cd + "' AND parent_cd='" + menu_cd + "';";

            ArrayList<ArrayList<String>> arrList = con.getData(query);

            if (arrList.size() > 0) {
                for(ArrayList<String> arr1 : arrList){
                    json = disableMenu(module_cd, page_cd, arr1.get(0));
                    if(!json.getBoolean("isValid"))
                        return json;
                }                
                
            }

        }

        json = new JSONObject();
        json.put("isValid", isValid);
        json.put("query", query);

        return json;
    }

}
