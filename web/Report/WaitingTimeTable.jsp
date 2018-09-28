<%-- 
    Document   : WaitingTimeTable
    Created on : Sep 27, 2018, 10:01:54 AM
    Author     : user
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<table  id="WaitingTimeTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Month</th>
    <th style="text-align: center;">PMI NO</th>
    <th style="text-align: center;">Patient Name</th>
    <th style="text-align: center;">Register Date</th>
    <th style="text-align: center;">DR ID</th>
    <th style="text-align: center;">DR Name</th>
    <th style="text-align: center;">Consult Date</th>
    <th style="text-align: center;">Order Date</th>
    <th style="text-align: center;">Dispense Date</th>
    <th style="text-align: center;">Nurse ID</th>
    <th style="text-align: center;">Nurse Name</th>
    <th style="text-align: center;">Duration (Minutes)</th>
</thead>
<tbody>


    <%
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

        Conn conn = new Conn();

        //                                          0                                1            2                           3                               4
        String sql = " SELECT DATE_FORMAT(que.episode_date, '%M %Y') AS Bulan, que.pmi_no, bio.`PATIENT_NAME`, que.episode_date AS 'Register Date', que.user_id AS 'Doctor ID', "
                //                  5                                       6                           7                     8                         9
                + " doc.`USER_NAME` AS 'Doctor Name', pis.`ENCOUNTER_DATE` AS 'Consult Date', pis.`ORDER_DATE`, disp.`DISPENSED_DATE`, disp.`DISPENSED_BY` AS 'Nurse ID', "
                //                  10                                                          11                                            
                + " phar.`USER_NAME` AS 'Nurse Name', TIMESTAMPDIFF(MINUTE, que.episode_date, disp.`DISPENSED_DATE`) AS 'Duration in minutes' "
                // FROM PMS SQL
                + " FROM pms_patient_queue que "
                // JOIN PMS BIODATA SQL
                + " JOIN pms_patient_biodata bio on que.pmi_no=bio.`PMI_NO` "
                // JOIN USERS SQL
                + " LEFT JOIN adm_users doc on que.user_id=doc.`USER_ID` AND que.hfc_cd=doc.`HEALTH_FACILITY_CODE` "
                // JOIN PIS ORDER MASTER SQL
                + " JOIN pis_order_master pis on que.pmi_no=pis.`PMI_NO` AND que.episode_date=pis.`EPISODE_DATE` AND pis.`HFC_TO`=que.hfc_cd "
                // JOIN PIS DISPENSE MASTER SQL
                + " JOIN pis_dispense_master disp ON pis.`ORDER_NO`=disp.`ORDER_NO` "
                // JOIN USERS SQL
                + " LEFT JOIN adm_users phar ON disp.`DISPENSED_BY`=phar.`USER_ID` AND que.hfc_cd=phar.`HEALTH_FACILITY_CODE` "
                // WHERE SQL
                + " WHERE que.hfc_cd='" + hfc + "' AND YEAR(que.episode_date)='" + year + "' AND MONTH(que.episode_date)='" + month + "' "
                + " GROUP BY Bulan, que.episode_date "
                + " ORDER BY que.episode_date; ";

        ArrayList<ArrayList<String>> dataReport = conn.getData(sql);

        int sizeMain = dataReport.size();
        for (int s = 0; s < sizeMain; s++) {

    %>

    <tr style="text-align: center;">

        <td><%= dataReport.get(s).get(0)%></td>                                            <!-- Month -->
        <td><%= dataReport.get(s).get(1)%></td>                                            <!-- PMI NO -->
        <td><%= dataReport.get(s).get(2)%></td>                                            <!-- Patient Name -->
        <td><%= dataReport.get(s).get(3)%></td>                                            <!-- Register Date -->
        <td><%= dataReport.get(s).get(4)%></td>                                            <!-- DR ID -->
        <td><%= dataReport.get(s).get(5)%></td>                                            <!-- DR Nmae -->
        <td><%= dataReport.get(s).get(6)%></td>                                            <!-- Consult Date -->
        <td><%= dataReport.get(s).get(7)%></td>                                            <!-- Order Date -->
        <td><%= dataReport.get(s).get(8)%></td>                                            <!-- Dispense Date -->
        <td><%= dataReport.get(s).get(9)%></td>                                            <!-- Nurse ID -->
        <td><%= dataReport.get(s).get(10)%></td>                                           <!-- Nurse Name -->
        <td><%= dataReport.get(s).get(11)%></td>                                           <!-- Duration -->

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

        $('#WaitingTimeTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            columnDefs: [
                {targets: [0, 1, 2, 3, 5, 6, 8, 10, 11], visible: true},
                {targets: '_all', visible: false}
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Waiting Time List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Waiting Time List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Waiting Time List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
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