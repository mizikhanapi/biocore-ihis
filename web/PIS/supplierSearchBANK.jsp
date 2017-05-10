<%-- 
    Document   : supplierSearchBANK
    Created on : May 9, 2017, 9:35:01 AM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String searchProblem = "SELECT Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail WHERE Master_Reference_code = '0097' AND hfc_cd  = '" + hfc + "' AND (Detail_Reference_code like '%" + key + "%' OR Description like '%" + key + "%') ";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {
%>
<ul id="matchListBANK" style="width: 300px; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {
    %>
    <li value="<%=search.get(i).get(2)%>"><a style="cursor:pointer; color: black;"><%=search.get(i).get(2)%></a></li>
        <%
            }
        %>
</ul>

<%} else {%>
<span>No Record Found!</span>
<%
    }
%>

