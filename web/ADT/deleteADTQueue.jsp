<%-- 
    Document   : deletePMSQueue
    Created on : Jan 16, 2017, 11:45:49 AM
    Author     : shay
--%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String order = request.getParameter("order");
    
    //   String delSql ="DELETE FROM wis_order_master WHERE pmi_no ='"+pmino+"' AND EPISODE_DATE = '"+now+"'";

    String delSql = "DELETE FROM wis_order_master WHERE order_no ='" + order + "' ";
    String delSql2 = "DELETE FROM wis_order_detail WHERE order_no ='" + order + "' ";
    Boolean delSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, delSql);
    Boolean delSuccess2 = rmic.setQuerySQL(conn.HOST, conn.PORT, delSql2);

    if (delSuccess && delSuccess2) {
        out.print("success");
//out.print(delSql);
//out.print(delSql); 
    } else {
        out.print("fail");
        if(!delSuccess)
            out.print(delSql);
        if(!delSuccess2)
            out.print(delSql2);
    }
%>
