<%-- 
    Document   : listData
    Created on : Mar 13, 2017, 3:18:15 AM
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
    String disType = request.getParameter("disType");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="thumbnail">
    <table id="listData" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

        <thead>

        <th> PMI No </th>
        <th> Name </th>
        <th> Nationality </th>
        <th> IC No/ ID No </th>
        <th> Gender </th>
        <th> total </th>

        <%  String sql = "";
            if (disType.equals("outpatient")) {
                sql = "SELECT pmi_no,patient_name,nationality, NEW_IC_NO, SEX_CODE from pms_episode INNER JOIN pms_patient_biodata ON pms_episode.pmi_no = pmi_no.pms_patient_biodata AND discpline_code=001 WHERE pms_episode.episode_date BETWEEN = '"+ startDate +"' AND '"+ endDate +"'";
            } else if (disType.equals("inpatient")) {
                sql = "SELECT pmi_no,patient_name,nationality, NEW_IC_NO, SEX_CODE from pms_episode INNER JOIN pms_patient_biodata ON pms_episode.pmi_no = pmi_no.pms_patient_biodata AND discpline_code=001 WHERE pms_episode.episode_date BETWEEN = '"+ startDate +"' AND '"+ endDate +"'";
            } else {
                sql = "SELECT pmi_no,patient_name,nationality, NEW_IC_NO, SEX_CODE from pms_episode INNER JOIN pms_patient_biodata ON pms_episode.pmi_no = pmi_no.pms_patient_biodata AND discpline_code=001 WHERE pms_episode.episode_date BETWEEN = '"+ startDate +"' AND '"+ endDate +"'";
            }
            ArrayList<ArrayList<String>> pmh = conn.getData(sql);

            int size = pmh.size();
            for (int i = 0; i < size; i++) {
        %>

        <tr>
            <td><%= pmh.get(i).get(0)%></td>
            <td><%= pmh.get(i).get(1)%></td>
            <td><%= pmh.get(i).get(2)%></td>
            <td><%= pmh.get(i).get(3)%></td>
            <td><%= pmh.get(i).get(4)%></td>

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
        $('#listData').DataTable();
    });
</script>


