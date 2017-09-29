
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.simple.*"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");

                                String searchProblem = "select icd10_desc from icd10_codes where CONCAT(UPPER(icd10_desc),LOWER(icd10_desc)) like '%" +  key + "%'";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                
                                    JSONArray jsonArray = new JSONArray();

                                        for (int i = 0; i < search.size(); i++) {
                                            JSONObject json = new JSONObject();
                                            json.put("name", search.get(i).get(0).trim() );
                                            
                                            jsonArray.add(json);
                                            out.flush();
                                        }
                                        out.print(jsonArray);
                                                              
%>
