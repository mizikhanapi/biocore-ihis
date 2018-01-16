<%-- 
    Document   : assignSpecimenOrderDeleteItem
    Created on : Jan 15, 2018, 10:38:26 AM
    Author     : Shammugam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    Conn conn = new Conn();

    String orderNo = request.getParameter("orderNo");
    String itemCode = request.getParameter("itemCode");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM lis_order_detail WHERE order_no = '" + orderNo + "' AND item_cd = '" + itemCode + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>

