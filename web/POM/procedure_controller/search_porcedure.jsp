<%-- 
    Document   : search_porcedure
    Created on : May 17, 2017, 9:49:24 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();

    String process = request.getParameter("process");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    if (process.equalsIgnoreCase("level1")) {

        String key = request.getParameter("key");

        String query = "Select procedure_cd, procedure_name from cis_procedure "
                + "where concat(procedure_cd, ' | ', procedure_name) like '%" + key + "%' AND hfc_cd = '" + hfc_cd + "' "
                + "ORDER BY procedure_cd asc";

        ArrayList<ArrayList<String>> result = conn.getData(query);

        if (result.size() > 0) {

%>
<ul id="PRO_match_list" style="width: 300px; max-height: 200px; height: 100%; overflow: auto">

    <%        for (int i = 0; i < result.size(); i++) {

    %>
    <li data-code="<%=result.get(i).get(0)%>"><%=result.get(i).get(0)%> | <%=result.get(i).get(1)%></li>
        <%

            }// end for loop
        %>

</ul>
<%
        } else {

            out.print("<span>No result found!</span>");
        }

    }// end if level 1
    else if (process.equalsIgnoreCase("level2")) {

        String key = request.getParameter("key");

        String query = "Select procedure_1_cd, procedure_1_name from cis_procedure_1 "
                + "where concat(procedure_1_cd, ' | ', procedure_1_name) like '%" + key + "%' AND hfc_cd = '" + hfc_cd + "' "
                + "ORDER BY procedure_1_cd asc";

        ArrayList<ArrayList<String>> result = conn.getData(query);

        if (result.size() > 0) {

%>
    <ul id="PRO_match_list" style="width: 300px; max-height: 200px; height: 100%; overflow: auto">

        <%        for (int i = 0; i < result.size(); i++) {

        %>
        <li data-code="<%=result.get(i).get(0)%>"><%=result.get(i).get(0)%> | <%=result.get(i).get(1)%></li>
        <%

                }// end for loop
        %>

    </ul>
<%
            } else {

                out.print("<span>No result found!</span>");
            }

        }// end if level 2 
%>
