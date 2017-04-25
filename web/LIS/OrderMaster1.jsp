<%-- 
    Document   : risManageOrderListTable
    Created on : Mar 28, 2017, 3:40:38 PM
    Author     : Raziff
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String current_user = (String) session.getAttribute("USER_ID");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String last_nine = current_user.substring(current_user.length() - 1);
%>

<h4>Order List</h4>

<table  id="risManageOrderListTable"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="width: 8%;">Order No.</th>
    <th style="width: 10%;">PMI No.</th>
    <th style="width: 40%;">Name</th>
    <th style="width: 12%;">Order Date</th>
    <th style="width: 12%;">Health Facility Code</th>
    <th style="width: 12%;">Doctor's Name</th>
</thead>
<tbody>


    <%
        //String whereClause = "";
        //if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
        // whereClause = "lis_order_master.hfc_cd = '"+hfc_cd+"' ";
        //}
        String sql = "SELECT lis_order_master.pmi_no,lis_order_master.order_no,lis_order_master.hfc_cd,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,lis_order_master.order_by,lis_order_master.hfc_from,lis_order_master.hfc_to,lis_order_master.order_status,lis_order_master.diagnosis_cd,lis_order_master.created_by,lis_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE lis_order_master.order_status='0' AND lis_order_master.hfc_cd = '" + hfc_cd + "'";
        //+ whereClause + "";

        ArrayList<ArrayList<String>> dataRISOrderList = conn.getData(sql);

        int size = dataRISOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToRISOrderDetailsTButton" style="cursor: pointer;">
<input id="dataRISOrderListhidden" type="hidden" value="<%=String.join("|", dataRISOrderList.get(i))%>">
<td><%= dataRISOrderList.get(i).get(1)%></td> <!-- Order No -->
<td><%= dataRISOrderList.get(i).get(0)%></td> <!-- PMI No -->
<td style="font-weight: 500;"><%= dataRISOrderList.get(i).get(13)%></td> <!-- Name -->
<td><%= dataRISOrderList.get(i).get(5)%></td> <!-- Order Date -->
<td><%= dataRISOrderList.get(i).get(2)%></td> <!-- Health Facility Code -->
<td><%= dataRISOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->
</tr>
<%
    }
%>
</tbody>
</table>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        $('#risManageOrderListTable').DataTable({
            language: {
                emptyTable: "No Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
    });

</script>

