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
                               if(orderId.equals("-")){
                                if (type.equals("today")) {
                                        searchProblem = "SELECT om.order_no, om.hfc_to, hf.hfc_name, om.`EPISODE_DATE`, od.`PROCEDURE_CD`, od.`PROCEDURE_NAME`, au.`USER_NAME`,om.order_by, rd.comments "
                                                + " FROM pos_order_master om   "
                                                + "JOIN pos_order_detail od ON om.order_no = od.order_no    "
                                                + "JOIN adm_health_facility hf  ON hf.hfc_cd = om.hfc_to "
                                                + "JOIN adm_users au ON au.`USER_ID` = om.order_by   "
                                                + "LEFT JOIN pos_result_detail rd ON om.order_no = rd.order_no "
                                                + "WHERE  om.`PMI_NO` = '"+pmiNo+"'  "
                                                + "AND DATE(om.episode_date) = '" + todayDate + "'  "
                                                + "ORDER BY om.order_no DESC;";
                                        
                                       //out.print(searchProblem);
                                    } else if (type.equals("previous")) {
                                       searchProblem = "SELECT om.order_no, om.hfc_to, hf.hfc_name, om.`EPISODE_DATE`, od.`PROCEDURE_CD`, od.`PROCEDURE_NAME`, au.`USER_NAME`,om.order_by, rd.comments "
                                                + " FROM pos_order_master om   "
                                                + "JOIN pos_order_detail od ON om.order_no = od.order_no    "
                                                + "JOIN adm_health_facility hf  ON hf.hfc_cd = om.hfc_to "
                                                + "JOIN adm_users au ON au.`USER_ID` = om.order_by   "
                                                + "LEFT JOIN pos_result_detail rd ON om.order_no = rd.order_no "
                                                + "WHERE  om.`PMI_NO` = '"+pmiNo+"'  "
                                                
                                                + "ORDER BY om.order_no DESC;";
                                     
                                    }
                               }else{
                                    if (type.equals("today")) {
                                        searchProblem = "SELECT om.order_no, om.hfc_to, hf.hfc_name, om.`EPISODE_DATE`, od.`PROCEDURE_CD`, od.`PROCEDURE_NAME`, au.`USER_NAME`,om.order_by, rd.comments "
                                                + " FROM pos_order_master om   "
                                                + "JOIN pos_order_detail od ON om.order_no = od.order_no    "
                                                + "JOIN adm_health_facility hf  ON hf.hfc_cd = om.hfc_to "
                                                + "JOIN adm_users au ON au.`USER_ID` = om.order_by   "
                                                + "LEFT JOIN pos_result_detail rd ON om.order_no = rd.order_no "
                                                + "WHERE  om.`PMI_NO` = '"+pmiNo+"'  "
                                                + "AND DATE(om.episode_date) = '" + todayDate + "'  "
                                                 + " AND om.order_no = '"+orderId+"' "
                                                + "ORDER BY om.order_no DESC;";
                                            
                                        } else if (type.equals("previous")) {
                                        searchProblem = "SELECT om.order_no, om.hfc_to, hf.hfc_name, om.`EPISODE_DATE`, od.`PROCEDURE_CD`, od.`PROCEDURE_NAME`, au.`USER_NAME`,om.order_by, rd.comments "
                                                + " FROM pos_order_master om   "
                                                + "JOIN pos_order_detail od ON om.order_no = od.order_no    "
                                                + "JOIN adm_health_facility hf  ON hf.hfc_cd = om.hfc_to "
                                                + "JOIN adm_users au ON au.`USER_ID` = om.order_by   "
                                                + "LEFT JOIN pos_result_detail rd ON om.order_no = rd.order_no "
                                                + "WHERE  om.`PMI_NO` = '"+pmiNo+"'  "
                                              
                                                 + " AND om.order_no = '"+orderId+"' "
                                                + "ORDER BY om.order_no DESC;";
 
                                    
                               }
                              }

                               

                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                
                                 if(search.size() > 0){
                                     
                                
                                        
                                                                        
%>
       <table class="table table-bordered table-striped" id="tblOPOS">
                    <thead>
                        <tr>
                            <td>Episode Date</td>
                            <td>Order By</td>
                            <td>Procedure Name</td>
                            <td>Result</td>
                            <td>Provider Facility</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableSearchOrderPOS">

                        <% for(int i=0; i<search.size(); i++){
                            %>
                            <tr>
                                <td><%out.print(search.get(i).get(3));%></td>
                                <td><%out.print(search.get(i).get(6));%></td>
                                <td><%out.print(search.get(i).get(5));%></td>
                                <td><%out.print(search.get(i).get(8));%></td>
                                <td><%out.print(search.get(i).get(2));%></td>
                                <td hidden id="orderId"><%out.print(search.get(i).get(0));%></td>
                                <td hidden id="providerId"><%out.print(search.get(i).get(1));%></td>
                                <td hidden id="procedure_cd"><%out.print(search.get(i).get(4));%></td>
                                <td><a  data-toggle="tooltip" data-placement="top" title="Add Order" class="btnAdd" style="cursor: pointer" id="btnCIS_OE_POS_SEARCH_ADD"><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;</td>
                            </tr>
                        <%    
                        }
                       %>
                        
                            

                    </tbody>
                </table>
                       
                       <%}
else{
out.print("No Order");
}%>
                       