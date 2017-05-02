<%-- 
    Document   : risResult_table
    Created on : May 1, 2017, 3:53:30 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>

<%
    Conn conn = new Conn();
    String current_user = (String) session.getAttribute("USER_ID");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String last_nine = current_user.substring(current_user.length() - 1);
%>



<table  id="risResultTable"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>        
    <th style="display: none">Hidden</th>
    <th style="text-align: left; width: 10%;">Order No.</th>
    <th style="text-align: left; width: 10%;">Body System</th>
    <th style="text-align: left; width: 10%;">Modality</th>
    <th style="text-align: left; width: 10%;">Procedure</th>
    <th style="text-align: left; width: 40%;">Comment</th>
   
</thead>
<tbody>


    <%
        String whereClause = "";
      

        //=============================================================================================
        if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " where hfc_cd = '"+hfc_cd+"' or hfc_to = '"+hfc_cd+"' ";
        }
//                                  0             1                       2                  3           4                    5                    6                    7
        String sql = "SELECT res.order_no, res.body_system_cd, bs.body_system_name, res.modality_cd, md.modality_name, res.procedure_cd, pm.ris_procedure_name, res.filler_comments "
                + "from ris_result_detail res "
                + "left join ris_body_system bs on res.body_system_cd = bs.body_system_cd AND bs.hfc_cd = '"+hfc_cd+"' "
                + "left join ris_modality md on res.modality_cd = md.modality_cd AND md.hfc_cd = '"+hfc_cd+"' "
                + "left join ris_procedure_master pm on res.procedure_cd = pm.ris_procedure_cd AND pm.hfc_cd = '"+hfc_cd+"' "
                + "where res.result_status = '0' AND res.order_no in (Select order_no from ris_order_master" +whereClause+ ") "
                + "order by res.created_date ASC;";

        ArrayList<ArrayList<String>> dataResultList = conn.getData(sql);

        int size = dataResultList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="risRM_btnModal" style="text-align: left;">
        <td style="display: none"><%= String.join("|", dataResultList.get(i))%></td> <!-- hidden -->
        <td><%= dataResultList.get(i).get(0)%></td> <!-- Order No -->
        <td><%= dataResultList.get(i).get(2)%></td> <!-- body system -->
        <td><%= dataResultList.get(i).get(4)%></td> <!-- modality -->
        <td><%= dataResultList.get(i).get(6)%></td> <!-- procedure -->
        <td><%= dataResultList.get(i).get(7)%></td> <!-- comment -->
        
    </tr>
    <%
        }
    %>
</tbody>
</table>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        $('#risResultTable').DataTable({
            language: {
                emptyTable: "No Result Available To Display"
            }, initComplete: function (settings, json) {
                destroyScreenLoading();
            }
        });


    });

</script>