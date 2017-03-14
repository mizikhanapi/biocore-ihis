<%-- 
    Document   : supplierSearchCOUNTRY_CODE
    Created on : Mar 12, 2017, 10:15:42 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String searchProblem = "SELECT Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail WHERE Master_Reference_code = '0001' AND (Detail_Reference_code like '%"+key+"%' OR Description like '%"+key+"%') ";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
            {
%>
<ul id="matchListCOUNTRY" style="width: 300px; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++)
        {
    %>
    <li value="<%=search.get(i).get(2)%>"><a style="cursor:pointer; color: black;"><%=search.get(i).get(2)%></a></li>
    <%
        }
    %>
</ul>
    
<%}else{%>
<span>No Record Found!</span>
<% 
    }
%>
