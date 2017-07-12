<%-- 
    Document   : manageReportATCListTable
    Created on : May 29, 2017, 7:17:41 PM
    Author     : Shammugam
--%>


<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
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
<h4 style="padding-top: 2%;padding-bottom: 1%;">List Of ATC Drugs</h4>
<br>
<table  id="reportListATCTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">ATC CODE</th>
    <th style="text-align: center;">ATC CODE DESCRIPTION</th>
    <th style="text-align: center;">CATEGORY CODE</th>
    <th style="text-align: center;">HFC CODE</th>
    <th style="text-align: center;">DISCIPLINE CODE</th>
    <th style="text-align: center;">SUBDISCIPLINE CODE</th>
    <th style="text-align: center;">STATUS</th>
</thead>
<tbody>

    <%
        String sql = " SELECT UD_ATC_Code, UD_ATC_Desc, Category_Code,hfc_cd,discipline_cd,subdiscipline_cd,Status FROM pis_atc WHERE hfc_cd  = '" + hfc + "' AND discipline_cd  = '" + dis + "' ";
        ArrayList<ArrayList<String>> dataATC = conn.getData(sql);

        int size = dataATC.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
        <td><%= dataATC.get(i).get(0)%></td>
        <td><%= dataATC.get(i).get(1)%></td>
        <td><%= dataATC.get(i).get(2)%></td>
        <td><%= dataATC.get(i).get(3)%></td>
        <td><%= dataATC.get(i).get(4)%></td>
        <td><%= dataATC.get(i).get(5)%></td>
        <td><%if (dataATC.get(i).get(6).equals("1")) {
                out.print("Active");
            } else {
                out.print("Inactive");
            } %></td> <!--status 3 --> 
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

        $('#reportListATCTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Pharmacy ATC Drug List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Pharmacy ATC Drug List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print ATC List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Pharmacy ATC Drug List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Pharmacy Sales Report  &nbsp;&nbsp;  ***** </div>');
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