<%-- 
    Document   : manageReportATCListTable
    Created on : May 29, 2017, 7:17:41 PM
    Author     : Shammugam
--%>


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
                    text: 'Print MDC List',
                    title: 'Pharmacy ATC Drug List',
                    message: 'List of Available ATC Drug In Pharmacy',
                    className: 'btn btn-primary',
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