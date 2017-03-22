<%-- 
    Document   : pmiGen
    Created on : Jan 23, 2017, 7:00:23 PM
    Author     : shay
--%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String pmino;
    String input =  request.getParameter("idInput");
    pmino = rmic.getPMI(conn.HOST, conn.PORT, input); 
    
out.print(pmino);
%>