<%-- 
    Document   : FluidBalanceFunction
    Created on : Jul 14, 2017, 6:08:39 PM
    Author     : Shammugam
--%>



<%@page import="NIW_helper.FluidBalanceUtils"%>
<%@page import="java.util.ArrayList"%>
<%
    FluidBalanceUtils fluid = new FluidBalanceUtils();

    String data = request.getParameter("dataString");
    String methodName = request.getParameter("methodName");

    Boolean result;
    if (methodName.equalsIgnoreCase("addIntake")) {
        result = fluid.addFluidIntake(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("addOutput")) {
        result = fluid.addFluidOutput(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("updateIntake")) {
        result = fluid.updateFluidIntake(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("updateOutput")) {
        result = fluid.updateFluidOutput(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("deleteFluidIntake")) {
        result = fluid.delFluidIntake(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("deleteFluidOutput")) {
        result = fluid.delFluidOutput(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        // Do Nothing
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = fluid.getFluidIntake(data);

%>
<h5>Intake</h5>
<table class="table table-bordered" id="tableFluidBalanceIntakeTable" style="width: 100%">
    <thead>
        <tr>
            <th rowspan="2">Date</th>
            <th rowspan="2">Time</th>
            <th colspan="2">Oral</th>
            <th colspan="2">Intravenous</th>
            <th colspan="2">Other (Specify)</th>
            <th rowspan="2">Action</th>
        </tr>
        <tr>
            <th>Type</th>
            <th>Amount</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Type</th>
            <th>Amount</th>
        </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < datas.size(); i++) {%>
        <tr>
    <input id="dataFluidBalanceIntakehidden" type="hidden" value="<%=String.join("|", datas.get(i))%>">
    <td><%=datas.get(i).get(5)%></td>
    <td><%=datas.get(i).get(4)%></td>
    <td><%=datas.get(i).get(6)%></td>
    <td><%=datas.get(i).get(7)%></td>
    <td><%=datas.get(i).get(8)%></td>
    <td><%=datas.get(i).get(9)%></td>
    <td><%=datas.get(i).get(10)%></td>
    <td><%=datas.get(i).get(11)%></td>
    <td>
        <a id="tableFluidBalanceIntakeUpdateBtn" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        &nbsp;&nbsp;
        <a id="tableFluidBalanceIntakeDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
    </td>
</tr> 
<%    } %>
</tbody>

</table>

<script>
    $('#tableFluidBalanceIntakeTable').DataTable({
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
    ArrayList<ArrayList<String>> datass = fluid.getFluidOutput(data);
%>

<h5>Output</h5>
<table class="table table-bordered" id="tableFluidBalanceOutputTable" style="width: 100%">
    <thead>
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Urine</th>
            <th>Vomitus</th>
            <th>Gastric Suction</th>
            <th>Other (Specify)</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < datass.size(); i++) {%>
        <tr>
    <input id="dataFluidBalanceOutputhidden" type="hidden" value="<%=String.join("|", datass.get(i))%>">
    <td><%=datass.get(i).get(5)%></td>
    <td><%=datass.get(i).get(4)%></td>
    <td><%=datass.get(i).get(6)%></td>
    <td><%=datass.get(i).get(7)%></td>
    <td><%=datass.get(i).get(8)%></td>
    <td><%=datass.get(i).get(9)%></td>
    <td>
        <a id="tableFluidBalanceOutputUpdateBtn" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        &nbsp;&nbsp;
        <a id="tableFluidBalanceOutputDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
    </td>
</tr> 
<%    } %>
</tbody>

</table>

<script>
    $('#tableFluidBalanceOutputTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>


<% }%>

