/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
Ardhi Surya; rdsurya147@gmail.com; @rdcfc
 */
package ADM_helper;

import dBConn.Conn;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;
import main.RMIConnector;

/**
 *
 * @author Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
 */
public class MySession {

    //Comparison type
    private static final String MATCH_ALL = "1"; // userID.equals(SUPER_UID)
    private static final String MATCH_LAST_CHARACTER = "2";// userID.substring(userID.length - 1).equals(SUPER_UID)

    private static String SUPER_HFC_CD = "";
    private static String SUPER_UID = "";
    private static String COMPARE_TYPE = "";

    private String userID; //the userID when login
    private String hfc_cd; //the user assigned hfc
    private ArrayList<String> dataModule;
    private ArrayList<String> dataPage;
    private Conn con;

    private String sessionValidationMsg;

    //menu list for menu access permission
    private ArrayList<ArrayList<String>> listOfMenu;
    private ArrayList<ArrayList<String>> listOfAssignedMenu;

    public MySession() {
        // empty constructor. Only to be used to generateRandom and user
    }

    public MySession(String id, String hfc) {
        userID = id;
        hfc_cd = hfc;
        con = new Conn();

        sessionValidationMsg = "";

    }

    //function to generate first admin
    public String getAdminID() {
        String id = hfc_cd+"_ADM";
        String query="";
        int i=0;
        do {
            if(i>0){
                id = id+i;
            }
            query ="SELECT user_id from adm_users WHERE user_id = '"+id+"' limit 1 ;";
            i++;
        }while(con.getData(query).size()>0);
        
        return id;    
    }

    //function to get the user current role code
    public String getRoleCode() {

        String query = "Select role_code from adm_user_access_role where user_id='" + userID + "' and health_facility_code='" + hfc_cd + "' and status='0' Limit 1;";
        ArrayList<ArrayList<String>> dataRoleCode = con.getData(query);
        System.out.println("\n" + query);

        String role_code = "";

        if (dataRoleCode.size() > 0) {
            role_code = dataRoleCode.get(0).get(0);
        }

        return role_code;

    }

    public void initModulePageAccess() {
        //get the role code
        String query = "Select role_code from adm_user_access_role where user_id='" + userID + "' and health_facility_code='" + hfc_cd + "' and status='0'";
        ArrayList<ArrayList<String>> dataRoleCode = con.getData(query);
        System.out.println("\n\n" + query);

        String role_code = "";

        if (dataRoleCode.size() > 0) {
            role_code = dataRoleCode.get(0).get(0);
        }

        //............... getTheModules
        /*
            select distinct(ar.module_code)
            from adm_responsibility ar
            join adm_module m on m.module_code = ar.module_code and m.status = ar.status
            where ar.health_facility_code='99_iHIS_99' and ar.status='0' and ar.role_code='002'; 
         */
        query = "select distinct(ar.module_code) "
                + "from adm_responsibility ar "
                + "join adm_module m on m.module_code = ar.module_code and m.status = ar.status "
                + "join adm_system s on s.system_code=m.system_code and s.status=ar.status "
                + "where ar.health_facility_code='" + hfc_cd + "' and ar.status='0' and ar.role_code='" + role_code + "';";
        ArrayList<ArrayList<String>> tempModule = con.getData(query);
        System.out.println(query);

        dataModule = new ArrayList<String>();

        for (int i = 0; i < tempModule.size(); i++) {
            dataModule.add(tempModule.get(i).get(0));
        }

        //..........getThePages
        /*
           SELECT ar.page_code
        from adm_responsibility ar 
        join adm_page p on p.page_code=ar.page_code and p.status=ar.status
        where ar.health_facility_code='99_iHIS_99' and ar.status='0' and ar.role_code='002';
         */
        query = "SELECT ar.page_code "
                + "from adm_responsibility ar "
                + "join adm_page p on p.page_code=ar.page_code and p.status=ar.status "
                + "join adm_module m on m.module_code=p.module_code and m.system_code=p.system_code and m.status=ar.status "
                + "join adm_system s on s.system_code=p.system_code and s.status=ar.status "
                + "where ar.health_facility_code='" + hfc_cd + "' and ar.status='0' and ar.role_code='" + role_code + "';";
        ArrayList<ArrayList<String>> tempPage = con.getData(query);
        System.out.println(query);

        dataPage = new ArrayList<String>();

        for (int i = 0; i < tempPage.size(); i++) {
            dataPage.add(tempPage.get(i).get(0));
        }
    }

    public String getLongStringModule() {
        String module = String.join("|", dataModule);

        return module;
    }

    public String getLongStringPage() {
        String page = String.join("|", dataPage);

        return page;
    }

    public boolean isSessionValid(String sessionID) {
        boolean isValid = true;
        String curSessionID = "";
        String curLoginStatus = "";

        String query = "Select user_status, login_status from adm_users where user_id='" + userID + "' and status='0' limit 1;";

        ArrayList<ArrayList<String>> dataStatus = con.getData(query);

        if (dataStatus.size() > 0) {

            curSessionID = dataStatus.get(0).get(0);

            curLoginStatus = dataStatus.get(0).get(1);

        } else {
            sessionValidationMsg = "Your user information is not exist!";
            isValid = false;
            return isValid;
        }

        if (curLoginStatus.equalsIgnoreCase("0")) { // check wheter the user is still log in. 0-log out, 1-log in
            sessionValidationMsg = "You are logged out.";
            isValid = false;
            return isValid;
        } else if (!curSessionID.equalsIgnoreCase(sessionID)) { // check session id is the same or not. If not same means same id has been used to login somewhere...
            sessionValidationMsg = "Multiple login using the same ID has been detected!";
            isValid = false;
            return isValid;

        } else { // everything is ok... return true;
            return true;

        }

    }

    //function to get non valid session message
    public String getInvalidSessionMsg() {

        return sessionValidationMsg;
    }

    //function to generate session ID. Used when user is logging in.
    public String getRandomSessionID() {
        int length = 10; //length of the random string

        String candidateChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"; //possible characters in the random string

        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(candidateChars.charAt(random.nextInt(candidateChars.length())));
        }

        return sb.toString();

    }

    public void logOutUser() {

        RMIConnector rmic = new RMIConnector();

        String query = "Update adm_users set login_status = '0' where user_id = '" + userID + "';";

        rmic.setQuerySQL(con.HOST, con.PORT, query);
    }

    //Static function to set static variable to configure super user 
    public static void setPathToSuper(String lePath) throws IOException {

        try {

            String path = lePath;        //+"superConfig";

            File f = new File(path);

            BufferedReader b = new BufferedReader(new FileReader(f));

            String readLine = "";

            ArrayList<String> theLines = new ArrayList<String>();

            System.out.println("Reading file using Buffered Reader using path: " + path);

            while (((readLine = b.readLine()) != null) && theLines.size() <= 3) {
                theLines.add(readLine);
            }

            SUPER_HFC_CD = theLines.get(0).split("#")[0].trim();
            SUPER_UID = theLines.get(1).split("#")[0].trim();
            COMPARE_TYPE = theLines.get(2).split("#")[0].trim();

        } catch (IOException e) {
            System.out.println("Failed to find the superConfig file.");
            e.printStackTrace();

            //If failed... this is the default value...
            SUPER_HFC_CD = "99_iHIS_99";
            SUPER_UID = "9";
            COMPARE_TYPE = "2";
        }
    }

    //function to check whether user is a super user or not
    public boolean isSuperUser() {
        boolean isSuper = false;

        //compare the hfc first
        isSuper = hfc_cd.equals(SUPER_HFC_CD);

        //compare user id based on type of comparison
        if (isSuper) {
            if (COMPARE_TYPE.equalsIgnoreCase(MATCH_LAST_CHARACTER)) {
                //compare the last character
                isSuper = userID.substring(userID.length() - 1).equals(SUPER_UID);
            } else if (COMPARE_TYPE.equalsIgnoreCase(MATCH_ALL)) {
                //compare all
                isSuper = userID.equals(SUPER_UID);
            }
        }

        return isSuper;
    }

    //function to check module access
    public boolean haveModuleAccess(String moduleCode) {
        boolean access = true;

        access = isSuperUser();

        // if super, skip this checking
        if (access) {
            return access;

        }

        //Search module in database based on role code and the module code. If record found more than 0 row, return true;
        String role_code = getRoleCode();

        String query = "select ar.module_code "
                + "from adm_responsibility ar "
                + "join adm_module m on m.module_code = ar.module_code and m.status = ar.status "
                + "join adm_system s on s.system_code=m.system_code and s.status=ar.status "
                + "where ar.health_facility_code='" + hfc_cd + "' and ar.status='0' and ar.role_code='" + role_code + "' and ar.module_code='" + moduleCode + "' Limit 1;";
        ArrayList<ArrayList<String>> tempModule = con.getData(query);
        System.out.println("\n" + query);

        access = tempModule.size() > 0;

        return access;

    }

    public static String getSuperString() {
        return SUPER_HFC_CD + SUPER_UID + COMPARE_TYPE;
    }

    public boolean hasMenuAccess(String menu_cd) {
        if (isSuperUser()) {
            return true;
        }

        boolean isMenuExist, isMenuActive, isMenuEnabled;

        isMenuExist = isMenuActive = isMenuEnabled = false;

        for (int i = 0; i < listOfMenu.size(); i++) {

            if (menu_cd.equalsIgnoreCase(listOfMenu.get(i).get(0))) {
                isMenuExist = true;
                isMenuActive = "0".equalsIgnoreCase(listOfMenu.get(i).get(1));
                isMenuEnabled = "0".equalsIgnoreCase(listOfAssignedMenu.get(i).get(1));
                listOfMenu.remove(i);
                listOfAssignedMenu.remove(i);
                break;
            }
        }//end for loop;

        if (!isMenuExist) {
            return true;
        } else if (isMenuActive && isMenuEnabled) {
            return true;
        } else {
            return false;
        }

    }

    public void initiateMenuList(String module_cd, String page_cd) {

        String query = "SELECT menu_cd, status FROM adm_menu WHERE module_cd='" + module_cd + "' AND page_cd='" + page_cd + "' order by menu_cd;";
        listOfMenu = con.getData(query);

        if (listOfMenu.size() > 0) {

            String role_cd = getRoleCode().trim();
            query = "SELECT menu_cd, status FROM adm_responsibility_detail WHERE module_cd='" + module_cd + "' AND page_cd='" + page_cd + "' AND role_cd='" + role_cd + "' AND hfc_cd='" + hfc_cd + "' order by menu_cd;";
            listOfAssignedMenu = con.getData(query);

            if (listOfMenu.size() > listOfAssignedMenu.size()) {
                query = "INSERT IGNORE INTO adm_responsibility_detail(role_cd, system_cd, module_cd, page_cd, menu_cd, hfc_cd, status, created_by, created_date) "
                        + "SELECT '" + role_cd + "', system_cd, module_cd, page_cd, menu_cd, '" + hfc_cd + "', '0', '" + userID + "', now() FROM adm_menu WHERE module_cd='" + module_cd + "' AND page_cd='" + page_cd + "';";

                if (new RMIConnector().setQuerySQL(con.HOST, con.PORT, query)) {
                    query = "SELECT menu_cd, status FROM adm_responsibility_detail WHERE module_cd='" + module_cd + "' AND page_cd='" + page_cd + "' AND role_cd='" + role_cd + "' AND hfc_cd='" + hfc_cd + "' order by menu_cd;";
                    listOfAssignedMenu = con.getData(query);
                }
            }

        } else {
            listOfAssignedMenu = new ArrayList<ArrayList<String>>();
        }

    }

}
