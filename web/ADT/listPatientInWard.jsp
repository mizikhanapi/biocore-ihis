<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>

<%@ page session="true" %>



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

    <%
        Conn conn = new Conn();
        String wardTran="";
        String idButton = request.getParameter("idButton");
        String wardID = request.getParameter("wardID");
        String input = request.getParameter("input");
        String idType = request.getParameter("idType");
        String hfc = request.getParameter("hfc");
        if(idButton.equalsIgnoreCase("P")){
            if(idType.equalsIgnoreCase("001")){
                wardTran = "SELECT * FROM wis_inpatient_episode where hfc_cd='"+hfc+"' and pmi_no = '"+input+"'";
            }else if(idType.equalsIgnoreCase("002")){
                wardTran = "SELECT * FROM wis_inpatient_episode where hfc_cd='"+hfc+"' and NEW_IC_NO = '"+input+"'";
            }else if(idType.equalsIgnoreCase("003")){
                wardTran = "SELECT * FROM wis_inpatient_episode where hfc_cd='"+hfc+"' and OLD_IC_NO = '"+input+"'";
            }else{
                wardTran = "SELECT * FROM wis_inpatient_episode where hfc_cd='"+hfc+"' and ID_NO = '"+input+"' and ID_TYPE='"+idType+"'";
            }                  
        }else if(idButton.equalsIgnoreCase("W")){
            wardTran = "SELECT * FROM wis_inpatient_episode where ward_id ='"+wardID+"' and hfc_cd = '"+hfc+"'";
        }
         
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
<script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>



