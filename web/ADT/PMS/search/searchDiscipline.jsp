<%-- 
    Document   : searchTitle
    Created on : Mar 13, 2017, 5:17:12 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String hfc = request.getParameter("hfc");
    String input = request.getParameter("input");
    String searchProblem = "select a.discipline_name,a.discipline_cd from adm_discipline a inner join adm_hfc_discipline b on a.discipline_cd = b.discipline_cd and b.hfc_cd = '"+hfc+"' where CONCAT(UPPER(a.discipline_name),LOWER(a.discipline_name)) like '%" +  input + "%';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListDis" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li><%=search.get(i).get(1)+"|"+search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>
