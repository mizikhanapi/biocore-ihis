<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%
String item_cd = request.getParameter("item_cd");
String specimen_no1 = (String)session.getAttribute("specimen_no");
//int number = Integer.parseInt(request.getParameter("Total"));

RMIConnector rmic = new RMIConnector();
Conn conn = new Conn();
String sqlUpdate = "UPDATE lis_specimen SET specimen_status = 'Verified' WHERE item_cd='"+item_cd+"' and specimen_no='"+specimen_no1+"'";
String sqlOrder = "UPDATE lis_order_master SET order_status = '3' WHERE item_cd='"+item_cd+"' and specimen_no='"+specimen_no1+"'";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
   rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    //out.println(isInsert);
%>
