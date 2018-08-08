<%-- 
    Document   : loginProcessGetAccessToJomloka
    Created on : Aug 7, 2018, 8:19:30 PM
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

    // Status To Get As Return
    final String SUCCESS = "Success";
    final String FAILED = "Failed";

    // Variable to Assign Value
    String status = "";

    // Connection 
    Conn con = new Conn();

    RMIConnector rmi = new RMIConnector();

    String query = "Update adm_users SET status='0', login_status='0' "
            + " WHERE user_id='" + user_id + "'; ";

    boolean isUpdate = rmi.setQuerySQL(con.HOST, con.PORT, query);

    // Status To Get As Return
    if (isUpdate) {
        status = SUCCESS;
    } else {
        status = FAILED;
    }

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", status);

    out.print(obj);


%>