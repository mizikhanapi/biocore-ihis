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
        String mrc = "0098";

   

    String searchProblem = "SELECT Detail_Reference_Code , Description from adm_lookup_detail "
            + "WHERE hfc_cd = '"+hfc+"' AND Master_Reference_Code = '"+mrc+"' and (Detail_Reference_Code like '%"+key+"%' OR Description like '%"+key+"%')";
    
   

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
