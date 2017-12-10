<%-- 
    Document   : distributeStockOrderDetailsTable
    Created on : Nov 16, 2017, 5:30:53 PM
    Author     : Shammugam
--%>
<%@page import="SMS_helper.NumberOrDecimalChecker"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();
    String orderNo = request.getParameter("orderNo");
    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");

    NumberFormat formatter = new DecimalFormat("#0.00");
    NumberFormat formatterInt = new DecimalFormat("#0");
    //                                  0                 1           2               3               4                 5                   6                       7
    String orderList = "SELECT stkod.order_no, stkod.txn_date, stkod.item_cd, stkod.item_desc, stkod.item_amt, stkod.ordered_quantity, stkod.released_quantity, stkod.location, "
            //             8             9                10                 11               12            13                      14                      15                  16              17
            + " stkod.customer_id, stkod.order_by, stkod.order_status, stksi.item_cd, stksi.item_name, stksi.selling_price, stksi.physical_stock, stksi.item_condition, stksi.item_grade,stkod.comment  "
            // FROM DETAIL TABLE
            + " FROM stk_order_detail stkod "
            // LEFT JOIN ITEM TABLE
            + " LEFT JOIN stk_stock_item stksi ON (stkod.item_cd = stksi.item_cd)  "
            // WHERE CONDITION
            + " WHERE stkod.order_no = '" + orderNo + "' AND (stkod.order_status = '0' OR stkod.order_status = '1') "
            + " AND stksi.hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND stksi.discipline_cd = '" + DISCIPLINE_CODE + "' ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="distributeStockOrderDetailsListTable">
    <thead>
    <th style="text-align: left;">Check</th>
    <th style="display: none;text-align: center;">Order No</th>
    <th style="text-align: left;">Item Cd</th>
    <th style="text-align: left;">Item Name</th>
    <th style="text-align: left;">Stock Qty</th>
    <th style="text-align: left;">Order Qty</th>
    <th style="text-align: left;">Released Qty</th>
    <th style="text-align: left;">Qty To Released</th>
    <th style="text-align: left;">Price/Unit</th>
    <th style="text-align: left;">Total (RM)</th>
    <th style="text-align: left;">Comment</th>
    <th style="text-align: left;">Status</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {

            NumberOrDecimalChecker check = new NumberOrDecimalChecker();

            boolean stockCheck = check.isInteger(dataOrderList.get(i).get(14));
            boolean orderedCheck = check.isInteger(dataOrderList.get(i).get(5));
            boolean releaseCheck = check.isInteger(dataOrderList.get(i).get(6));
            boolean priceCheck = check.isDouble(dataOrderList.get(i).get(13));

            if (stockCheck && orderedCheck && releaseCheck && priceCheck) {

                /* Stock */
                String stock = dataOrderList.get(i).get(14);


                /* Ordered */
                String ordered = formatterInt.format(Double.parseDouble(dataOrderList.get(i).get(5)));


                /* Released */
                String released = formatterInt.format(Double.parseDouble(dataOrderList.get(i).get(6)));


                /* ToReleased */
                String toReleased = formatterInt.format(Double.parseDouble(ordered) - Double.parseDouble(released));


                /* Price */
                String price = formatter.format(Double.parseDouble(dataOrderList.get(i).get(13)));


                /* Check Dispensed */
                String checkReleased = "0";

                /* Assign Dispensed */
                if ((Double.parseDouble(toReleased)) > (Double.parseDouble(stock))) {
                    checkReleased = stock;
                } else {
                    checkReleased = toReleased;
                }

                /* Total Price */
                String totalPrice = formatter.format(Double.parseDouble(checkReleased) * Double.parseDouble(price));

                /* Status */
                String status = dataOrderList.get(i).get(10);

                if (status.equalsIgnoreCase("0")) {
                    status = "New";
                } else if (status.equalsIgnoreCase("1")) {
                    status = "Partial";
                } else if (status.equalsIgnoreCase("2")) {
                    status = "Partial Complete";
                } else if (status.equalsIgnoreCase("4")) {
                    status = "Full";
                }

    %>

    <%            if (((Double.parseDouble(toReleased)) > (Double.parseDouble(stock))) && ((Double.parseDouble(stock)) > 0)) {    %>
    <tr style="font-weight:bolder; color: #FFD700;text-align: center;" >
        <% } else if (Integer.parseInt(stock) == 0) {   %>
    <tr style="font-weight:bolder; color: red;text-align: center;">
        <% } else {   %>
    <tr style="text-align: left;">
        <%   }%>
<input id="dataPatientOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
<td align="center"><input type="checkbox" id="drugDistributeChecked" checked></td> <!-- Checked -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center" style="display: none"><%= dataOrderList.get(i).get(0)%></td> <!-- Order No -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center" ><%= dataOrderList.get(i).get(11)%></td> <!-- Code -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= dataOrderList.get(i).get(12)%></td> <!-- Name -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= stock%></td> <!-- Stock -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= ordered%></td> <!-- Ordered -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= released%></td> <!-- Supplied -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= checkReleased%></td> <!-- Dispensed -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= price%></td> <!-- Price -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= totalPrice%></td> <!--  Total -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= dataOrderList.get(i).get(17)%></td> <!--  Comment -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= status%></td> <!-- Status -->

</tr>


<%  } else {

        }// end else
    }// end for loop
%>

</tbody>
</table>


