<%-- 
    Document   : manageBillMasterOrderListTable
    Created on : Oct 25, 2017, 5:19:43 PM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ic = request.getParameter("ic");
    String status = request.getParameter("status");

    DecimalFormat df = new DecimalFormat("0.00");

    Conn conn = new Conn();

    String userID = session.getAttribute("USER_ID").toString();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");

    //                        0               1                  2                  3           4             5
    String query = "SELECT ch.bill_no, ch.customer_id, UPPER(pb.patient_name), pb.new_ic_no, pb.id_no, pb.home_address, "
            //          6             7                     8                  9           10           11
            + " pb.mobile_phone, ch.quantity, (ch.item_amt-ch.amt_paid), ch.txn_date, ch.item_amt, ch.amt_paid,DATE_FORMAT(ch.txn_date, '%d/%m/%Y %T') "
            // FROM CONDITION
            + " FROM far_customer_hdr ch "
            // JOIN CONDITION
            + " LEFT JOIN pms_patient_biodata pb ON (ch.customer_id = pb.PMI_NO) "
            // WHERE CONDITION
            + " WHERE ch.payment = '" + status + "' AND pb.new_ic_no = '" + ic + "' AND ch.hfc_cd = '" + hfc + "'";

    ArrayList<ArrayList<String>> dataManageBillMasterOrderList = conn.getData(query);

    int size = dataManageBillMasterOrderList.size();
%>
<input id="dataManageBillMasterOrderListhiddenStatus" type="hidden" value="<%=status%>">
<table class="table table-bordered table-striped" id="manageBillMasterOrderListTable" style="width: 100%">
    <thead>
    <th>Transaction Date</th>
    <th>Bill No.</th>
    <th style="display: none;">Customer ID</th>
    <th style="display: none;">Name</th>
    <th style="display: none;">IC No.</th>
    <th style="display: none;">Other ID</th>
    <th style="display: none;">Phone No.</th>
    <th>Outstanding (RM)</th>
    <th>Action</th>
</thead>
<tbody>
    <%
        for (int i = 0; i < size; i++) {
    %>
    <tr style="text-align: left;"> 
<input id="dataManageBillMasterOrderListhidden" type="hidden" value="<%=String.join("|", dataManageBillMasterOrderList.get(i))%>">
<td><%=dataManageBillMasterOrderList.get(i).get(12)%></td>
<td><%=dataManageBillMasterOrderList.get(i).get(0)%></td>
<td style="display: none;"><%=dataManageBillMasterOrderList.get(i).get(1)%></td>
<td style="display: none;"><%=dataManageBillMasterOrderList.get(i).get(2)%></td>
<td style="display: none;"><%=dataManageBillMasterOrderList.get(i).get(3)%></td>
<td style="display: none;"><%=dataManageBillMasterOrderList.get(i).get(4)%></td>
<td style="display: none;"><%=dataManageBillMasterOrderList.get(i).get(6)%></td>
<td><%=df.format(Double.parseDouble(dataManageBillMasterOrderList.get(i).get(8)))%></td>
<td align="center"><button id="manageBillViewBillDetailBtn" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="View Details" ><i class="fa fa-eye fa-lg" aria-hidden="true"></i></button></td>
</tr>
<% }
%>
</tbody>
</table>


<hr class="pemisah">

<div id="manageBillMasterOrderListButtonRightDiv">
    <div class="col-lg-4 pull-left" style="margin-bottom: 10px; ">
        <button id="manageBillMasterOrderListButtonRightDivBackBtn" class="btn btn-default" style="float: left;"><i class="fa fa-angle-left fa-lg" aria-hidden="true"></i>&nbsp; &nbsp; Back</button>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function () {


        $('#manageBillMasterOrderListTable').DataTable().destroy();

        $('#manageBillMasterOrderListTable').DataTable({
            "language": {
                "emptyTable": "No Bill Record Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });

        $(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });

// --------------------------------------------------------------- Back Data In Master Table --------------------------------------------------------------- //



        // Load Master Table Start
        $('#manageBillMasterOrderListButtonRightDiv').off('click', '#manageBillMasterOrderListButtonRightDivBackBtn').on('click', ' #manageBillMasterOrderListButtonRightDivBackBtn', function (e) {

            e.preventDefault();


            $('.nav-tabs a[href="#tab_default_1"]').tab('show');

            $('#manageBillMasterOrderListCustomerContent').html('');

        });
        // Load Master Table End



// --------------------------------------------------------------- Back Data In Master Table --------------------------------------------------------------- //



    });
</script>
