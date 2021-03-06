<%-- 
    Document   : manageStockCodeCateTable
    Created on : Nov 14, 2017, 10:05:16 AM
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


<table  id="stockCateTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Category Code</th>
    <th style="text-align: center;">Category Name</th>
    <th style="text-align: center;">GL Code</th>
    <th style="text-align: center;">Status</th>
    <th style="text-align: center;" class="mrsembunyi">Action</th>
</thead>
<tbody>

    <%
        //                         0            1           2          3                4            5       6        
        String sql = " SELECT category_cd, category_name, hfc_cd, discipline_cd, subdiscipline_cd, gl_cd, status "
                //
                // Where Condition
                + " FROM stk_stock_category WHERE hfc_cd  = '" + hfc + "' AND discipline_cd = '" + dis + "'";
        ArrayList<ArrayList<String>> dataStockCate = conn.getData(sql);

        int size = dataStockCate.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: left;">
<input id="dataStockCatehidden" type="hidden" value="<%=String.join("|", dataStockCate.get(i))%>">
<td><%= dataStockCate.get(i).get(0)%></td> <!-- Code -->
<td><%= dataStockCate.get(i).get(1)%></td> <!-- Desc -->
<td><%= dataStockCate.get(i).get(5)%></td> <!-- Value -->
<td><% if (dataStockCate.get(i).get(6).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }%></td> <!-- Status -->
<td class="mrsembunyi">
    <!-- Update Part Start -->
    <a id="stockCateUpdateTButton" data-toggle="modal" data-target="#stockCateModal"><i data-toggle="tooltip" data-placement="left" title="Update code" class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
    &nbsp;&nbsp;&nbsp;
    <!-- Delete Button Start -->
    <a id="stockCateDeleteTButton" ><i data-toggle="tooltip" data-placement="right" title="Delete code" class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
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

        $('#stockCateTable').DataTable().destroy();
        if(adminrole==="001"){
        $('.mrsembunyi').addClass('hidden'); // hides
        }else{
            $('.mrsembunyi').removeClass('hidden'); // Shows
        }
        // Supplier DataTables Start
        $('#stockCateTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Category Available To Display"
            },columnDefs: [{className: 'dt-body-left',targets: '_all'}]                            
                                        
        });
        // Supplier DataTables End



    });

</script>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
      }); 
</script>