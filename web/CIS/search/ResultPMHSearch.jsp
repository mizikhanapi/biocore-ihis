
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.simple.*"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               //String key ="fever";
                               String searchProblem = "SELECT rpmh_desc FROM readcode_past_medical_history where CONCAT(UPPER(rpmh_desc),LOWER(rpmh_desc)) like '%" +  key + "%'";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                    JSONArray jsonArray = new JSONArray();

                                        for (int i = 0; i < search.size(); i++) {
                                            JSONObject json = new JSONObject();
                                            json.put("name", search.get(i).get(0).trim());
                                            
                                            jsonArray.add(json);
                                            out.flush();
                                        }
                                        out.print(jsonArray);
                                        
                                        
//                                 if (search.size() > 0) 
//                                        {
//                                            out.print("[");
//                                            for(int i =0; i < search.size(); i++){
//                                                
//                                               if(i == search.size() -1){
//                                                   data += "{ \"name\" : \""+search.get(i).get(0)+ "\"}"  ;
//                                                 out.print(
//                                                        "{ \"name\" : \""+search.get(i).get(0)+ "\"}"  
//                                                );
//                                               }else{
//                                                      data +=  "{ \"name\" : \""+search.get(i).get(0)+ "\"}," ;
//                                                out.print(
//                                                        "{ \"name\" : \""+search.get(i).get(0)+ "\"},"  
//                                                );
//                                               }
//                                            }
//                                             data +="]";
//                                            out.print("]");
//                                        }
//                                                                        
%>
