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
    String EliSrc = request.getParameter("EliSrc");
%>

    <!--<option value="-">-</option>-->
     <%
        String eliType = "select  Detail_Reference_Code, Description from adm_lookup_detail where master_reference_code = '0034' and  Detail_Reference_Code like '" + EliSrc + "%' and hfc_cd ='" + hfc + "' ";
        ArrayList<ArrayList<String>> dataEliType;

        dataEliType = conn.getData(eliType);

        int sizeEL = dataEliType.size();
        
    %>
    <option value="">Select Eligibility Type</option>
    <%

        for (int i = 0; i < sizeEL; i++) {
    %>
    <option value="<%= dataEliType.get(i).get(0)%>"><%= dataEliType.get(i).get(1)%> </option>
    <%
        }
    %>


