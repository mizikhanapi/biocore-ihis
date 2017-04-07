<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>




<table id="OccuTableTT"  class="table table-striped table-bordered" cellspacing="0" width="100%">


    <thead>


    <th>Ward Name</th>
    <th>Bed</th>
    <th>Patient Name</th>
    <th>Patient ID</th>
    <th>Sponsor</th>
    <th>Transfer</th>
    <th>Discharge</th>
</thead>
<tbody>

    <%            String idWard = request.getParameter("idWard");
    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");

        Conn conn = new Conn();
        String wardTran = "SELECT ward_class_code, bed_id, PATIENT_NAME, ID_NO, pmi_no, ward_id, eligibility_category_cd,DEPOSIT_INPATIENT  FROM wis_inpatient_episode where ward_id ='" + idWard + "'";
        ArrayList<ArrayList<String>> datawardTran = conn.getData(wardTran);

        int size1141 = datawardTran.size();
        for (int i = 0; i < size1141; i++) {


    %>


    <tr id="moveToPatientTransferButton">

<input id="dataWardhidden" type="hidden" value="<%=String.join("|", datawardTran.get(i))%>">
<td><input readonly type="text"  name="WardClass" id="WardClass" value="<%= datawardTran.get(i).get(0)%>" /></td>
<td><input readonly="" type="text"  name="Bed" id="Bed" value="<%= datawardTran.get(i).get(1)%>" /></td>
<td><input readonly type="text"  name="pname" id="pname" value="<%= datawardTran.get(i).get(2)%>"/></td>
<td><input readonly type="text"  name="pino" id="pino" value="<%= datawardTran.get(i).get(3)%>"/></td>
<td><input readonly type="text"  name="sponsor" id="sponsor" value="<%= datawardTran.get(i).get(6)%>"/></td>

<td>
    <!-- Update Part Start -->
    <a id="Occu_transfer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="Occu_delete" class="testing"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }

%>

</tbody>
</table>