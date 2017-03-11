<%-- 
    Document   : mdcSearchATC
    Created on : Mar 10, 2017, 11:36:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String searchProblem = "SELECT UD_ATC_Code,UD_ATC_Desc FROM pis_atc WHERE UD_ATC_Code like '%"+key+"%' OR UD_ATC_Desc like '%"+key+"%'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
            {
%>
<ul id="matchListATC" style="width: 300px; height: 200px; overflow: auto">
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
