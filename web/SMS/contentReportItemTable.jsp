<%-- 
    Document   : contentReportItemTable
    Created on : Dec 12, 2017, 6:30:08 PM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
    <th style="text-align: center;">OUM</th>
    <th style="text-align: center;">Supplier Name</th>
    <th style="text-align: center;">Serial No.</th>
    <th style="text-align: center;">Brand</th>
    <th style="text-align: center;">Location</th>
    <th style="text-align: center;">Currency</th>
    <th style="text-align: center;">Sell Price</th>
    <th style="text-align: center;">Purchase Price</th>
    <th style="text-align: center;">Wholesale Price</th>
    <th style="text-align: center;">Tax</th>
    <th style="text-align: center;">Minimum Stock</th>
    <th style="text-align: center;">Float Stock</th>
    <th style="text-align: center;">Physical Stock</th>
    <th style="text-align: center;">Reorder Level</th>
    <th style="text-align: center;">Standard Material Cost</th>
    <th style="text-align: center;">Standard Labor Cost</th>
    <th style="text-align: center;">Standard Expenses</th>
    <th style="text-align: center;">Condition</th>
    <th style="text-align: center;">Grade</th>
    <th style="text-align: center;">Status</th>
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


        <td><%= dataStockItem.get(s).get(1)%></td>                                            <!-- Category Code -->
        <td><%= dataStockItem.get(s).get(0)%></td>                                            <!-- Item Code -->
        <td><%= dataStockItem.get(s).get(2)%></td>                                            <!-- Item Name -->
        <td><%= dataStockItem.get(s).get(3)%></td>                                            <!-- Barcode -->
        <td><%= dataStockItem.get(s).get(4)%></td>                                            <!-- oum -->
        <td><%= dataStockItem.get(s).get(5)%></td>                                            <!-- supplier_cd -->
        <td><%= dataStockItem.get(s).get(6)%></td>                                            <!-- serial_no -->
        <td><%= dataStockItem.get(s).get(7)%></td>                                            <!-- brand -->
        <td><%= dataStockItem.get(s).get(8)%></td>                                            <!-- location -->
        <td><%= dataStockItem.get(s).get(9)%></td>                                            <!-- currency -->
        <td><%= dataStockItem.get(s).get(10)%></td>                                           <!-- selling_price -->
        <td><%= dataStockItem.get(s).get(11)%></td>                                           <!-- purchase_price -->
        <td><%= dataStockItem.get(s).get(12)%></td>                                           <!-- wholesale_price -->
        <td><%= dataStockItem.get(s).get(13)%></td>                                           <!-- tax -->
        <td><%= dataStockItem.get(s).get(14)%></td>                                           <!-- min_stock -->
        <td><%= dataStockItem.get(s).get(15)%></td>                                           <!-- float_stock -->
        <td><%= dataStockItem.get(s).get(16)%></td>                                           <!-- physical_stock -->
        <td><%= dataStockItem.get(s).get(17)%></td>                                           <!-- reorder_level -->
        <td><%= dataStockItem.get(s).get(18)%></td>                                           <!-- std_material_cost -->
        <td><%= dataStockItem.get(s).get(19)%></td>                                           <!-- std_labor_cost -->
        <td><%= dataStockItem.get(s).get(20)%></td>                                           <!-- std_expenses -->
        <td><%= dataStockItem.get(s).get(21)%></td>                                           <!-- item_condition -->
        <td><%= dataStockItem.get(s).get(22)%></td>                                           <!-- item_grade -->
        <td><% if (dataStockItem.get(s).get(23).equals("1")) {
                out.print("Active");
            } else {
                out.print("Inactive");
            }%>
        </td> <!-- Status -->


    </tr>

    <%
        }
    %>

</tbody>
</table>





<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

%>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#stockItemTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            columnDefs: [
                {targets: [0, 1, 2, 4, 10, 14, 16, 17, 23], visible: true},
                {targets: '_all', visible: false}
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Stock Item List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Stock Item List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Item List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Stock Item List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>SMS-0002</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'colvis',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });

    });

</script>