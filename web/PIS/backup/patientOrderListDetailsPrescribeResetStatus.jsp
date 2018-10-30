<%-- 
    Document   : patientOrderListDetailsPrescribeResetStatus
    Created on : Mar 13, 2017, 2:32:42 AM
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
    int STATUS = 0;

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlResetStatus = "UPDATE pis_order_detail SET STATUS = " + STATUS + " WHERE ORDER_NO = '" + orderNo + "'; ";
    boolean isResetStatus = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlResetStatus);

    if (isResetStatus == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
    

%>