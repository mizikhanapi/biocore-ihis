<%-- 
    Document   : manageReportOrderListTable
    Created on : Jan 31, 2018, 12:01:20 PM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>

<%
    Conn conn = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    String status = request.getParameter("status");
    String timeFrame = request.getParameter("timeFrame");

    String whereCondition = "", tabStat = "";

    if (status.equalsIgnoreCase("0")) {

        whereCondition = " AND order_no in "
                + "(SELECT order_no FROM lis_order_detail "
                + "GROUP BY order_no HAVING sum(detail_status <> '0') = 0) ";
        tabStat = "Pending";

    } else if (status.equalsIgnoreCase("1")) {

        whereCondition = " AND order_no in "
                + "(SELECT order_no FROM lis_order_detail "
                + "WHERE detail_status in ('1')) ";
        tabStat = "In progress";

    } else if (status.equalsIgnoreCase("2")) {

        whereCondition = " AND order_status='3' ";
        tabStat = "Complete";

    } else if (status.equalsIgnoreCase("3")) {

        whereCondition = " AND order_status='1' ";
        tabStat = "Cancel";

    }

    String query = "SELECT date_format(order_date, '" + timeFrame + "') as masa, order_status, count(order_no) "
            + "FROM lis_order_master "
            + "WHERE hfc_to='" + hfc_cd + "' " + whereCondition
            + "GROUP BY masa;";

    ArrayList<ArrayList<String>> dataPatientApp = conn.getData(query);

%>

<table id="reportLabOrderTable"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Order Date</th>
            <th >Status</th>
            <th >Total order</th>
        </tr>
    </thead>
    <tbody>

        <%            for (int i = 0; i < dataPatientApp.size(); i++) {

        %>
        <tr class="clickable_tr" style="cursor: pointer;">
            <td><%=dataPatientApp.get(i).get(0)%></td>
            <td><%=tabStat%></td>
            <td>
                <%=dataPatientApp.get(i).get(2)%>
                <input type="hidden" id="leDate" value="<%=dataPatientApp.get(i).get(0)%>">
                <input type="hidden" id="leStatus" value="<%=status%>">
                <input type="hidden" id="leTimeFrame" value="<%=timeFrame%>">
            </td>

        </tr>
        <%

            }
        %>
    </tbody>
</table>




<%
    String sqlhfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(sqlhfc_cd);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

%>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#reportLabOrderTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Laboratory Order List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Laboratory Order List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Order List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Laboratory Order List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>LIS-0003</strong></dd>\n\
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