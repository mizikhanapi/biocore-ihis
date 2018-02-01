<%-- 
    Document   : manageReportItemCodeListTable
    Created on : Jan 30, 2018, 9:58:36 PM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String userID = session.getAttribute("USER_ID").toString();
%>

<table  id="reportTestItemTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: center;">Category Code</th>
    <th style="text-align: center;">Category Name</th>
    <th style="text-align: center;">Item Code</th>	 
    <th style="text-align: center;">Item Name</th>
    <th style="text-align: center;">Specimen Source</th>
    <th style="text-align: center;">Specimen Container</th>
    <th style="text-align: center;">Volume</th>
    <th style="text-align: center;">Special Instruction</th>
    <th style="text-align: center;">Price</th>
    <th style="text-align: center;">Service Price</th>
    <th style="text-align: center;">Status</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = (String) session.getAttribute("DISCIPLINE_CODE");
        String current_user = (String) session.getAttribute("USER_ID");
        String last_nine = current_user.substring(current_user.length() - 1);

        String whereClause = "";
        String orderWhereClause = " ";

        //-------------------------- to refresh order table based on request--------------------------------
        String process = "all";

        if (request.getParameter("process") != null) {

            process = request.getParameter("process");
        }

        if (process.equalsIgnoreCase("all")) {

            orderWhereClause = "  WHERE lid.hfc_cd = '" + hfc + "' AND lic.hfc_cd = '" + hfc + "' ";

        } else {

            orderWhereClause = " WHERE lid.hfc_cd = '" + hfc + "' AND lic.hfc_cd = '" + hfc + "' AND lid.test_cat = '" + process + "' ";

        }

        //                          0                       1         2           3            4            5                       6           
        String sql = "SELECT lic.category_code,lic.category_name,lid.item_cd, lid.hfc_cd, lid.test_cat, lid.item_name, IFNULL(lid.spe_source,''),  "
                //              7                           8                      9                      10                     11               12
                + " IFNULL(lid.spe_container,''), IFNULL(lid.volume,''), IFNULL(lid.special_inst,''),lid.status, IFNULL(lid.buy_price,'0'), IFNULL(lid.ser_price,'0')  "
                // FROM ORDER TABLE
                + " FROM lis_item_category lic  "
                // LEFT JOIN ITEM DETAIL TABLE
                + " LEFT JOIN lis_item_detail lid ON (lic.category_code = lid.test_cat) "
                // WHERE CONDITION
                + orderWhereClause
                + whereClause + " ORDER BY lic.category_code  ;";

        ArrayList<ArrayList<String>> dataVerifyLabOrderMaster = conn.getData(sql);

        int size = dataVerifyLabOrderMaster.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: left;">
        <td><%= dataVerifyLabOrderMaster.get(i).get(0)%></td> <!-- Category Code -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(1)%></td> <!-- Category Name -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(2)%></td> <!-- Item Code -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(5)%></td> <!-- Item Name -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(6)%></td> <!-- Specimen Source -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(7)%></td> <!-- Specimen Container -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(8)%></td> <!-- Volume -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(9)%></td> <!-- Special Instruction -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(11)%></td> <!-- Price -->
        <td><%= dataVerifyLabOrderMaster.get(i).get(12)%></td> <!-- Service Price -->
        <td><% if (dataVerifyLabOrderMaster.get(i).get(10).equals("1")) {
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

        $('#reportTestItemTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            columnDefs: [
                {targets: [0, 1, 2, 3, 4, 9, 10], visible: true},
                {targets: '_all', visible: false}
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Test Item List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Test Item List',
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
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Test Item List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>LIS-0002</strong></dd>\n\
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