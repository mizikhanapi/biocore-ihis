<%-- 
    Document   : WoundAssementFunction
    Created on : Jul 14, 2017, 6:08:25 PM
    Author     : Shammugam
--%>


<%@page import="NIW_helper.WoundAssessmentUtils"%>
<%@page import="java.util.ArrayList"%>
<%
    WoundAssessmentUtils wound = new WoundAssessmentUtils();

    String data = request.getParameter("dataString");
    String methodName = request.getParameter("methodName");

    Boolean result;
    if (methodName.equalsIgnoreCase("add")) {
        result = wound.addWoundAssessment(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = wound.updateWoundAssessment(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = wound.delWoundAssessment(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        // Do Nothing
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = wound.getWoundAssessment(data);

%>

<table class="table table-bordered" id="tableWoundAssessmentTable" style="width: 100%">
    <thead>
        <tr>
            <th rowspan="2">Date</th>
            <th rowspan="2">Date of next dressing change</th>
            <th colspan="3">Wound Dimensions in cm</th>
            <th rowspan="2">Exudate Level</th>
            <th rowspan="2">Exudate Colour</th>
            <th rowspan="2">Wound Bed in %</th>
            <th rowspan="2">Wound Edges</th>
            <th rowspan="2">Surrounding Skin</th>
            <th rowspan="2">Signs of Clinical Infaction</th>
            <th colspan="2">Patient Pain</th>
            <th rowspan="2">Wound Progress</th>
            <th colspan="4">Dressing Plan</th>
            <th rowspan="2">Action</th>
        </tr>
        <tr>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>During Removal</th>
            <th>While in place</th>
            <th>Primary Dressing</th>
            <th>Size & no. of pieces</th>
            <th>Secondary Dressing</th>
            <th>Size & no. of pieces</th>
        </tr>
    </thead>
    <tbody>
        <% for (int i = 0; i < datas.size(); i++) {%>
        <tr>
    <input id="dataWoundAssessmenthidden" type="hidden" value="<%=String.join("|", datas.get(i))%>">
    <td><%=datas.get(i).get(5)%></td>
    <td><%=datas.get(i).get(7)%></td>
    <td><%=datas.get(i).get(8)%></td>
    <td><%=datas.get(i).get(9)%></td>
    <td><%=datas.get(i).get(10)%></td>
    <td><%=datas.get(i).get(11)%></td>
    <td><%=datas.get(i).get(12)%></td>
    <td><%=datas.get(i).get(13)%></td>
    <td><%=datas.get(i).get(14)%></td>
    <td><%=datas.get(i).get(15)%></td>
    <td><%=datas.get(i).get(16)%></td>
    <td><%=datas.get(i).get(17)%></td>
    <td><%=datas.get(i).get(18)%></td>
    <td><%=datas.get(i).get(19)%></td>
    <td><%=datas.get(i).get(20)%></td>
    <td><%=datas.get(i).get(21)%></td>
    <td><%=datas.get(i).get(22)%></td>
    <td><%=datas.get(i).get(23)%></td>
    <td>
        <a id="tableWoundAssessmentUpdateBtn" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
        &nbsp;&nbsp;
        <a id="tableWoundAssessmentDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
    </td>
</tr> 
<%    } %>
</tbody>

</table>

<script>
    $('#tableWoundAssessmentTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>

<% }%>
