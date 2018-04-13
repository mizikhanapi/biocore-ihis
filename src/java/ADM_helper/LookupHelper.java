/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADM_helper;

import dBConn.Conn;
import java.util.ArrayList;

/**
 *
 * @author user
 */
public class LookupHelper {
    Conn con;
    String hfc_cd;
    
    public LookupHelper(String hfc){
        con = new Conn();
        this.hfc_cd=hfc;
    }
    
    public String getCurrentHFCName(){
        String name="";
        
        String query="Select hfc_name from adm_health_facility where hfc_cd='"+hfc_cd+"' limit 1;";
        ArrayList<ArrayList<String>> data = con.getData(query);
        
        if(data.size()>0){
            name = data.get(0).get(0);
        }
        
        return name;
    }
    
    public String getHFCName(String hfc){
        String name="";
        String query="Select hfc_name from adm_health_facility where hfc_cd='"+hfc+"' limit 1;";
        ArrayList<ArrayList<String>> data = con.getData(query);
        if(data.size()>0){
            name = data.get(0).get(0);
        }
        return name;
    }
    
    public String getUserName(String user_id){
        String name = user_id;
        
        String query = "Select user_name from adm_users where user_id='"+user_id+"' limit 1;";
        
        ArrayList<ArrayList<String>> data = con.getData(query);
        if(data.size()>0){
            name = data.get(0).get(0);
        }
        
        return name;
    }
    
    
    public String getLookupDetailDescription(String master_cd, String detail_cd){
        String detail="";
        
        String query ="Select description from adm_lookup_detail where master_reference_code='"+master_cd+"' AND detail_reference_code='"+detail_cd+"' AND hfc_cd='"+hfc_cd+"' limit 1;";
        ArrayList<ArrayList<String>> data = con.getData(query);
        if(data.size()>0){
            detail = data.get(0).get(0);
        }
        
        return detail;
    }
    
    public ArrayList<ArrayList<String>> getListOfDetailCodeNameFlex(String master_cd, String key){
        String query = "Select detail_reference_code, description FROM adm_lookup_detail "
                + "WHERE master_reference_code = '"+master_cd+"' AND hfc_cd = '" + hfc_cd + "' AND status = '0' AND description like '%"+key+"%' "
                + "ORDER BY priority_indicator desc, description";
        
        return con.getData(query);
    }
}
