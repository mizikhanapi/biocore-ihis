<%-- 
    Document   : risManageOrderListTable
    Created on : Mar 28, 2017, 3:40:38 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
%>

<h4>Order List</h4>

<table  id="risManageOrderListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: center; width: 8%;">Order No.</th>
    <th style="text-align: center; width: 10%;">PMI No.</th>
    <th style="text-align: center; width: 40%;">Name</th>
    <th style="text-align: center; width: 12%;">Order Date</th>
    <th style="text-align: center;">Health Facility Code</th>
    <th style="text-align: center;">Doctor's Name</th>
</thead>
<tbody>


    <%
        String sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,"
                + "ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,"
                + "pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE "
                + "FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO);";

        ArrayList<ArrayList<String>> dataRISOrderList = conn.getData(sql);

        int size = dataRISOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToRISOrderDetailsTButton" style="text-align: center;">
<input id="dataRISOrderListhidden" type="hidden" value="<%=String.join("|", dataRISOrderList.get(i))%>">
<td><%= dataRISOrderList.get(i).get(1)%></td> <!-- Order No -->
<td><%= dataRISOrderList.get(i).get(0)%></td> <!-- PMI No -->
<td><%= dataRISOrderList.get(i).get(13)%></td> <!-- Name -->
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
            "language": {
                "emptyTable": "No Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
    });
    
</script>

