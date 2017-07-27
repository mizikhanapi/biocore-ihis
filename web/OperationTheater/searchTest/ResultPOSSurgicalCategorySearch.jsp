

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                               //String key ="bypass";
                                String searchProblem = "SELECT category_name,category_cd FROM opt_procedure_category WHERE category_name LIKE '%"+key+"%' AND hfc_cd = '"+hfc_cd+"'; ";
                                
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                               
                                    if (search.size() > 0) {
                                        out.print("[");
                                        for (int i = 0; i < search.size(); i++) {

                                            if (i == search.size() - 1) {

                                                out.print(
                                                        "{ \"name\" : \"" + search.get(i).get(0)+"\", "

                                                                + "\"value\" : \"" + search.get(i).get(1)+"\"}"
                                                );
                                            } else {

                                                out.print(
                                                        "{ \"name\" : \"" + search.get(i).get(0) + "\", "

                                                                + "\"value\" : \"" + search.get(i).get(1)+"\"},"
                                                );
                                            }
                                        }
                                        out.print("]");
                                    }                      
%>
