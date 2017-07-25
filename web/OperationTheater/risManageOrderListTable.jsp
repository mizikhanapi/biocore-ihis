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
    String current_user = (String) session.getAttribute("USER_ID");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String last_nine = current_user.substring(current_user.length() - 1);
%>



<table  id="risManageOrderListTable"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left; width: 8%;">Order No.</th>
    <th style="text-align: left; width: 10%;">PMI No.</th>
    <th style="text-align: left; width: 40%;">Name</th>
    <th style="text-align: left; width: 12%;">Order Date</th>
    <th style="text-align: left;">Health Facility</th>
    <!--<th style="text-align: left;">Doctor's Name</th>-->
</thead>
<tbody>


    <%
        String whereClause = "";
        String orderWhereClause = " ";

        //-------------------------- to refresh order table based on request--------------------------------
        String process = "1";

        if (request.getParameter("process") != null) {

            process = request.getParameter("process");
        }

        if (process.equalsIgnoreCase("1")) {

            orderWhereClause = " AND date(opt_order_master.encounter_date) = date(now()) ";
        }

        //=============================================================================================
        if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " AND opt_order_master.hfc_cd = '" + hfc_cd + "' ";
        }
//                                  0                       1                       2                           3                                   4                       5                       
        String sql = "SELECT opt_order_master.pmi_no,opt_order_master.order_no,opt_order_master.hfc_cd,opt_order_master.episode_date,opt_order_master.encounter_date,opt_order_master.encounter_date,"
                //  6                                           7                       8                           9                   10                                  11                  12                      
                + "'opt_order_master.doctor_id',opt_order_master.hfc_from,opt_order_master.hfc_to,opt_order_master.order_status,'opt_order_master.order_priority','opt_order_master.created_by','opt_order_master.created_date',"
                //  13                                          14                              15                                  16                          17
                + "pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, "
                //  18                  19              20              21
                + "sx.description, blot.description, hfc.hfc_name "//, au.user_name "
                + "FROM opt_order_master "
                + "LEFT JOIN pms_patient_biodata ON (opt_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
                + "LEFT JOIN adm_lookup_detail sx on pms_patient_biodata.SEX_CODE = sx.detail_reference_code AND sx.master_reference_code = '0041' AND sx.hfc_cd = opt_order_master.hfc_cd "
                + "LEFT JOIN adm_lookup_detail blot on pms_patient_biodata.BLOOD_TYPE = blot.detail_reference_code AND blot.master_reference_code = '0074' AND blot.hfc_cd = opt_order_master.hfc_cd "
                + "Left JOIN adm_health_facility hfc on hfc.hfc_cd = opt_order_master.hfc_cd "
                //+ "LEFT JOIN adm_users au on au.user_id = opt_order_master.doctor_id "
                + "WHERE opt_order_master.order_no in (select distinct(order_no) from opt_order_detail ) AND opt_order_master.order_status = '0' "
                + orderWhereClause
                + whereClause + " order by opt_order_master.encounter_date DESC;";

        ArrayList<ArrayList<String>> dataRISOrderList = conn.getData(sql);

        int size = dataRISOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToRISOrderDetailsTButton" style="text-align: left; cursor: pointer;">
<input id="dataRISOrderListhidden" type="hidden" value="<%=String.join("|", dataRISOrderList.get(i))%>">
<td><%= dataRISOrderList.get(i).get(1)%></td> <!-- Order No -->
<td><%= dataRISOrderList.get(i).get(0)%></td> <!-- PMI No -->
<td style="font-weight: 500;"><%= dataRISOrderList.get(i).get(13)%></td> <!-- Name -->
<td><%= dataRISOrderList.get(i).get(5)%></td> <!-- Order Date -->
<td><%= dataRISOrderList.get(i).get(20)%></td> <!-- Health Facility  -->
<!--<td></td>  Doctor's Name -->
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

