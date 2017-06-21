

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               //String key = "mo";
                               String hfc_cd = request.getParameter("hfc_cd");
                               //String hfc_cd = "04010101";
                               //String key ="fever";
                                 String searchProblem = "select ris_procedure_name from ris_procedure_master where CONCAT(UPPER(ris_procedure_name),LOWER(ris_procedure_name)) like '%" +  key + "%' AND hfc_cd = '"+hfc_cd+"' ";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                               // out.print(searchProblem);
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
                                 else{
                                     out.print(hfc_cd);
                                 }
                                                                        
%>
