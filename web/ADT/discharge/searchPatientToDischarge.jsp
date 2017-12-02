<%-- 
    Document   : searchPatientToDischarge
    Created on : Nov 30, 2017, 10:54:34 PM
    Author     : user
--%>

<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>



<hr class="pemisah" />
<table id="OccuTableTT"  class="table table-striped table-bordered margin-top-30px" cellspacing="0" width="100%">


    <thead>
        <tr>
            <th>Discipline</th>
            <th>Ward Name</th>
            <th>Bed</th>
            <th>Patient Name</th>
            <th>Patient ID</th>
            <th>Episode Date</th>
            <th>Discharge</th>
        </tr>

    </thead>
    <tbody>

        <%
            String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            String idWard = request.getParameter("idWard");
            String idType = request.getParameter("idType");
            String idInput = request.getParameter("idInput");
            String methodSearching = request.getParameter("methodSearch");
            String searching = "";
            String txntype = "T12115";
            String status = "0";
            String whereCon="";

            Conn conn = new Conn();
            //1 --- search by patient
            //0 --- search by ward list
            if (methodSearching.equalsIgnoreCase("1")) {
                if (idType.equals("pmino") || idType.equals("001")) {
                    whereCon=" AND ep.pmi_no='"+idInput+"'";

                } else if (idType.equals("icnew") || idType.equals("002")) {
                    whereCon=" AND bio.`NEW_IC_NO`='"+idInput+"'";
                    
                } else if (idType.equals("icold") || idType.equals("003")) {
                    whereCon=" AND bio.`OLD_IC_NO`='"+idInput+"'";
                    
                } else {
                    whereCon=" AND bio.`ID_NO`='"+idInput+"'";
                   
                }

            } else if (methodSearching.equalsIgnoreCase("0")) {
                whereCon=" AND ep.ward_id='"+idWard+"'";
            }
                
            //                      0                   1                   2          3            4           5                  6            7                                                 8                  
            searching="SELECT ep.discipline_cd, dis.discipline_name, wn.ward_id, wn.ward_name, bd.bed_id, bio.`PATIENT_NAME`, ep.pmi_no, date_format(ep.episode_date, '%Y-%m-%d %H:%i:%s'), om.order_no, "
                    //9
                    + "date_format(om.order_date, '%Y-%m-%d %H:%i:%s') "
                    + "FROM wis_inpatient_episode ep "
                    + "JOIN wis_order_master om on ep.pmi_no=om.pmi_no AND om.txn_type='T12115' AND om.order_status='0' "
                    + "JOIN wis_ward_name wn ON wn.ward_id=ep.ward_id AND wn.hfc_cd=ep.hfc_cd "
                    + "JOIN wis_bed_id bd ON bd.bed_id=ep.bed_id AND bd.ward_id=ep.ward_id AND bd.hfc_cd=ep.hfc_cd "
                    + "JOIN pms_patient_biodata bio ON bio.`PMI_NO`=ep.pmi_no "
                    + "JOIN adm_discipline dis ON dis.discipline_cd=ep.discipline_cd AND dis.discipline_hfc_cd=ep.hfc_cd "
                    + "WHERE ep.hfc_cd='"+hfc+"' AND ep.inpatient_status='0' "+whereCon;
            
            ArrayList<ArrayList<String>> dataList = conn.getData(searching);
            //out.print(searching);
            int size1141 = dataList.size();
            if (size1141 > 0) {

                for (int i = 0; i < size1141; i++) {


        %>

        <tr>
            <td><%= dataList.get(i).get(1)%></td>
            <td><%= dataList.get(i).get(3)%></td>
            <td><%= dataList.get(i).get(4)%></td>
            <td><%= dataList.get(i).get(5)%></td>
            <td><%= dataList.get(i).get(6)%></td>
            <td><%= dataList.get(i).get(7)%></td>

            <td>
                <a id="btnMoveDischarge"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                <input type="hidden" id="hidDischarge" value="<%=String.join("|", dataList.get(i))%>">
            </td>

        </tr>
        <%
            }
        } else if (size1141 < 1) { %>
        <tr>
            <td colspan="7"> No patient found! </td>
        </tr>

        <% }
        %>

    </tbody>
</table>


