<%-- 
    Document   : patientOrderListDetailsDispenceUpdateNew
    Created on : Feb 21, 2017, 2:30:03 PM
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
    
    String ORDER_NO = request.getParameter("orderNo");
    String DRUG_ITEM_CODE = request.getParameter("drugCode");
    String QTY_DISPENSED = request.getParameter("updateDispensedQuantity");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE pis_order_detail SET QTY_DISPENSED = '" + QTY_DISPENSED + "' WHERE ORDER_NO = '" + ORDER_NO + "' AND DRUG_ITEM_CODE = '" + DRUG_ITEM_CODE + "' ";
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>