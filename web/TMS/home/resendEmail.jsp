<%-- 
    Document   : resendEmail
    Created on : Apr 23, 2018, 12:04:57 PM
    Author     : user
--%>

<%@page import="ADM_helper.Emailer"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="ADM_helper.MySession"%>
<%@page import="org.json.JSONObject"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String hfc_cd = request.getParameter("hfc_cd");
    String hfc_name = request.getParameter("hfc_name");
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);
    String user_name = (String) session.getAttribute(MySessionKey.USER_NAME);

    Conn con = new Conn();

    JSONObject json = new JSONObject();
    boolean isValid = false;
    String jMsg = "";
    boolean hasLookup = false;

    String query = "SELECT `EMAIL` FROM adm_users WHERE `USER_ID`='" + user_id + "';";
    //get the user email address
    ArrayList<ArrayList<String>> arrEmail = con.getData(query);
    String user_email = "";
    if (arrEmail.size() > 0) {
        user_email = arrEmail.get(0).get(0);
    }

    RMIConnector rmi = new RMIConnector();

    //check discipline exist?; select discipline_cd, discipline_name from adm_discipline where discipline_cd='001' AND discipline_hfc_cd='04010101' limit 1;
    //subdiscipline exist?; select subdiscipline_name from adm_subdiscipline where discipline_cd='001' AND subdiscipline_cd='001' AND subdiscipline_hfc_cd='04010101' limit 1;
    query = "select discipline_cd, discipline_name from adm_discipline where discipline_cd='001' AND discipline_hfc_cd='" + hfc_cd + "' limit 1;";
    if (con.getData(query).size() < 1) {
        //insert discipline
        query = "INSERT INTO adm_discipline values('001', 'Outpatient', '', '', '', '" + user_id + "', now(), '0', '" + hfc_cd + "' )";
        rmi.setQuerySQL(con.HOST, con.PORT, query);

    }

    //subdiscipline exist?;
    query = "select subdiscipline_name from adm_subdiscipline where discipline_cd='001' AND subdiscipline_cd='001' AND subdiscipline_hfc_cd='04010101' limit 1;";
    if (con.getData(query).size() < 1) {
        query = "INSERT INTO adm_subdiscipline values('001', '001', 'Outpatient', '', '" + user_id + "', now(), '0', '" + hfc_cd + "')";
        rmi.setQuerySQL(con.HOST, con.PORT, query);

        query = "INSERT INTO adm_hfc_discipline(hfc_cd, discipline_cd, subdiscipline_cd, created_by, created_date, hfc_discipline_status) "
                + "VALUES('" + hfc_cd + "', '001', '001', '" + user_id + "', now(), '0')";
        rmi.setQuerySQL(con.HOST, con.PORT, query);
    }

    //check role exist; SELECT role_name FROM adm_role WHERE role_code='001' AND hfc_cd='99_iHIS_99';
    query = "SELECT role_name FROM adm_role WHERE role_code='001' AND hfc_cd='" + hfc_cd + "';";
    if (con.getData(query).size() < 1) {
        query = "insert into adm_role(role_code, role_name, status, created_by, created_date, hfc_cd) "
                + "select role_code, role_name, status, '" + user_id + "', now(), '" + hfc_cd + "' "
                + "from adm_role where hfc_cd = '99_iHIS_99'";
        rmi.setQuerySQL(con.HOST, con.PORT, query);
    }

    //check lookup detail; select count(detail_reference_code) from adm_lookup_detail where hfc_cd='04010101';
    query = "select count(detail_reference_code) from adm_lookup_detail where hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> arrLookup = con.getData(query);
    if (arrLookup.size() > 0) {
        int intLookup = Integer.parseInt(arrLookup.get(0).get(0));

        if (intLookup > 2000) {
            hasLookup = true;
        }
    }

    //check user exist?; select user_id, user_name, `password`, new_icno from adm_users where user_id like 'MMUC%ADM%' AND health_facility_code='MMUC' limit 1;
    query = "select user_id, `password` from adm_users where user_id like 'MMUC%ADM%' AND health_facility_code='MMUC' limit 1;";
    ArrayList<ArrayList<String>> arrAdmin = con.getData(query);
    String adminID = "";
    String adminPwd = "";

    if (arrAdmin.size() > 0) {
        adminID = arrAdmin.get(0).get(0);
        adminPwd = arrAdmin.get(0).get(1);

        //check user_access_role exist?; SELECT user_id from adm_user_access_role WHERE `USER_ID`='' AND `HEALTH_FACILITY_CODE`='' AND `DISCIPLINE_CODE`='' AND `SUBDISCIPLINE_CODE`='';
        query = "SELECT user_id from adm_user_access_role WHERE `USER_ID`='" + adminID + "' AND `HEALTH_FACILITY_CODE`='" + hfc_cd + "' AND `DISCIPLINE_CODE`='001' AND `SUBDISCIPLINE_CODE`='001';";
        if (con.getData(query).size() < 1) {
            //assign role to user
            query = "Insert into adm_user_access_role(user_id, discipline_code, subdiscipline_code, health_facility_code, role_code, `STATUS`) "
                    + "values('" + adminID + "', '001', '001', '" + hfc_cd + "', '001', '0')";
            rmi.setQuerySQL(con.HOST, con.PORT, query);
        }
    } else {
        //create user
        String timestamp = new Timestamp(System.currentTimeMillis()).toString();
        MySession temp_mys = new MySession(user_id, hfc_cd);
        adminID = temp_mys.getAdminID();
        adminPwd = temp_mys.getRandomSessionID();
        query = "INSERT INTO adm_users (user_id, health_facility_code, user_name, password, occupation_code, birth_date, sex_code, new_icno, home_phone, office_phone, mobile_phone, fax_no, email, id_category_code, start_date, end_date, title, nationality_code, user_type, user_group, user_classification_code, status, created_by, created_date, mother_name, room_no, picture, login_status, user_status) "
                + "VALUES('" + adminID + "', '" + hfc_cd + "', '" + hfc_cd + " Admin', '" + adminPwd + "', '001', now(), '001', '" + adminID + "', '', '', '', '', '" + user_email + "', '', '" + timestamp + "', '9999-12-31 00:00:00', '002', '001', 'STAFF', '', '', '0', '" + user_id + "', now(), '-', '01', '', '0', '0')";
        rmi.setQuerySQL(con.HOST, con.PORT, query);
        //assign role to user
        query = "Insert into adm_user_access_role(user_id, discipline_code, subdiscipline_code, health_facility_code, role_code, `STATUS`) "
                + "values('" + adminID + "', '001', '001', '" + hfc_cd + "', '001', '0')";
        rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    
    //check responsibility exist?;
    query = "SELECT health_facility_code FROM adm_responsibility WHERE role_code='001' AND health_facility_code='"+hfc_cd+"' limit 1;";
    if(con.getData(query).size()<1){
        query = "insert into adm_responsibility(role_code, system_code, module_code, page_code, health_facility_code, status, created_by, created_date) "
                    + "select role_code, system_code, module_code, page_code, '" + hfc_cd + "', status, '" + user_id + "', now() from adm_responsibility "
                    + "WHERE health_facility_code = '99_iHIS_99'";
        rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    
    String em_msg = "<h3>Good day dear " + user_name + "!</h3>"
            + "<br/></br>"
            + "<p>We are glad to inform you that the registration of " + hfc_name + " is approved!</p>"
            + "<p>Below are the details of the User ID to log into the health facility.</p>"
            + "<p>  User ID: " + adminID + "</p>"
            + "<p>  Password: " + adminPwd + "</p>"
            + "<p>  User IC: " + adminID + "</p>"
            + "<p>  Mother's Name: -</p>"
            + "<br/><p>It is advisable for you to change the password later. Enjoy!</p>";
    Emailer emailer = new Emailer(user_email, "Health Facility Registration Approval", em_msg);
    isValid = emailer.sendTextEmail();
    jMsg = "A notification email is resent to " + user_email;
    
    json.put("msg", jMsg);
    json.put("isValid", isValid);
    json.put("hasLookup", hasLookup);
    
    out.print(json.toString());
%>
