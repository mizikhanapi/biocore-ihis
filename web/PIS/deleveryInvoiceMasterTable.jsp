<%-- 
    Document   : deleveryInvoiceMasterTable
    Created on : May 22, 2017, 1:51:50 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;">Drug Invoice List</h4>

<table  id="drugInvoiceListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;"> Invoice No.</th>
    <th style="text-align: left;">Vendor Name</th>
    <th style="text-align: left;">Date</th>
    <th style="text-align: left; display: none">HFC</th>
    <th style="text-align: left; display: none">DIS</th>
    <th style="text-align: left; display: none">SUB</th>
    <th style="text-align: left; display: none">LOCA</th>
    <th style="text-align: left;">TOTAL AMOUNT (RM)</th>
    <th style="text-align: left;">TOTAL QUATITY (UNIT)</th>
    <th style="text-align: left; display: none">ORDER</th>
    <th style="text-align: left; display: none">SUBLED</th>
    <th style="text-align: left; display: none">NO</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = (String) session.getAttribute("DISCIPLINE_CODE");

        String sql = "SELECT vh.vendor_id,vh.invoice_no,vh.txt_date,vh.hfc_cd,vh.discipline,vh.sub_discipline,vh.location,vh.total_amt,vh.quantity,"
                + " vh.order_no,vh.subledger_type,vh.do_number,v.vendor_name "
                + " FROM fap_vendor_header vh INNER JOIN fap_vendor v "
                + " WHERE vh.hfc_cd = '" + hfc + "' AND vh.discipline = '" + dis + "' AND vh.vendor_id = v.vendor_id ";

        ArrayList<ArrayList<String>> dataInvoiceList = conn.getData(sql);

        int size = dataInvoiceList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToInvoiceDetailsTButton" style="text-align: left;">
<input id="dataInvoiceListhidden" type="hidden" value="<%=String.join("|", dataInvoiceList.get(i))%>">
<td><%= dataInvoiceList.get(i).get(1)%></td> <!-- Invoice No -->
<td><%= dataInvoiceList.get(i).get(12)%></td> <!-- Vendor Name -->
<td><%= dataInvoiceList.get(i).get(2)%></td> <!-- Date -->
<td style="display: none"><%= dataInvoiceList.get(i).get(3)%></td> <!-- HFC -->
<td style="display: none"><%= dataInvoiceList.get(i).get(4)%></td> <!-- DIS -->
<td style="display: none"><%= dataInvoiceList.get(i).get(5)%></td> <!-- SUBDIS -->
<td style="display: none"><%= dataInvoiceList.get(i).get(6)%></td> <!-- LOCATION -->
<td><%= dataInvoiceList.get(i).get(7)%></td> <!-- TOTAL -->
<td><%= dataInvoiceList.get(i).get(8)%></td> <!-- QUANTITY -->
<td style="display: none"><%= dataInvoiceList.get(i).get(9)%></td> <!-- ORDER NO -->
<td style="display: none"><%= dataInvoiceList.get(i).get(10)%></td> <!-- SUBLEG -->
<td style="display: none"><%= dataInvoiceList.get(i).get(11)%></td> <!-- DO NO -->
</tr>
<%
    }
%>
</tbody>
</table>

<br><br>

<div class="text-right">
    <button class="btn btn-default" type="button" id="deleveryViewInvoiceResreshBtn"><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;&nbsp;Refresh Table</button>
</div>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#drugInvoiceListTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Invoice Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });

    });


    // Refresh Button Function Start
    $('#InvoiceTopContentMaster').on('click', '#deleveryViewInvoiceResreshBtn', function (e) {
        $("#InvoiceTopContentMaster").load("deleveryInvoiceMasterTable.jsp");
    });
    // Refresh Button Function End
</script>

