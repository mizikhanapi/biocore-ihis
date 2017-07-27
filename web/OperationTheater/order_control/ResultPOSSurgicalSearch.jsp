

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                               String cat_cd = request.getParameter("cat_cd");
                               
                               if(cat_cd == null){
                                   cat_cd="";
                               }
                               
                               String condition=" AND (category_cd like '%"+key+"%' OR procedure_longName LIKE '%"+key+"%')";
                               
                               if(!cat_cd.equalsIgnoreCase("")){
                                   condition=" AND category_cd = '"+cat_cd+"' AND procedure_longName LIKE '%"+key+"%'";
                               }

                               //String key ="bypass";
                                String searchProblem = "SELECT `procedure_longName`, procedure_cd FROM opt_procedure WHERE hfc_cd = '"+hfc_cd+"' "+condition;
                                
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                               
                                    if (search.size() > 0) {
                                        out.print("[");
                                        for (int i = 0; i < search.size(); i++) {

                                            if (i == search.size() - 1) {

                                                out.print(
                                                        "{ \"name\" : \"( "+search.get(i).get(1)+" ) "+ search.get(i).get(0) +"\", "

                                                                + "\"value\" : \"" + search.get(i).get(1)+"\"}"
                                                );
                                            } else {

                                                out.print(
                                                        "{ \"name\" : \"( "+search.get(i).get(1)+" ) "+ search.get(i).get(0)+ "\", "

                                                                + "\"value\" : \"" + search.get(i).get(1)+"\"},"
                                                );
                                            }
                                        }
                                        out.print("]");
                                    }                      
%>
