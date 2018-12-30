<%-- 
    Document   : patientScreenListDetails
    Created on : Oct 29, 2018, 11:12:51 PM
    Author     : Shammugam
--%>

<%@page import="PIS_helper.NumberOrDecimalChecker"%>
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
    String orderList = "SELECT ORDER_NO,DRUG_ITEM_CODE,DRUG_ITEM_DESC,DRUG_FREQUENCY,DRUG_ROUTE,DRUG_FORM,DRUG_STRENGTH,"
            //      7           8       9           10          11          12          13              14
            + " DRUG_DOSAGE,ORDER_OUM,DURATION,ORDER_STATUS,QTY_ORDERED,QTY_SUPPLIED,SUPPLIED_OUM,QTY_DISPENSED,"
            //      15                  16                           17                 18                      19
            + " DISPENSE_OUM,pis_order_detail.STATUS,IFNULL(pis_order_detail.DURATIONT,''),pis_mdc2.D_STOCK_QTY,pis_mdc2.D_SELL_PRICE,"
            //                                                                       20 
            + " CASE ORDER_STATUS WHEN '0' THEN 'New' WHEN '1' THEN 'Partial' WHEN '2' THEN 'Complete Partial' WHEN '3' THEN 'Full Complete' WHEN '4' THEN 'Full' END  AS ORDER_STATUSCON,"
            //          21                  22                  23                      24                      25                  26                           27
            + " pis_mdc2.UD_ATC_CODE,pis_mdc2.UD_ATC_CODE,pis_mdc2.D_TRADE_NAME,pis_mdc2.D_STRENGTH,lForm.Master_Reference_code,lForm.Detail_Reference_code,lForm.Description,"
            //                28                     29                         30                   31                              32                     33
            + " lRoute.Master_Reference_code,lRoute.Detail_Reference_code,lRoute.Description,lFreq.frequency_code,lFreq.frequency_code,lFreq.frequency_desc, "
            //          34              35                36                  37                38
            + " pis_mdc2.D_QTY,lDose.Description,pis_mdc2.D_DURATION,lDura.Description,IFNULL(pis_order_detail.COMMENT,'-') "
            + " FROM pis_order_detail "
            + " LEFT JOIN pis_mdc2 ON (pis_order_detail.DRUG_ITEM_CODE = pis_mdc2.UD_MDC_CODE)  "
            // + " LEFT JOIN pis_atc ON (pis_mdc2.UD_ATC_CODE = pis_atc.UD_ATC_Code)  "
            + " LEFT join adm_lookup_detail lForm on (pis_mdc2.d_form_code = lForm.Detail_Reference_code) AND lForm.master_reference_code = '0067' AND lForm.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " LEFT join adm_lookup_detail lRoute on (pis_mdc2.d_route_code = lRoute.Detail_Reference_code) AND lRoute.master_reference_code = '0066' AND lRoute.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            //  + " LEFT join adm_lookup_detail lFreq on (pis_mdc2.D_FREQUENCY = lFreq.Detail_Reference_code) AND lFreq.master_reference_code = '0088' AND lFreq.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " LEFT join adm_lookup_detail lDose on (pis_mdc2.D_QTYT = lDose.Description) AND lDose.master_reference_code = '0025' AND lDose.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " LEFT join adm_lookup_detail lDura on (pis_mdc2.D_DURATIONT = lDura.Detail_Reference_code) AND lDura.master_reference_code = '0089' AND lDura.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " LEFT join pis_drug_frequency lFreq on (pis_mdc2.D_FREQUENCY = lFreq.frequency_desc) AND lFreq.hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND lFreq.discipline_cd = '" + DISCIPLINE_CODE + "' "
            + " WHERE pis_order_detail.ORDER_NO = '" + orderNo + "' AND (ORDER_STATUS='0' OR ORDER_STATUS='1') "
            + " AND pis_mdc2.hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND pis_mdc2.discipline_cd = '" + DISCIPLINE_CODE + "' ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);

%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientScreenDetailsListTable">
    <thead>
    <th style="display: none;text-align: left;">Order No</th>
    <th style="text-align: left;">Drug Cd</th>
    <th style="text-align: left;">Drug Name</th>
    <th style="text-align: left;">Strength</th>
    <th style="text-align: left;">Frequency</th>
    <th style="text-align: left;">Duration</th>
    <th style="text-align: left;">Dose</th>
    <th style="text-align: left;" data-toggle="tooltip" data-placement="left" title="Stock Qty" aria-hidden="true">S.Qty</th>
    <th style="text-align: left;" data-toggle="tooltip" data-placement="left" title="Order Qty" aria-hidden="true">O.Qty</th>
    <th style="text-align: left;" data-toggle="tooltip" data-placement="left" title="Quantity to Dispense" aria-hidden="true">Qty To Dis</th>
    <th style="text-align: left;" data-toggle="tooltip" data-placement="left" title="Price Per Unit" aria-hidden="true">P/U</th>
    <th style="text-align: left;" >Total</th>
    <th style="text-align: left;">Comment</th>
</thead>
<tbody>
    <%        
        for (int i = 0; i < dataOrderList.size(); i++) {

            NumberOrDecimalChecker check = new NumberOrDecimalChecker();

            boolean stockCheck = check.isInteger(dataOrderList.get(i).get(18));
            boolean orderedCheck = check.isInteger(dataOrderList.get(i).get(11));
            boolean priceCheck = check.isDouble(dataOrderList.get(i).get(19));       

            if (stockCheck && orderedCheck && priceCheck) {

                /* Stock */
                String stock = dataOrderList.get(i).get(18);

                /* Ordered */
                String ordered = formatterInt.format(Double.parseDouble(dataOrderList.get(i).get(11)));
                
                 /* Quantity To Dispense */
                String quantityToDispense = ordered;

                /* Price */
                String price = formatter.format(Double.parseDouble(dataOrderList.get(i).get(19)));

                /* Total Price */
                String totalPrice = formatter.format(Double.parseDouble(quantityToDispense) * Double.parseDouble(price));              

    %>

    <%            
        if (((Double.parseDouble(ordered)) > (Double.parseDouble(stock))) && ((Double.parseDouble(stock)) > 0)) {    %>
    <tr style="font-weight:bolder; color: #FFD700;text-align: center;" class="clickable_tr">
        <% } else if (Integer.parseInt(stock) == 0) {   %>
    <tr style="font-weight:bolder; color: red;text-align: center;" class="clickable_tr">
        <% } else {   %>
    <tr style="text-align: left;" class="clickable_tr">
        <%   }%>
        <input id="dataPatientScreenDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" style="display: none"><%= dataOrderList.get(i).get(0)%></td> <!-- Order No -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= dataOrderList.get(i).get(1)%></td> <!-- Code -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= dataOrderList.get(i).get(2)%></td> <!-- Description -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= dataOrderList.get(i).get(6)%></td> <!-- Strength -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= dataOrderList.get(i).get(3)%></td> <!-- Frequency -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= dataOrderList.get(i).get(9)%> <%= dataOrderList.get(i).get(17)%></td> <!-- Duration/Duration T -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= dataOrderList.get(i).get(7)%></td> <!-- Dose -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= stock%></td> <!-- Stock -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= ordered%></td> <!-- Ordered -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= quantityToDispense%></td> <!-- Qty To Dispense -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= price%></td> <!-- Price -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= totalPrice%></td> <!--  Total -->
        <td id="deleteScreenDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#deleteScreenItem" ><%= dataOrderList.get(i).get(38)%></td> <!-- Comment -->
    </tr>

<%  } else {

        }// end else
    }// end for loop
%>

</tbody>
</table>
