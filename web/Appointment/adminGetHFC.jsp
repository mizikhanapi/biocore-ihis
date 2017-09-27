<%-- 
    Document   : adminGetHFC
    Created on : Aug 5, 2016, 9:21:30 AM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <select class="form-control" id="hfc_codeC" name="hfc_code" onchange="getDiscipline()" required>
        <option></option>
        <%
            Conn Conn = new Conn();
            String stateCode = request.getParameter("state");
            String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");

            String sql_hfc_list = " SELECT hfc_cd,hfc_name FROM adm_health_facility WHERE state_cd = '" + stateCode + "'  ";
            ArrayList<ArrayList<String>> data_hfc_list = Conn.getData(sql_hfc_list);

            if (data_hfc_list.size() > 0) {
                for (int i = 0; i < data_hfc_list.size(); i++) {
                    if (hfc.equals(data_hfc_list.get(i).get(0))) {
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
</html>
