<%-- 
    Document   : CirculationFunction
    Created on : Jul 8, 2017, 10:35:57 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="NIW_helper.CirculationUtils"%>
<%
    CirculationUtils cirUt = new CirculationUtils();

    String data = request.getParameter("dataString");
    String methodName = request.getParameter("methodName");

    Boolean result;
    if (methodName.equalsIgnoreCase("add")) {
        result = cirUt.addCirculation(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = cirUt.updateCirculation(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = cirUt.delCirculation(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        // Do Nothing
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = cirUt.getCirculation(data);

%>

<table class="table table-bordered" id="tableChartCirculationTable" style="width: 100%">
    <thead>
    <th>Date</th>
    <th>Time</th>
    <th>Colour</th>
    <th>Sensation</th>
    <th>Hot / Cold</th>
    <th>Movement</th>
    <th>Others</th>
    <th>Action</th>
</thead>
<tbody>
    <% for (int i = 0; i < datas.size(); i++) {%>
    <tr>
<input id="dataChartCirculationhidden" type="hidden" value="<%=String.join("|", datas.get(i))%>">
<td><%=datas.get(i).get(7)%></td>
<td><%=datas.get(i).get(6)%></td>
<td><%=datas.get(i).get(8)%></td>
<td><%=datas.get(i).get(9)%></td>
<td><%=datas.get(i).get(10)%></td>
<td><%=datas.get(i).get(11)%></td>
<td><%=datas.get(i).get(12)%></td>
<td>
    <a id="tableChartCirculationUpdateBtn" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    &nbsp;&nbsp;
    <a id="tableChartCirculationDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
</td>
</tr> 
<%    } %>
</tbody>

</table>

<script>
    $('#tableChartCirculationTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>

<% }%>