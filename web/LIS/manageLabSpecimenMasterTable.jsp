<%-- 
    Document   : manageLabSpecimenMasterTable
    Created on : Jan 15, 2018, 5:57:22 PM
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
<input id="assignLabSpecimenMasterTableUserIDHidden" type="hidden" value="<%= userID%>">

<table  id="assignLabSpecimenMasterTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;">Specimen No.</th>
    <th style="text-align: left;">Order No.</th>
    <th style="text-align: left;">PMI No.</th>
    <th style="text-align: left;">Name</th>
    <th style="text-align: left;">Receive Specimen</th>
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

            orderWhereClause = " AND date(lsm.txt_date) = date(now()) ";

        }

        //=============================================================================================
        if (!hfc.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " AND lsm.hfc_cd = '" + hfc + "'  ";
        }

        //                        0          1            2           3            4            5                   6               7
        String sql = "SELECT lsm.pmi_no,lsm.txt_date,lsm.hfc_cd,lsm.order_no,lsm.specimen_no,lsm.episode_date,lsm.encounter_date,lsm.order_date,  "
                //        8             9          10             11                  12                13                      14
                + " lsm.order_by,lsm.hfc_from,lsm.hfc_to,lsm.discipline_from,lsm.discipline_to,lsm.subdiscipline_from,lsm.subdiscipline_to, "
                //        15                16           17                  18             19              20                          21
                + " lsm.order_status,lsm.created_by,lsm.created_date,pms.PATIENT_NAME,pms.NEW_IC_NO,IFNULL(pms.BIRTH_DATE,'-'),IFNULL(pms.SEX_CODE,'-'), "
                //            22                            23                      24                 25           26
                + " IFNULL(pms.BLOOD_TYPE,'-'),IFNULL(s.description,'-'),IFNULL(b.description,'-'),adm.hfc_name,aus.USER_NAME  "
                // FROM ORDER TABLE
                + " FROM lis_specimen_master lsm  "
                // LEFT JOIN USER TABLE
                + " LEFT JOIN pms_patient_biodata pms ON (lsm.pmi_no = pms.PMI_NO)"
                // LEFT JOIN USER TABLE
                + " LEFT JOIN adm_users aus ON (lsm.order_by = aus.USER_ID) "
                // LEFT JOIN HFC TABLE
                + " LEFT JOIN adm_health_facility adm ON (lsm.hfc_cd = adm.hfc_cd) "
                // LEFT LOOKUP SEX TABLE
                + " LEFT JOIN adm_lookup_detail s ON pms.SEX_CODE = s.detail_reference_code "
                + " AND s.master_reference_code = '0041' AND s.hfc_cd = lsm.hfc_cd "
                // LEFT LOOKUP BLOOD TABLE
                + " LEFT JOIN adm_lookup_detail b ON pms.BLOOD_TYPE = b.detail_reference_code "
                + " AND b.master_reference_code = '0074' AND b.hfc_cd = lsm.hfc_cd "
                // WHERE CONDITION
                + " WHERE lsm.order_status = '0'   "
                + orderWhereClause
                + whereClause + " ;";

        ArrayList<ArrayList<String>> dataAssignLabOrderMaster = conn.getData(sql);

        int size = dataAssignLabOrderMaster.size();
        for (int i = 0; i < size; i++) {

            /* Status From Database */
            String status = dataAssignLabOrderMaster.get(i).get(15);

            if (status.equalsIgnoreCase("0")) {
                status = "Waiting For Approval";
            } else if (status.equalsIgnoreCase("1")) {
                status = "Approved";
            } else if (status.equalsIgnoreCase("2")) {
                status = "Rejected";
            }

    %>

    <tr id="moveToSpecimenDetailsTButton" style="text-align: left;">
<input id="dataAssignLabSpecimenMasterListhidden" type="hidden" value="<%=String.join("|", dataAssignLabOrderMaster.get(i))%>">
<td><%= dataAssignLabOrderMaster.get(i).get(4)%></td> <!-- Specimen No -->
<td><%= dataAssignLabOrderMaster.get(i).get(3)%></td> <!-- Order No  -->
<td ><%= dataAssignLabOrderMaster.get(i).get(0)%></td> <!-- PMI No -->
<td style="text-transform: uppercase;"><%= dataAssignLabOrderMaster.get(i).get(18)%></td> <!-- Name -->
<td style="font-weight: 500;"><%= status%></td> <!-- Receive Specimen -->
</tr>
<%
    }
%>
</tbody>
</table>


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {


        $('#assignLabSpecimenMasterTable').DataTable().destroy();

        $('#assignLabSpecimenMasterTable').DataTable({
            "language": {
                "emptyTable": "No Lab Specimen Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });


    });

</script>

