<%-- 
    Document   : searchTitle
    Created on : Mar 13, 2017, 5:17:12 PM
    Author     : shay
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String input = request.getParameter("input");
    String hfc = request.getParameter("hfc") != null? request.getParameter("hfc") : (String) session.getAttribute(MySessionKey.HFC_CD);
   
    String searchProblem = " select user_id, USER_NAME  from adm_users where "
            + "CONCAT(CONVERT(user_id USING utf8), ' | ', CONVERT(USER_NAME USING utf8)) like '%"+input+"%' AND HEALTH_FACILITY_CODE = '"+hfc+"';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListHFC" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>
