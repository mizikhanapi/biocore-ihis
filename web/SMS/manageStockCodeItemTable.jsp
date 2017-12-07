<%-- 
    Document   : manageStockCodeItemTable
    Created on : Nov 14, 2017, 10:05:57 AM
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
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>

<table  id="stockItemTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Category Code</th>
    <th style="text-align: center;">Item Code</th>
    <th style="text-align: center;">Item Name</th>
    <th style="text-align: center;">Barcode</th>
    <th style="text-align: center;">Physical Stock</th>
    <th style="text-align: center;">Selling Price</th>
    <th style="text-align: center;">Condition</th>
    <th style="text-align: center;">Update</th>
    <th style="text-align: center;">Delete</th>
</thead>
<tbody>

    <%
        //                           0         1          2             3    4       5            6        7       8         9                  10                          11                                    
        String sqlMain = " SELECT item_cd, category_cd, item_name, barcode, oum, supplier_cd, serial_no, brand, location, currency, IFNULL(selling_price,'0'), IFNULL(purchase_price,'0'),"
                //
                //              12                     13                   14                      15                          16                     17                    18                   
                + " IFNULL(wholesale_price,'0'), IFNULL(tax,'0'), IFNULL(min_stock,'0'), IFNULL(float_stock,'0'), IFNULL(physical_stock,'0'), IFNULL(reorder_level,'0'), IFNULL(std_material_cost,'0'),"
                //
                //          19                              20                  21            22        23      24        25            26        
                + " IFNULL(std_labor_cost,'0'), IFNULL(std_expenses,'0'), item_condition, item_grade, status, hfc_cd, discipline_cd, subdiscipline_cd "
                //
                // Where Condition
                + "FROM stk_stock_item WHERE hfc_cd  = '" + hfc + "' AND discipline_cd  = '" + dis + "'; ";

        ArrayList<ArrayList<String>> dataStockItem = conn.getData(sqlMain);

        int sizeMain = dataStockItem.size();
        for (int s = 0; s < sizeMain; s++) {

    %>

    <tr style="text-align: center;">

<input id="dataStockItemhidden" type="hidden" value="<%=String.join("|", dataStockItem.get(s))%>">

<td><%= dataStockItem.get(s).get(1)%></td>                                            <!-- Category Code -->
<td><%= dataStockItem.get(s).get(0)%></td>                                            <!-- Item Code -->
<td><%= dataStockItem.get(s).get(2)%></td>                                            <!-- Item Name -->
<td><%= dataStockItem.get(s).get(3)%></td>                                            <!-- Barcode -->
<td><%= dataStockItem.get(s).get(16)%></td>                                           <!-- Physical Stock -->
<td><%= dataStockItem.get(s).get(10)%></td>                                           <!-- Selling Price -->
<td><%= dataStockItem.get(s).get(21)%></td>                                           <!-- Condition -->


<!-- Button Part Start -->
<td>
    <!-- Update Button Start -->
    <a id="stockItemUpdateTButton" data-toggle="modal" data-target="#stockItemModal">
        <i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i>
    </a>
    <!-- Update Button End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="stockItemDeleteTButton" class="testing">
        <i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i>
    </a>
    <!-- Delete Button End -->
</td>
<!-- Button Part End -->

</tr>

<%
    }
%>

</tbody>
</table>


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        // $('#mdcUpdateModal').css('overflow', 'auto');

        $('#stockItemTable').DataTable().destroy();

        $('#stockItemTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Item Available To Display"
            },
            initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });


    });
</script>