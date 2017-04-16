<%-- 
    Document   : patientOrderListDetailsNew
    Created on : Feb 15, 2017, 1:13:37 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();
    String orderNo = request.getParameter("orderNo");

    NumberFormat formatter = new DecimalFormat("#0.00");
    NumberFormat formatterInt = new DecimalFormat("#0");

    String orderList = "select ORDER_NO,DRUG_ITEM_CODE,DRUG_ITEM_DESC,DRUG_FREQUENCY,DRUG_ROUTE,DRUG_FORM,DRUG_STRENGTH,"
            + "DRUG_DOSAGE,ORDER_OUM,DURATION,ORDER_STATUS,QTY_ORDERED,QTY_SUPPLIED,SUPPLIED_OUM,QTY_DISPENSED,"
            + "DISPENSE_OUM,pis_order_detail.STATUS,DURATIONT,D_STOCK_QTY,D_SELL_PRICE,"
            + "CASE ORDER_STATUS WHEN '0' THEN 'New' WHEN '1' THEN 'Partial' WHEN '2' THEN 'Complete Partial' WHEN '3' THEN 'Full Complete' WHEN '4' THEN 'Full' END  AS ORDER_STATUSCON"
            + " FROM pis_order_detail "
            + "JOIN pis_mdc2 ON (pis_order_detail.DRUG_ITEM_CODE = pis_mdc2.UD_MDC_CODE) "
            + "where ORDER_NO = '" + orderNo + "' AND (ORDER_STATUS='0' OR ORDER_STATUS='1')  ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: center" id="patientOrderDetailsListTable">
    <thead>
    <th style="display: none;text-align: center;">Order No</th>
    <th style="text-align: center;">Code</th>
    <th style="text-align: center;">Description</th>
    <th style="text-align: center;">Strength</th>
    <th style="text-align: center;">Frequency</th>
    <th style="text-align: center;">Duration</th>
    <th style="text-align: center;">Dose</th>
    <th style="text-align: center;">Stock Qty</th>
    <th style="text-align: center;">Ordered Qty</th>
    <th style="text-align: center;">Supplied Qty</th>
    <th style="text-align: center;">Dispensed Qty</th>
    <th style="text-align: center;">Price/Pack</th>
    <th style="text-align: center;">Total (RM)</th>
    <th style="text-align: center;">Status</th>
    <th style="text-align: center;">Check<!--<br><input id="checkDispenseAll" type="checkbox" onchange="checkAll(this)" name="chk[]" />--></th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {

            /* Stock */
            String stock = dataOrderList.get(i).get(18);

            /* Ordered */
            String ordered = formatterInt.format(Double.parseDouble(dataOrderList.get(i).get(11)));

            /* Supplied */
            String supplied = dataOrderList.get(i).get(12);

            /* Dispensed */
            String dispensed = formatterInt.format(Double.parseDouble(dataOrderList.get(i).get(11)) - Double.parseDouble(dataOrderList.get(i).get(12)));

            /* Price */
            String price = formatter.format(Double.parseDouble(dataOrderList.get(i).get(19)));

            /* Check Dispensed */
            String checkDispensed = "0";

            /* Assign Dispensed */
            if ((Double.parseDouble(dispensed)) > (Double.parseDouble(stock))) {
                checkDispensed = stock;
            } else {
                checkDispensed = dispensed;
            }

            /* Total Price */
            String totalPrice = formatter.format(Double.parseDouble(checkDispensed) * Double.parseDouble(price));

    %>

    <%            if (((Double.parseDouble(dispensed)) > (Double.parseDouble(stock))) && ((Double.parseDouble(stock)) > 0 ))  {    %>
    <tr style="font-weight:bolder; background-color: yellow;text-align: center;" >
        <% } else if (Integer.parseInt(stock) == 0) {   %>
    <tr style="font-weight:bolder; background-color: red;text-align: center;">
        <% } else {   %>
    <tr style="text-align: center;">
        <%   }%>
<input id="dataPatientOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center" style="display: none"><%= dataOrderList.get(i).get(0)%></td> <!-- Order No -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center" ><%= dataOrderList.get(i).get(1)%></td> <!-- Code -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= dataOrderList.get(i).get(2)%></td> <!-- Description -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= dataOrderList.get(i).get(6)%></td> <!-- Strength -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= dataOrderList.get(i).get(3)%></td> <!-- Frequency -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= dataOrderList.get(i).get(9)%> <%= dataOrderList.get(i).get(17)%></td> <!-- Duration/Duration T -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= dataOrderList.get(i).get(7)%></td> <!-- Dose -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= stock%></td> <!-- Stock -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= ordered%></td> <!-- Ordered -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= supplied%></td> <!-- Supplied -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= checkDispensed%></td> <!-- Dispensed -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= price%></td> <!-- Price -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= totalPrice%></td> <!--  Total -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= dataOrderList.get(i).get(20)%></td> <!-- Status -->
<td align="center"><input type="checkbox" id="drugDispenseChecked" checked></td> <!-- Status -->
</tr>


<%  }
%>

</tbody>
</table>


