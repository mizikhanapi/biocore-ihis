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
    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");

    NumberFormat formatter = new DecimalFormat("#0.00");
    NumberFormat formatterInt = new DecimalFormat("#0");
//                                 0        1           2               3               4           5           6
    String orderList = "select ORDER_NO,DRUG_ITEM_CODE,DRUG_ITEM_DESC,DRUG_FREQUENCY,DRUG_ROUTE,DRUG_FORM,DRUG_STRENGTH,"
            //      7           8       9           10          11          12          13              14
            + " DRUG_DOSAGE,ORDER_OUM,DURATION,ORDER_STATUS,QTY_ORDERED,QTY_SUPPLIED,SUPPLIED_OUM,QTY_DISPENSED,"
            //      15                  16                           17                 18                      19
            + " DISPENSE_OUM,pis_order_detail.STATUS,pis_order_detail.DURATIONT,pis_mdc2.D_STOCK_QTY,pis_mdc2.D_SELL_PRICE,"
            //                                                                       20 
            + " CASE ORDER_STATUS WHEN '0' THEN 'New' WHEN '1' THEN 'Partial' WHEN '2' THEN 'Complete Partial' WHEN '3' THEN 'Full Complete' WHEN '4' THEN 'Full' END  AS ORDER_STATUSCON,"
            //          21                  22                  23                      24                      25                  26                           27
            + " pis_mdc2.UD_ATC_CODE,pis_atc.UD_ATC_Desc,pis_mdc2.D_TRADE_NAME,pis_mdc2.D_STRENGTH,lForm.Master_Reference_code,lForm.Detail_Reference_code,lForm.Description,"
            //                28                     29                         30                   31                              32                     33
            + " lRoute.Master_Reference_code,lRoute.Detail_Reference_code,lRoute.Description,lFreq.Master_Reference_code,lFreq.Detail_Reference_code,lFreq.Description, "
            //          34              35                36                  37                
            + " pis_mdc2.D_QTY,lDose.Description,pis_mdc2.D_DURATION,lDura.Description "
            + " FROM pis_order_detail "
            + " JOIN pis_mdc2 ON (pis_order_detail.DRUG_ITEM_CODE = pis_mdc2.UD_MDC_CODE)  "
            + " JOIN pis_atc ON (pis_mdc2.UD_ATC_CODE = pis_atc.UD_ATC_Code)  "
            + " join adm_lookup_detail lForm on (pis_mdc2.d_form_code = lForm.Detail_Reference_code) AND lForm.master_reference_code = '0067' AND lForm.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " join adm_lookup_detail lRoute on (pis_mdc2.d_route_code = lRoute.Detail_Reference_code) AND lRoute.master_reference_code = '0066' AND lRoute.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " join adm_lookup_detail lFreq on (pis_mdc2.D_FREQUENCY = lFreq.Detail_Reference_code) AND lFreq.master_reference_code = '0088' AND lFreq.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " join adm_lookup_detail lDose on (pis_mdc2.D_QTYT = lDose.Detail_Reference_code) AND lDose.master_reference_code = '0025' AND lDose.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " join adm_lookup_detail lDura on (pis_mdc2.D_DURATIONT = lDura.Detail_Reference_code) AND lDura.master_reference_code = '0089' AND lDura.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " WHERE pis_order_detail.ORDER_NO = '" + orderNo + "' AND (ORDER_STATUS='0' OR ORDER_STATUS='1') "
            + " AND pis_mdc2.hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND pis_mdc2.discipline_cd = '" + DISCIPLINE_CODE + "' "
            + " AND pis_atc.hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND pis_atc.discipline_cd = '" + DISCIPLINE_CODE + "' ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientOrderDetailsListTable">
    <thead>
    <th style="display: none;text-align: center;">Order No</th>
    <th style="text-align: left;">Code</th>
    <th style="text-align: left;">Description</th>
    <th style="text-align: left;">Strength</th>
    <th style="text-align: left;">Frequency</th>
    <th style="text-align: left;">Duration</th>
    <th style="text-align: left;">Dose</th>
    <th style="text-align: left;">Stock Qty</th>
    <th style="text-align: left;">Ordered Qty</th>
    <th style="text-align: left;">Supplied Qty</th>
    <th style="text-align: left;">Dispensed Qty</th>
    <th style="text-align: left;">Price/Pack</th>
    <th style="text-align: left;">Total (RM)</th>
    <th style="text-align: left;">Status</th>
    <th style="text-align: left;">Check<!--<br><input id="checkDispenseAll" type="checkbox" onchange="checkAll(this)" name="chk[]" />--></th>
    <th style="display: none;text-align: center;">ATC Code</th>
    <th style="display: none;text-align: center;">ATC Desc</th>
    <th style="display: none;text-align: center;">MDC Desc</th>
    <th style="display: none;text-align: center;">MDC Strength</th>
    <th style="display: none;text-align: center;">MDC Form MCode</th>
    <th style="display: none;text-align: center;">MDC Form RCode</th>
    <th style="display: none;text-align: center;">MDC Form Desc</th>
    <th style="display: none;text-align: center;">MDC Route MCode</th>
    <th style="display: none;text-align: center;">MDC Route RCode</th>
    <th style="display: none;text-align: center;">MDC Route Desc</th>
    <th style="display: none;text-align: center;">MDC Frequency MCode</th>
    <th style="display: none;text-align: center;">MDC Frequency RCode</th>
    <th style="display: none;text-align: center;">MDC Frequency Desc</th>
    <th style="display: none;text-align: center;">MDC Dosage</th>
    <th style="display: none;text-align: center;">MDC Duration</th>
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

    <%            if (((Double.parseDouble(dispensed)) > (Double.parseDouble(stock))) && ((Double.parseDouble(stock)) > 0)) {    %>
    <tr style="font-weight:bolder; background-color: yellow;text-align: center;" >
        <% } else if (Integer.parseInt(stock) == 0) {   %>
    <tr style="font-weight:bolder; background-color: red;text-align: center;">
        <% } else {   %>
    <tr style="text-align: left;">
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
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(21)%></td> <!-- ATC Code -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(22)%></td> <!-- ATC Desc -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(23)%></td> <!-- MDC Desc -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(24)%></td> <!-- MDC Strength -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(25)%></td> <!-- MDC Form MCode -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(26)%></td> <!-- MDC Form RCode -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(27)%></td> <!-- MDC Form Desc -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(28)%></td> <!-- MDC Route MCode -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(29)%></td> <!-- MDC Route RCode -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(30)%></td> <!-- MDC Route Desc -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(31)%></td> <!-- MDC Frequency MCode -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(32)%></td> <!-- MDC Frequency RCode -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(33)%></td> <!-- MDC Frequency Desc -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(34)%><%= dataOrderList.get(i).get(35)%></td> <!-- MDC Dosage -->
<td align="center" style="display:none;"><%= dataOrderList.get(i).get(36)%><%= dataOrderList.get(i).get(37)%></td> <!-- MDC Duration -->


</tr>


<%  }
%>

</tbody>
</table>


