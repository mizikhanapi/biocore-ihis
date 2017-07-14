

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                               String p = request.getParameter("p");
                               //String key ="fever";
                                String searchProblem = "select procedure_1_name from cis_procedure_1 where CONCAT(UPPER(procedure_1_name),LOWER(procedure_1_name)) like '%" +  key + "%' AND hfc_cd = '"+ hfc_cd + "' AND procedure_cd = '"+p+"'; ";
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
