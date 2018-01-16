<%-- 
    Document   : lisManageOrderListTable
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
    //String t = request.getParameter("process");
    String result = request.getParameter("process");
    
    String sql = "";
    if ((result.equals("1"))) {
        
        sql = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,a.`USER_NAME`,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,s.description,b.description  FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status <= '2' AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND DATE_FORMAT(lis_order_master.order_date, '%Y-%m-%d') = CURDATE() GROUP BY lis_order_master.ORDER_NO DESC";
    }
    else if((result.equals("2"))){
        sql = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,a.`USER_NAME`,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,s.description,b.description  FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status <= '2' AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND MONTH(DATE_FORMAT(lis_order_master.order_date, '%Y-%m-%d')) = MONTH(CURRENT_DATE()) GROUP BY lis_order_master.ORDER_NO DESC";
    }
    else if((result.equals("3"))){
        sql = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,a.`USER_NAME`,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,s.description,b.description  FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status <= '2' AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND YEAR(DATE_FORMAT(lis_order_master.order_date, '%Y-%m-%d')) = YEAR(CURRENT_DATE()) GROUP BY lis_order_master.ORDER_NO DESC";
    }
    else if((result.equals("4"))){
        sql = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,a.`USER_NAME`,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,s.description,b.description  FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status <= '2' AND lis_order_master.hfc_cd = '" + hfc_cd + "' GROUP BY lis_order_master.ORDER_NO DESC";
    }

%>
<table  id="risManageOrderListTable"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="width: 8%;">Order No.</th>
    <th style="width: 10%;">PMI No.</th>
    <th style="width: 40%;">Name</th>
    <th style="width: 12%;">Order Date</th>
    <th style="width: 12%;">Doctor's Name</th>
</thead>
<tbody>


    <%

        ArrayList<ArrayList<String>> dataRISOrderList = conn.getData(sql);

        int size = dataRISOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToRISOrderDetailsTButton" style="cursor: pointer;">
<input id="dataRISOrderListhidden" type="hidden" value="<%=String.join("|", dataRISOrderList.get(i))%>">
<td><%= dataRISOrderList.get(i).get(0)%></td> <!-- Order No -->
<td><%= dataRISOrderList.get(i).get(1)%></td> <!-- PMI No -->
<td style="font-weight: 500;"><%= dataRISOrderList.get(i).get(13)%></td> <!-- Name -->
<td><%= dataRISOrderList.get(i).get(5)%></td> <!-- Order Date -->
<td><%= dataRISOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->
</tr>
<%
    }
%>
</tbody>
</table>






<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        $('#risManageOrderListTable').dataTable({
            "order": [[0, 'desc']],
            language: {
                "emptyTable": "No order available to display for today"

            }
        });
    });

</script>
