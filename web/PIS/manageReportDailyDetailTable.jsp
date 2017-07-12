<%-- 
    Document   : manageReportDailyDetailTable
    Created on : Jun 28, 2017, 1:49:10 AM
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

<table  id="reportDailyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Item Code</th>
    <th>Item Name</th>
    <th>Item Amount (RM)</th>
    <th>Item Quantity Dispensed (PRICE/UNIT)</th>
    <th>Total (RM)</th>
</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        String date = request.getParameter("date");

        double quantity = 0.00;
        double grandTotal = 0.00;

        String sql = " SELECT pis_mdc2.UD_MDC_CODE, pis_mdc2.D_TRADE_NAME,pis_mdc2.D_SELL_PRICE,SUM(pis_dispense_detail.DISPENSED_QTY), "
                + " SUM(pis_dispense_detail.DISPENSED_QTY * pis_mdc2.D_SELL_PRICE) "
                + " FROM pis_dispense_master JOIN pis_dispense_detail ON (pis_dispense_master.ORDER_NO =  pis_dispense_detail.ORDER_NO) "
                + " JOIN pis_mdc2 ON (pis_dispense_detail.DRUG_ITEM_CODE =  pis_mdc2.UD_MDC_CODE) "
                + " WHERE pis_dispense_master.LOCATION_CODE  = '" + hfc + "' AND pis_dispense_master.DISCIPLINE_CODE  = '" + dis + "'  "
                + " AND pis_mdc2.hfc_cd  = '" + hfc + "' AND pis_mdc2.discipline_cd  = '" + dis + "' AND DATE(pis_dispense_master.DISPENSED_DATE) = '" + date + "' GROUP BY pis_mdc2.UD_MDC_CODE ";
        ArrayList<ArrayList<String>> dataReportDaily = conn.getData(sql);

        int size = dataReportDaily.size();
        for (int i = 0; i < size; i++) {

            quantity = quantity + Double.parseDouble(dataReportDaily.get(i).get(3));
            grandTotal = grandTotal + Double.parseDouble(dataReportDaily.get(i).get(4));
    %>

    <tr style="text-align: center;" id="">
        <td><%= dataReportDaily.get(i).get(0)%></td>
        <td><%= dataReportDaily.get(i).get(1)%></td>
        <td><%= formatter.format(Double.parseDouble(dataReportDaily.get(i).get(2)))%></td>
        <td><%= formatterInt.format(Double.parseDouble(dataReportDaily.get(i).get(3)))%></td>
        <td><%= formatter.format(Double.parseDouble(dataReportDaily.get(i).get(4)))%></td>
    </tr>
    <%
        }
    %>
</tbody>
</table>


<ShannugamRamasamySeperator></ShannugamRamasamySeperator>
    <%=formatterInt.format(quantity)%>
<ShannugamRamasamySeperator></ShannugamRamasamySeperator>
<%=formatter.format(grandTotal)%>