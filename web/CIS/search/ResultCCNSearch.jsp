

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.simple.*"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               //String key ="fever";
                                String searchProblem = "select RCC_DESC from READCODE_CHIEF_COMPLAINT where CONCAT(UPPER(RCC_DESC),LOWER(RCC_DESC)) like '%" +  key + "%' order by CHAR_LENGTH(rcc_desc), rcc_desc  ASC;";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                
                                    JSONArray jsonArray = new JSONArray();

                                        for (int i = 0; i < search.size(); i++) {
                                            JSONObject json = new JSONObject();
                                            json.put("name", search.get(i).get(0).trim());
                                            
                                            jsonArray.add(json);
                                            out.flush();
                                        }
                                        out.print(jsonArray);
                                        
//                                String data = "[";
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
                                                                        
%>
