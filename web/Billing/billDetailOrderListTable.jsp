<%-- 
    Document   : billDetailOrderListTable
    Created on : Oct 12, 2017, 10:14:23 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String userID = session.getAttribute("USER_ID").toString();
%>

<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    DETAIL LIST
</h4>

<table  id="billDetailOrderListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;">Check</th>
    <th>Episode Date</th>
    <th>Order No</th>
    <th style="display: none">PMI No.</th>
    <th>IC No. / ID</th>
    <th>Name</th>
    <th>Address</th>
    <th>Phone No.</th>
    <th>Action</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = (String) session.getAttribute("DISCIPLINE_CODE");
        String current_user = (String) session.getAttribute("USER_ID");
        String last_nine = current_user.substring(current_user.length() - 1);

        String patientnic = request.getParameter("patientnic");
        String patientpmino = request.getParameter("patientpmino");
        String seperatorData = "|";

        //                        0                 1               2           3           4               5           6               7           8
        String sql = " SELECT pb.pmi_no,UPPER(pb.patient_name),pb.new_ic_no,pb.id_no,pb.home_address,pb.mobile_phone,fm.txn_date,fm.order_no,fm.hfc_cd "
                + " FROM far_order_master fm  "
                + " LEFT JOIN pms_patient_biodata pb ON (fm.customer_id = pb.PMI_NO)  "
                + " WHERE hfc_cd = '" + hfc + "' AND pb.new_ic_no = '" + patientnic + "' AND fm.status ='0' ORDER BY fm.txn_date DESC; ";

        ArrayList<ArrayList<String>> dataBillDetailsOrderList = conn.getData(sql);

        int size = dataBillDetailsOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToBillDetailsTButton" style="text-align: left;">
<input id="dataBillDetailsOrderListhidden" type="hidden" value="<%=String.join("|", dataBillDetailsOrderList.get(i))%>">
<td align="center"><input type="checkbox" id="generateBillChecked"></td> <!-- Checked -->
<td><%=dataBillDetailsOrderList.get(i).get(6)%></td>  <!-- Episode Date -->
<td><%=dataBillDetailsOrderList.get(i).get(7)%></td>  <!-- Order No -->
<td style="display: none"><%=dataBillDetailsOrderList.get(i).get(0)%></td>  <!-- PMI No. -->
<td><%=dataBillDetailsOrderList.get(i).get(2)%> / <%=dataBillDetailsOrderList.get(i).get(3)%></td> <!-- IC No. -->  <!-- Other ID -->
<td><%=dataBillDetailsOrderList.get(i).get(1)%></td>  <!-- Name -->
<td><%=dataBillDetailsOrderList.get(i).get(4)%></td>  <!-- Address -->
<td><%=dataBillDetailsOrderList.get(i).get(5)%></td>  <!-- Phone No. -->
<td><button id="generateBillDetailSingleRecordBtn" class="btn btn-primary pull-right"><i class="fa fa-file-o fa-lg" ></i>&nbsp; Generate Bill</button></td>
</tr>
<%
    }
%>
</tbody>
</table>


<br>
<hr/>
<div class="text-right" id="viewBillGenereteBillMasterButtonRightDiv" > 
    <input id="viewBillGenereteBillMasterButtonRightDivPMIPatientHidden" type="hidden" value="<%=patientnic%><%=seperatorData%><%=patientpmino%>">
    <button class="btn btn-success " type="button" id="btnViewBillGenereteBillMasterGenerateSelected" name="btnViewBillGenereteBillMasterGenerateSelected" > <i class="fa fa-file-text-o fa-lg" ></i>&nbsp; Generate Selected Bill &nbsp;</button>
</div>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        $('#billDetailOrderListTable').DataTable({
            "language": {
                "emptyTable": "No Bill Record Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });

    });
</script>

