<%-- 
    Document   : deleveryOrderSearchDrugCode
    Created on : May 10, 2017, 4:51:20 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String key = request.getParameter("input");
    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");
    //String key1 = request.getParameter("input2");

    Conn conn = new Conn();

    String searchProblem = "select d_trade_name from pis_mdc2 where hfc_cd = '"+HEALTH_FACILITY_CODE+"' AND discipline_cd = '"+DISCIPLINE_CODE+"' "
            + " AND CONCAT(UPPER(d_trade_name),LOWER(d_trade_name)) like '%" + key + "%'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListDrugCode" style="width: 100%; height: 200px; overflow: auto;padding-bottom: 5%">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li onClick= "'<%=search.get(i).get(0)%>';"><%=search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>