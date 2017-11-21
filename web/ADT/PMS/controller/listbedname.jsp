<%-- 
    Document   : listbedname
    Created on : 12-Apr-2017, 15:44:19
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String wclassCode = request.getParameter("classCode");
%>
<input type="hidden" value="<%=hfc%>" id="Rhfc">

<select id="wname" name="selectbasic" class="form-control">
    <option value="-">-</option>
    <option value="null" selected="" disabled="">Select Ward Name</option>

    <%
        String wname = "select ward_id,ward_name from wis_ward_name where hfc_cd='" + hfc + "' and ward_class_code='" + wclassCode + "'";
        ArrayList<ArrayList<String>> dataWardName = conn.getData(wname);

        int size1 = dataWardName.size();

        for (int i = 0; i < size1; i++) {
    %>
    <option value="<%= dataWardName.get(i).get(0) + "|" + dataWardName.get(i).get(1)%>"><%= dataWardName.get(i).get(1)%> </option> 

    <%
        }
    %>



</select>
