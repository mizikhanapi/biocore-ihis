<%-- 
    Document   : registerProcessRegisterUser
    Created on : Aug 7, 2018, 8:20:47 PM
    Author     : Shammugam
--%>

<%@page import="ADM_helper.Emailer"%>
<%@page import="ADM_helper.MySession"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONObject"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Getting Parameter
    String user_id = request.getParameter("user_id");
    String user_phone = request.getParameter("user_phone");
    String user_pass = request.getParameter("user_pass");
    String user_question = request.getParameter("user_question");
    String user_answer = request.getParameter("user_answer");
    String user_name = request.getParameter("user_name");
    String user_title = request.getParameter("user_title");
    String user_gender = request.getParameter("user_gender");
    String user_ic = request.getParameter("user_ic");
    String user_birth = request.getParameter("user_birth");

    // Status To Get As Return
    final String SUCCESS = "Registered";
    final String FAILED = "Failed";

    // Variable to Assign Value
    String status = "";

    // Connection 
    Conn con = new Conn();

    MySession mys = new MySession();
    String random = mys.getRandomSessionID();

    RMIConnector rmi = new RMIConnector();
    String query = "INSERT INTO adm_users "
            + " ( user_id, user_name, status, user_type, user_group, id_category_code, new_icno, birth_date, sex_code, mobile_phone, email, password, title, "
            + " question , answer , created_date, created_by , health_facility_code, start_date, end_date, user_status, occupation_code, home_phone, "
            + " office_phone, fax_no, user_classification_code, mother_name, nationality_code, room_no ) "
            + "VALUES('" + user_id + "', '" + user_name + "', 'link', 'JOMLOKA Customer', 'JOMLOKA', 'JOMLOKA', '" + user_ic + "', '" + user_birth + " 00:00:00', "
            + " '" + user_gender + "', '" + user_phone + "', '" + user_id + "', '" + user_pass + "', '" + user_title + "', '" + user_question + "', "
            + " '" + user_answer + "', now(), '" + user_id + "' , '', now(), '9999-12-31 00:00:00', '" + random + "','','','','','','','','' );";

    if (rmi.setQuerySQL(con.HOST, con.PORT, query)) {

        String message = "<h3>Good Day Dear " + user_name + "!</h3> "
                + "<br/><p>Thank you for registering with us.</p>"
                + "<br/><br/><p>Following are your ID information...</p>"
                + "<p>User ID : " + user_id + "</p>"
                + "<p>IC Number : " + user_ic + "</p>"
                + "<p>Password : " + user_pass + "</p><br/>";

        String subject = "Account Registration Successful";

        Emailer em = new Emailer(user_id, subject, message);
        em.sendTextEmail();

        Boolean sql = false;
        String sqlInsert = "INSERT INTO jlk_notification "
                + " (send_time, user_id, sender_id, receiver_id, title, message, type, status, created_by, created_date)  "
                + " VALUES(now(),'" + user_id + "','mkagtech@gmail.com','" + user_id + "','" + subject + "','Thank you for registering with us.Following are your ID information...User ID : " + user_id + "Password : " + user_pass + "', 'inbox', '0', 'mkagtech@gmail.com',now()) ";
        sql = rmi.setQuerySQL(con.HOST, con.PORT, sqlInsert);

        status = SUCCESS;

    } else {

        status = FAILED;

    }

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", status);

    out.print(obj);

%>