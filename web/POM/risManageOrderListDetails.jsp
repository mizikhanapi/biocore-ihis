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
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn conn = new Conn();
    String orderNo = request.getParameter("orderNo");

    NumberFormat formatter = new DecimalFormat("#0.00");
    NumberFormat formatterInt = new DecimalFormat("#0");
//                                  0           1               2                           3               4               5                                                      6              7                                 
    String orderList = "select order_no, pod.PROCEDURE_CD, cp1.`PROCEDURE_1_NAME`, cp.`PROCEDURE_NAME`, episode_date, ifnull(DATE_FORMAT(pod.`ENCOUNTER_DATE`,'%d/%m/%Y'), ''), comment, order_status "
            + "FROM pos_order_detail pod "
            + "left join cis_procedure_1 cp1 on pod.`PROCEDURE_CD` = cp1.`PROCEDURE_1_CD` "
            + "left join cis_procedure cp on cp.`PROCEDURE_CD` = cp1.`PROCEDURE_CD` "
            + "where order_status in ('0', '1', '5', '3') AND order_no = '" + orderNo + "'; ";
           

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="risManageOrderDetailsListTable">
    <thead>
    <th style="display: none">Hidden</th>    
    <th style="width: 15%">Procedure Name</th>
    <th style="width: 5%">Procedure Code</th>
    <th style="width: 15%">Procedure Type</th>
    <th style="width: 20%">Comment</th>
    <th style="width: 5%">Encounter Date</th>
    <th style="width: 5%">Status</th>
    <th style="width: 5%">Perform Procedure</th>
    <th style="width: 5%">Cancel Order</th>

</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {
            String status = dataOrderList.get(i).get(7);
            String performDisabled = "";
            String prepareDisabled = "";
            String cancelDisabled = "";
            if (status.equalsIgnoreCase("0")) {
                status = "New";
                prepareDisabled = "disabled";
            } else if (status.equalsIgnoreCase("1")) {
                status = "In progress";
                performDisabled = "disabled";
            }else if (status.equalsIgnoreCase("5")) {
                status = "Submitted for verification";
                performDisabled = "disabled";
                prepareDisabled = "disabled";
                cancelDisabled = "disabled";
            
            }else if(status.equalsIgnoreCase("3")){
                status = "Result Rejected. Please redo.";
                prepareDisabled = "disabled";
            }

    %>
    <tr>

        <td style="display: none"><%= String.join("|", dataOrderList.get(i))%></td> <!-- hidden -->
        <td><%= dataOrderList.get(i).get(3)%></td> <!-- name -->
        <td><%= dataOrderList.get(i).get(1)%></td> <!-- code -->
        <td><%= dataOrderList.get(i).get(2)%></td> <!-- type -->
        <td><%= dataOrderList.get(i).get(6)%></td> <!-- comment -->
        <td><%= dataOrderList.get(i).get(5)%></td><!-- date -->
        <td><%= status%></td> <!-- status -->
        <td> <button id="MOD_btnPerform" class="btn btn-default" <%out.print(performDisabled);%> ><i class="fa fa-film" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i></button></td><!-- perform -->
        <td> <button id ="MOD_btnDelete" class="btn btn-default" <%out.print(cancelDisabled);%>><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></button></td> <!-- cancel order -->

        <!--<td align="center"><input type="checkbox" id="risRequestChecked" checked></td>  Status -->
    </tr>


    <%  }
    %>

</tbody>
</table>

<script>
    $('#risManageOrderDetailsListTable').DataTable({
        "paging": false,
        "searching": false,
       // "scrollX": true,
        "info": false,
        "language": {
            "emptyTable": "No Request Available To Display"
        }
    });

</script>

