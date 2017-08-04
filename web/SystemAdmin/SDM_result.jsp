<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String hfc_cd = request.getParameter("hfc_cd");
    
    String searchProblem = "SELECT discipline_cd, discipline_name FROM adm_discipline "
            + "WHERE concat(discipline_cd, ' | ', discipline_name) like '%"+key+"%' and discipline_hfc_cd = '"+hfc_cd+"' and discipline_status='0';";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
    {
%>
<ul id="SDM_matchList" style="width: 300px; max-height: 200px; height: 100%; overflow: auto">
    <% for (int i = 0; i < search.size(); i++)
        {
    %>
    <li><a style="cursor: pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
    <%
        }
    %>
</ul>
    
<%}else{%>
<span>No Record Found!</span>
<% 
    }
%>

