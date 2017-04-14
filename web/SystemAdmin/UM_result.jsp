<%-- 
    Document   : UM_result
    Created on : Feb 17, 2017, 10:50:52 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String user_id = session.getAttribute("USER_ID").toString();
    String last9 = user_id.substring(user_id.length() - 1);

    Conn conn = new Conn();
    
    String whereClause = " ";
    
     if(!last9.equals("9") || !hfc_cd.equals("99_iHIS_99")){
         whereClause = " AND hfc_cd <> '99_iHIS_99' ";
     }
    
    String key = request.getParameter("input");
    String searchProblem = "SELECT hfc_cd, hfc_name FROM adm_health_facility WHERE concat(hfc_cd, ' | ', hfc_name) like '%"+key+"%' "+whereClause;
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0)
            {
%>
<ul id="UM_hfc_matchlist" style="width: 300px; height: 100%; max-height: 100px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++)
        {
    %>
    <li><a style="cursor:pointer"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
    <%
        }
    %>
</ul>
    
<%}else{%>
<span>No Record Found!</span>
<% 
    }
%>