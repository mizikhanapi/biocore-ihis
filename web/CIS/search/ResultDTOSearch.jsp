
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("keyword");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    //String key ="fever";
    String searchProblem = "select d_trade_name from pis_mdc2 where CONCAT(UPPER(d_trade_name),LOWER(d_trade_name)) like '%" + key + "%' AND hfc_cd = '" + hfc_cd + "'  AND discipline_cd = '" + discipline + "'   ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    String data = "[";
    if (search.size() > 0) {
        out.print("[");
        for (int i = 0; i < search.size(); i++) {

            if (i == search.size() - 1) {
                data += "{ \"name\" : \"" + search.get(i).get(0) + "\"}";
                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0) + "\"}"
                );
            } else {
                data += "{ \"name\" : \"" + search.get(i).get(0) + "\"},";
                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0) + "\"},"
                );
            }
        }
        data += "]";
        out.print("]");
    }

%>
