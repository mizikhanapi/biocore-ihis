<%-- 
    Document   : ResultSearchOrderROS
    Created on : Jul 11, 2017, 9:51:38 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String pmiNo = request.getParameter("pmiNo");
    String todayDate = request.getParameter("todayDate");
    String type = request.getParameter("type");
    String orderId = request.getParameter("orderId");

    String searchProblem = "";
    String searchResult = "";
              
    if (orderId.equals("-")) {
        if (type.equals("today")) {
            searchProblem = "SELECT od.order_no,od.procedure_cd, pm.ris_procedure_name,bs.body_system_name,m.modality_name,ahc.hfc_name,om.hfc_to,om.episode_date,au.USER_NAME "
                    + "FROM ris_order_detail od "
                    + " JOIN ris_order_master om "
                    + " JOIN ris_procedure_master pm "
                    + " JOIN ris_modality m "
                    + " JOIN ris_body_system bs"
                    + " JOIN adm_health_facility ahc "
                    + " JOIN adm_users au"
                    + " WHERE od.order_no = om.order_no "
                    + " AND om.hfc_to = ahc.hfc_cd "
                    + " AND om.order_by = au.USER_ID "
                    + " AND od.modality_cd = m.modality_cd "
                    + " AND od.body_system_cd = bs.body_system_cd "
                    + " AND od.procedure_cd = pm.ris_procedure_cd "
                    + " AND om.pmi_no = '" + pmiNo + "' "
                    + " AND DATE(om.episode_date) =  '" + todayDate + "' "
                    + " GROUP BY procedure_cd ORDER BY om.episode_date DESC;";
            
        } else if (type.equals("previous")) {
            

            searchProblem = "SELECT od.order_no,od.procedure_cd, pm.ris_procedure_name,bs.body_system_name,m.modality_name,ahc.hfc_name,om.hfc_to,om.episode_date,au.USER_NAME "
                    + "FROM ris_order_detail od "
                    + " JOIN ris_order_master om "
                    + " JOIN ris_procedure_master pm "
                    + " JOIN ris_modality m "
                    + " JOIN ris_body_system bs"
                    + " JOIN adm_health_facility ahc "
                    + " JOIN adm_users au"
                    + " WHERE od.order_no = om.order_no "
                    + " AND om.hfc_to = ahc.hfc_cd "
                    + " AND om.order_by = au.USER_ID "
                    + " AND od.modality_cd = m.modality_cd "
                    + " AND od.body_system_cd = bs.body_system_cd "
                    + " AND od.procedure_cd = pm.ris_procedure_cd "
                    + " AND om.pmi_no = '" + pmiNo + "' "
                    + " GROUP BY procedure_cd ORDER BY om.episode_date DESC;";
            
        }
    } else {
        if (type.equals("today")) {
            searchProblem = "SELECT od.order_no,od.procedure_cd, pm.ris_procedure_name,bs.body_system_name,m.modality_name,ahc.hfc_name,om.hfc_to,om.episode_date,au.USER_NAME "
                    + "FROM ris_order_detail od "
                    + " JOIN ris_order_master om "
                    + " JOIN ris_procedure_master pm "
                    + " JOIN ris_modality m "
                    + " JOIN ris_body_system bs"
                    + " JOIN adm_health_facility ahc "
                    + " JOIN adm_users au"
                    + " WHERE od.order_no = om.order_no "
                    + " AND om.hfc_to = ahc.hfc_cd "
                    + " AND om.order_by = au.USER_ID "
                    + " AND od.modality_cd = m.modality_cd "
                    + " AND od.body_system_cd = bs.body_system_cd "
                    + " AND od.procedure_cd = pm.ris_procedure_cd "
                    + " AND om.pmi_no = '" + pmiNo + "' "
                    + " AND DATE(om.episode_date) = '" + todayDate + "' "
                    + " AND om.order_no = '" + orderId + "' "
                    + " GROUP BY procedure_cd ORDER BY om.episode_date DESC;";
            

        } else if (type.equals("previous")) {
            searchProblem = "SELECT od.order_no,od.procedure_cd, pm.ris_procedure_name,bs.body_system_name,m.modality_name,ahc.hfc_name,om.hfc_to,om.episode_date,au.USER_NAME "
                    + "FROM ris_order_detail od "
                    + " JOIN ris_order_master om "
                    + " JOIN ris_procedure_master pm "
                    + " JOIN ris_modality m "
                    + " JOIN ris_body_system bs"
                    + " JOIN adm_health_facility ahc "
                    + " JOIN adm_users au"
                    + " WHERE od.order_no = om.order_no "
                    + " AND om.hfc_to = ahc.hfc_cd "
                    + " AND om.order_by = au.USER_ID "
                    + " AND od.modality_cd = m.modality_cd "
                    + " AND od.body_system_cd = bs.body_system_cd "
                    + "AND od.procedure_cd = pm.ris_procedure_cd "
                    + "AND om.pmi_no = '" + pmiNo + "' "
                    + "AND om.order_no = '" + orderId + "' "
                    + "GROUP BY procedure_cd ORDER BY om.episode_date DESC;";
      
        }

    }
//out.print(searchProblem);
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   

    if (search.size() > 0) {


%>


<table class="table table-bordered table-striped" id="tblOROS">
    <thead>
        <tr>
            <td>Episode Date</td>
            <td>Order By</td>
            <td>Procedure Name</td>
            <td>Result</td>
            <td>Provider Facility</td>
            <td hidden>orderID</td>
            <td hidden>providerID</td>
            <td>Action</td>
        </tr>
    </thead>
    <tbody id="tableSearchOrderROS">
       
        <% 
            for (int i = 0; i < search.size(); i++) {
        %>
        <tr>
            <td><%out.print(search.get(i).get(7));%></td>
            <td><%out.print(search.get(i).get(8));%></td>
            <td><%out.print(search.get(i).get(2));%></td>
            <td>No Result Yet</td>
            
            <td><%out.print(search.get(i).get(5));%></td>
            <td hidden id="orderId"><%out.print(search.get(i).get(0));%></td>
            <td hidden id="providerId"><%out.print(search.get(i).get(6));%></td>
            <td><a  data-toggle="tooltip" data-placement="top" title="Add Order" class="btnAdd" style="cursor: pointer" id="btnCIS_OE_ROS_SEARCH_ADD"><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;</td>
        </tr>
        <%
            }
        %>



    </tbody>
</table>
        
        <script>
            $('#tblOROS').DataTable();
        </script>     

<%} else {
        out.print("No Order");
    }%>
