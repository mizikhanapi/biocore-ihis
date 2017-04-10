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
    String hfc = request.getParameter("hfc");
    
    String searchProblem = "select user_name from adm_users where CONCAT(UPPER(user_name),LOWER(user_name)) like '%" + input + "%' and health_facility_code ='"+hfc+"' ;";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListDoctor" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li><%=search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>