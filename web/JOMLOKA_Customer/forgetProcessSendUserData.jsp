<%-- 
    Document   : forgetProcessSendUserData
    Created on : Aug 8, 2018, 8:40:33 PM
    Author     : Shammugam
--%>

<%@page import="JOMLOKAHelper.CustomerNotificationSender"%>
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
    String user_name = request.getParameter("user_name");
    String user_password = request.getParameter("user_password");

    // Status To Get As Return
    final String SUCCESS = "Success";

    String message = "<h3>Good Day Dear " + user_name + " !!!</h3> "
            + "<br/><p>Following are your ID information...</p>"
            + "<p>User ID : " + user_id + "</p>"
            + "<p>Password : " + user_password + "</p><br/>";

    String subject = "Request Password Successful";

    Emailer em = new Emailer(user_id, subject, message);
    em.sendTextEmail();

    String sender = "biocore@utem.edu.my";
    CustomerNotificationSender noti = new CustomerNotificationSender(sender, user_id, subject, message);
    noti.sendCustomerInboxNotification();

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", SUCCESS);

    out.print(obj);

%>