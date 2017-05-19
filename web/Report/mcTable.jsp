<%-- 
    Document   : mcTable
    Created on : Apr 17, 2017, 3:25:01 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
   
    Conn conn = new Conn();
    String mcType = request.getParameter("mcType");
    String mcInput = request.getParameter("mcInput");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<hr class="pemisah" />

<table id="mcTableDivision1" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Name </th>
    <th> Episode date </th>
    <th> PMI No </th>
    <th> Reprint </th>

    <%  String sql = "";
        if (mcType.equals("001")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + mcInput + "'";
        } else if (mcType.equals("002")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.NEW_IC_NO = '" + mcInput + "'";
        } else if (mcType.equals("003")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.OLD_IC_NO = '" + mcInput + "'";
        } else {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.ID_NO = '" + mcInput + "'";
        }
        ArrayList<ArrayList<String>> mc = conn.getData(sql);

        int size = mc.size();
        for (int i = 0; i < size; i++) {
    %>
</thead>
<tr>
    <td id="name"><%= mc.get(i).get(0)%></td>
    <td id="episodeDate2"><%= mc.get(i).get(1)%>
        <input type="hidden" id="episodeDate2_<%=i%>" value="<%= mc.get(i).get(1)%>">
    </td>
    <td id="pmino"><%= mc.get(i).get(2)%></td>
    <td><form><input type=submit value="reprint" id="printMC3<%=i%>" role="button"></form></td>

</tr>
</table>

<%
    }
%>
<script>
  
$(document).ready(function() {
    $('#mcTableDivision1').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    } );
} );
</script>
