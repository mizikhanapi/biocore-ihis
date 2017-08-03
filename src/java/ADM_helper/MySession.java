/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADM_helper;

import dBConn.Conn;
import java.util.ArrayList;
import java.util.Random;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class MySession {
    
    private String userID; //the userID when login
    private String hfc_cd; //the user assigned hfc
    private ArrayList<ArrayList<String>> dataModule;
    private ArrayList<ArrayList<String>> dataPage;
    private Conn con;
    
    public MySession(){
        // empty constructor. Only to be used to generateRandom.
    }
        
    public MySession(String id, String hfc){
        userID=id;
        hfc_cd=hfc;
        con = new Conn();
    }
    
    public void initModulePageAccess(){
        //get the role code
        String query="Select role_code from adm_user_access_role where user_id='"+userID+"' and health_facility_code='"+hfc_cd+"' and status='0'";
        ArrayList<ArrayList<String>> dataRoleCode = con.getData(query);
        
        String role_code="";
        
        if(dataRoleCode.size()>0)
            role_code= dataRoleCode.get(0).get(0);
        
        //getTheModules
        query="Select distinct(module_code) from adm_responsibility where role_code = '" + role_code + "' AND status = '0' "
            + "AND health_facility_code = '" + hfc_cd + "';";
        dataModule = con.getData(query);
        
        
        //getThePages
        query="Select page_code from adm_responsibility where role_code = '" + role_code + "' AND status = '0' "
                        + "AND health_facility_code = '" + hfc_cd + "';";
        dataPage = con.getData(query);
    }
    
    public boolean isSessionValid(String sessionID){
        boolean isValid=true;
        
        String query="Select user_status from adm_users where user_id='"+userID+"' and status='0' limit 1;";
        
        ArrayList<ArrayList<String>> dataStatus = con.getData(query);
        
        if(dataStatus.size()>0){
            
            String curSessionID = dataStatus.get(0).get(0);
            
            isValid = sessionID.equalsIgnoreCase(curSessionID);
        
        }
        else{
        
            isValid=false;
        }
        
        
        return isValid;
    }
    
    public String getRandomSessionID(){
        int length = 10;
        
        String candidateChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(candidateChars.charAt(random.nextInt(candidateChars.length())));
        }

        return sb.toString();
    
    }
    
    public void logOutUser(){
    
        RMIConnector rmic = new RMIConnector ();
        
        String query = "Update adm_users set login_status = '0' where user_id = '"+userID+"'";

        rmic.setQuerySQL(con.HOST, con.PORT, query);
    }
    
}
