<%-- 
    Document   : assignSpecimenOrderUpdateItem
    Created on : Jan 15, 2018, 10:41:22 AM
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
    String orderNo = request.getParameter("orderNo");
    String itemCode = request.getParameter("itemCode");
    String itemComment = request.getParameter("itemComment");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE lis_order_detail SET comment = '" + itemComment + "' "
            + " WHERE order_no = '" + orderNo + "' AND item_cd = '" + itemCode + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>