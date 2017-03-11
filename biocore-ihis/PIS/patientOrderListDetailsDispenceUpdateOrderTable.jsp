<%-- 
    Document   : patientOrderListDetailsDispenceUpdateOrderTable
    Created on : Feb 22, 2017, 5:00:02 PM
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
    String D_SELL_PRICE = request.getParameter("drugPrice");
    String D_STOCK_QTY = request.getParameter("drugStockQty");
    String QTY_ORDERED = request.getParameter("drugOrderedQty");
    String QTY_SUPPLIED = request.getParameter("drugSuppliedQty");
    String QTY_DISPENSED = request.getParameter("drugDispensedQty");
    String ORDER_STATUS = request.getParameter("drugStatus");

    QTY_DISPENSED = "0";

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdateOrderDetailsData = "UPDATE pis_order_detail SET QTY_SUPPLIED = '" + QTY_SUPPLIED + "',QTY_DISPENSED = '" + QTY_DISPENSED + "',"
            + "ORDER_STATUS = '" + ORDER_STATUS + "' WHERE ORDER_NO = '" + ORDER_NO + "' AND DRUG_ITEM_CODE = '" + DRUG_ITEM_CODE + "' ";
    boolean isUpdateOrderDetailsData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderDetailsData);

    if (isUpdateOrderDetailsData == true) {

        String sqlCheck = "SELECT ORDER_NO,DRUG_ITEM_CODE FROM pis_order_detail WHERE ORDER_NO = '" + ORDER_NO + "' AND (ORDER_STATUS = '0' OR ORDER_STATUS = '1')";
        ArrayList<ArrayList<String>> totalOrder = conn.getData(sqlCheck);

        String totalOrderForOrderNo = String.valueOf(totalOrder.size());

        if (totalOrder.size() == 0) {

            String masterStatus = "1";

            String sqlUpdateOrderMasterFullData = "UPDATE pis_order_master SET ORDER_STATUS = '" + masterStatus + "',TOTAL_ORDER = '" + totalOrderForOrderNo + "' "
                    + "WHERE ORDER_NO = '" + ORDER_NO + "' ";

            boolean isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterFullData);

            if (isUpdateOrderMasterData == true) {
                out.print("Success Master");
            } else {
                out.print("Master Full Failed");
            }

        } else {

            String sqlUpdateOrderMasterPartialData = "UPDATE pis_order_master SET TOTAL_ORDER = '" + totalOrderForOrderNo + "' "
                    + "WHERE ORDER_NO = '" + ORDER_NO + "' ";

            boolean isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

            if (isUpdateOrderMasterData == true) {
                out.print("Success Partial");
            } else {
                out.print("Master Partial Failed");
            }
        }

    } else {
        out.print("Failed");
    }

%>