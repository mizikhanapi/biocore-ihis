<%-- 
    Document   : manageReportDailyTable
    Created on : Jan 24, 2017, 12:33:56 PM
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


<h4>
    DAILY DISPENSED DATA
</h4>


<table  id="reportDailyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">DATE</th>
    <th style="text-align: center;">TOTAL DRUG QUANTITY DISPENSED</th>
    <th style="text-align: center;">TOTAL PRICE (RM)</th>
</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        String sql = " SELECT DATE_FORMAT(pis_dispense_master.DISPENSED_DATE, '%d %M %Y') AS DATE,COUNT(pis_dispense_detail.DRUG_ITEM_CODE), "
                + " SUM(pis_dispense_detail.DISPENSED_QTY),SUM(pis_dispense_detail.DISPENSED_QTY * pis_mdc2.D_SELL_PRICE),DATE(pis_dispense_master.DISPENSED_DATE)  "
                + " FROM pis_dispense_master JOIN pis_dispense_detail ON (pis_dispense_master.ORDER_NO =  pis_dispense_detail.ORDER_NO) "
                + " JOIN pis_mdc2 ON (pis_dispense_detail.DRUG_ITEM_CODE =  pis_mdc2.UD_MDC_CODE) "
                + " WHERE pis_dispense_master.LOCATION_CODE  = '"+dis+"' AND pis_dispense_master.DISCIPLINE_CODE  = '"+dis+"'  "
                + " AND pis_mdc2.hfc_cd  = '"+dis+"' AND pis_mdc2.discipline_cd  = '"+dis+"' GROUP BY DATE; ";
        ArrayList<ArrayList<String>> dataReportDaily = conn.getData(sql);

        int size = dataReportDaily.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;" id="moveToDailySalesDetailsTButton">
        <input id="dataDailySalesListhidden" type="hidden" value="<%=String.join("|", dataReportDaily.get(i))%>">
        <td><%= dataReportDaily.get(i).get(0)%></td>
        <td><%= formatterInt.format(Double.parseDouble(dataReportDaily.get(i).get(2)))%></td>
        <td><%= formatter.format(Double.parseDouble(dataReportDaily.get(i).get(3)))%></td>
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


        $('#reportDailyTable').DataTable({
            pageLength: 15,
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Pharmacy Daily Dispensed Drug List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Pharmacy Daily Dispensed Drug List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Daily Sales List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Pharmacy Daily Dispensed Drug List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
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
