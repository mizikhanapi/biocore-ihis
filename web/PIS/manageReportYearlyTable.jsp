<%-- 
    Document   : manageReportYearlyTable
    Created on : Mar 9, 2017, 9:25:25 PM
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
%>


<h4 style="padding-top: 1%;padding-bottom: 2%; font-weight: bold;text-align: center;">
    YEARLY DISPENSE DATA
</h4>


<table  id="reportYearlyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">YEAR</th>
    <th style="text-align: center;">TOTAL PRODUCT DISPENSED</th>
    <th style="text-align: center;">TOTAL QUANTITY DISPENSED</th>
    <th style="text-align: center;">TOTAL PRICE (RM)</th>
</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        String sql = " SELECT YEAR(pis_dispense_master.DISPENSED_DATE) AS DATE,COUNT(pis_dispense_detail.DRUG_ITEM_CODE), "
                + "SUM(pis_dispense_detail.DISPENSED_QTY),SUM(pis_dispense_detail.DISPENSED_QTY * pis_mdc2.D_SELL_PRICE) "
                + " FROM pis_dispense_master JOIN pis_dispense_detail ON (pis_dispense_master.ORDER_NO =  pis_dispense_detail.ORDER_NO) "
                + " JOIN pis_mdc2 ON (pis_dispense_detail.DRUG_ITEM_CODE =  pis_mdc2.UD_MDC_CODE) GROUP BY DATE;";
        ArrayList<ArrayList<String>> dataReportYearly = conn.getData(sql);

        int size = dataReportYearly.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
        <td><%= dataReportYearly.get(i).get(0)%></td>
        <td><%= dataReportYearly.get(i).get(1)%></td>
        <td><%= formatterInt.format(Double.parseDouble(dataReportYearly.get(i).get(2)))%></td>
        <td><%= formatter.format(Double.parseDouble(dataReportYearly.get(i).get(3)))%></td>
    </tr>
    <%
        }
    %>
</tbody>
</table>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {



        $('#reportYearlyTable').DataTable({
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Pharmacy Yearly Report'
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Pharmacy Yearly Report'
//                }, {
//                    extend: 'pdfHtml5',
//                    text: 'Export To PDF',
//                    title: 'Pharmacy Yearly Report'
//                }, {
//                    text: 'Export To PDF My button',
//                    action: function (e, dt, node, config) {
//                        window.open("ShowPDF.jsp");
//                    }
                }
            ]
        });

    });

</script>
