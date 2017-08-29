

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String user_id = (String)session.getAttribute("USER_ID");
                               //String key ="fever";
                                String searchProblem = "SELECT clinical_term_name FROM cis_personalised_clinical_term WHERE code_type = 'FMH' AND user_id = '"+user_id+"' AND UPPER(clinical_term_name) LIKE '%"+key+"%';";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                String data = "[";
                                 if (search.size() > 0) 
                                        {
                                            out.print("[");
                                            for(int i =0; i < search.size(); i++){
                                                
                                               if(i == search.size() -1){
                                                   data += "{ \"name\" : \""+search.get(i).get(0)+ "\"}"  ;
                                                 out.print(
                                                        "{ \"name\" : \""+search.get(i).get(0)+ "\"}"  
                                                );
                                               }else{
                                                      data +=  "{ \"name\" : \""+search.get(i).get(0)+ "\"}," ;
                                                out.print(
                                                        "{ \"name\" : \""+search.get(i).get(0)+ "\"},"  
                                                );
                                               }
                                            }
                                             data +="]";
                                            out.print("]");
                                        }
                                                                        
%>
