

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                               String cat_cd = request.getParameter("cat_cd");

                               //String key ="bypass";
                                String searchProblem = "SELECT `procedure_longName` FROM opt_procedure WHERE hfc_cd = '"+hfc_cd+"' AND category_cd = '"+cat_cd+"' AND procedure_longName LIKE '%"+key+"%'";
                                
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                               
                                    if (search.size() > 0) {
                                        out.print("[");
                                        for (int i = 0; i < search.size(); i++) {

                                            if (i == search.size() - 1) {

                                                out.print(
                                                        "{ \"name\" : \"" + search.get(i).get(0) +"\", "

                                                                + "\"value\" : \"" + search.get(i).get(0)+"\"}"
                                                );
                                            } else {

                                                out.print(
                                                        "{ \"name\" : \"" + search.get(i).get(0)+ "\", "

                                                                + "\"value\" : \"" + search.get(i).get(0)+"\"},"
                                                );
                                            }
                                        }
                                        out.print("]");
                                    }                      
%>
