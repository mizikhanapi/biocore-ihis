<%-- 
    Document   : manageReportMDCListTable
    Created on : May 29, 2017, 12:40:27 PM
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

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;">List Of MDC Drugs</h4>
<br>
<table  id="reportListMDCTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">MDC CODE</th>
    <th style="text-align: center;">ATC CODE</th>
    <th style="text-align: center;">TRADE NAME</th>
    <th style="text-align: center;">GNR NAME</th>
    <th style="text-align: center;">ROUTE_CODE</th>
    <th style="text-align: center;">FORM CODE</th>
    <th style="text-align: center;">STRENGTH</th>
    <th style="text-align: center;">ADVISE</th>
    <th style="text-align: center;">STOCK QTY</th>
    <th style="text-align: center;">DOSE QTY</th>
    <th style="text-align: center;">DOSE TYPE</th>
    <th style="text-align: center;">DURATION</th>
    <th style="text-align: center;">DURATION TYPE</th>
    <th style="text-align: center;">FREQUENCY</th>
    <th style="text-align: center;">CAUTION</th>
    <th style="text-align: center;">EXP DATE</th>
    <th style="text-align: center;">CLASSIFICATION</th>
    <th style="text-align: center;">STATUS</th>
    <th style="text-align: center;">LOCATION CODE</th>
    <th style="text-align: center;">SELL PRICE (RM)</th>
    <th style="text-align: center;">COST PRICE (RM)</th>
    <th style="text-align: center;">PACKAGING</th>
    <th style="text-align: center;">PACKAGING TYPE</th>
    <th style="text-align: center;">PRICE/PACK (RM)</th>
    <th style="text-align: center;">HFC</th>
    <th style="text-align: center;">DISCIPLINE</th>
    <th style="text-align: center;">SUB-DISCIPLINE</th>
</thead>
<tbody>

    <%
        NumberFormat formatter = new DecimalFormat("#0.00");

        //                              0         1           2           3           4           5           6           7           
        String sqlMain = " SELECT UD_MDC_CODE,UD_ATC_CODE,D_TRADE_NAME,D_GNR_NAME,D_ROUTE_CODE,D_FORM_CODE,D_STRENGTH,D_ADVISORY_CODE,"
                //      8       9       10      11      12          13          14          15          16              17          18          
                + "D_STOCK_QTY,D_QTY,D_QTYT,D_DURATION,D_DURATIONT,D_FREQUENCY,D_CAUTION_CODE,D_EXP_DATE,D_CLASSIFICATION,STATUS,D_LOCATION_CODE,"
                //      19          20          21              22          23        24        25              26
                + "D_SELL_PRICE,D_COST_PRICE,D_PACKAGING,D_PACKAGINGT,D_PRICE_PPACK,hfc_cd,discipline_cd,subdiscipline_cd "
                + "FROM pis_mdc2 WHERE hfc_cd  = '" + hfc + "' AND discipline_cd  = '" + dis + "' ";
        ArrayList<ArrayList<String>> dataMTC = conn.getData(sqlMain);

        int sizeMain = dataMTC.size();
        for (int s = 0; s < sizeMain; s++) {
    %>

    <tr style="text-align: center;">
        <td ><%= dataMTC.get(s).get(0)%></td>
        <td ><%= dataMTC.get(s).get(1)%></td>
        <td ><%= dataMTC.get(s).get(2)%></td>
        <td ><%= dataMTC.get(s).get(3)%></td>
        <td ><%= dataMTC.get(s).get(4)%></td>
        <td ><%= dataMTC.get(s).get(5)%></td>
        <td ><%= dataMTC.get(s).get(6)%></td>
        <td ><%= dataMTC.get(s).get(7)%></td>
        <td ><%= dataMTC.get(s).get(8)%></td>
        <td ><%= dataMTC.get(s).get(9)%></td>
        <td ><%= dataMTC.get(s).get(10)%></td>
        <td ><%= dataMTC.get(s).get(11)%></td>
        <td ><%= dataMTC.get(s).get(12)%></td>
        <td ><%= dataMTC.get(s).get(13)%></td>
        <td ><%= dataMTC.get(s).get(14)%></td>
        <td ><%= dataMTC.get(s).get(15)%></td>
        <td ><%= dataMTC.get(s).get(16)%></td>
        <td ><%= dataMTC.get(s).get(17)%></td>
        <td ><%= dataMTC.get(s).get(18)%></td>
        <td ><%= formatter.format(Double.parseDouble(dataMTC.get(s).get(19)))%></td>
        <td ><%= formatter.format(Double.parseDouble(dataMTC.get(s).get(20)))%></td>
        <td ><%= dataMTC.get(s).get(21)%></td>
        <td ><%= dataMTC.get(s).get(22)%></td>
        <td ><%= formatter.format(Double.parseDouble(dataMTC.get(s).get(23)))%></td>
        <td ><%= dataMTC.get(s).get(24)%></td>
        <td ><%= dataMTC.get(s).get(25)%></td>
        <td ><%= dataMTC.get(s).get(26)%></td>
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

        $('#reportListMDCTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            columnDefs: [
                {targets: [0, 1, 2, 3, 8, 15, 19], visible: true},
                {targets: '_all', visible: false}
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Pharmacy MDC Drug List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Pharmacy MDC Drug List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print MDC List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Pharmacy MDC Drug List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>PIS-0002</strong></dd>\n\
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
                    collectionLayout: 'fixed two-column',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });

    });

</script>