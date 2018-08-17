<%-- 
    Document   : customerProcessChangePasswordProcess
    Created on : Aug 12, 2018, 8:17:38 PM
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
    String user_pass = request.getParameter("user_pass");
    String user_name = request.getParameter("user_name");
    String user_ic = request.getParameter("user_ic");

    // Status To Get As Return
    final String SUCCESS = "Success";
    final String FAILED = "Failed";

    // Variable to Assign Value
    String status = "";

    // Connection 
    Conn con = new Conn();

    RMIConnector rmi = new RMIConnector();
    String query = "Update adm_users SET password = '" + user_pass + "' "
            + " WHERE user_id='" + user_id + "'; ";

    boolean isUpdate = rmi.setQuerySQL(con.HOST, con.PORT, query);

    // Status To Get As Return
    if (isUpdate) {

        String message = "<h3>Good Day Dear " + user_name + "!</h3> "
                + "<br/><p>You have requested for change of password.</p>"
                + "<br/><br/><p>Following are your new ID information...</p>"
                + "<p>User ID : " + user_id + "</p>"
                + "<p>IC Number : " + user_ic + "</p>"
                + "<p>Your New Password : " + user_pass + "</p><br/>";

        String subject = "Account Change Password Successful";

        Emailer em = new Emailer(user_id, subject, message);
        em.sendTextEmail();

        Boolean sql = false;
        String sqlInsert = "INSERT INTO jlk_notification "
                + " (send_time, user_id, sender_id, receiver_id, title, message, type, status, created_by, created_date)  "
                + " VALUES(now(),'" + user_id + "','mkagtech@gmail.com','" + user_id + "','Testing','Testing', 'inbox', '0', 'mkagtech@gmail.com',now()) ";
        sql = rmi.setQuerySQL(con.HOST, con.PORT, sqlInsert);

        status = SUCCESS;

    } else {

        status = FAILED;

    }

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", query);

    out.print(obj);

%>