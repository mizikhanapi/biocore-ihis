<%-- 
    Document   : WaitingTimeConsultRadiologyTable
    Created on : Oct 27, 2018, 12:10:28 AM
    Author     : Shammugam
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
    <th style="text-align: left;">PMI NO</th>
    <th style="text-align: left;">Patient Name</th>
    <th style="text-align: left;">DR ID</th>
    <th style="text-align: left;">DR Name</th>
    <th style="text-align: left;">Register Date</th>
    <th style="text-align: left;">Consult Date</th>
    <th style="text-align: left;">Order Date</th>
    <th style="text-align: left;">Duration (Minutes)</th>
</thead>
<tbody>


    <%
        String filter = request.getParameter("filter");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String monthString = request.getParameter("monthString");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

        Conn conn = new Conn();

        String sql = "";

        if (filter.equals("month")) {

            //                                          0                         1            2                     3                               4
            sql = " SELECT DATE_FORMAT(que.episode_date, '%M %Y') AS BULAN, que.pmi_no, bio.PATIENT_NAME, que.user_id AS 'Doctor ID', IFNULL(doc.USER_NAME,'-') AS 'Doctor Name',  "
                    //                  5                                       6                                   7                
                    + " que.episode_date AS 'Register Date', ris.encounter_date AS 'Consult Date', ris.order_date AS 'Radiology Get Order', "
                    //                  8                                                                         
                    + " TIMESTAMPDIFF(MINUTE, ris.encounter_date, ris.order_date) AS 'Duration in minutes', "
                    //                              9                                       10                                      11
                    + " DATE_FORMAT(que.episode_date,'%d/%m/%Y %H:%i:%s'), DATE_FORMAT(ris.encounter_date,'%d/%m/%Y %H:%i:%s'), DATE_FORMAT(ris.order_date,'%d/%m/%Y %H:%i:%s') "
                    // FROM PMS SQL
                    + " FROM pms_patient_queue que "
                    // JOIN PMS BIODATA SQL
                    + " JOIN pms_patient_biodata bio ON (que.pmi_no = bio.PMI_NO) "
                    // JOIN PIS ORDER MASTER SQL
                    + " JOIN ris_order_master ris ON (que.pmi_no = ris.pmi_no AND que.episode_date = ris.episode_date AND ris.hfc_to = que.hfc_cd) "
                    // JOIN USERS SQL
                    + " LEFT JOIN adm_users doc ON (que.user_id = doc.USER_ID AND que.hfc_cd = doc.HEALTH_FACILITY_CODE) "
                    // WHERE SQL
                    + " WHERE que.hfc_cd='" + hfc + "' AND YEAR(que.episode_date)='" + year + "' AND MONTH(que.episode_date)='" + month + "' "
                    + " GROUP BY que.episode_date "
                    + " ORDER BY que.episode_date; ";

        } else {

            //                                          0                         1            2                     3                               4
            sql = " SELECT DATE_FORMAT(que.episode_date, '%M %Y') AS BULAN, que.pmi_no, bio.PATIENT_NAME, que.user_id AS 'Doctor ID', IFNULL(doc.USER_NAME,'-') AS 'Doctor Name',  "
                    //                  5                                       6                                   7                
                    + " que.episode_date AS 'Register Date', ris.encounter_date AS 'Consult Date', ris.order_date AS 'Radiology Get Order', "
                    //                  8                                                                         
                    + " TIMESTAMPDIFF(MINUTE, ris.encounter_date, ris.order_date) AS 'Duration in minutes', "
                    //                              9                                       10                                      11
                    + " DATE_FORMAT(que.episode_date,'%d/%m/%Y %H:%i:%s'), DATE_FORMAT(ris.encounter_date,'%d/%m/%Y %H:%i:%s'), DATE_FORMAT(ris.order_date,'%d/%m/%Y %H:%i:%s') "
                    // FROM PMS SQL
                    + " FROM pms_patient_queue que "
                    // JOIN PMS BIODATA SQL
                    + " JOIN pms_patient_biodata bio ON (que.pmi_no = bio.PMI_NO) "
                    // JOIN PIS ORDER MASTER SQL
                    + " JOIN ris_order_master ris ON (que.pmi_no = ris.pmi_no AND que.episode_date = ris.episode_date AND ris.hfc_to = que.hfc_cd) "
                    // JOIN USERS SQL
                    + " LEFT JOIN adm_users doc ON (que.user_id = doc.USER_ID AND que.hfc_cd = doc.HEALTH_FACILITY_CODE) "
                    // WHERE SQL
                    + " WHERE que.hfc_cd='" + hfc + "' AND que.episode_date BETWEEN '" + startDate + "' AND '" + endDate + "' "
                    + " GROUP BY que.episode_date "
                    + " ORDER BY que.episode_date; ";

        }

        ArrayList< ArrayList< String>> dataReport = conn.getData(sql);

        int sizeMain = dataReport.size();
        for (int s = 0; s < sizeMain; s++) {

            if (Integer.parseInt(dataReport.get(s).get(8)) < 0) {
            } else {

    %>

    <tr style="text-align: left;">

        <td><%= dataReport.get(s).get(1)%></td>                                            <!-- PMI NO -->
        <td><%= dataReport.get(s).get(2)%></td>                                            <!-- Patient Name -->
        <td><%= dataReport.get(s).get(3)%></td>                                            <!-- DR ID -->
        <td><%= dataReport.get(s).get(4)%></td>                                            <!-- DR Nmae -->
        <td><%= dataReport.get(s).get(9)%></td>                                            <!-- Register Date -->
        <td><%= dataReport.get(s).get(10)%></td>                                            <!-- Consult Date -->
        <td><%= dataReport.get(s).get(11)%></td>                                            <!-- Order Date -->
        <td><%= dataReport.get(s).get(8)%></td>                                           <!-- Duration -->

    </tr>

    <%
            }
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

    var prepend = "";

    if ('<%=filter%>' === 'month') {

        var detailyear, detailmonth;
        detailyear = "<%=year%>";
        detailmonth = "<%=monthString%>";

        prepend = '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                    <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Waiting Time Report (Consultation -> Radiology)<br/><h5>For <strong>' + detailmonth + ' ' + detailyear + '</strong> </h5></div>\n\
                    <div class="info_kecik">\n\
                    <dd>Date: <strong><%=newdate%></strong></dd>\n\
                    <dd>Report ID: <strong>SAM-0006</strong></dd>\n\
                    </div> ';

    } else {

        var startdate, enddate;
        startdate = "<%=startDate%>";
        enddate = "<%=endDate%>";
        var temp = startdate.split("-");
        startdate = temp[2] + "/" + temp[1] + "/" + temp[0];

        temp = enddate.split("-");
        enddate = temp[2] + "/" + temp[1] + "/" + temp[0];

        prepend = '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                    <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Waiting Time Report (Consultation -> Radiology)<br/><h5>From <strong>' + startdate + '</strong>  To <strong>' + enddate + '</strong> </h5></div>\n\
                    <div class="info_kecik">\n\
                    <dd>Date: <strong><%=newdate%></strong></dd>\n\
                    <dd>Report ID: <strong>SAM-0006</strong></dd>\n\
                    </div> ';

    }




    $(document).ready(function () {

        $('#WaitingTimeTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            columnDefs: [
                {targets: [0, 1, 3, 5, 6, 7], visible: true},
                {targets: '_all', visible: false}
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Waiting Time List (Consultation -> Radiology)',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Waiting Time List (Consultation -> Radiology)',
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
                                .prepend(prepend);
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