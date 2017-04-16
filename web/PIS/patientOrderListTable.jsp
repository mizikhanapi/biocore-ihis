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
%>

<h4 style="padding-top: 2%;padding-bottom: 1%;">Drug Order List</h4>

<table  id="patientOrderListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: center;">Order No.</th>
    <th style="text-align: center;">PMI No.</th>
    <th style="text-align: center;">Name</th>
    <th style="text-align: center;">Order Date</th>
    <th style="text-align: center;">Health Facility Code</th>
    <th style="text-align: center;">Doctor's Name</th>
</thead>
<tbody>

    <%
        String hfc = "";

        hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

        String sql = "SELECT ORDER_NO,PMI_NO,HEALTH_FACILITY_CODE,EPISODE_CODE,ENCOUNTER_DATE,ORDER_DATE,ORDER_BY,"
                + "ORDER_FROM,ORDER_TO,HFC_FROM,HFC_TO,SPUB_NO,KEYIN_BY,TOTAL_ORDER,STATUS,PATIENT_NAME,NEW_IC_NO,BIRTH_DATE,"
                + "SEX_CODE,BLOOD_TYPE,ORDER_STATUS FROM pis_order_master JOIN pms_patient_biodata USING (PMI_NO) WHERE ORDER_STATUS = '0' AND HEALTH_FACILITY_CODE = '" + hfc + "';";

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
<td><%= dataPatientOrderList.get(i).get(2)%></td> <!-- Health Facility Code -->
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

