<%-- 
    Document   : checkEmailAvailable
    Created on : Jun 27, 2018, 11:58:27 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    Conn con = new Conn();
    
    boolean isAvailable = true;
    
    String query = "Select user_id from adm_users where email = '"+email+"' limit 1;";
    
    if(con.getData(query).size()>0){
        isAvailable = false;
    }
    
    JSONObject json = new JSONObject();
    json.put("isAvailable", isAvailable);
    
    out.print(json.toString());
%>
