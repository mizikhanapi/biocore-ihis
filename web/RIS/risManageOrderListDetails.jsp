<%-- 
    Document   : risManageOrderListDetails
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

    String orderList = "select order_no,modality_cd,body_system_cd,episode_date,encounter_date,requestor_instruction,remarks,order_status"
            + ",ris_procedure_name,modality_name,body_system_name,patient_name,order_date,diagnosis,procedure_cd"
            + " FROM ris_detail_order "
            + "where order_no = '" + orderNo + "' ";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: center" id="risManageOrderDetailsListTable">
    <thead>
    <th>Requestor Instruction</th>
    <th>Result</th>
    <th>Status</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {


    %>
    <tr style="text-align: center;">
<input id="dataRISManageOrderDetailsListhidden" type="hidden" value="<%=String.join("|", dataOrderList.get(i))%>">
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center" style="display: none"><%= dataOrderList.get(i).get(0)%></td> <!-- Order No -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= dataOrderList.get(i).get(6)%></td> <!-- Description -->
<td id="updateOrderDetailsTButton" data-status="pagado" data-toggle="modal" data-id="1" data-target="#updateOrder" align="center"><%= dataOrderList.get(i).get(7)%></td> <!-- Strength -->
<td align="center"><input type="checkbox" id="risRequestChecked" checked></td> <!-- Status -->
</tr>


<%  }
%>

</tbody>
</table>


