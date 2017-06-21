

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               //String key ="fever";
                                String searchProblem = "SELECT rsh_desc FROM readcode_social_history where CONCAT(UPPER(rsh_desc),LOWER(rsh_desc)) like '%" + key + "%' union select socialhistory_name from socialhistory_type where CONCAT(UPPER(socialhistory_name ),LOWER(socialhistory_name )) like '%" + key + "%'";
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
