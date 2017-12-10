<%-- 
    Document   : distributeStockOrderMasterTable
    Created on : Nov 16, 2017, 11:02:34 AM
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
<input id="distributeStockOrderMasterTableUserIDHidden" type="hidden" value="<%= userID%>">

<table  id="distributeStockOrderMasterTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
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

            orderWhereClause = " AND date(stkom.txt_date) = date(now()) ";

        }

        //=============================================================================================
        if (!hfc.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " AND stkom.hfc_cd = '" + hfc + "' AND stkom.discipline_cd = '" + dis + "' ";
        }

        //                          0               1               2               3               4            5
        String sql = "SELECT stkom.customer_id,stkom.order_no,stkom.txt_date,stkom.item_amt,stkom.quantity,stkom.location,  "
                //         6            7                       8                    9                      10
                + " stkom.hfc_cd,stkom.discipline_cd,stkom.subdiscipline_cd,stkom.ordering_hfc_cd,stkom.ordering_discipline_cd, "
                //              11                      12               13             14
                + " stkom.ordering_subdiscipline_cd,stkom.status,ppb.PATIENT_NAME,ppb.NEW_IC_NO, "
                //              15                      16                      17
                + " IFNULL(ppb.BIRTH_DATE,'-'),IFNULL(ppb.SEX_CODE,'-'),IFNULL(ppb.BLOOD_TYPE,'-'), "
                //          18                          19                    20
                + " IFNULL(s.description,'-'),IFNULL(b.description,'-'),adm.hfc_name "
                // FROM ORDER TABLE
                + " FROM stk_order_master stkom  "
                // LEFT JOIN BIODATA TABLE
                + " LEFT JOIN pms_patient_biodata ppb ON (stkom.customer_id = ppb.PMI_NO) "
                // LEFT JOIN HFC TABLE
                + " LEFT JOIN adm_health_facility adm ON (stkom.hfc_cd = adm.hfc_cd) "
                // LEFT LOOKUP SEX TABLE
                + " LEFT JOIN adm_lookup_detail s ON ppb.SEX_CODE = s.detail_reference_code "
                + " AND s.master_reference_code = '0041' AND s.hfc_cd = stkom.hfc_cd "
                // LEFT LOOKUP BLOOD TABLE
                + " LEFT JOIN adm_lookup_detail b ON ppb.BLOOD_TYPE = b.detail_reference_code "
                + " AND b.master_reference_code = '0074' AND b.hfc_cd = stkom.hfc_cd "
                // WHERE CONDITION
                + " WHERE stkom.status = '0'   "
                + orderWhereClause
                + whereClause + " ;";

        ArrayList<ArrayList<String>> dataDistributeStockOrderMaster = conn.getData(sql);

        int size = dataDistributeStockOrderMaster.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToOrderDetailsTButton" style="text-align: left;">
<input id="dataDistributeStockOrderMasterListhidden" type="hidden" value="<%=String.join("|", dataDistributeStockOrderMaster.get(i))%>">
<td><%= dataDistributeStockOrderMaster.get(i).get(1)%></td> <!-- Order No -->
<td><%= dataDistributeStockOrderMaster.get(i).get(0)%></td> <!-- PMI No -->
<td><%= dataDistributeStockOrderMaster.get(i).get(14)%></td> <!-- IC No -->
<td style="font-weight: 500;"><%= dataDistributeStockOrderMaster.get(i).get(13)%></td> <!-- Name -->
<td><%= dataDistributeStockOrderMaster.get(i).get(2)%></td> <!-- Order Date -->
</tr>
<%
    }
%>
</tbody>
</table>


<script type="text/javascript" charset="utf-8">
    
    $(document).ready(function () {


        $('#distributeStockOrderMasterTable').DataTable().destroy();

        $('#distributeStockOrderMasterTable').DataTable({
            "language": {
                "emptyTable": "No Stock Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });


    });
    
</script>

