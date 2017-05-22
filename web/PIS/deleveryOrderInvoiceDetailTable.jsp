<%-- 
    Document   : deleveryOrderInvoiceDetailTable
    Created on : May 22, 2017, 6:27:00 PM
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
            + " FROM fap_vendor_detail vd  INNER JOIN fap_vendor_header vh "
            + " WHERE vh.invoice_no = vd.invoice_no AND vd.invoice_no = '" + invoiceNo + "' AND vh.hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND vh.discipline = '" + DISCIPLINE_CODE + "'  ";

    ArrayList<ArrayList<String>> dataInvoiceDetailList;
    dataInvoiceDetailList = conn.getData(invoiceDetailList);


%>
<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 95%; text-align: left" id="deleveryOrderInvoiceDetailsTable">
    <thead>
    <th style="text-align: left;">Item Code</th>
    <th style="text-align: left;">Item Name</th>
    <th style="text-align: left;">Item Amount (RM)</th>
    <th style="text-align: left;">Item Quantity (PRICE/UNIT)</th>
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
<td ><%= dataInvoiceDetailList.get(i).get(4)%></td> <!-- Item Amount (RM) -->
<td ><%= dataInvoiceDetailList.get(i).get(5)%></td> <!-- Item Quantity (UNIT) -->
<td ><%= formatter.format(Double.parseDouble(dataInvoiceDetailList.get(i).get(4)) * Double.parseDouble(dataInvoiceDetailList.get(i).get(5))) %></td> <!-- Total Price (RM) -->
<td ><%= dataInvoiceDetailList.get(i).get(6)%> </td> <!-- Created By -->
</tr>

<%  }
%>

</tbody>
</table>


