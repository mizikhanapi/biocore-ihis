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

<table  id="patientOrderListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;">Order No.</th>
    <th style="text-align: left;">PMI No.</th>
    <th style="text-align: left;">Name</th>
    <th style="text-align: left;">Order Date</th>
    <th style="text-align: left; display: none">Health Facility Code</th>
    <th style="text-align: left;">Doctor's Name</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = (String) session.getAttribute("DISCIPLINE_CODE");
        String current_user = (String) session.getAttribute("USER_ID");
        String last_nine = current_user.substring(current_user.length() - 1);

        String whereClause = "";
        String orderWhereClause = " ";

        //-------------------------- to refresh order table based on request--------------------------------
        String process = "1";
        String fromDate = "";
        String toDate = "";

        if (request.getParameter("process") != null) {
            process = request.getParameter("process");
            fromDate = request.getParameter("dateFrom");
            toDate = request.getParameter("dateTo");
        }

        if (process.equalsIgnoreCase("today")) {
            orderWhereClause = " AND date(pis_order_master.ORDER_DATE) = date(now()) ";
        } else if (process.equalsIgnoreCase("yesterday")) {
            orderWhereClause = " AND date(pis_order_master.ORDER_DATE) = DATE(NOW() - INTERVAL 1 DAY) ";
        } else if (process.equalsIgnoreCase("7")) {
            orderWhereClause = " AND (date(pis_order_master.ORDER_DATE) between SUBDATE(CURDATE(),7) and CURDATE() ) ";
        } else if (process.equalsIgnoreCase("30")) {
            orderWhereClause = " AND (date(pis_order_master.ORDER_DATE) between SUBDATE(CURDATE(),30) and CURDATE() ) ";
        } else if (process.equalsIgnoreCase("60")) {
            orderWhereClause = " AND (date(pis_order_master.ORDER_DATE) between SUBDATE(CURDATE(),60) and CURDATE() ) ";
        } else if (process.equalsIgnoreCase("custom")) {
            orderWhereClause = " AND (date(pis_order_master.ORDER_DATE) between STR_TO_DATE('" + fromDate + "','%d/%m/%Y') and STR_TO_DATE('" + toDate + "','%d/%m/%Y') ) ";
        }

        //=============================================================================================
        if (!hfc.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " AND pis_order_master.HEALTH_FACILITY_CODE = '" + hfc + "' AND pis_order_master.DISCIPLINE_CODE = '" + dis + "' ";
        }

        String sql = "SELECT pis_order_master.ORDER_NO,pis_order_master.PMI_NO,pis_order_master.HEALTH_FACILITY_CODE,pis_order_master.EPISODE_DATE,pis_order_master.ENCOUNTER_DATE, "
                + " pis_order_master.ORDER_DATE,pis_order_master.ORDER_BY,pis_order_master.ORDER_FROM,pis_order_master.ORDER_TO,pis_order_master.HFC_FROM,pis_order_master.HFC_TO, "
                + " pis_order_master.SPUB_NO,pis_order_master.KEYIN_BY,pis_order_master.TOTAL_ORDER,pis_order_master.STATUS,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO, "
                + " IFNULL(DATE_FORMAT(pms_patient_biodata.BIRTH_DATE, '%d/%m/%Y'),'-'),IFNULL(pms_patient_biodata.SEX_CODE,'-'),IFNULL(pms_patient_biodata.BLOOD_TYPE,'-'),pis_order_master.ORDER_STATUS, "
                + " IFNULL(s.description,'-'),IFNULL(b.description,'-'),adm.hfc_name,aus.USER_NAME,DATE_FORMAT(pis_order_master.ORDER_DATE, '%d/%m/%Y %T') FROM pis_order_master  "
                + " LEFT JOIN pms_patient_biodata ON (pis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) "
                + " LEFT JOIN adm_users aus ON (pis_order_master.ORDER_BY = aus.USER_ID) "
                + " LEFT JOIN adm_health_facility adm ON (pis_order_master.HEALTH_FACILITY_CODE = adm.hfc_cd) "
                + " LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = pis_order_master.HEALTH_FACILITY_CODE "
                + " LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = pis_order_master.HEALTH_FACILITY_CODE "
                + " WHERE pis_order_master.ORDER_STATUS = '0'   "
                + orderWhereClause
                + whereClause + " ;";

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToOrderDetailsTButton" class="clickable_tr" style="text-align: left;">
<input id="dataPatientOrderListhidden" type="hidden" value="<%=String.join("|", dataPatientOrderList.get(i))%>">
<td><%= dataPatientOrderList.get(i).get(0)%></td> <!-- Order No -->
<td><%= dataPatientOrderList.get(i).get(1)%></td> <!-- PMI No -->
<td style="font-weight: 500;"><%= dataPatientOrderList.get(i).get(15)%></td> <!-- Name -->
<td><%= dataPatientOrderList.get(i).get(25)%></td> <!-- Order Date -->
<td style="display: none"><%= dataPatientOrderList.get(i).get(2)%></td> <!-- Health Facility Code -->
<td><%= dataPatientOrderList.get(i).get(24)%></td> <!-- Doctor's Name -->
</tr>
<%
    }
%>
</tbody>
</table>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        $('#patientOrderListTable').DataTable({
            "language": {
                "emptyTable": "No Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });

//        var strCom = 'Ahamad"mom';
//        var strCom = strCom.replace(/"/g, '\\\"');
//        
//        
//        console.log(strCom);
    });
</script>

