<%-- 
    Document   : patientOrderListDispenseFillerDetails
    Created on : Oct 27, 2018, 3:30:14 AM
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

    String searchProblem = "SELECT USER_ID, USER_NAME "
            + " FROM adm_users "
            + " WHERE USER_TYPE = 'HIS-CARE User' AND USER_GROUP = 'HIS-CARE' AND CONCAT(UPPER(USER_NAME),LOWER(USER_NAME)) like '%" + key + "%'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchList" style="width: 100%; height: 200px; overflow: auto;padding-bottom: 5%">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li ><%=search.get(i).get(0)%>|<%=search.get(i).get(1)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>
