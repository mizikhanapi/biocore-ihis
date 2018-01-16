<%-- 
    Document   : manageLabOrderDetailsTable
    Created on : Jan 13, 2018, 1:26:01 PM
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
    //                                  0             1             2               3               4                 5                         6                       7
    String orderList = "SELECT lisod.order_no, lisod.txn_date, lisod.item_cd, lisod.pmi_no, lisod.episode_date, lisod.encounter_date, lisod.requestor_comments, lisod.filler_comments, "
            //             8             9                10                 11             12              13                 14               15                  16        
            + " lisod.verify_by, lisod.verify_date, lisod.spe_source, lisod.item_name, lisod.volume, lisod.spe_container, lisod.comment, lisod.special_inst, lisod.order_date,  "
            //          17                  18                      19                  20
            + " lisod.specimen_status, lisod.Verification, lisod.detail_status, lisod.collectionDate  "
            // FROM DETAIL TABLE
            + " FROM lis_order_detail lisod "
            // LEFT JOIN ITEM TABLE
            + " LEFT JOIN lis_item_detail lisid ON (lisod.item_cd = lisid.item_cd)  "
            // WHERE CONDITION
            + " WHERE lisod.order_no = '" + orderNo + "' AND (lisod.detail_status = '0' OR lisod.detail_status = '1') "
            + " AND lisid.hfc_cd = '" + HEALTH_FACILITY_CODE + "' ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientOrderDetailsListTable">
    <thead>
    <th style="text-align: left;">Check</th>
    <th style="display: none;text-align: center;">Order No</th>
    <th style="text-align: left;">Item Cd</th>
    <th style="text-align: left;">Item Name</th>
    <th style="text-align: left;">S. Source</th>
    <th style="text-align: left;">S. Container</th>
    <th style="text-align: left;">Volume</th>
    <th style="text-align: left;">Special Instruction</th>
    <th style="text-align: left;">Requester Comment</th>
    <th style="text-align: left;">Verification</th>
    <th style="text-align: left;">Comment</th>
    <th style="text-align: left;">Status</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {

            /* Status From Database */
            String status = dataOrderList.get(i).get(19);

            /* Status For Check Box */
            String statusBox = status;

            /* Status For Table */
            String statusTable = status;

            if (statusTable.equalsIgnoreCase("0")) {
                statusTable = "New";
            } else if (statusTable.equalsIgnoreCase("1")) {
                statusTable = "Specimen Assigned";
            } else if (statusTable.equalsIgnoreCase("2")) {
                statusTable = "Partial Complete";
            } else if (statusTable.equalsIgnoreCase("4")) {
                statusTable = "Full";
            }

    %>

    <tr style="text-align: center;" >
<input id="dataPatientOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
<%
    if (statusBox.equals("0")) {
%>
<td align="center"><input type="checkbox" id="labRequestChecked" checked></td> <!-- Checked -->
    <%
    } else {
    %>
<td align="center"><input type="checkbox" id="labRequestChecked" checked disabled></td> <!-- Checked -->
    <%
        }
    %>
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center" style="display: none"><%= dataOrderList.get(i).get(1)%></td> <!-- Order No -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center" ><%= dataOrderList.get(i).get(2)%></td> <!-- Code -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= dataOrderList.get(i).get(11)%></td> <!-- Name -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= dataOrderList.get(i).get(10)%></td> <!--  S Source -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= dataOrderList.get(i).get(13)%></td> <!--  S Container -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= dataOrderList.get(i).get(12)%></td> <!--  Volume -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= dataOrderList.get(i).get(15)%></td> <!--  Special Instruction -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= dataOrderList.get(i).get(6)%></td> <!--  Requester Comment -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= dataOrderList.get(i).get(18)%></td> <!--  Verification -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= dataOrderList.get(i).get(14)%></td> <!--  Comment -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateLabRequestOrder" align="center"><%= statusTable%></td> <!--  Status -->

</tr>
<%
    }// end for loop
%>

</tbody>
</table>


