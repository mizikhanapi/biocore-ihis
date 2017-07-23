

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String hfc_cd = request.getParameter("hfc_code");
                               //String key ="fever";
                               String searchProblem = "SELECT `USER_NAME` FROM adm_users WHERE `OCCUPATION_CODE` = '002' AND `HEALTH_FACILITY_CODE` = '"+hfc_cd+"'";
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
