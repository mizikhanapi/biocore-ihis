

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String p1 = request.getParameter("p1");
                               String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                               //String key ="fever";
                                String searchProblem = "select procedure_2_name from cis_procedure_2 where CONCAT(UPPER(procedure_2_name),LOWER(procedure_2_name)) like '%" +  key + "%' AND hfc_cd = '"+ hfc_cd + "' AND procedure_1_cd = '"+p1+"' ";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                               
                                 if (search.size() > 0) 
                                        {
                                            out.print("[");
                                            for(int i =0; i < search.size(); i++){
                                                
                                               if(i == search.size() -1){
                                                  
                                                 out.print(
                                                        "{ \"name\" : \""+search.get(i).get(0)+ "\"}"  
                                                );
                                               }else{
                                                      
                                                out.print(
                                                        "{ \"name\" : \""+search.get(i).get(0)+ "\"},"  
                                                );
                                               }
                                            }
                                            out.print("]");
                                        }
                                                                        
%>
