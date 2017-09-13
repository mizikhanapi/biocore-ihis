<%-- 
    Document   : dataManagementArchiveOrderTable
    Created on : Sep 12, 2017, 9:41:56 AM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String userID = session.getAttribute("USER_ID").toString();
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;">List Of Avaliable Order That Can Be Archived</h4>

<table  id="dataManagementListArchiveOrderTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;">Check<!--<br><input id="checkDispenseAll" type="checkbox" onchange="checkAll(this)" name="chk[]" />--></th>
    <th style="text-align: left;">Order No.</th>
    <th style="text-align: left;">PMI No.</th>
    <th style="text-align: left;">Name</th>
    <th style="text-align: left;">Order Date</th>
    <th style="text-align: left;">Total Incomplete Order</th>
    <th style="text-align: left;">Doctor's Name</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = session.getAttribute("DISCIPLINE_CODE").toString();

        //                              0                           1                   2                                       3                                   4
        String sql = "SELECT pis_order_master.ORDER_NO,pis_order_master.PMI_NO,pis_order_master.HEALTH_FACILITY_CODE,pis_order_master.EPISODE_DATE,pis_order_master.ENCOUNTER_DATE, "
                //                  5                           6                           7                       8                           9                       10
                + " pis_order_master.ORDER_DATE,pis_order_master.ORDER_BY,pis_order_master.ORDER_FROM,pis_order_master.ORDER_TO,pis_order_master.HFC_FROM,pis_order_master.HFC_TO, "
                //                  11                      12                      13                              14                          15
                + " pis_order_master.SPUB_NO,pis_order_master.KEYIN_BY,IFNULL(pis_order_master.TOTAL_ORDER,'-'),pis_order_master.STATUS,pms_patient_biodata.PATIENT_NAME, "
                //                  16                      17                              18                              19                          20                          21
                + " pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,pis_order_master.ORDER_STATUS,adm_users.USER_NAME "
                + " FROM pis_order_master "
                + " LEFT JOIN pms_patient_biodata ON (pis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) "
                + " LEFT JOIN adm_users ON (pis_order_master.ORDER_BY = adm_users.USER_ID) "
                + " WHERE pis_order_master.ORDER_STATUS = '0' AND pis_order_master.HEALTH_FACILITY_CODE = '" + hfc + "' "
                + " AND pis_order_master.DISCIPLINE_CODE = '" + dis + "'  ";

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: left;text-transform: uppercase;">
        <input id="dataArchiveOrderListhidden" type="hidden" value="<%=String.join("|", dataPatientOrderList.get(i))%>">
        <td align="center"><input type="checkbox" id="archiveOrderChecked"></td> <!-- Checked -->
        <td ><%= dataPatientOrderList.get(i).get(0)%></td> <!-- Order No -->
        <td ><%= dataPatientOrderList.get(i).get(1)%></td> <!-- PMI No -->
        <td style="font-weight: 500;"><%= dataPatientOrderList.get(i).get(15)%></td> <!-- Name -->
        <td ><%= dataPatientOrderList.get(i).get(5)%></td> <!-- Order Date -->
        <td ><%= dataPatientOrderList.get(i).get(13)%></td> <!-- Total Order -->
        <td ><%= dataPatientOrderList.get(i).get(21)%></td> <!-- Doctor's Name -->
    </tr>
    <%
        }
    %>
</tbody>
</table>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        $('#dataManagementListArchiveOrderTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            language: {
                "emptyTable": "No Order Available To Display"
            }
        });

    });
</script>

