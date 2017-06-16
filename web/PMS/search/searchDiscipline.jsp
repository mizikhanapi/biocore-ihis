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
    String searchProblem = "select a.discipline_name,a.discipline_cd,b.subdiscipline_cd,c.subdiscipline_name from adm_discipline a inner join adm_hfc_discipline b on a.discipline_cd = b.discipline_cd and b.hfc_cd = '"+hfc+"' left join adm_subdiscipline c on b.subdiscipline_cd = c.subdiscipline_cd and b.discipline_cd = c.discipline_cd where CONCAT(UPPER(a.discipline_name),LOWER(a.discipline_name)) like '%" +  input + "%' AND hfc_cd = '"+hfc+"';";
    String sql = "select a.discipline_name,a.discipline_cd,b.subdiscipline_cd,c.subdiscipline_name from adm_discipline a inner join adm_hfc_discipline b on a.discipline_cd = b.discipline_cd and b.hfc_cd = '"+hfc+"' left join adm_subdiscipline c on b.subdiscipline_cd = c.subdiscipline_cd and b.discipline_cd = c.discipline_cd and c.subdiscipline_hfc_cd = a.discipline_hfc_cd where CONCAT(UPPER(a.discipline_name),LOWER(a.discipline_name)) like '%" +  input + "%' AND a.discipline_hfc_cd = '"+hfc+"';";
    ArrayList<ArrayList<String>> search = Conn.getData(sql);
    if (search.size() > 0) {
%>
<ul id="matchListDis" style="width: auto; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li><%=search.get(i).get(1)+"|"+search.get(i).get(0)+"|"+search.get(i).get(2)+"|"+search.get(i).get(3)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found!</span>
<%}%>
