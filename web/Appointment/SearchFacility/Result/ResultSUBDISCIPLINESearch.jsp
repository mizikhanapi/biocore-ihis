

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String hfc_cd = request.getParameter("hfc_code");
                               String dis_code = request.getParameter("dis_code");
    
                               //String key ="fever";
                               String searchProblem = "SELECT subdiscipline_name FROM adm_subdiscipline where subdiscipline_hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+dis_code+"'; ";
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
