<%-- 
    Document   : patientOrderListDetailsPrescribeUpdateStatus
    Created on : Mar 13, 2017, 2:47:47 AM
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
    String drugCode = request.getParameter("drugCode");
    int STATUS = 1;

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdateStatus = "UPDATE pis_order_detail SET STATUS = " + STATUS + " WHERE ORDER_NO = '" + orderNo + "' AND DRUG_ITEM_CODE = '" + drugCode + "'; ";
    boolean isUpdateStatus = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateStatus);

    if (isUpdateStatus == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
    

%>