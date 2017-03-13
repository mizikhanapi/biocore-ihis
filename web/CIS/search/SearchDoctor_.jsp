<%-- 
    Document   : SearchDoctor_
    Created on : 17-Feb-2017, 11:27:58
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key =request.getParameter("name");
    String hfc =request.getParameter("hfc");
    String dis =request.getParameter("dis");
    String searchProblem = "SELECT user_name FROM adm_users inner join adm_user_access_role on adm_user_access_role.user_id=adm_users.`USER_ID` where adm_users.health_facility_code='"+hfc+"' and adm_user_access_role.`DISCIPLINE_CODE`='"+dis+"' and CONCAT(UPPER(adm_users.user_name),LOWER(adm_users.user_name)) like '%" + key + "%'";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListDoctor" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li ><%=search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>