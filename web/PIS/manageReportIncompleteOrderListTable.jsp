<%-- 
    Document   : manageReportIncompleteOrderListTable
    Created on : Aug 19, 2017, 2:32:04 AM
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
<h4 style="padding-top: 2%;padding-bottom: 1%;">List Of Incomplete Order</h4>

<table  id="reportListIncompleteOrderTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;">Order No.</th>
    <th style="text-align: left;">PMI No.</th>
    <th style="text-align: left;">Name</th>
    <th style="text-align: left;">Order Date</th>
    <th style="text-align: left;">Total Incomplete Order</th>
    <th style="text-align: left;">Doctor's Name</th>
    <th style="text-align: left;">Order Status</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = (String) session.getAttribute("DISCIPLINE_CODE");

        //                              0                           1                   2                                       3                                   4
        String sql = "SELECT pis_order_master.ORDER_NO,pis_order_master.PMI_NO,pis_order_master.HEALTH_FACILITY_CODE,pis_order_master.EPISODE_DATE,pis_order_master.ENCOUNTER_DATE, "
                //                  5                           6                           7                       8                           9                       10
                + " pis_order_master.ORDER_DATE,pis_order_master.ORDER_BY,pis_order_master.ORDER_FROM,pis_order_master.ORDER_TO,pis_order_master.HFC_FROM,pis_order_master.HFC_TO, "
                //                  11                      12                      13                              14                          15
                + " pis_order_master.SPUB_NO,pis_order_master.KEYIN_BY,pis_order_master.TOTAL_ORDER,pis_order_master.STATUS,pms_patient_biodata.PATIENT_NAME, "
                + " pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,pis_order_master.ORDER_STATUS,s.description,b.description,adm.hfc_name "
                + " FROM pis_order_master JOIN pms_patient_biodata ON (pis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) "
                + " JOIN adm_health_facility adm ON (pis_order_master.HEALTH_FACILITY_CODE = adm.hfc_cd) "
                + " JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = pis_order_master.HEALTH_FACILITY_CODE "
                + " LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = pis_order_master.HEALTH_FACILITY_CODE "
                + " WHERE pis_order_master.ORDER_STATUS = '0' AND pis_order_master.HEALTH_FACILITY_CODE = '" + hfc + "' AND pis_order_master.DISCIPLINE_CODE = '" + dis + "'  ";

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: left;">
        <td ><%= dataPatientOrderList.get(i).get(0)%></td> <!-- Order No -->
        <td ><%= dataPatientOrderList.get(i).get(1)%></td> <!-- PMI No -->
        <td style="font-weight: 500;"><%= dataPatientOrderList.get(i).get(15)%></td> <!-- Name -->
        <td ><%= dataPatientOrderList.get(i).get(5)%></td> <!-- Order Date -->
        <td ><%= dataPatientOrderList.get(i).get(13)%></td> <!-- Total Order -->
        <td ><%= dataPatientOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->
        <td ><%if (dataPatientOrderList.get(i).get(14).equals("1")) {
                out.print("Fully Dispensed");
            } else {
                out.print("Incomplete");
            }%></td> <!-- Order Status -->
    </tr>
    <%
        }
    %>
</tbody>
</table>


<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#reportListIncompleteOrderTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Pharmacy Incomplete Order List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Pharmacy Incomplete Order List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Incomplete Order List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Pharmacy Incomplete Order List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>PIS-0006</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'colvis',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });
    });
</script>

