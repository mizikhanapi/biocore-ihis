
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("keyword");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    //String key ="fever";
    String searchProblem = "select `D_TRADE_NAME`,`D_GNR_NAME` from pis_mdc2 WHERE hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline+"' AND (`D_TRADE_NAME` LIKE '%"+key+"%' OR `D_GNR_NAME` LIKE '%"+key+"%'); ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    String data = "[";
                                    if (search.size() > 0) {
                                        out.print("[");
                                        for (int i = 0; i < search.size(); i++) {

                                            if (i == search.size() - 1) {

                                                out.print(
                                                        "{ \"name\" : \"" + search.get(i).get(0) +" - " +search.get(i).get(1)+"\", "

                                                                + "\"value\" : \"" + search.get(i).get(0)+"\"}"
                                                );
                                            } else {

                                                out.print(
                                                        "{ \"name\" : \"" + search.get(i).get(0) +" - " +search.get(i).get(1)+ "\", "

                                                                + "\"value\" : \"" + search.get(i).get(0)+"\"},"
                                                );
                                            }
                                        }
                                        out.print("]");
                                    }
%>
