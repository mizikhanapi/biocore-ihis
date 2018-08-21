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

    String subject = "Request Password Credential Successful";

    String sender = "mkagtech@gmail.com";

    String messageNotify = "Good Day Dear " + user_name + ". "
            + "You have requested for your of password.\n\n"
            + "Following are your ID information...\n"
            + "User ID : " + user_id + "\n"
            + "Password : " + user_password + "";

    String messageEmail = "<h3>Good Day Dear " + user_name + " !!!</h3> "
            + "<br/><p>Following are your ID information...</p>"
            + "<p>User ID : " + user_id + "</p>"
            + "<p>Password : " + user_password + "</p><br/>";

    Emailer em = new Emailer(user_id, subject, messageEmail);
    em.sendTextEmail();

    CustomerNotificationSender notify = new CustomerNotificationSender(sender, user_id, subject, messageNotify);
    notify.sendCustomerInboxNotification();

    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", SUCCESS);

    out.print(obj);

%>