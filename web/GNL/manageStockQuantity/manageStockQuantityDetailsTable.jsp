<%-- 
    Document   : manageStockQuantityDetailsTable
    Created on : Dec 11, 2017, 5:31:24 PM
    Author     : Shammugam
--%>


<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();

    NumberFormat formatter = new DecimalFormat("#0.00");
    NumberFormat formatterInt = new DecimalFormat("#0");

    String invoiceNo = request.getParameter("invoiceNo");

    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");

    //                                      0            1            2         3            4           5           6        
    String invoiceDetailList = "SELECT vd.invoice_no,vd.txt_date,vd.item_cd,vd.item_desc,vd.item_amt,vd.quantity,vd.created_by "
            + " FROM fap_vendor_detail vd  "
            + " LEFT JOIN fap_vendor_header vh ON (vh.invoice_no = vd.invoice_no) "
            + " WHERE  vd.invoice_no = '" + invoiceNo + "' "
            + " AND vh.hfc_cd = '" + HEALTH_FACILITY_CODE + "' "
            + " AND vh.discipline = '" + DISCIPLINE_CODE + "'  ";

    ArrayList<ArrayList<String>> dataInvoiceDetailList;

    dataInvoiceDetailList = conn.getData(invoiceDetailList);


%>
<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 95%; text-align: left" id="invoiceOrderInvoiceDetailsTable">
    <thead>
    <th style="text-align: left;">Item Code</th>
    <th style="text-align: left;">Item Name</th>
    <th style="text-align: left;">Item Price (PRICE/UNIT)</th>
    <th style="text-align: left;">Item Quantity</th>
    <th style="text-align: left;">Total Price (RM)</th>
    <th style="text-align: left;">Created By</th>
</thead>

<tbody>
    <%        for (int i = 0; i < dataInvoiceDetailList.size(); i++) {

    %>
    <tr style="text-align: left;">
<input id="dataInvoiceDetailListhidden" type="hidden" value="<%=String.join("|", dataInvoiceDetailList.get(i))%>">

<td ><%= dataInvoiceDetailList.get(i).get(2)%></td> <!-- Item Code -->
<td ><%= dataInvoiceDetailList.get(i).get(3)%></td> <!-- Item Name -->
<td ><%= formatter.format(Double.parseDouble(dataInvoiceDetailList.get(i).get(4)) / Double.parseDouble(dataInvoiceDetailList.get(i).get(5)))%></td> <!-- Item Price (RM) -->
<td ><%= dataInvoiceDetailList.get(i).get(5)%></td> <!-- Item Quantity (UNIT) -->
<td ><%= dataInvoiceDetailList.get(i).get(4)%></td> <!-- Total Price (RM) -->
<td ><%= dataInvoiceDetailList.get(i).get(6)%> </td> <!-- Created By -->
</tr>

<%  }
%>

</tbody>
</table>