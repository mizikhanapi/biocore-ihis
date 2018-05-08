<%-- 
    Document   : searchFamIC
    Created on : May 8, 2018, 2:04:21 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String input = request.getParameter("input");
    //String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String searchProblem = "SELECT `NEW_IC_NO`, PATIENT_NAME FROM pms_patient_biodata WHERE `NEW_IC_NO` LIKE '"+input+"%';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListPmiFam" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li data-name='<%=search.get(i).get(1)%>'><%=search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>
