<%-- 
    Document   : nursingUseChartControllerSearchDrugCodeResult
    Created on : Oct 5, 2017, 3:44:30 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("search");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");

    String searchProblem = "SELECT ud_mdc_code,d_trade_name,d_route_code,d_form_code,d_strength,d_frequency FROM pis_mdc2 "
            + " WHERE ud_mdc_code = '" + key + "' AND hfc_cd = '" + hfc_cd + "' AND discipline_cd = '" + dis_cd + "'; ";

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));

        }
    }
%>