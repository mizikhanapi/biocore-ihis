<%-- 
    Document   : nursingUseChartControllerSearchDrugCode
    Created on : Oct 5, 2017, 12:30:38 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("keyword");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");

    String searchProblem = "SELECT ud_mdc_code,d_trade_name FROM pis_mdc2 "
            + " WHERE (d_trade_name LIKE '%" + key + "%' OR ud_mdc_code like '%" + key + "%') AND hfc_cd = '" + hfc_cd + "' AND discipline_cd = '" + dis_cd + "'; ";

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {
        out.print("[");
        for (int i = 0; i < search.size(); i++) {

            if (i == search.size() - 1) {

                out.print(
                        "{ \"name\" : \"(" + search.get(i).get(0) + ") " + search.get(i).get(1) + "\", "
                        + "\"value\" : \"" + search.get(i).get(0) + "\"}"
                );
            } else {

                out.print(
                        "{ \"name\" : \"(" + search.get(i).get(0) + ") " + search.get(i).get(1) + "\", "
                        + "\"value\" : \"" + search.get(i).get(0) + "\"},"
                );
            }
        }
        out.print("]");
    }
%>
