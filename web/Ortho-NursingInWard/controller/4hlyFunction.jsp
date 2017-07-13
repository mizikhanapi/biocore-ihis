<%-- 
    Document   : 4hlyFunction
    Created on : 03-Jul-2017, 17:42:32
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="NIW_helper.ThrombophlebitisUtils"%>
<%
    ThrombophlebitisUtils tbU = new ThrombophlebitisUtils();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;

    if (methodName.equalsIgnoreCase("add")) {
        result = tbU.add4hly(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = tbU.get4hly(data); %>
<table class="table table-bordered table-striped" id="tblNIW_4hly">
    <thead>
    <th hidden=""></th>
    <th>Date</th>
    <th>Time 4hly obs.</th>
    <th>Site of IV Canulation</th>
    <th>Pain Score</th>
    <th>Yes / No</th>
    <th>Additive</th>
    <th>ThromboPhlebitis</th>
    <th>V.I.P. Score</th>
    <th>Assign By</th>
    <th>Action</th>

</thead>
<tbody>
    <%
        for (int i = 0; i < datas.size(); i++) {%>
    <tr>
        <td hidden="" id="priNIW4hly"><%=datas.get(i).get(0) + "|" + datas.get(i).get(1) + "|" + datas.get(i).get(2) + "|" + datas.get(i).get(3)+ "|" + datas.get(i).get(4)+ "|" + datas.get(i).get(5)+ "|" + datas.get(i).get(6)+ "|" + datas.get(i).get(7)+ "|" + datas.get(i).get(8)+ "|" + datas.get(i).get(9)+ "|" + datas.get(i).get(10)+ "|" + datas.get(i).get(11)+ "|" + datas.get(i).get(12)+ "|" + datas.get(i).get(13)+ "|" + datas.get(i).get(14)+ "|" + datas.get(i).get(15)+ "|" + datas.get(i).get(16)+ "|" + datas.get(i).get(17)+ "|" + datas.get(i).get(18)+ "|" + datas.get(i).get(19)%></td>
        <td><%=datas.get(i).get(4)%></td>
        <td><%=datas.get(i).get(5)%></td>
        <td><%=datas.get(i).get(6)%></td>
        <td><%=datas.get(i).get(7)%></td>
        <td>
            <strong>Slight redness:</strong> <%=datas.get(i).get(8)%> </br>
            <strong>Swelling:</strong> <%=datas.get(i).get(10)%> </br>
            <strong>Palpable venous cord:</strong> <%=datas.get(i).get(11)%> </br>
            <strong>Unconscious pl:</strong> <%=datas.get(i).get(12)%> </br>
            <strong>Redness:</strong> <%=datas.get(i).get(9)%>
        </td>
        <td>
            <strong>Medication:</strong> <%=datas.get(i).get(15)%></br>
            <strong>Blood tx:</strong> <%=datas.get(i).get(16)%></br>
            <strong>Plain i/v drip:</strong> <%=datas.get(i).get(17)%> 
        </td>
        <td><%=datas.get(i).get(13)%></td>
        <td><%=datas.get(i).get(14)%></td>
        <td><%=datas.get(i).get(18)%></td>
        <td>
            <a data-toggle="modal" data-target="#4hly" id="editNIW4hly"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
            &nbsp;
            <a id="delNIW4hly" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
    </tr>
    <%   }
    %>
</tbody>
</table>
<script>
    $('#tblNIW_4hly').dataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>        

<% } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        //nah do nothing
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = tbU.del4hly(data);
        out.print(result);
    }else if (methodName.equalsIgnoreCase("update")) {
        result  = tbU.update4hly(data);
        out.print(result);
    }
%>
