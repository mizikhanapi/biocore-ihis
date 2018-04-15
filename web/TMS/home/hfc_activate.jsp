<%-- 
    Document   : hfc_activate
    Created on : Apr 16, 2018, 1:39:34 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String hfc_cd = request.getParameter("hfc_cd");
    String status = request.getParameter("status");
    String query = "Update adm_health_facility set hfc_status='"+status+"' WHERE hfc_cd='"+hfc_cd+"';";
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    boolean isUpdate = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    String msg="";
    
    if(isUpdate){
        if("0".equals(status)){
            msg = "The health facility is activated";
        }
        else{
            msg = "The health facility is deactivated";
        }
    }
    else{
        msg = "Oops! Something went wrong.";
    }
    
    JSONObject json = new JSONObject();
    json.put("msg", msg);
    json.put("isValid", isUpdate);
    out.print(json.toString());
%>
