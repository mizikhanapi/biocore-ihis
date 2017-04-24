<%-- 
    Document   : patientOrderListTable
    Created on : Feb 7, 2017, 12:19:40 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String userID = session.getAttribute("USER_ID").toString();
%>
<input id="dataPatientOrderListUserIDhidden" type="hidden" value="<%= userID%>">
<h4 style="padding-top: 2%;padding-bottom: 1%;">Drug Order List</h4>

<table  id="patientOrderListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: center;">Order No.</th>
    <th style="text-align: center;">PMI No.</th>
    <th style="text-align: center;">Name</th>
    <th style="text-align: center;">Order Date</th>
    <th style="text-align: center; display: none">Health Facility Code</th>
    <th style="text-align: center;">Doctor's Name</th>
</thead>
<tbody>

    <%
        String hfc = "";

        hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

        String sql = "SELECT pis_order_master.ORDER_NO,pis_order_master.PMI_NO,pis_order_master.HEALTH_FACILITY_CODE,pis_order_master.EPISODE_CODE,pis_order_master.ENCOUNTER_DATE,"
                + "pis_order_master.ORDER_DATE,pis_order_master.ORDER_BY,pis_order_master.ORDER_FROM,pis_order_master.ORDER_TO,pis_order_master.HFC_FROM,pis_order_master.HFC_TO,"
                + "pis_order_master.SPUB_NO,pis_order_master.KEYIN_BY,pis_order_master.TOTAL_ORDER,pis_order_master.STATUS,pms_patient_biodata.PATIENT_NAME,"
                + "pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,pis_order_master.ORDER_STATUS,s.description,b.description "
                + "FROM pis_order_master JOIN pms_patient_biodata ON (pis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) "
                + "JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = pis_order_master.HEALTH_FACILITY_CODE "
                + "LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = pis_order_master.HEALTH_FACILITY_CODE "
                + "WHERE pis_order_master.ORDER_STATUS = '0' AND pis_order_master.HEALTH_FACILITY_CODE = '" + hfc + "';";

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToOrderDetailsTButton" style="text-align: center;">
<input id="dataPatientOrderListhidden" type="hidden" value="<%=String.join("|", dataPatientOrderList.get(i))%>">
<td><%= dataPatientOrderList.get(i).get(0)%></td> <!-- Order No -->
<td><%= dataPatientOrderList.get(i).get(1)%></td> <!-- PMI No -->
<td><%= dataPatientOrderList.get(i).get(15)%></td> <!-- Name -->
<td><%= dataPatientOrderList.get(i).get(5)%></td> <!-- Order Date -->
<td style="display: none"><%= dataPatientOrderList.get(i).get(2)%></td> <!-- Health Facility Code -->
<td><%= dataPatientOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->
</tr>
<%
    }
%>
</tbody>
</table>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#patientOrderListTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
    });
</script>

