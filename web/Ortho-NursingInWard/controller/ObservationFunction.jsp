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
//String result;
    if (methodName.equalsIgnoreCase("add")) {
        result = obU.addObservation(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = obU.getObservation(data); %>
                <table class="table table-bordered table-striped" id="tblNIW_observation_chart" width="100%">
                    <thead>
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
                    <td><%=datas.get(i).get(7)%></td>
                    <td><%=datas.get(i).get(6)%></td>
                    <td>Systolic: <%=datas.get(i).get(9)%> <br/>Diastolic: <%=datas.get(i).get(10)%></td>
                    <td><%=datas.get(i).get(8)%></td>
                    <td><%=datas.get(i).get(11)%></td>
                    <td><%=datas.get(i).get(12)%></td>
                    <td><%=datas.get(i).get(13)%></td>
                    <td><%=datas.get(i).get(14)%></td>
                    <td>
                        <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
                    </td>
                    <td>
                        <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                        &nbsp;
                        <a id="MW_delete" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

                    </td>
                </tr>
    <%    } %>
            </tbody>
            <script>
                $('#tblNIW_observation_chart').dataTable();
            </script>
<%    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {

    }
%>
