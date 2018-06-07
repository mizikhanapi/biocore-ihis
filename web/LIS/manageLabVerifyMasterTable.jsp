<%-- 
    Document   : manageLabVerifyMasterTable
    Created on : Jan 16, 2018, 1:44:15 AM
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
<input id="verifyLabMasterTableUserIDHidden" type="hidden" value="<%= userID%>">

<table  id="verifyLabOrderMasterTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;">Specimen No.</th>
    <th style="text-align: left;">Order No.</th>
    <th style="text-align: left;">PMI No.</th>
    <th style="text-align: left;">IC No.</th>
    <th style="text-align: left;">Name</th>
    <th style="text-align: left;">Order Date</th>
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

        if (request.getParameter("process") != null) {

            process = request.getParameter("process");
        }

        if (process.equalsIgnoreCase("1")) {

            orderWhereClause = " AND date(lom.txn_date) = date(now()) ";

        }

        //=============================================================================================
        if (!hfc.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " AND lom.hfc_to = '" + hfc + "'  ";
        }

        //                        0          1            2           3            4            5                   6               7
        String sql = "SELECT lom.pmi_no,lom.order_no,lom.txn_date,lom.hfc_cd,lom.txn_type,lom.episode_date,lom.encounter_date,lom.order_date,  "
                //        8                  9                         10                              11               12
                + " lom.order_by,lom.order_from_discipline,lom.order_from_subdiscipline,lom.order_to_discipline,lom.order_to_subdiscipline, "
                //        3           14           15              16               17                  18                      19
                + " lom.hfc_from,lom.hfc_to,lom.order_status,pms.PATIENT_NAME,pms.NEW_IC_NO,IFNULL(pms.BIRTH_DATE,'-'),IFNULL(pms.SEX_CODE,'-'), "
                //          20                          21                          22                  23          24              25
                + " IFNULL(pms.BLOOD_TYPE,'-'),IFNULL(s.description,'-'),IFNULL(b.description,'-'),adm.hfc_name,aus.USER_NAME,lissm.specimen_no  "
                // FROM ORDER TABLE
                + " FROM lis_order_master lom  "
                // LEFT JOIN SPECIMEN MASTER TABLE
                + " LEFT JOIN lis_specimen_master lissm ON (lom.order_no = lissm.order_no)"
                // LEFT JOIN USER TABLE
                + " LEFT JOIN pms_patient_biodata pms ON (lom.pmi_no = pms.PMI_NO)"
                // LEFT JOIN USER TABLE
                + " LEFT JOIN adm_users aus ON (lom.order_by = aus.USER_ID) "
                // LEFT JOIN HFC TABLE
                + " LEFT JOIN adm_health_facility adm ON (lom.hfc_to = adm.hfc_cd) "
                // LEFT LOOKUP SEX TABLE
                + " LEFT JOIN adm_lookup_detail s ON pms.SEX_CODE = s.detail_reference_code "
                + " AND s.master_reference_code = '0041' AND s.hfc_cd = lom.hfc_to "
                // LEFT LOOKUP BLOOD TABLE
                + " LEFT JOIN adm_lookup_detail b ON pms.BLOOD_TYPE = b.detail_reference_code "
                + " AND b.master_reference_code = '0074' AND b.hfc_cd = lom.hfc_to "
                // WHERE CONDITION
                + " WHERE lom.order_status = '2'   "
                + orderWhereClause
                + whereClause + " ;";

        ArrayList<ArrayList<String>> dataVerifyLabOrderMaster = conn.getData(sql);

        int size = dataVerifyLabOrderMaster.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToOrderDetailsTButton" style="text-align: left;">
<input id="dataVerifyLabOrderMasterListhidden" type="hidden" value="<%=String.join("|", dataVerifyLabOrderMaster.get(i))%>">
<td><%= dataVerifyLabOrderMaster.get(i).get(25)%></td> <!-- Specimen No -->
<td><%= dataVerifyLabOrderMaster.get(i).get(1)%></td> <!-- Order No -->
<td><%= dataVerifyLabOrderMaster.get(i).get(0)%></td> <!-- PMI No -->
<td><%= dataVerifyLabOrderMaster.get(i).get(17)%></td> <!-- IC -->
<td style="font-weight: 500; text-transform: uppercase;"><%= dataVerifyLabOrderMaster.get(i).get(16)%></td> <!-- Order Date -->
<td style="text-transform: uppercase;"><%= dataVerifyLabOrderMaster.get(i).get(7)%></td> <!-- Doctor -->
</tr>
<%
    }
%>
</tbody>
</table>


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {


        $('#verifyLabOrderMasterTable').DataTable().destroy();

        $('#verifyLabOrderMasterTable').DataTable({
            "language": {
                "emptyTable": "No Lab Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });


    });

</script>

