<%-- 
    Document   : redivacFunction
    Created on : Jul 13, 2017, 11:33:45 AM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="NIW_helper.redivacUtils"%>
<%
    redivacUtils redU = new redivacUtils();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;
    String A;

    if (methodName.equalsIgnoreCase("add")) {
        result = redU.addRedivac(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = redU.getRedivac(data); %>
<table class="table table-bordered" id="tblNIW_redivac">
    <thead>
    <th hidden=""></th>
    <th>Date</th>
    <th>Shift</th>
    <th>Total in Bottle</th>
    <th>Amount<br>Increased / shift</th>
    <th>Total in Bottle<br>end of shift</th>
    <th>Remarks</th>
    <th>Action</th>
</thead>
<tbody>
    <%
            for (int i = 0; i < datas.size(); i++) {%>
    <tr>
        <td hidden="" id="priNIWredavic"><%=datas.get(i).get(0) + "|" + datas.get(i).get(1) + "|" + datas.get(i).get(2) + "|" + datas.get(i).get(3) + "|" + datas.get(i).get(4) + "|" + datas.get(i).get(5) + "|" + datas.get(i).get(6) + "|" + datas.get(i).get(7) + "|" + datas.get(i).get(8) + "|" + datas.get(i).get(9) + "|" + datas.get(i).get(10)%></td>
        <td><%=datas.get(i).get(4)%></td>
        <td><%=datas.get(i).get(5)%></td>
        <td><%=datas.get(i).get(6)%></td>
        <td><%=datas.get(i).get(7)%></td>
        <td><%=datas.get(i).get(8)%></td>
        <td><%=datas.get(i).get(9)%></td>
        <td>
            <a id="editNIWredivac" data-toggle="modal" data-target="#redivacDrainChart"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="delNIWredivac" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
        </td>
    </tr>
    <%   }
    %>
</tbody>
</table>
    <script>
    $('#tblNIW_redivac').dataTable({
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
        result = redU.delRedivac(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = redU.updateRedivac(data);
        out.print(result);
    }
%>
