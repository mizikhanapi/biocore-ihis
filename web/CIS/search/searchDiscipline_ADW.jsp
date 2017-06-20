<%-- 
    Document   : searchTitle
    Created on : Mar 13, 2017, 5:17:12 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String hfc = request.getParameter("hfc");
    String input = request.getParameter("input");
    String searchProblem = "select ward_id, ward_name  from wis_ward_name where hfc_cd =  '"+hfc+"' and ward_name like '%"+input+"%'";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListDis" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li><%=search.get(i).get(0)+"|"+search.get(i).get(1)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!--</span>
<%}%>
