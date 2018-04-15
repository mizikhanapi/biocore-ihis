<%-- 
    Document   : personal_update
    Created on : Apr 16, 2018, 3:31:20 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);

    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    String query = "UPDATE adm_users SET `MOBILE_PHONE`='" + phone + "', `EMAIL`='" + email + "' WHERE `USER_ID`='" + user_id + "';";
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();

    boolean isUpdate = rmi.setQuerySQL(con.HOST, con.PORT, query);
    String msg = "";
    if (isUpdate) {
        msg = "Your information is updated.";
    } else {
        msg = "Oops! Something went wrong.";
    }
    
    JSONObject json = new JSONObject();
    json.put("msg", msg);
    json.put("isValid", isUpdate);
    
    out.print(json.toString());

%>