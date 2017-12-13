<%-- 
    Document   : contentReportMonthlyDetailsTable
    Created on : Dec 13, 2017, 9:52:03 AM
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

<table  id="reportMonthlyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
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

        String sql = " SELECT sdd.item_cd, sdd.item_desc,SUM(sdd.item_quantity),SUM(sdd.item_amt) "
                + " FROM stk_distribition_detail sdd "
                + " LEFT JOIN stk_distribition_master sdm ON (sdm.order_no =  sdd.order_no) "
                + " WHERE sdm.hfc_cd  = '" + hfc + "' AND sdm.discipline_cd  = '" + dis + "' AND EXTRACT(YEAR_MONTH FROM sdd.txt_date) = '" + date + "' "
                + " GROUP BY sdd.item_cd ";
        ArrayList<ArrayList<String>> dataReportMonthly = conn.getData(sql);

        int size = dataReportMonthly.size();
        for (int i = 0; i < size; i++) {

            quantity = quantity + Double.parseDouble(dataReportMonthly.get(i).get(2));
            grandTotal = grandTotal + Double.parseDouble(dataReportMonthly.get(i).get(3));
    %>

    <tr style="text-align: center;" id="">
        <td><%= dataReportMonthly.get(i).get(0)%></td>
        <td><%= dataReportMonthly.get(i).get(1)%></td>
        <td><%= formatter.format(Double.parseDouble(dataReportMonthly.get(i).get(3)) / Double.parseDouble(dataReportMonthly.get(i).get(2)))%></td>
        <td><%= formatterInt.format(Double.parseDouble(dataReportMonthly.get(i).get(2)))%></td>
        <td><%= formatter.format(Double.parseDouble(dataReportMonthly.get(i).get(3)))%></td>
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