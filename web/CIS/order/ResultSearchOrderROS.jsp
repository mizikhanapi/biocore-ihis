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
                                        searchProblem = "SELECT od.procedure_cd, pm.ris_procedure_name,pm.body_system_name,modality_name "
                                                + "FROM ris_order_detail od "
                                                + "INNER JOIN ris_order_master om "
                                                + "INNER JOIN ris_procedure_master pm "
                                                + "WHERE od.order_no = om.order_no "
                                                + "AND od.procedure_cd = pm.ris_procedure_cd "
                                                + "AND om.pmi_no = '" + pmiNo + "' "
                                                + "AND DATE(om.episode_date) =  '" + todayDate + "' "
                                                + "GROUP BY procedure_cd";
                                        
                                       //out.print(searchProblem);
                                    } else if (type.equals("previous")) {
                                        searchProblem = "SELECT od.procedure_cd, pm.ris_procedure_name,pm.body_system_name,modality_name "
                                                + "FROM ris_order_detail od "
                                                + "INNER JOIN ris_order_master om "
                                                + "INNER JOIN ris_procedure_master pm "
                                                + "WHERE od.order_no = om.order_no "
                                                + "AND od.procedure_cd = pm.ris_procedure_cd "
                                                + "AND om.pmi_no = '" + pmiNo + "' "
                                                + "GROUP BY procedure_cd";
                                    }
                               }else{
                                    if (type.equals("today")) {
                                            searchProblem = "SELECT od.procedure_cd, pm.ris_procedure_name,pm.body_system_name,modality_name "
                                                    + "FROM ris_order_detail od "
                                                    + "INNER JOIN ris_order_master om "
                                                    + "INNER JOIN ris_procedure_master pm "
                                                    + "WHERE od.order_no = om.order_no "
                                                    + "AND od.procedure_cd = pm.ris_procedure_cd "
                                                    + "AND om.pmi_no = '" + pmiNo + "' "
                                                    + "AND DATE(om.episode_date) = '" + todayDate + "' "
                                                    + "AND om.order_no = '"+orderId+"' "
                                                    + "GROUP BY procedure_cd";
                                            
                                        } else if (type.equals("previous")) {
                                            searchProblem = "SELECT od.procedure_cd, pm.ris_procedure_name,pm.body_system_name,modality_name "
                                                    + "FROM ris_order_detail od "
                                                    + "INNER JOIN ris_order_master om "
                                                    + "INNER JOIN ris_procedure_master pm "
                                                    + "WHERE od.order_no = om.order_no "
                                                    + "AND od.procedure_cd = pm.ris_procedure_cd "
                                                    + "AND om.pmi_no = '" + pmiNo + "' "
                                                    + "AND om.order_no = '"+orderId+"' "
                                                    + "GROUP BY procedure_cd";
                                            
                                        }
                                    
                               }

                               

                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                     
                                 
                                        
                                                                        
%>


                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <td>Body-System</td>
                            <td>Modality</td>
                            <td>Procedure Name</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody id="tableSearchOrderROS">
                        <% for(int i=0; i<search.size(); i++){
                            %>
                            <tr>
                                <td><%out.print(search.get(i).get(2));%></td>
                                <td><%out.print(search.get(i).get(3));%></td>
                                <td><%out.print(search.get(i).get(1));%></td>
                                <td><a id="row" data-toggle="tooltip" data-placement="top" title="Add Order" class="btnAdd" style="cursor: pointer" id=""><i class="fa fa-plus fa-lg" aria-hidden="true" style="display: inline-block;color: #58C102;"></i></a>&nbsp;</td>
                            </tr>
                        <%    
                        }
                       %>
                        
                            

                    </tbody>
                </table>