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

                               String orderId = request.getParameter("orderId");
                               String module = request.getParameter("module");
                               String searchProblem = "";
                               if (module.equals("ROS")){
                                searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.modality_cd,m.modality_name,od.body_system_cd,bs.body_system_name,od.procedure_cd,pm.ris_procedure_name "
                                       + "FROM ris_order_detail od "
                                       + "JOIN ris_order_master om "
                                       + "JOIN ris_body_system bs "
                                       + "JOIN ris_modality m "
                                       + "JOIN ris_procedure_master pm "
                                       + "JOIN adm_health_facility hf "
                                       + "WHERE  od.order_no = om.order_no "
                                       + "AND om.hfc_to = hf.hfc_cd "
                                       + "AND od.modality_cd = m.modality_cd "
                                       + "AND od.body_system_cd = bs.body_system_cd "
                                       + "AND od.procedure_cd = pm.ris_procedure_cd  "
                                       + "AND od.order_no = '"+orderId+"' "
                                       + "GROUP BY od.order_no";
                               } else if(module.equals("LIO")){
                                   searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.modality_cd,m.modality_name,od.body_system_cd,bs.body_system_name,od.procedure_cd,pm.ris_procedure_name "
                                       + "FROM ris_order_detail od "
                                       + "JOIN ris_order_master om "
                                       + "JOIN ris_body_system bs "
                                       + "JOIN ris_modality m "
                                       + "JOIN ris_procedure_master pm "
                                       + "JOIN adm_health_facility hf "
                                       + "WHERE  od.order_no = om.order_no "
                                       + "AND om.hfc_to = hf.hfc_cd "
                                       + "AND od.modality_cd = m.modality_cd "
                                       + "AND od.body_system_cd = bs.body_system_cd "
                                       + "AND od.procedure_cd = pm.ris_procedure_cd  "
                                       + "AND od.order_no = '"+orderId+"' "
                                       + "GROUP BY od.order_no";
                                   out.print(searchProblem);
                               }


                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                
                         if (search.size() > 0) {

                                 for (int i = 0; i < search.size(); i++) {

                                     out.print(String.join("|", search.get(i)));
                                 }
                             }
                                 
                                        
                                                                        
%>