<%-- 
    Document   : ChartDailySkinFunction
    Created on : Jul 14, 2017, 6:08:50 PM
    Author     : Shammugam
--%>

<%@page import="NIW_helper.DailySkinUtils"%>
<%@page import="java.util.ArrayList"%>
<%
    DailySkinUtils dailySkin = new DailySkinUtils();

    String data = request.getParameter("dataString");
    String methodName = request.getParameter("methodName");
    String created_by = session.getAttribute("USER_NAME").toString();

    Boolean result;
    if (methodName.equalsIgnoreCase("addSkinTool")) {
        result = dailySkin.addSkinTool(data + "|" + created_by);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("addPosition")) {
        result = dailySkin.addPosition(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("updateSkinTool")) {
        result = dailySkin.updateSkinTool(data + "|" + created_by);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("updatePosition")) {
        result = dailySkin.updatePosition(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("deleteSkinTool")) {
        result = dailySkin.delSkinTool(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("deletePosition")) {
        result = dailySkin.delPosition(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        // Do Nothing
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = dailySkin.getSkinTool(data);

%>

<h5>Daily Skin Assessment Tool</h5>
<table class="table table-bordered" id="tableChartDailySkinToolTable" style="width: 100%">
    <thead>
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Temperature</th>
            <th>Color</th>
            <th>Moisture</th>
            <th>Skin Turgor</th>
            <th>Integrity</th>
            <th>Assesor</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < datas.size(); i++) {%>
        <tr>
    <input id="dataChartDailySkinToolhidden" type="hidden" value="<%=String.join("|", datas.get(i))%>">
    <td><%=datas.get(i).get(5)%></td>
    <td><%=datas.get(i).get(4)%></td>
    <td><%=datas.get(i).get(6)%></td>
    <td><%=datas.get(i).get(7)%></td>
    <td><%=datas.get(i).get(8)%></td>
    <td><%=datas.get(i).get(9)%></td>
    <td><%=datas.get(i).get(10)%></td>
    <td><%=datas.get(i).get(11)%></td>
    <td>
        <a id="tableChartDailySkinToolUpdateBtn" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        &nbsp;&nbsp;
        <a id="tableChartDailySkinToolDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
    </td>
</tr> 
<%    } %>
</tbody>

</table>

<script>
    $('#tableChartDailySkinToolTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>


<ShammugamRamasamySeperator></ShammugamRamasamySeperator>


<%
    ArrayList<ArrayList<String>> datass = dailySkin.getPosition(data);
%>

<h5>Positioning Chart</h5>
<table class="table table-bordered" id="tableChartDailySkinPositionTable" style="width: 100%">
    <thead>
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Position / Activity</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < datass.size(); i++) {%>
        <tr>
    <input id="dataChartDailySkinPositionhidden" type="hidden" value="<%=String.join("|", datass.get(i))%>">
    <td><%=datass.get(i).get(5)%></td>
    <td><%=datass.get(i).get(4)%></td>
    <td><%=datass.get(i).get(6)%></td>
    <td>
        <a id="tableChartDailySkinPositionUpdateBtn" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        &nbsp;&nbsp;
        <a id="tableChartDailySkinPositionDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
    </td>
</tr> 
<%    } %>
</tbody>

</table>

<script>
    $('#tableChartDailySkinPositionTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>


<% }%>
