<%-- 
    Document   : distributeStockOrderDeleteItem
    Created on : Dec 8, 2017, 5:19:31 PM
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
    String sql = "DELETE FROM stk_order_detail WHERE order_no = '" + orderNo + "' AND item_cd = '" + itemCode + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {

        String sqlCheckTotalOrder = "SELECT SUM(item_amt),SUM(ordered_quantity) FROM stk_order_detail  "
                + " WHERE order_no = '" + orderNo + "' AND (order_status = '0' OR order_status = '1')";
        ArrayList<ArrayList<String>> getOrderSummary = conn.getData(sqlCheckTotalOrder);

        String totalOrderAmount = String.valueOf(getOrderSummary.get(0).get(0));
        String totalOrderQuantity = String.valueOf(getOrderSummary.get(0).get(1));

        String sqlUpdateOrderMasterPartialData = "UPDATE stk_order_master "
                + " SET item_amt = '" + totalOrderAmount + "' , quantity  = '" + totalOrderQuantity + "' "
                + " WHERE ORDER_NO = '" + orderNo + "' ";

        boolean isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

        if (isUpdateOrderMasterData == true) {
            out.print("Success");
        } else {
            out.print("Master Update Failed");
        }

    } else {
        out.print("Failed");
    }

%>

