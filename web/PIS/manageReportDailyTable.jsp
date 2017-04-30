<%-- 
    Document   : manageReportDailyTable
    Created on : Jan 24, 2017, 12:33:56 PM
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


<h4>
    DAILY DISPENSE DATA
</h4>


<table  id="reportDailyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">DATE</th>
    <th style="text-align: center;">TOTAL PRODUCT DISPENSED</th>
    <th style="text-align: center;">TOTAL QUANTITY DISPENSED</th>
    <th style="text-align: center;">TOTAL PRICE (RM)</th>
</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        String sql = " SELECT DATE_FORMAT(pis_dispense_master.DISPENSED_DATE, '%d %M %Y') AS DATE,COUNT(pis_dispense_detail.DRUG_ITEM_CODE), "
                + " SUM(pis_dispense_detail.DISPENSED_QTY),SUM(pis_dispense_detail.DISPENSED_QTY * pis_mdc2.D_SELL_PRICE)  "
                + " FROM pis_dispense_master JOIN pis_dispense_detail ON (pis_dispense_master.ORDER_NO =  pis_dispense_detail.ORDER_NO) "
                + " JOIN pis_mdc2 ON (pis_dispense_detail.DRUG_ITEM_CODE =  pis_mdc2.UD_MDC_CODE) "
                + " WHERE pis_dispense_master.LOCATION_CODE  = '04010101' AND pis_dispense_master.DISCIPLINE_CODE  = '001'  "
                + " AND pis_mdc2.hfc_cd  = '04010101' AND pis_mdc2.discipline_cd  = '001' GROUP BY DATE; ";
        ArrayList<ArrayList<String>> dataReportDaily = conn.getData(sql);

        int size = dataReportDaily.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
        <td><%= dataReportDaily.get(i).get(0)%></td>
        <td><%= dataReportDaily.get(i).get(1)%></td>
        <td><%= formatterInt.format(Double.parseDouble(dataReportDaily.get(i).get(2)))%></td>
        <td><%= formatter.format(Double.parseDouble(dataReportDaily.get(i).get(3)))%></td>
    </tr>
    <%
        }
    %>
</tbody>
</table>

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
                    title: 'Pharmacy Daily Report'
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Pharmacy Daily Report'
                }
            ]
        });

    });
</script>
