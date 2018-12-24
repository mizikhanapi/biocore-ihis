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
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String current_user = (String) session.getAttribute("USER_ID");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String last_nine = current_user.substring(current_user.length() - 1);
%>



<table  id="risManageOrderListTable"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
        <tr>
            <th style="text-align: left; width: 8%;">Order No.</th>
            <th style="text-align: left; width: 10%;">PMI No.</th>
            <th style="text-align: left; width: 40%;">Name</th>
            <th style="text-align: left; width: 12%;">Order Date</th>
            <th style="text-align: left;">Health Facility</th>
            <th style="text-align: left;">Doctor's Name</th>
        </tr>
    </thead>
<tbody>


    <%
        String whereClause = "";
        String orderWhereClause = " ";

        //-------------------------- to refresh order table based on request--------------------------------
        String process = "";
        process = request.getParameter("process");
        String fromDate = request.getParameter("dateFrom");
        String toDate = request.getParameter("dateTo");
        

        if (process.equalsIgnoreCase("today")) {

            orderWhereClause = " AND date(ris_order_master.order_date) = date(now()) ";
        }else if(process.equalsIgnoreCase("yesterday")){
            orderWhereClause = " AND date(ris_order_master.order_date) = DATE(NOW() - INTERVAL 1 DAY) ";
        }else if(process.equalsIgnoreCase("7")){
            orderWhereClause = " AND (date(ris_order_master.order_date) between SUBDATE(CURDATE(),7) and CURDATE() ) ";
        }else if(process.equalsIgnoreCase("30")){
            orderWhereClause = " AND (date(ris_order_master.order_date) between SUBDATE(CURDATE(),30) and CURDATE() ) ";
        }else if(process.equalsIgnoreCase("60")){
            orderWhereClause = " AND (date(ris_order_master.order_date) between SUBDATE(CURDATE(),60) and CURDATE() ) ";
        }else if(process.equalsIgnoreCase("custom")){
            orderWhereClause = " AND (date(ris_order_master.order_date) between STR_TO_DATE('" + fromDate + "','%d/%m/%Y') and STR_TO_DATE('" + toDate + "','%d/%m/%Y') ) ";
        }

        //=============================================================================================
        if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " AND ris_order_master.hfc_to = '" + hfc_cd + "' ";
        }
//                                  0                       1                       2                           3                                   4                       5                       
        String sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,"
                //  6                                           7                       8                           9                   10                                  11                  12                      
                + "ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,"
                //  13                                          14                              15                                  16                          17
                + "pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, "
                //  18                  19              20
                + "sx.description, blot.description, hfc.hfc_name "
                + "FROM ris_order_master "
                + "LEFT JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
                + "LEFT JOIN adm_lookup_detail sx on pms_patient_biodata.SEX_CODE = sx.detail_reference_code AND sx.master_reference_code = '0041' AND sx.hfc_cd = ris_order_master.hfc_to "
                + "LEFT JOIN adm_lookup_detail blot on pms_patient_biodata.BLOOD_TYPE = blot.detail_reference_code AND blot.master_reference_code = '0074' AND blot.hfc_cd = ris_order_master.hfc_to "
                + "Left JOIN adm_health_facility hfc on hfc.hfc_cd = ris_order_master.hfc_to "
                + "WHERE ris_order_master.order_no in (select distinct(order_no) from ris_order_detail ) AND ris_order_master.order_status = '0' "
                + orderWhereClause
                + whereClause + " ;";

        ArrayList<ArrayList<String>> dataRISOrderList = conn.getData(sql);
        //out.print(sql);
        int size = dataRISOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToRISOrderDetailsTButton"  style="text-align: left; cursor: pointer;">
<input id="dataRISOrderListhidden" type="hidden" value="<%=String.join("|", dataRISOrderList.get(i))%>">
<td><%= dataRISOrderList.get(i).get(1)%></td> <!-- Order No -->
<td><%= dataRISOrderList.get(i).get(0)%></td> <!-- PMI No -->
<td style="font-weight: 500;"><%= dataRISOrderList.get(i).get(13)%></td> <!-- Name -->
<td><%= dataRISOrderList.get(i).get(5)%></td> <!-- Order Date -->
<td><%= dataRISOrderList.get(i).get(20)%></td> <!-- Health Facility Code -->
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
            },"order": [[ 3, "desc" ]]
        });


    });

</script>

