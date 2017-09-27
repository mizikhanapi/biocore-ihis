<%-- 
    Document   : adminGetHFC
    Created on : Aug 5, 2016, 9:21:30 AM
    Author     : -D-
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <select class="form-control" id="discipline" name="discipline" required>
        <option></option>
        <%
            Conn Conn = new Conn();
            String hfc = request.getParameter("hfc_cd");
            String discipline_cd = request.getParameter("discipline_cd");
            String sub_discipline_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");

            if (hfc == null) {
                hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
                discipline_cd = (String) session.getAttribute("DISCIPLINE_CODE");
            }

            String sql_hfc_list = "select subdiscipline_cd, subdiscipline_name from adm_subdiscipline where subdiscipline_hfc_cd = '" + hfc + "' and discipline_cd = '" + discipline_cd + "'";
            ArrayList<ArrayList<String>> data_hfc_list = Conn.getData(sql_hfc_list);

            if (data_hfc_list.size() > 0) {
                for (int i = 0; i < data_hfc_list.size(); i++) {
                    if (sub_discipline_cd.equals(data_hfc_list.get(i).get(0))) {
        %><option value="<%=data_hfc_list.get(i).get(0)%>" selected=""><%=data_hfc_list.get(i).get(1)%></option> <%
        } else {
        %><option value="<%=data_hfc_list.get(i).get(0)%>" ><%=data_hfc_list.get(i).get(1)%></option> <%
         }

     }
 } else {%>
        <option>No Healthcare Facility Exist</option>
        <%}


        %>
    </select>
    <%
    %>
</html>
