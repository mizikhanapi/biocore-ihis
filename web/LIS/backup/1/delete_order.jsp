<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    String tcode = request.getParameter("tcode");
    String order_no = request.getParameter("order_no");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String sqlInsert = "DELETE FROM lis_order_detail WHERE order_no='"+order_no+"' AND item_cd = '"+tcode+"'";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>
