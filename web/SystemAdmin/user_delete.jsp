<%-- 
    Document   : user_delete
    Created on : Feb 19, 2017, 10:57:24 PM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    Conn conn = new Conn();

    String userID = request.getParameter("userID");

    
        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_users WHERE user_id = '" + userID + "' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

%>

