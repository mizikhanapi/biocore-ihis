<%-- 
    Document   : searchSocialHistory
    Created on : 25-Jan-2017, 11:08:15
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("input");
    String hfc_cd = request.getParameter("hfc_cd");
    //String key1 = request.getParameter("input2");

    String searchProblem = "select d.discipline_name from adm_discipline d,adm_hfc_discipline hfcd where d.discipline_cd = hfcd.discipline_cd and d.discipline_hfc_cd = hfcd.hfc_cd and  hfcd.hfc_cd='"+hfc_cd+"' and d.discipline_name like '%"+key+"%'";
    //out.print(searchProblem);
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchList" style="width: 100%; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {%>
    <li onClick= "selectCountry('<%=search.get(i).get(0)%>');"><%=search.get(i).get(0)%></li>
        <%}%>
</ul>
<%} else {%>
<span>No Record Found! <%out.print(searchProblem);%></span>
<%}%>
