<%-- 
    Document   : fullReportDiagnosisTable
    Created on : Feb 27, 2017, 12:12:47 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="thumbnail">
    <table id="DiagnosisTable" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 15px">

        <thead>

        <th> Diagnosis </th>
        <th> Number of Diagnosis</th>

        <%  String sql = "SELECT ICD10_Description, diagnosis_cd FROM lhr_diagnosis  WHERE episode_date = '" + startDate + "' BETWEEN '" + endDate + "'";

            ArrayList<ArrayList<String>> diagnosisData = conn.getData(sql);

            int size = diagnosisData.size();
            for (int i = 0; i < size; i++) {
        %>

        <tr>
            <td><%= diagnosisData.get(i).get(0)%></td>
            <td><%= diagnosisData.get(i).get(1)%></td>


        </tr>


        <%
            }
        %>  
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#DiagnosisTable').DataTable();
    });
</script>


