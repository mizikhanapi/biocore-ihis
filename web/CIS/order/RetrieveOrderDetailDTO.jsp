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
                               String itemCode = request.getParameter("drug_cd");
                               String hfcTo = request.getParameter("hfc_to");
                               String searchProblem = "";

                                   searchProblem = "SELECT om.`ORDER_NO`, om.`HFC_TO`, hf.hfc_name, od.`DRUG_ITEM_CODE`, mdc.`D_TRADE_NAME` "
                                           + "FROM pis_order_master om "
                                           + "JOIN pis_order_detail od  "
                                           + "JOIN pis_mdc2 mdc "
                                           + "JOIN adm_health_facility hf "
                                           + "WHERE om.`ORDER_NO` = od.`ORDER_NO` "
                                           + "AND od.`DRUG_ITEM_CODE` = mdc.`UD_MDC_CODE` "
                                           + "AND om.`HFC_TO` = hf.hfc_cd "
                                           + "AND om.`ORDER_NO` = '"+orderId+"' "
                                           + "AND od.`DRUG_ITEM_CODE` = '"+itemCode+"' "
                                           + "AND om.`HFC_TO` = '"+hfcTo+"' "
                                           + "GROUP BY od.`DRUG_ITEM_CODE`;";
                                   


                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                
                         if (search.size() > 0) {

                                 for (int i = 0; i < search.size(); i++) {

                                     out.print(String.join("|", search.get(i)));
                                 }
                             }
                                 
                                        
                                                                        
%>