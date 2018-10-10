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
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");
   //String status = request.getParameter("status");
    NumberFormat formatter = new DecimalFormat("#0.00");
    NumberFormat formatterInt = new DecimalFormat("#0");
    Double grandtotal = 0.0;
    String selectadditionalinfo = "";
    //                               0      1       2           3       4       5           6       7       8           9               10      11       12      13    14
    String selectType = "Select order_no,txn_date,item_cd,item_desc,item_amt,location,customer_id,order_by,created_by,created_date,quantity,item_type,comment,status,released_quantity "
            + "FROM stk_order_detail where order_no = '"+orderNo+"'";
    //                                  0                 1           2               3               4                 5                   6                       7
    String orderList = "SELECT stkod.order_no, stkod.txn_date, stkod.item_cd, stkod.item_desc, stkod.item_amt, stkod.location,stkod.customer_id, stkod.order_by "
            // FROM DETAIL TABLE
            + " FROM stk_order_detail stkod "
            // LEFT JOIN ITEM TABLE
            + " INNER JOIN stk_stock_item stksi ON (stkod.item_cd = stksi.item_cd) AND stksi.hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND stksi.discipline_cd = '" + DISCIPLINE_CODE + "'  "
            + " INNER JOIN pis_mdc2 mdc ON (stkod.item_cd = mdc.ud_mdc_code) AND mdc.hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND mdc.discipline_cd = '" + DISCIPLINE_CODE + "' "
            // WHERE CONDITION
            + " WHERE stkod.order_no = '" + orderNo + "' AND (stkod.order_status = '0' OR stkod.order_status = '1') "
            + "  ";

    ArrayList<ArrayList<String>> dataOrderList,dataOrderNew,dataAdditional;
    //dataOrderList = conn.getData(orderList);
    
    dataOrderNew = conn.getData(selectType);
    if(dataOrderNew.size() > 0){
        
        for(int i = 0;i <dataOrderNew.size();i++){
            
            if(dataOrderNew.get(i).get(11).equalsIgnoreCase("drug")){
               selectadditionalinfo = "Select d_stock_qty,d_sell_price from pis_mdc2 where ud_mdc_code = '"+dataOrderNew.get(i).get(2)+"' "
                       + "and hfc_cd = '"+hfc+"' and discipline_cd = '"+dis+"'";
            }else{
                selectadditionalinfo = "Select physical_stock,selling_price from stk_stock_item where item_cd = '"+dataOrderNew.get(i).get(2)+"' "
                       + "and hfc_cd = '"+hfc+"' and discipline_cd = '"+dis+"'";
            }
            dataAdditional = conn.getData(selectadditionalinfo);
            //out.print(selectadditionalinfo);
            dataOrderNew.get(i).add(dataAdditional.get(0).get(0));
            dataOrderNew.get(i).add(dataAdditional.get(0).get(1));
        }
        
    }


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="distributeStockOrderDetailsListTable">
    <thead>
    <th style="text-align: left;">Check</th>
    <th style="display: none;text-align: center;">Order No</th>
    <th style="text-align: left;">Item Cd</th>
    <th style="text-align: left;">Item Name</th>
    <th style="text-align: left;">Stock Qty</th>
    <th style="text-align: left;">Order Qty</th>
    <th style="text-align: left;">Price/Unit</th>
    <th style="text-align: left;">Total (RM)</th>
    <th style="text-align: left;">Comment</th>
    <th style="text-align: left;">Status</th>
    <th style="text-align: left;">Released Quantity</th>
    <th style="text-align: left;">To release Quantity</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderNew.size(); i++) {

            NumberOrDecimalChecker check = new NumberOrDecimalChecker();

            boolean stockCheck = check.isInteger(dataOrderNew.get(i).get(15));
            boolean orderedCheck = check.isInteger(dataOrderNew.get(i).get(10));
            //boolean releaseCheck = check.isInteger(dataOrderNew.get(i).get(6));
            boolean priceCheck = check.isDouble(dataOrderNew.get(i).get(16));

            if (stockCheck && orderedCheck  && priceCheck) {

                /* Stock */
                String stock = dataOrderNew.get(i).get(15);


                /* Ordered */
                String ordered = formatterInt.format(Double.parseDouble(dataOrderNew.get(i).get(10)));


                /* Released */
                String released = "";
                if(dataOrderNew.get(i).get(14).equalsIgnoreCase("") || dataOrderNew.get(i).get(14).isEmpty() || dataOrderNew.get(i).get(14) == null){
                    released = "0";
                }else{
                    released = dataOrderNew.get(i).get(14);
                }

                /* ToReleased */
                //String toReleased = formatterInt.format(Double.parseDouble(ordered) - Double.parseDouble(released));


                /* Price */
                String price = formatter.format(Double.parseDouble(dataOrderNew.get(i).get(16)));


                /* Check Dispensed */
                String checkReleased = "0";

                /* Assign Dispensed */
//                if ((Double.parseDouble(toReleased)) > (Double.parseDouble(stock))) {
//                    checkReleased = stock;
//                } else {
//                    checkReleased = toReleased;
//                }

                /* Total Price */
                String totalPrice = dataOrderNew.get(i).get(4);
                grandtotal += Double.valueOf(totalPrice);
                /* Status */
               String status = dataOrderNew.get(i).get(13);
//
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

    <%            if ( ((Double.parseDouble(ordered)) > ((Double.parseDouble(stock))) )) {    %>
    <tr style="font-weight:bolder; color: #FFD700;text-align: center;" >
        <% } else if (Integer.parseInt(stock) == 0) {   %>
    <tr style="font-weight:bolder; color: red;text-align: center;">
        <% } else {   %>
    <tr style="text-align: left;">
        <%   }%>

<td align="center"><input type="checkbox" id="drugDistributeChecked" checked><input id="dataPatientOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderNew.get(i))%>"></td> <!-- Checked -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center" style="display: none"><%= dataOrderNew.get(i).get(0)%></td> <!-- Order No -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center" ><%= dataOrderNew.get(i).get(2)%></td> <!-- Code -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= dataOrderNew.get(i).get(3)%></td> <!-- Name -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= stock%></td> <!-- Stock -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= ordered%></td> <!-- Ordered -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= price%></td> <!-- Price -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= totalPrice%><input type="hidden" id="totalprice" value="<%=totalPrice%>"></td> <!--  Total -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%= dataOrderNew.get(i).get(12)%></td> <!--  comment -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%=status%></td> <!--  status -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%=released%></td> <!--  released quantity -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateStockOrder" align="center"><%=ordered%></td> <!--  to release released quantity -->

</tr>
<%  } else {

        }// end else
    }// end for loop
%>

</tbody>
</table>
