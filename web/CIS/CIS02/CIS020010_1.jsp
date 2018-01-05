<%-- 
    Document   : CIS020010_1
    Created on : Feb 13, 2017, 7:20:22 PM
    Author     : -D-
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    String pmiNo = session.getAttribute("patientPMINo").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    
    Conn conn = new Conn();
    
   
    
//String sqlRIS = "SELECT ris_order_master.order_no,ris_detail_order.procedure_cd, ris_detail_order.ris_procedure_name, ris_detail_order.modality_name, ris_detail_order.body_system_name, ris_detail_order.remarks,ris_detail_order.requestor_instruction FROM  ris_detail_order INNER JOIN ris_order_master ON ris_detail_order.order_no = ris_order_master.order_no WHERE ris_order_master.pmi_no ='"+pmiNo+"' AND ris_order_master.hfc_cd = '" +hfc_cd+"'";
/*String  searchResult2 = "SELECT od.order_no, od.procedure_cd, pm.ris_procedure_name, bs.body_system_name, m.modality_name, ahc.hfc_name, om.hfc_to, om.episode_date, au.USER_NAME, rrd.filler_comments, rrd.result_status, od.body_system_cd, od.modality_cd "
                          + "FROM ris_order_detail od  "
                          + "JOIN ris_order_master om "
                          + "JOIN ris_procedure_master pm "
                          + "JOIN ris_modality m "
                          + "JOIN ris_body_system bs "
                          + "JOIN adm_health_facility ahc "
                          + "JOIN adm_users au "
                          + "JOIN ris_result_detail rrd "
                          + "WHERE od.order_no = om.order_no "
                          + "AND om.order_no = rrd.order_no "
                          + "AND om.order_by = au.USER_ID "
                          + "AND om.hfc_to = ahc.hfc_cd "
                          + "AND od.modality_cd = m.modality_cd "
                          + "AND od.body_system_cd = bs.body_system_cd "
                          + "AND od.procedure_cd = pm.ris_procedure_cd "
                          + "AND om.pmi_no = '" + pmiNo + "' GROUP by od.procedure_cd ORDER BY om.episode_date DESC LIMIT 10";
*/

String searchResult2 = "SELECT od.order_no, od.procedure_cd, pm.ris_procedure_name, bs.body_system_name, m.modality_name, ahc.hfc_name, om.hfc_to, om.episode_date, au.USER_NAME, rrd.filler_comments, rrd.result_status, od.body_system_cd, od.modality_cd "
        + "FROM ris_order_detail od "
        + "JOIN ris_order_master om ON om.order_no=od.order_no "
        + "JOIN ris_procedure_master pm ON pm.ris_procedure_cd=od.procedure_cd AND pm.hfc_cd=om.hfc_to "
        + "JOIN ris_modality m ON m.modality_cd=od.modality_cd AND m.hfc_cd=om.hfc_to "
        + "JOIN ris_body_system bs ON bs.body_system_cd=od.body_system_cd AND bs.hfc_cd=om.hfc_to "
        + "JOIN adm_health_facility ahc ON ahc.hfc_cd=om.hfc_to "
        + "JOIN adm_users au ON au.`USER_ID`=om.order_by "
        + "JOIN ris_result_detail rrd ON rrd.order_no=om.order_no AND rrd.procedure_cd=od.procedure_cd "
        + "WHERE om.pmi_no = '"+pmiNo+"' ORDER BY om.episode_date DESC LIMIT 10";
ArrayList<ArrayList<String>> result = conn.getData(searchResult2);

%>

<table class="table table-striped table-filter table-bordered" id="risTable" style="width: 100%">
    <%
        if(result.size() >0){%>
        <thead>
         
                <th>Order No</th>
                <th>Modality Name</th>
                <th>Body System Name</th>
                <th>Procedure Name</th>
                <th>Filler Comment</th>
                <th>Result</th>
                <th hidden>a</th>
                <th hidden>a</th>
                <th hidden>a</th>
               <th hidden>a</th> 
                <th hidden>a</th>
      
           
        </thead>
        <tbody>

            <%
                for (int i = 0; i < result.size(); i++) {
            %>
            <tr>
                <td><%out.print(result.get(i).get(7));%></td>
                <td><%out.print(result.get(i).get(3));%></td>
                <td><%out.print(result.get(i).get(4));%></td>
                <td><%out.print(result.get(i).get(2));%></td>
                <td><%out.print(result.get(i).get(9));%></td>
                <td hidden id="tBS_SEARCH_CODE"><%out.print(result.get(i).get(11));%></td>
                <td hidden id="tM_SEARCH_CODE"><%out.print(result.get(i).get(12));%></td>
                <td hidden id="tP_SEARCH_CODE"><%out.print(result.get(i).get(1));%></td>
                <td hidden id="orderId"><%out.print(result.get(i).get(0));%></td>
                <td hidden id="providerId"><%out.print(result.get(i).get(6));%></td>
                <td>
                    <button id="btnCIS_O_ROS_VIEW_RESULT">Show Image</button>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
</table>
        <script type="text/javascript">
        
                $('#risTable').DataTable({
                    language: {
                        emptyTable: "No result"
                    }
                });
       
            
            </script>
        <%}
else{
out.print("No Result for this moment");
}
        %>
