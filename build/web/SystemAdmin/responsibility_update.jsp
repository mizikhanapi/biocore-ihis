<%-- 
    Document   : responsibility_update
    Created on : Mar 2, 2017, 9:35:47 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    Conn conn  = new Conn();
    
    String roleCode = request.getParameter("roleCode");
    String pageCode = request.getParameter("pageCode");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_responsibility SET status = '"+status+"'"+
                        " WHERE role_code = '"+roleCode+"' AND page_code = '"+pageCode+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>
