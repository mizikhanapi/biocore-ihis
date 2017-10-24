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
}
