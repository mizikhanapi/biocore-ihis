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
                                        searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container  "
                                                + "FROM lis_order_master om JOIN lis_order_detail od "
                                                + "JOIN adm_health_facility hf "
                                                + "WHERE om.order_no = od.order_no "
                                                + "AND hf.hfc_cd = om.hfc_to "
                                                + "AND om.pmi_no = '"+pmiNo+"' "
                                                + "AND DATE(om.episode_date) = '"+todayDate+"'  "
                                                + "GROUP BY od.item_cd";
                                        
                                       //out.print(searchProblem);
                                    } else if (type.equals("previous")) {
                                        searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container  "
                                                + "FROM lis_order_master om JOIN lis_order_detail od "
                                                + "JOIN adm_health_facility hf "
                                                + "WHERE om.order_no = od.order_no "
                                                + "AND hf.hfc_cd = om.hfc_to "
                                                + "AND om.pmi_no = '"+pmiNo+"' "
                                                + "GROUP BY od.item_cd";
                                     
                                    }
                               }else{
                                    if (type.equals("today")) {
                                          searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container  "
                                                + "FROM lis_order_master om JOIN lis_order_detail od "
                                                + "JOIN adm_health_facility hf "
                                                + "WHERE om.order_no = od.order_no "
                                                + "AND hf.hfc_cd = om.hfc_to "
                                                + "AND om.pmi_no = '"+pmiNo+"' "
                                                + "AND DATE(om.episode_date) = '"+todayDate+"'  "
                                                + " AND om.order_no = '"+orderId+"' "
                                                + "GROUP BY od.item_cd";
                                            
                                        } else if (type.equals("previous")) {
                                        searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.spe_source,od.item_cd,od.item_name,od.volume,od.spe_container  "
                                                + "FROM lis_order_master om JOIN lis_order_detail od "
                                                + "JOIN adm_health_facility hf "
                                                + "WHERE om.order_no = od.order_no "
                                                + "AND hf.hfc_cd = om.hfc_to "
                                                + "AND om.pmi_no = '"+pmiNo+"' "
                                                + " AND om.order_no = '"+orderId+"' "
                                                + "GROUP BY od.item_cd";
                                        }
                                    
                               }

                               

                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                     
                                 if(search.size() > 0){
                                     
                                 
                                        
                                                                        
%>


                <table class="table table-bordered table-striped" id="tblOROS">
                    <thead>
                        <tr>
                            <td>Body-System</td>
                            <td>Modality</td>
                            <td>Procedure Name</td>
                            <td>Provider Facility</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableSearchOrderROS">
                        <% for(int i=0; i<search.size(); i++){
                            %>
                            <tr>
                                <td><%out.print(search.get(i).get(3));%></td>
                                <td><%out.print(search.get(i).get(4));%></td>
                                <td><%out.print(search.get(i).get(2));%></td>
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
                       
                       <%}
else{
out.print("No Order");
}%>
                       