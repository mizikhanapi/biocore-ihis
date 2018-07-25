<%-- 
    Document   : getBasicInfo
    Created on : Jul 20, 2018, 11:53:30 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);
    
    String query = "Select email, mobile_phone from adm_users Where user_id='"+user_id+"' limit 1;";
    
    Conn con = new Conn();
    
    ArrayList<ArrayList<String>> arrData = con.getData(query);
    
    String phone="", email="";
    
    if(arrData.size()>0){
        phone= arrData.get(0).get(1);
        email = arrData.get(0).get(0);
    }
    
    JSONObject json = new JSONObject();
    json.put("email", email);
    json.put("phone", phone);
    
    out.print(json.toString());
%>