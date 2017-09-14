<%-- 
    Document   : CIS020012_1
    Created on : Feb 15, 2017, 10:00:30 AM
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
    String hfc_cd = "Klinik UTeM Induk";
    
    Conn conn = new Conn();
    
    
   
        //                  0           1           2           3                   4               5                       6           7               8           9               10
String sqlRIS = "SELECT om.order_no, om.hfc_to, hf.hfc_name, om.`EPISODE_DATE`, od.`PROCEDURE_CD`, od.`PROCEDURE_NAME`, au.`USER_NAME`,om.order_by, rd.comments,od.`COMMENT`, lp.procedure_outcome    "
                                                + " FROM pos_order_master om   "
                                                + "JOIN pos_order_detail od ON om.order_no = od.order_no    "
                                                + "JOIN adm_health_facility hf  ON hf.hfc_cd = om.hfc_to "
                                                + "JOIN adm_users au ON au.`USER_ID` = om.order_by   "
                                                + "LEFT JOIN pos_result_detail rd ON om.order_no = rd.order_no "
                                                + "LEFT JOIN lhr_procedure lp ON lp.pmi_no = om.pmi_no "
                                                + "WHERE  om.`PMI_NO` = '"+pmiNo+"'  "
                                                + "ORDER BY om.order_no DESC;";

ArrayList<ArrayList<String>> dataRIS = conn.getData(sqlRIS);


%>
<table class="table table-striped table-filter table-bordered" id="opTable" style="width: 100%">
    <%
        if(dataRIS.size()>0){
            %>
            <thead>
                <tr>
                    <th>Episode Date</th>
                    <th>Procedure Name</th>
                    <th>Doctor's Comments</th>
                    <th>Procedure Outcome</th>
                    <th>Order By</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < dataRIS.size(); i++) {
                        String procedure_outcome = dataRIS.get(i).get(10);
                        if(procedure_outcome == null){
                            procedure_outcome = "-";
                        }
                %>
                <tr>
                    <td><%out.print(dataRIS.get(i).get(3));%></td>
                    <td><%out.print(dataRIS.get(i).get(5));%></td>
                    <td><%out.print(dataRIS.get(i).get(9));%></td>
                    <td><%out.print(procedure_outcome);%></td>
                    <td><%out.print(dataRIS.get(i).get(6));%></td>
                    


                </tr>
                <%
                    }
                %>

            </tbody>
            
</table>
                            <script type="text/javascript">
                $(document).ready(function () {
                    $('#opTable').DataTable();
                  
                });
            </script>
            <%
        }else {
out.print("No record for this moment");
}
        %>

<%


    


    
%>
