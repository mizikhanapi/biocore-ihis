<%-- 
    Document   : search_hfc
    Created on : May 20, 2017, 6:31:30 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String input = request.getParameter("key");

    Conn conn = new Conn();

    String sql = "Select hfc_cd, hfc_name FROM adm_health_facility WHERE concat(hfc_cd, ' | ', hfc_name) like '%" + input + "%' AND hfc_status='0';";
    ArrayList<ArrayList<String>> search = conn.getData(sql);

    if (search.size() > 0) {

%><ul id="HFC_matchlist" style="width: 300px; max-height: 200px; height: 100%; overflow: auto">
    <%                
        for (int i = 0; i < search.size(); i++) {

    %>
    <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
        <%

            }
        %>
</ul>
<%
} else {

%>
<span>No Record Found!</span>
<%                }


%>
