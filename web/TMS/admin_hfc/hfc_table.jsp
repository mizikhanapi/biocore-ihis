<%-- 
    Document   : hfc_table
    Created on : Apr 15, 2018, 5:56:45 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc_cd = "99_iHIS_99";
    
%>


<table  id="THE_healthFacilityTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>HFC Code</th>
    <th>HFC Name</th>
    <th>Director</th>
    <th>Address</th>
    <th>Tenant</th>
    <th>Requester</th>
    <th>Status</th>
    <th>ACTIONS</th>
</thead>
<tbody>

    <%        //--------        0           1               2                   3           4                5          6           7              8              9         10
        String sql = "SELECT hfc.hfc_cd, hfc.hfc_name, hfc.director_name, hfc.address1, hfc.address2, hfc.address3, tnt.tnt_cd, tnt.tnt_name, u.`USER_NAME`, u.user_id, u.email "
                + "FROM adm_health_facility hfc JOIN adm_tenant tnt on hfc.hfc_report = tnt.tnt_cd "
                + "JOIN adm_users u ON u.`HEALTH_FACILITY_CODE`=hfc.hfc_report WHERE hfc.hfc_status='2';";

        ArrayList<ArrayList<String>> dataHFC = conn.getData(sql);

        int size = dataHFC.size();

        for (int i = 0; i < size; i++) {
            

    %>
    <tr>

        <td><%= dataHFC.get(i).get(0)%></td> <!-- HFC code -->   
        <td><%= dataHFC.get(i).get(1)%></td> <!-- HFC name  --> 
        <td><%= dataHFC.get(i).get(2)%></td> <!-- Director --> 
        <td><%= dataHFC.get(i).get(3)%> <%=dataHFC.get(i).get(4)%> <%= dataHFC.get(i).get(5)%></td> <!-- Address  --> 
        <td><%= dataHFC.get(i).get(7)%></td> <!-- Tenant --> 
        <td><%= dataHFC.get(i).get(8)%></td> <!-- requester --> 
        <td>Waiting for approval</td> <!-- Status --> 

        <td style="width: 10% ">
           
            <input id="HFT_hidden" type="hidden" value="<%=String.join("|", dataHFC.get(i))%>">
            <!-- Update Part Start -->
            <a id="HFT_btnApprove" title="Approve HFC" style="cursor: pointer"><i class="fa fa-check-circle fa-2x" aria-hidden="true" style="display: inline-block;color: #00dd1c;"></i></a>
            &nbsp;
            <!-- Update Part Start -->
            <a id="HFT_btnReject" title="Reject HFC" style="cursor: pointer"><i class="fa fa-times-circle fa-2x" aria-hidden="true" style="display: inline-block;color: #ee2200;"></i></a>
                
        </td>
    </tr>

    <%
        }//end for loop

    %>

</tbody>
</table>
<script type="text/javascript" charset="utf-8">
    
</script>