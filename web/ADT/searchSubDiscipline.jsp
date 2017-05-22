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


    String searchProblem = "SELECT a.subdiscipline_cd,a.subdiscipline_name,b.subdiscipline_cd, b.hfc_cd FROM adm_subdiscipline a "
            + "LEFT JOIN adm_hfc_discipline b ON a.subdiscipline_cd = b.subdiscipline_cd  "
            + "WHERE b.hfc_cd = '"+hfc+"' AND  (a.subdiscipline_cd like '%"+key+"%' OR subdiscipline_name like '%"+key+"%') group by b.subdiscipline_cd ";
    
   

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
