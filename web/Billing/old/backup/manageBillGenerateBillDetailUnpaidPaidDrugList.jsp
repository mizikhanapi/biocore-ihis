<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidDrugList
    Created on : Oct 26, 2017, 8:11:01 PM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<table id="tableDrugsItem" class="table table-filter table-bordered">
    <thead>
    <th>Item Code</th>
    <th>Name</th>
    <th>Expire Date</th>
    <th style="text-align: center;">Price (RM)</th>
</thead>
<tbody>
    <%
        // Conncetion And Session Variable
        Conn conn = new Conn();

        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = session.getAttribute("DISCIPLINE_CODE").toString();
        String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

        // Decimal Format
        DecimalFormat df = new DecimalFormat("0.00");

        String sql = "SELECT ud_mdc_code, d_trade_name, DATE_FORMAT(DATE(d_exp_date),'%d/%m/%Y'), d_sell_price "
                + "FROM pis_mdc2 WHERE hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "' ";
        
        ArrayList<ArrayList<String>> data = conn.getData(sql);
        if (!data.isEmpty()) {
            for (int i = 0; i < data.size(); i++) {
    %>
    <tr>
        <td><%=data.get(i).get(0)%></td>
        <td><%=data.get(i).get(1)%></td>
        <td><%=data.get(i).get(2)%></td>
        <td style="text-align: center;"><%=df.format(Double.parseDouble(data.get(i).get(3)))%></td>
    </tr>
    <%}
        }%>
</tbody>
</table>


<script type="text/javascript">

    $(document).ready(function () {

        $("#tableDrugsItem tbody tr").click(function () {
            $('tr.row_selected').removeClass('row_selected selectedtr');
            $(this).addClass('row_selected selectedtr');
        });

    });

</script>
