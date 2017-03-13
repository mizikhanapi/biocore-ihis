<%-- 
    Document   : searchProcedureRIS
    Created on : 26-Jan-2017, 15:04:15
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    String key = request.getParameter("input");
    //String id = request.getParameter("id");
    
   
    String searchProblem = "select ris_procedure_name from ris_procedure_master where CONCAT(UPPER(ris_procedure_name),LOWER(ris_procedure_name)) like '%" +  key + "%' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
%>                           
<ul id="ROSmatchList" style="width: 100%; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) 
                                            {%>
    <li><%=search.get(i).get(0)%></li>
<%}%>
</ul>
<%}else{%>
<span>No Record Found!</span>
<%}%>

