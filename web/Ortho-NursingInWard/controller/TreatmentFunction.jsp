<%-- 
    Document   : TreatmentFunction
    Created on : Jul 11, 2017, 2:58:50 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="NIW_helper.TreatmentUtils"%>
<%
    TreatmentUtils trU = new TreatmentUtils();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;
    String A;

    if (methodName.equalsIgnoreCase("add")) {
        result = trU.addTreatment(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = trU.getTreatment(data); %>
<table class="table-guling table-responsive" id="tblNIW_tr">
    <thead>
    <th>Date</th>
    <th>Shift</th>
    <th>Right Upper Limb</th>
    <th>Left Upper Limb</th>
    <th>Right Lower Limb</th>
    <th>Left Lower Limb</th>
    <th>Angio Catheter</th>
    <th>CVP</th>
    <th>Tracheostomy</th>
    <th>Urinary Catheter</th>
    <th>Drain 1</th>
    <th>Drain 2</th>
    <th>Vaccum Dressing</th>
    <th>Ryies Tube</th>
    <th>Chest Tube</th>
    <th>Assign By</th>
</thead>
<tbody>
    <% for (int i = 0; i < datas.size(); i++) {%>
    <tr>
        <td ><input id="priNIWTR" type="hidden" value="<%=datas.get(i).get(0) + "|" + datas.get(i).get(1) + "|" + datas.get(i).get(2) + "|" + datas.get(i).get(3) + "|" + datas.get(i).get(4) + "|" + datas.get(i).get(5) + "|" + datas.get(i).get(6) + "|" + datas.get(i).get(7) + "|" + datas.get(i).get(8) + "|" + datas.get(i).get(9) + "|" + datas.get(i).get(10) + "|" + datas.get(i).get(11) + "|" + datas.get(i).get(12) + "|" + datas.get(i).get(13) + "|" + datas.get(i).get(14) + "|" + datas.get(i).get(15) + "|" + datas.get(i).get(16) + "|" + datas.get(i).get(17) + "|" + datas.get(i).get(18) + "|" + datas.get(i).get(19)%>"><strong><%=datas.get(i).get(4)%></strong></td>
        <td ><strong><%=datas.get(i).get(5)%></strong>&nbsp;&nbsp;<a data-toggle="modal" data-target="#perawatan-ortho" id="editNIWtr"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="delNIWtr" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a></td>
        <td ><%=datas.get(i).get(6)%></td>
        <td ><%=datas.get(i).get(7)%></td>
        <td ><%=datas.get(i).get(8)%></td>
        <td ><%=datas.get(i).get(9)%></td>
        <td ><%=datas.get(i).get(10)%></td>
        <td><%=datas.get(i).get(11)%></td>
        <td ><%=datas.get(i).get(12)%></td>
        <td ><%=datas.get(i).get(13)%></td>
        <td ><%=datas.get(i).get(14)%></td>
        <td ><%=datas.get(i).get(15)%></td>
        <td ><%=datas.get(i).get(16)%></td>
        <td ><%=datas.get(i).get(17)%></td>
        <td ><%=datas.get(i).get(18)%></td>
        <td ><%=datas.get(i).get(19)%></td>
    </tr>
    <% } %>
</tbody>
</table>
<script>
    $('#tblNIW_tr').dataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>
<%  } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        //nah nothing to do
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = trU.delTreatment(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = trU.updateTreatment(data);
        out.print(result);
    }
%>
