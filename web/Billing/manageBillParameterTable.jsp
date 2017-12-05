<%-- 
    Document   : manageBillParameterTable
    Created on : Nov 29, 2017, 11:44:17 AM
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
%>


<table  id="billParameterTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Parameter Code</th>
    <th style="text-align: center;">Parameter Name</th>
    <th style="text-align: center;">Value</th>
    <th style="text-align: center;">Enable</th>
    <th style="text-align: center;">Status</th>
    <th style="text-align: center;">Update</th>
    <th style="text-align: center;">Delete</th>
</thead>
<tbody>

    <%
        //                         0        1        2               3           4            5           6     7        
        String sql = " SELECT param_code, hfc_cd, param_name, param_value, param_type, display_option, enable, status "
                //
                // Where Condition
                + " FROM far_billing_parameter WHERE hfc_cd  = '" + hfc + "' ";
        ArrayList<ArrayList<String>> dataParam = conn.getData(sql);

        int size = dataParam.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
<input id="dataBillParameterhidden" type="hidden" value="<%=String.join("|", dataParam.get(i))%>">
<td><%= dataParam.get(i).get(0)%></td> <!-- Code -->
<td><%= dataParam.get(i).get(2)%></td> <!-- Name -->
<td><%= dataParam.get(i).get(3)%></td> <!-- Value -->
<td><%= dataParam.get(i).get(6)%></td> <!-- Enable -->
<td><% if (dataParam.get(i).get(7).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }%></td> <!-- Status -->
<td>
    <!-- Update Part Start -->
    <a id="billParameterUpdateTButton" data-toggle="modal" data-target="#billParameterModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="billParameterDeleteTButton" ><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>
</tbody>
</table>




<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#billParameterTable').DataTable().destroy();

        // Supplier DataTables Start
        $('#billParameterTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Bill Parameter Available To Display"
            },
            initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
        // Supplier DataTables End



    });

</script>
