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
//                                  0           1               2                   3               4               5                    6              7               8           9                                   10                                   11                  12
    String orderList = "select order_no, rod.modality_cd, rod.body_system_cd, rod.procedure_cd, episode_date, encounter_date, requestor_comments, filler_comments, order_status, rpm.ris_procedure_name, ifnull(DATE_FORMAT(exam_date,'%d/%m/%Y'), ''), bs.body_system_name, rmod.modality_name "
            + "FROM ris_order_detail rod "
            + "Left join ris_procedure_master rpm  on rpm.ris_procedure_cd = rod.procedure_cd AND rpm.hfc_cd = '" + hfc_cd + "' "
            + "Left join ris_body_system bs on bs.body_system_cd = rod.body_system_cd AND bs.hfc_cd = '" + hfc_cd + "' "
            + "Left join ris_modality rmod on rmod.modality_cd = rod.modality_cd AND rmod.hfc_cd = '" + hfc_cd + "' "
            + "where order_no = '" + orderNo + "' AND order_status in ('0', '1')";

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: center" id="risManageOrderDetailsListTable">
    <thead>
    <th style="display: none">Hidden</th>    
    <th style="width: 15%">Body System</th>
    <th style="width: 5%">Modality</th>
    <th style="width: 5%">Procedure Code</th>
    <th style="width: 15%">Procedure Name</th>
    <th style="width: 20%">Requestor Instruction</th>
    <th style="width: 5%">Exam Date</th>
    <th style="width: 5%">Status</th>
    <th style="width: 5%">Set Exam Date</th>
    <th style="width: 5%">Perform Exam</th>
    <th style="width: 5%">Prepare Report</th>
    <th style="width: 5%">Cancel Order</th>

</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {
            String status = dataOrderList.get(i).get(8);
            String performDisabled = "";
            String prepareDisabled = "";
            if (status.equalsIgnoreCase("0")) {
                status = "New";
                prepareDisabled = "disabled";
            } else if (status.equalsIgnoreCase("1")) {
                status = "In progress";
                performDisabled = "disabled";
            }

    %>
    <tr>

        <td style="display: none"><%= String.join("|", dataOrderList.get(i))%></td> <!-- hidden -->
        <td><%= dataOrderList.get(i).get(11)%></td> <!-- body -->
        <td><%= dataOrderList.get(i).get(12)%></td> <!-- modality -->
        <td><%= dataOrderList.get(i).get(3)%></td> <!-- procedure code-->
        <td><%= dataOrderList.get(i).get(9)%></td> <!-- procedure name-->
        <td><%= dataOrderList.get(i).get(6)%></td> <!-- Instruction -->
        <td><%= dataOrderList.get(i).get(10)%></td><!-- exam date -->
        <td><%= status%></td> <!-- status -->
        <td> <button id="MOD_btnModalDate" class="btn btn-default" <%out.print(performDisabled);%> ><i class="fa fa-calendar" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i></button></td><!-- set date -->
        <td> <button id="MOD_btnPerform" class="btn btn-default" <%out.print(performDisabled);%> ><i class="fa fa-film" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i></button></td><!-- perform -->
        <td> <button id="MOD_btnPrepare" class="btn btn-default" <%out.print(prepareDisabled);%> ><i class="fa fa-file-text" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i></button></td><!-- prepare -->
        <td> <button id ="MOD_btnDelete" class="btn btn-default"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></button></td> <!-- cancel order -->

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
        "info": false,
        "language": {
            "emptyTable": "No Request Available To Display"
        }
    });

</script>

