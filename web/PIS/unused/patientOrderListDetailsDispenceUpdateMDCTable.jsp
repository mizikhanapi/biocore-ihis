<%-- 
    Document   : patientOrderListDetailsDispenceUpdateMDCTable
    Created on : Feb 23, 2017, 8:00:25 PM
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

    String DRUG_ITEM_CODE = request.getParameter("drugCode");
    String D_STOCK_QTY = request.getParameter("drugStockQty");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdateStockData = "UPDATE pis_mdc2 SET D_STOCK_QTY = '" + D_STOCK_QTY + "' WHERE UD_MDC_CODE = '" + DRUG_ITEM_CODE + "' ";
    boolean isUpdateStockData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateStockData);

    if (isUpdateStockData == true) {
        out.print("Stock Update Success");
    } else {
        out.print("Stock Update Failed");
    }

%>