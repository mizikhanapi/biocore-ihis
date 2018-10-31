<%-- 
    Document   : mcTable
    Created on : Apr 17, 2017, 3:25:01 PM
    Author     : user
--%>

<%@page import="java.text.SimpleDateFormat"%>
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

<table id="mcTableDivision" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Nama </th>
    <th> Episode date </th>
    <th> PMI No </th>
    <th> Reprint </th>

    <%  String sql = "";
        if (mcType.equals("001")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO`,A.ID_NO FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + mcInput + "' and b.leave_type='MC'";
        } else if (mcType.equals("002")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO`,A.ID_NO FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.NEW_IC_NO = '" + mcInput + "' and b.leave_type='MC'";
        } else if (mcType.equals("003")) {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO`,A.ID_NO FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.OLD_IC_NO = '" + mcInput + "' and b.leave_type='MC'";
        } else {
            sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO`,B.start_date,B.end_date,B.comment,A.`NEW_IC_NO`,A.ID_NO FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.ID_NO = '" + mcInput + "' and b.leave_type='MC'";
        }
        ArrayList<ArrayList<String>> mc = conn.getData(sql);

        int size = mc.size();
        for (int i = 0; i < size; i++) {
    %>
</thead>
<tr>
    <input id="dataMCListhidden" type="hidden" value="<%=String.join("|", mc.get(i))%>">
    <td ><%= mc.get(i).get(0)%></td>
    <td ><%= mc.get(i).get(1)%></td>
    <td id="pmino"><%= mc.get(i).get(2)%></td>
    <td>
        <button id="MC_btnPrint" class="btn btn-default" data-toggle="modal" ><i class="fa fa-print fa-lg" aria-hidden="true" style="display: inline-block;color: #2DA3FB;" ></i>&nbsp;&nbsp;&nbsp;Print</button>
    </td>
</tr>



<%
    }
%>
</table>


<script>

    $(document).ready(function () {
        $('#mcTableDivision').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csv', 'excel', 'pdf', 'print'
            ]
        });
    });
    
</script>

