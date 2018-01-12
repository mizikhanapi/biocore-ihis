<%-- 
    Document   : manageTestCateTable
    Created on : Jan 12, 2018, 10:50:08 AM
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

<table  id="testCateTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Category Code</th>
    <th style="text-align: center;">Category Name</th>
    <th style="text-align: center;">Status</th>
    <th style="text-align: center;">View Detail</th>
    <th style="text-align: center;">Action</th>
</thead>
<tbody>

    <%
        //                         0            1           2          3           4            5               
        String sql = " SELECT category_code, hfc_cd, category_name, status, discipline_cd, subdiscipline_cd "
                //
                // Where Condition
                + " FROM lis_item_category WHERE hfc_cd  = '" + hfc + "' ";
        ArrayList<ArrayList<String>> dataTestCate = conn.getData(sql);

        int size = dataTestCate.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
<input id="dataTestCatehidden" type="hidden" value="<%=String.join("|", dataTestCate.get(i))%>">
<td><%= dataTestCate.get(i).get(0)%></td> <!-- Code -->
<td><%= dataTestCate.get(i).get(2)%></td> <!-- Desc -->
<td><% if (dataTestCate.get(i).get(3).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }%></td> <!-- Status -->
<td>
    <!-- Update Part Start -->
    <a id="testCateViewDetailTButton" ><i class="fa fa-arrow-circle-o-down fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Update Part Start -->
    <a id="testCateUpdateTButton" data-toggle="modal" data-target="#testCateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
    &nbsp;&nbsp;
    <!-- Delete Button Start -->
    <a id="testCateDeleteTButton" ><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
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

        $('#testCateTable').DataTable().destroy();

        // Supplier DataTables Start
        $('#testCateTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Category Available To Display"
            }
        });
        // Supplier DataTables End



    });

</script>
