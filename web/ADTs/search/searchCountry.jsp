<%-- 
    Document   : searchCountry
    Created on : Mar 13, 2017, 5:31:33 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String input = request.getParameter("input");

    String searchProblem = "select description from adm_lookup_detail where master_reference_code = '0001' and CONCAT(UPPER(description),LOWER(description)) like '%" + input + "%';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListCountry" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li><%=search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>