<%-- 
    Document   : manageMiscTable
    Created on : Nov 29, 2017, 12:20:09 PM
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


<table  id="miscTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Miscellaneous Code</th>
    <th style="text-align: center;">Miscellaneous Name</th>
    <th style="text-align: center;">Buy Price</th>
    <th style="text-align: center;">Sell Price</th>
    <th style="text-align: center;">Status</th>
    <th style="text-align: center;">Update</th>
    <th style="text-align: center;">Delete</th>
</thead>
<tbody>

    <%
        //                         0        1        2               3           4            5       6      
        String sql = " SELECT item_code, hfc_cd, item_desc, buying_price, selling_price, discount, status "
                //
                // Where Condition
                + " FROM far_miscellaneous_item WHERE hfc_cd  = '" + hfc + "' ";
        ArrayList<ArrayList<String>> dataMisc = conn.getData(sql);

        int size = dataMisc.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
<input id="dataMischidden" type="hidden" value="<%=String.join("|", dataMisc.get(i))%>">
<td><%= dataMisc.get(i).get(0)%></td> <!-- Code -->
<td><%= dataMisc.get(i).get(2)%></td> <!-- Name -->
<td><%= dataMisc.get(i).get(3)%></td> <!-- Value -->
<td><%= dataMisc.get(i).get(4)%></td> <!-- Enable -->
<td><% if (dataMisc.get(i).get(6).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }%></td> <!-- Status -->
<td>
    <!-- Update Part Start -->
    <a id="miscUpdateTButton" data-toggle="modal" data-target="#miscModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="miscDeleteTButton" ><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
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

        $('#miscTable').DataTable().destroy();

        // Supplier DataTables Start
        $('#miscTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Miscellaneous Available To Display"
            },
            initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
        // Supplier DataTables End



    });

</script>
