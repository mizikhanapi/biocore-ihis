<%-- 
    Document   : atcSearchSubDiscipline
    Created on : Mar 10, 2017, 3:13:42 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String searchProblem = "SELECT discipline_cd,subdiscipline_cd,subdiscipline_name FROM adm_subdiscipline WHERE subdiscipline_cd like '%"+key+"%' OR subdiscipline_name like '%"+key+"%'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
            {
%>
<ul id="matchListSubDis" style="width: 300px; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++)
        {
    %>
    <li value="<%=search.get(i).get(1)%>"><a style="cursor:pointer; color: black;"><%=search.get(i).get(1)%> | <%=search.get(i).get(2)%></a></li>
    <%
        }
    %>
</ul>
    
<%}else{%>
<span>No Record Found!</span>
<% 
    }
%>
