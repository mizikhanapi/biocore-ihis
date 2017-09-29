
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.simple.*"%>
<%

%>
<%    Conn Conn = new Conn();
    //String key = request.getParameter("keyword");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    //String key ="fever";
    String searchProblem = "select `D_TRADE_NAME`,`D_GNR_NAME` from pis_mdc2 WHERE hfc_cd = '" + hfc_cd + "' AND discipline_cd = '" + discipline + "'  ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    JSONArray jsonArray = new JSONArray();

    for (int i = 0; i < search.size(); i++) {
        JSONObject json = new JSONObject();
        json.put("name", search.get(i).get(0).trim() + " - " + search.get(i).get(1).trim());
        json.put("value", search.get(i).get(0).trim());
        jsonArray.add(json);
        out.flush();
    }
    out.print(jsonArray);

//                                    if (search.size() > 0) {
//                                        out.print("[");
//                                        for (int i = 0; i < search.size(); i++) {
//
//                                            if (i == search.size() - 1) {
//                                                
//
//
//                                                out.print(
//                                                        "{ \"name\" : \"" + search.get(i).get(0).trim() +" - " +search.get(i).get(1).trim()+"\", "
//
//                                                                + "\"value\" : \"" + search.get(i).get(0).trim()+"\"}"
//                                                );
//                                            } else {
//
//                                                out.print(
//                                                        "{ \"name\" : \"" + search.get(i).get(0).trim() +" - " +search.get(i).get(1).trim()+ "\", "
//
//                                                                + "\"value\" : \"" + search.get(i).get(0)+"\"},"
//                                                );
//                                            }
//                                        }
//                                        out.print("]");
//                                    }
%>
