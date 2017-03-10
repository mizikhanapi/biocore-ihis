<%-- 
    Document   : patientOrderListNewOrderDelete
    Created on : Feb 22, 2017, 7:16:25 AM
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
    String drugCode = request.getParameter("drugCode");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM pis_order_detail WHERE ORDER_NO = '" + orderNo + "' AND DRUG_ITEM_CODE = '" + drugCode + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        
        String sqlCheckTotalOrder = "SELECT ORDER_NO,DRUG_ITEM_CODE FROM pis_order_detail WHERE ORDER_NO = '" + orderNo + "' AND (ORDER_STATUS = '0' OR ORDER_STATUS = '1')";
        ArrayList<ArrayList<String>> totalOrder = conn.getData(sqlCheckTotalOrder);

        String totalOrderForOrderNo = String.valueOf(totalOrder.size());

        String sqlUpdateOrderMasterPartialData = "UPDATE pis_order_master SET TOTAL_ORDER = '" + totalOrderForOrderNo + "' "
                + "WHERE ORDER_NO = '" + orderNo + "' ";

        boolean isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

        if (isUpdateOrderMasterData == true) {
            out.print("Success");
        } else {
            out.print("Master Total Delete Failed");
        }
        
    } else {
        out.print("Failed");
    }
    
%>
