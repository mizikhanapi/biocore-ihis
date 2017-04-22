<%-- 
    Document   : atcSearchDiscipline
    Created on : Mar 10, 2017, 3:09:26 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String hfc = request.getParameter("hfc");
    
    String searchProblem = "SELECT DISTINCT(adm_hfc_discipline.discipline_cd),adm_discipline.discipline_name FROM adm_hfc_discipline JOIN adm_discipline ON (adm_hfc_discipline.discipline_cd = adm_discipline.discipline_cd) WHERE hfc_cd = '"+hfc+"' AND (adm_hfc_discipline.discipline_cd like '%"+key+"%' OR adm_discipline.discipline_name like '%"+key+"%') ";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
            {
%>
<ul id="matchListDis" style="width: 300px; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++)
        {
    %>
    <li value="<%=search.get(i).get(0)%>"><a style="cursor:pointer; color: black;"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
    <%
        }
    %>
</ul>
    
<%}else{%>
<span>No Record Found!</span>
<% 
    }
%>
