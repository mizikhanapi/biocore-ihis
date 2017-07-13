<%-- 
    Document   : ObservationFuntion
    Created on : 21-Jun-2017, 12:46:52
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="NIW_helper.ObservationUtils"%>
<%
    ObservationUtils obU = new ObservationUtils();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;
    String A;
//String result;
    if (methodName.equalsIgnoreCase("add")) {
        result = obU.addObservation(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = obU.getObservation(data); %>
<table class="table table-bordered table-striped" id="tblNIW_observation_chart" width="100%">
    <thead>
    <th hidden=""></th>
    <th>Date</th>
    <th>Time</th>
    <th>B/P</th>
    <th>PR</th>
    <th>RR</th>
    <th>SpO2</th>
    <th>Pain Scale</th>
    <th style="width: 30%;">Notes</th>
    <th>Approval</th>
    <th>Action</th>
</thead>
<tbody>
    <% for (int i = 0; i < datas.size(); i++) {%>
    <tr>
        <td hidden="" id="priNIWOB"><%=datas.get(i).get(0) + "|" + datas.get(i).get(1) + "|" + datas.get(i).get(2) + "|" + datas.get(i).get(3) + "|" + datas.get(i).get(4) + "|" + datas.get(i).get(5) + "|" + datas.get(i).get(6) + "|" + datas.get(i).get(7) + "|" + datas.get(i).get(8) + "|" + datas.get(i).get(9) + "|" + datas.get(i).get(10) + "|" + datas.get(i).get(11) + "|" + datas.get(i).get(12) + "|" + datas.get(i).get(13) + "|" + datas.get(i).get(14) + "|" + datas.get(i).get(15) + "|" + datas.get(i).get(16)%></td>
        <td><%=datas.get(i).get(7)%></td>
        <td><%=datas.get(i).get(6)%></td>
        <td><strong>Systolic:</strong> <%=datas.get(i).get(9)%> <br/><strong>Diastolic:</strong> <%=datas.get(i).get(10)%></td>
        <td><%=datas.get(i).get(8)%></td>
        <td><%=datas.get(i).get(11)%></td>
        <td><%=datas.get(i).get(12)%></td>
        <td><%=datas.get(i).get(13)%></td>
        <td><%=datas.get(i).get(14)%></td>
        <td>
            <%
                if (datas.get(i).get(15).equalsIgnoreCase("pending")) { %>


            <button class="btn btn-warning btn-block" id="pendingNIWOB"><i class="fa fa-check-square-o"></i> Pending</button>
            <%          } else if (datas.get(i).get(15).equalsIgnoreCase("approved")) { %>
            <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
            <%    }
            %>
        </td>
        <td>
            <%
                if (datas.get(i).get(15).equalsIgnoreCase("pending")) { %>


            <a data-toggle="modal" data-target="#cobserved1" id="editNIWOB"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <%          }
            %>
            &nbsp;
            <a id="delNIWOB" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>
    </tr>
    <%    } %>
</tbody>
<script>
    $('#tblNIW_observation_chart').dataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>
<%    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        //nah nothing to do
    } else if (methodName.equalsIgnoreCase("approving")) {
        result = obU.approving(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = obU.delObservation(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = obU.update(data);
        out.print(result);
    }
%>
