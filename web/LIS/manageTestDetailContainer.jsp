<%-- 
    Document   : manageTestDetailContainer
    Created on : Jan 12, 2018, 3:17:18 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String testCategory = request.getParameter("iditem");
%>


<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    TEST DETAILS MANAGEMENT
    <span class="pull-right">
        <button id="TESTDETAILSClone_btnClone" class="btn btn-default" data-status="pagado" data-toggle="modal" data-id="1" data-target="#testDetailsCloneModal" style=" padding-right: 10px;padding-left: 10px;"><a ><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;"></i></a>CLONE TEST DETAILS &nbsp;</button>
        <button id="addNewTestDetailsButton" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#testDetailsModal" style=" padding-right: 10px;padding-left: 10px;"><a ><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;"></i></a>ADD TEST DETAILS &nbsp;</button>
    </span>
</h4>


<table  id="testDetailsTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Code</th>
    <th>Name</th>
    <th>Spe Source</th>
    <th>Spe Container</th>
    <th>Volume</th>
    <th>Special Instruction</th>
    <th>Sell Price</th>
    <th>Status</th>
    <th>Action</th>
</thead>
<tbody>

    <%
        //                       0        1        2         3               4                          5                   6                   7     
        String sql = " SELECT item_cd, hfc_cd, test_cat, item_name, IFNULL(spe_source,''), IFNULL(spe_container,''), IFNULL(volume,''), IFNULL(special_inst,''), "
                //    8             9                       10    
                + " status, IFNULL(buy_price,'0'), IFNULL(ser_price,'0') "
                //
                // Where Condition
                + " FROM lis_item_detail WHERE hfc_cd  = '" + hfc + "' AND test_cat = '" + testCategory + "' ";
        ArrayList<ArrayList<String>> dataTestDetails = conn.getData(sql);

        int size = dataTestDetails.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: left;">
<input id="dataTestDetailshidden" type="hidden" value="<%=String.join("|", dataTestDetails.get(i))%>">
<td><%= dataTestDetails.get(i).get(0)%></td> <!-- Code -->
<td><%= dataTestDetails.get(i).get(3)%></td> <!-- Name -->
<td><%= dataTestDetails.get(i).get(4)%></td> <!-- Spe Source -->
<td><%= dataTestDetails.get(i).get(5)%></td> <!-- Spe Container -->
<td><%= dataTestDetails.get(i).get(6)%></td> <!-- Volume -->
<td><%= dataTestDetails.get(i).get(7)%></td> <!-- Special -->
<td><%= dataTestDetails.get(i).get(10)%></td> <!-- Sell Price -->
<td><% if (dataTestDetails.get(i).get(8).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }%>
</td> <!-- Status -->
<td   align="center">
    <!-- Update Part Start -->
    <a id="testDetailsUpdateTButton" data-toggle="modal" data-target="#testDetailsModal"><i class="fa fa-pencil-square-o fa-lg" data-toggle="tooltip" data-placement="left" title="Update Item" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
    &nbsp;&nbsp;
    <!-- Delete Button Start -->
    <a id="testDetailsDeleteTButton" ><i class="fa fa-times fa-lg" data-toggle="tooltip" data-placement="left" title="Delete Item" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>
</tbody>
</table>

<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#testDetailsTable').DataTable().destroy();

        // Supplier DataTables Start
        $('#testDetailsTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Details Available To Display"
            }
        });
        // Supplier DataTables End



    });

</script>
