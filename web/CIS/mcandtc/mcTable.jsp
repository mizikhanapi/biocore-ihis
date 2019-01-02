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
    String mcType = request.getParameter("mcType");
    String mcInput = request.getParameter("mcInput");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<hr class="pemisah" />

<table id="mcTableDivision" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Nama </th>
    <th> Episode date </th>
    <th> PMI No </th>
    <th> Reprint </th>

    <%  String sql = "";
        if (mcType.equals("001")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`, B.start_date, B.end_date, B.comment, A.`NEW_IC_NO`, A.ID_NO, DATE_FORMAT(DATE(B.EPISODE_DATE),'%d/%m/%Y') FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + mcInput + "' and b.leave_type='MC'";
        } else if (mcType.equals("002")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`, B.start_date, B.end_date, B.comment, A.`NEW_IC_NO`,A.ID_NO , DATE_FORMAT(DATE(B.EPISODE_DATE),'%d/%m/%Y') FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.NEW_IC_NO = '" + mcInput + "' and b.leave_type='MC'";
        } else if (mcType.equals("003")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`, B.start_date, B.end_date, B.comment, A.`NEW_IC_NO`, A.ID_NO, DATE_FORMAT(DATE(B.EPISODE_DATE),'%d/%m/%Y') FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.OLD_IC_NO = '" + mcInput + "' and b.leave_type='MC'";
        } else {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`, B.start_date, B.end_date, B.comment, A.`NEW_IC_NO`, A.ID_NO, DATE_FORMAT(DATE(B.EPISODE_DATE),'%d/%m/%Y') FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.ID_NO = '" + mcInput + "' and b.leave_type='MC'";
        }
        ArrayList<ArrayList<String>> mc = conn.getData(sql);

        int size = mc.size();
        for (int i = 0; i < size; i++) {
    %>
</thead>
<tr>
<input id="dataMCListhidden" type="hidden" value="<%=String.join("|", mc.get(i))%>">
<td ><%= mc.get(i).get(0)%></td>
<td ><%= mc.get(i).get(8)%></td>
<td id="pmino"><%= mc.get(i).get(2)%></td>
<td align="center">
    <button id="MC_btnPrint" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Print Record" ><i class="fa fa-print fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i></button>
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

        $('#mcTableDivision').DataTable({
            pageLength: 15,
            initComplete: function (settings, json) {
                $('.loading').hide();
                $('[data-toggle="tooltip"]').tooltip();
            },
            "order": [[2, "asc"]],
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'MC List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'MC List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print MC List',
                    title: '',
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Patient MC List<br/></div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>REP-003</strong></dd>\n\
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

