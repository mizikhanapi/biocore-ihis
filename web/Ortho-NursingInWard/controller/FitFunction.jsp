<%-- 
    Document   : FitFunction
    Created on : Jul 13, 2017, 8:23:15 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="NIW_helper.FitUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    FitUtils FU = new FitUtils();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;
    String A;

    if (methodName.equalsIgnoreCase("add")) {
        result = FU.addFits(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = FU.getFits(data); %>
<table class="table table-bordered" id="tblNIW_fits">
    <thead>
    <th hidden=""></th>
    <th>Date</th>
    <th>Time</th>
    <th>Nature of Fits</th>
    <th>Duration</th>
    <th>Remarks</th>
    <th>Action</th>
</thead>
<tbody>
    <%
        for (int i = 0; i < datas.size(); i++) {%>
    <tr>
        <td hidden="" id="priNIWfits"><%=datas.get(i).get(0) + "|" + datas.get(i).get(1) + "|" + datas.get(i).get(2) + "|" + datas.get(i).get(3) + "|" + datas.get(i).get(4) + "|" + datas.get(i).get(5) + "|" + datas.get(i).get(6) + "|" + datas.get(i).get(7) + "|" + datas.get(i).get(8) + "|" + datas.get(i).get(9)%></td>
        <td><%=datas.get(i).get(4)%></td>
        <td><%=datas.get(i).get(5)%></td>
        <td><%=datas.get(i).get(7)%></td>
        <td><%=datas.get(i).get(8)%></td>
        <td><%=datas.get(i).get(9)%></td>
        <td>
            <a id="editNIWfits" data-toggle="modal" data-target="#FitsChart"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="delNIWfits" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
    </tr>
    <%   }
    %>
</tbody>
</table>
<script>
    $('#tblNIW_fits').dataTable({
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
        result = FU.delFits(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = FU.updateFits(data);
        out.print(result);
    }
%>