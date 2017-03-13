<%-- 
    Document   : pmiGen
    Created on : Jan 23, 2017, 7:00:23 PM
    Author     : shay
--%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String pmino;
    String input =  request.getParameter("icInput");
    //String input = "9506070152";
    pmino = rmic.getPMI(conn.HOST, conn.PORT, input);
    //int PMINOGEN = pmiw.getNewPmi();
    //pmino = rmic.getPMI(input);
    out.print(pmino);
%>