<%-- 
    Document   : mcTable
    Created on : Apr 17, 2017, 3:25:01 PM
    Author     : user
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String tsType = request.getParameter("tsType");
    String tsInput = request.getParameter("tsInput");
//    String episodeDate2 = request.getParameter("episodeDate2");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<hr class="pemisah" />
<table id="tsTableDivision" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Name </th>
    <th> Episode date </th>
    <th> PMI No</th>
    <th> Reprint </th>
</thead>
<%  String sql = "";
    if (tsType.equals("001")) {
        sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`, B.start_time, B.end_time, B.comment, A.`NEW_IC_NO`, A.ID_NO, DATE_FORMAT(DATE(B.EPISODE_DATE),'%d/%m/%Y') FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + tsInput + "' and b.leave_type='TS'";
    } else if (tsType.equals("002")) {
        sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`, B.start_time, B.end_time, B.comment, A.`NEW_IC_NO`, A.ID_NO, DATE_FORMAT(DATE(B.EPISODE_DATE),'%d/%m/%Y') FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.NEW_IC_NO = '" + tsInput + "' and b.leave_type='TS'";
    } else if (tsType.equals("003")) {
        sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`, B.start_time, B.end_time, B.comment, A.`NEW_IC_NO`, A.ID_NO, DATE_FORMAT(DATE(B.EPISODE_DATE),'%d/%m/%Y') FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.OLD_IC_NO = '" + tsInput + "' and b.leave_type='TS'";
    } else {
        sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`, B.start_time, B.end_time, B.comment, A.`NEW_IC_NO`, A.ID_NO, DATE_FORMAT(DATE(B.EPISODE_DATE),'%d/%m/%Y') FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.ID_NO = '" + tsInput + "' and b.leave_type='TS'";
    }
    ArrayList<ArrayList<String>> ts = conn.getData(sql);

    int size = ts.size();
    for (int i = 0; i < size; i++) {
%>

<tr>
<input id="dataTSListhidden" type="hidden" value="<%=String.join("|", ts.get(i))%>">
<td ><%= ts.get(i).get(0)%></td>
<td ><%= ts.get(i).get(8)%></td>
<td id="pmino"><%= ts.get(i).get(2)%></td>
<td align="center">
    <button id="TS_btnPrint" class="btn btn-default" data-toggle="modal" ><i class="fa fa-print fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i>&nbsp;&nbsp;&nbsp;Print</button>
</td>
</tr>


<%
    }
%>


</table>

<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>


<script>

    $(document).ready(function () {
        $('#tsTableDivision').DataTable({
            pageLength: 15,
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            "order": [[2, "asc"]],
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'TimeSlip List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'TimeSlip List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print TimeSlip List',
                    title: '',
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Patient TimeSlip List<br/></div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>REP-004</strong></dd>\n\
                                        </div> \n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');

                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'colvis',
                    text: 'Filter Table Columns',
                    className: 'btn btn-success'
                }
            ]
        });
    });

</script>







