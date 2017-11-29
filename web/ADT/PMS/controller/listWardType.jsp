<%-- 
    Document   : listWardType
    Created on : 12-Apr-2017, 23:38:02
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
     String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String disipline = request.getParameter("Dis");
%>

                <select id="WardType" name="WardType" class="form-control">
                    <option value="" selected disabled>Select Ward Type </option>

                    <%
                        String wtype = "select ward_class_code,ward_class_name from wis_ward_class where hfc_cd='" + hfc + "';";
                        ArrayList<ArrayList<String>> dataWardType = conn.getData(wtype);

                        int size2 = dataWardType.size();

                        for (int i = 0; i < size2; i++) {
                    %>
                    <option value="<%= dataWardType.get(i).get(0)%>"><%= dataWardType.get(i).get(1)%> </option>
             
                    <%
                        }
                    %>
                </select>
                