<%-- 
    Document   : risManageOrderListDetails
    Created on : Feb 15, 2017, 1:13:37 PM
    Author     : Shammugam
--%>

<%@page import="POS_helper.OrderMaster"%>
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

  
//                                                   0                                              1                                   2                        3                  4               5        6              7               8             9            10
    String orderList = "select date_format(d.`startDateTime`, '%d/%m/%Y %H:%i'), date_format(d.`endDateTime`, '%d/%m/%Y %H:%i'), pro.procedure_cd, pro.`procedure_longName`, d.ot_room_no, rm.room_name, u.`USER_ID`, u.`USER_NAME`, d.order_status, d.comments, d.order_no "
            + "FROM opt_order_detail d "
            + "left join opt_room rm on rm.hfc_cd ='"+hfc_cd+"' and rm.room_no=d.ot_room_no "
            + "left join opt_procedure pro on pro.hfc_cd='"+hfc_cd+"' and pro.category_cd=d.category_cd and pro.procedure_cd = d.procedure_cd "
            + "left join adm_users u on u.`USER_ID` = d.consultant_id "
            + "where d.order_status in ('0', '1', '2', '3') AND d.order_no = '" + orderNo + "' "
            + "order by d.`startDateTime`, d.`endDateTime`;";
           

    ArrayList<ArrayList<String>> dataOrderList;
    dataOrderList = conn.getData(orderList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="risManageOrderDetailsListTable">
    <thead>
    <th style="display: none">Hidden</th>    
    <th>Start</th>
    <th>End</th>
    <th>Procedure</th>
    <th>OT-Room</th>
    <th>Consultant</th>
    <th>Comment</th>
    <th>Status</th>
    <th>Actions</th>

</thead>
<tbody>
    <%        for (int i = 0; i < dataOrderList.size(); i++) {
            String status = dataOrderList.get(i).get(8);
            String performDisabled = "";
            String prepareDisabled = "";
            String cancelDisabled = "";
            if (status.equalsIgnoreCase("0")) {
                status = "New";
                prepareDisabled = "disabled";
            } else if (status.equalsIgnoreCase("1")) {
                status = "In progress. Please write the report to complete this order.";
                performDisabled = "disabled";
                cancelDisabled = "disabled";
            }else if (status.equalsIgnoreCase("2")) {
                status = "Completed";
                performDisabled = "disabled";
                prepareDisabled = "disabled";
                cancelDisabled = "disabled";
            
            }else if(status.equalsIgnoreCase("3")){
                status = "Result Rejected. Please redo.";
               // prepareDisabled = "disabled";
            }
            
                       
//            String test = String.join("|", dataOrderList.get(i));
            
//            out.print(dataOrderList.get(i).toString());
//            out.print(test);

    %>
    <tr>

        <td style="display: none"><%= String.join("|", dataOrderList.get(i))%></td> <!-- hidden -->
        <td><%= dataOrderList.get(i).get(0)%></td> <!-- start -->
        <td><%= dataOrderList.get(i).get(1)%></td> <!-- End -->
        <td>(<%= dataOrderList.get(i).get(2)%>) <%= dataOrderList.get(i).get(3)%></td> <!-- Procedure -->
        <td>(<%= dataOrderList.get(i).get(4)%>) <%= dataOrderList.get(i).get(5)%></td> <!-- OT-Room -->
        <td>(<%= dataOrderList.get(i).get(6)%>) <%= dataOrderList.get(i).get(7)%></td><!-- Consultant -->
        <td><%= dataOrderList.get(i).get(9)%></td> <!-- comment -->
        <td><%= status%></td> <!-- status -->
        <td> 
        <button id="MOD_btnPerform" class="btn btn-default" <%out.print(performDisabled);%> ><i class="fa fa-user-md fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i>&nbsp;&nbsp;&nbsp;Perform Procedure</button><!-- perform -->
        <button id="MOD_btnReport" class="btn btn-default" <%out.print(prepareDisabled);%> ><i class="fa fa-file-text fa-lg" aria-hidden="true" style="display: inline-block;color: #00dd1c;" ></i>&nbsp;&nbsp;&nbsp;Write Report</button><!-- report -->
        <button id ="MOD_btnDelete" class="btn btn-default" <%out.print(cancelDisabled);%>><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i>&nbsp;&nbsp;&nbsp;Cancel Order</button>        
        </td><!-- perform -->
       
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

