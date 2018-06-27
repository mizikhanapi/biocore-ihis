<%-- 
    Document   : quitRegistration
    Created on : Jun 27, 2018, 1:12:52 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String id = (String) session.getAttribute("REGISTRATION_ID");
    String query = "Delete from adm_users where user_id = '"+id+"';";
    String msg = "Deleted";
    if(!rmi.setQuerySQL(con.HOST, con.PORT, query)){
        msg="Failed";
    }
    
    session.invalidate();
    
    JSONObject json = new JSONObject();
    
    json.put("msg", msg);
    out.print(json.toString());
    
%>
