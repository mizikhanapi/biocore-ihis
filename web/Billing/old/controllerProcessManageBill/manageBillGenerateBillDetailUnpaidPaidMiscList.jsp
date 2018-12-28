<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidMiscList
    Created on : Oct 26, 2017, 8:11:17 PM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<table id="tableMisc" class="table table-filter table-bordered">
    <thead>
    <th>Item Code</th>
    <th>Item Name</th>
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

        String query2 = "SELECT * FROM far_miscellaneous_item WHERE hfc_cd = '" + hfc + "' ";

        ArrayList<ArrayList<String>> data2 = conn.getData(query2);

        if (!data2.isEmpty()) {
            for (int i = 0; i < data2.size(); i++) {
    %>
    <tr>
        <td><%=data2.get(i).get(1)%></td>
        <td><%=data2.get(i).get(2)%></td>
        <td style="text-align: center;"><%=df.format(Double.parseDouble(data2.get(i).get(3)))%></td>
    </tr>
    <%}
    } else {%>
    <tr>
        <td colspan="3" style="text-align: center;">No Data Avaliable To Be Showed</td>
    </tr> 
    <% }
    %>
</tbody>
</table>


<script type="text/javascript">

    $(document).ready(function () {

        $("#tableMisc tbody tr").click(function () {

            $('tr.row_selected').removeClass('row_selected selectedtr');
            $(this).addClass('row_selected selectedtr');

            var dataTableTD = $(this).find('td').html();

            if (dataTableTD === "No Data Avaliable To Be Showed") {

                document.getElementById("addMiscItem").disabled = true;

            } else {

                document.getElementById("addMiscItem").disabled = false;

            }

        });

        $('.loading').hide();


    });

</script>
