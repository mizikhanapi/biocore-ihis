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



<table  id="WaitingTimeTable"  class="table table-striped table-bordered" cellspacing="0" width="100%" style="overflow-x: auto;">
    <thead>
    <th style="text-align: center;">PMI NO</th>
    <th style="text-align: center;">Patient Name</th>
    <th style="text-align: center;">DR ID</th>
    <th style="text-align: center;">DR Name</th>
    <th style="text-align: center;">Nurse ID</th>
    <th style="text-align: center;">Nurse Name</th>
    <th style="text-align: center;">Register Date</th>
    <th style="text-align: center;">Consult Date</th>
    <th style="text-align: center;">Dispense Date</th>
    <th style="text-align: center;">Register -> Consult (Minutes)</th>
    <th style="text-align: center;">Consult -> Dispense (Minutes)</th>
    <th style="text-align: center;">Total (Minutes)</th>
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

            //                 0               1            2                3                   4                5
            sql = " SELECT ehr.C_TXNDATE, pis.ORDER_NO, pis.TXN_DATE, pis.EPISODE_DATE, disp.DISPENSED_DATE, ehr.C_TxnData, "
                    //      6               7                   8                                       9
                    + " que.pmi_no, bio.PATIENT_NAME, que.user_id AS 'Doctor ID', IFNULL(doc.USER_NAME,'-') AS 'Doctor Name', "
                    //                  10                                      11
                    + " disp.DISPENSED_BY AS 'Nurse ID', IFNULL(phar.USER_NAME,'-') AS 'Nurse Name' "
                    // FROM EHR SQL
                    + " FROM ehr_central ehr "
                    // JOIN PMS QUEUE SQL
                    + " JOIN pms_patient_queue que ON (ehr.C_TXNDATE = que.EPISODE_DATE) "
                    // JOIN PMS BIODATA SQL
                    + " JOIN pms_patient_biodata bio ON (que.pmi_no = bio.PMI_NO) "
                    // JOIN PIS ORDER MASTER SQL
                    + " JOIN pis_order_master pis ON (que.pmi_no = pis.PMI_NO AND que.episode_date = pis.EPISODE_DATE AND pis.HFC_TO = que.hfc_cd)  "
                    // JOIN PIS DISPENSE MASTER SQL
                    + " JOIN pis_dispense_master disp ON (pis.ORDER_NO = disp.ORDER_NO)  "
                    // JOIN USERS SQL
                    + " LEFT JOIN adm_users phar ON (disp.DISPENSED_BY = phar.USER_ID AND que.hfc_cd = phar.HEALTH_FACILITY_CODE) "
                    // JOIN USERS SQL
                    + " LEFT JOIN adm_users doc ON (que.user_id = doc.USER_ID AND que.hfc_cd = doc.HEALTH_FACILITY_CODE) "
                    // WHERE SQL
                    + " WHERE que.hfc_cd='" + hfc + "' AND YEAR(que.episode_date)='" + year + "' AND MONTH(que.episode_date)='" + month + "' "
                    + " AND disp.DISPENSED_DATE != '0000-00-00 00:00:00' AND ehr.STATUS = '3' "
                    + " GROUP BY que.episode_date "
                    + " ORDER BY que.episode_date; ";

        } else {

            //                 0               1            2                3                   4                5
            sql = " SELECT ehr.C_TXNDATE, pis.ORDER_NO, pis.TXN_DATE, pis.EPISODE_DATE, disp.DISPENSED_DATE, ehr.C_TxnData, "
                    //      6               7                   8                                       9
                    + " que.pmi_no, bio.PATIENT_NAME, que.user_id AS 'Doctor ID', IFNULL(doc.USER_NAME,'-') AS 'Doctor Name', "
                    //                  10                                      11
                    + " disp.DISPENSED_BY AS 'Nurse ID', IFNULL(phar.USER_NAME,'-') AS 'Nurse Name' "
                    // FROM EHR SQL
                    + " FROM ehr_central ehr "
                    // JOIN PMS QUEUE SQL
                    + " JOIN pms_patient_queue que ON (ehr.C_TXNDATE = que.EPISODE_DATE) "
                    // JOIN PMS BIODATA SQL
                    + " JOIN pms_patient_biodata bio ON (que.pmi_no = bio.PMI_NO) "
                    // JOIN PIS ORDER MASTER SQL
                    + " JOIN pis_order_master pis ON (que.pmi_no = pis.PMI_NO AND que.episode_date = pis.EPISODE_DATE AND pis.HFC_TO = que.hfc_cd)  "
                    // JOIN PIS DISPENSE MASTER SQL
                    + " JOIN pis_dispense_master disp ON (pis.ORDER_NO = disp.ORDER_NO)  "
                    // JOIN USERS SQL
                    + " LEFT JOIN adm_users phar ON (disp.DISPENSED_BY = phar.USER_ID AND que.hfc_cd = phar.HEALTH_FACILITY_CODE)  "
                    // JOIN USERS SQL
                    + " LEFT JOIN adm_users doc ON (que.user_id = doc.USER_ID AND que.hfc_cd = doc.HEALTH_FACILITY_CODE)  "
                    // WHERE SQL
                    + " WHERE que.hfc_cd='" + hfc + "' AND que.episode_date BETWEEN '" + startDate + "' AND '" + endDate + "' "
                    + " AND disp.DISPENSED_DATE != '0000-00-00 00:00:00' AND ehr.STATUS = '3' "
                    + " GROUP BY que.episode_date "
                    + " ORDER BY que.episode_date; ";

        }

        ArrayList< ArrayList< String>> dataReport = conn.getData(sql);

        int sizeMain = dataReport.size();
        for (int s = 0; s < sizeMain; s++) {

            String memo = dataReport.get(s).get(5);

            String messages[] = memo.split("\\<cr>");
            String withoutNode[] = messages[0].split("\\|", -1);

            Timestamp timestampMesageDate = Timestamp.valueOf(withoutNode[6]);
            Timestamp timestampRegisterDate = Timestamp.valueOf(dataReport.get(s).get(0));
            Timestamp timestampDispenseDate = Timestamp.valueOf(dataReport.get(s).get(4));

            long milisecForPMSCIS = timestampMesageDate.getTime() - timestampRegisterDate.getTime();
            int secondsPMSCIS = (int) milisecForPMSCIS / 1000;
            int minutesPMSCIS = (secondsPMSCIS % 3600) / 60;

            long milisecForCISPIS = timestampDispenseDate.getTime() - timestampMesageDate.getTime();
            int secondsCISPIS = (int) milisecForCISPIS / 1000;
            int minutesCISPIS = (secondsCISPIS % 3600) / 60;

            int minutesPMSPIS = minutesPMSCIS + minutesCISPIS;

            if (minutesPMSCIS >= 0 || secondsPMSCIS >= 0) {

    %>

    <tr style="text-align: center;">

        <td><%= dataReport.get(s).get(6)%></td>                                             <!-- PMI NO -->
        <td><%= dataReport.get(s).get(7)%></td>                                             <!-- Patient Name -->
        <td><%= dataReport.get(s).get(8)%></td>                                             <!-- DR ID -->
        <td><%= dataReport.get(s).get(9)%></td>                                             <!-- DR Nmae -->
        <td><%= dataReport.get(s).get(10)%></td>                                            <!-- Nurse ID -->
        <td><%= dataReport.get(s).get(11)%></td>                                            <!-- Nurse Name -->
        <td><%= timestampRegisterDate%></td>                                                <!-- Register Date -->
        <td><%= timestampMesageDate%></td>                                                  <!-- Consult Date -->
        <td><%= timestampDispenseDate%></td>                                                <!-- Dispense Date -->
        <td><%= minutesPMSCIS%></td>                                                        <!-- Duration PMS to CIS -->
        <td><%= minutesCISPIS%></td>                                                        <!-- Duration CIS to PIS -->
        <td><%= minutesPMSPIS%></td>                                                        <!-- Duration -->

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
                    <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Waiting Time Report (Overall Process)<br/><h5>For <strong>' + detailmonth + ' ' + detailyear + '</strong> </h5></div>\n\
                    <div class="info_kecik">\n\
                    <dd>Date: <strong><%=newdate%></strong></dd>\n\
                    <dd>Report ID: <strong>SAM-0001</strong></dd>\n\
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
                    <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Waiting Time Report (Overall Process)<br/><h5>From <strong>' + startdate + '</strong>  To <strong>' + enddate + '</strong> </h5></div>\n\
                    <div class="info_kecik">\n\
                    <dd>Date: <strong><%=newdate%></strong></dd>\n\
                    <dd>Report ID: <strong>SAM-0001</strong></dd>\n\
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
                {targets: [0, 1, 3, 5, 6, 7, 8, 11], visible: true},
                {targets: '_all', visible: false}
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Waiting Time List (Overall Process)',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Waiting Time List (Overall Process)',
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