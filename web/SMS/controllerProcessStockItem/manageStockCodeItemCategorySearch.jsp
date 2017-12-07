<%-- 
    Document   : manageStockCodeItemCategorySearch
    Created on : Nov 14, 2017, 8:54:09 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String key = request.getParameter("input");

    String searchProblem = "SELECT category_cd,category_name FROM stk_stock_category WHERE hfc_cd  = '" + hfc + "' AND discipline_cd  = '" + dis + "' AND (category_cd like '%" + key + "%' OR category_name like '%" + key + "%') ";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {
%>

<ul id="matchListATC" style="width: 300px; height: 200px; overflow: auto">
    <% for (int i = 0; i < search.size(); i++) {
    %>
    <li value="<%=search.get(i).get(0)%>"><a style="cursor:pointer; color: black;"><%=search.get(i).get(0)%> | <%=search.get(i).get(1)%></a></li>
        <%
            }
        %>
</ul>

<%} else {%>
<span>No Record Found!</span>
<%
    }
%>
