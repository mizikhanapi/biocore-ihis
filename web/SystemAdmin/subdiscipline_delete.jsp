<%-- 
    Document   : subdiscipline_delete
    Created on : Feb 6, 2017, 12:16:49 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="validateSession.jsp" %>
<%--<%@include file="controller/super_user_check.jsp" %>--%>
<%
    Conn conn = new Conn();

    String hfc_cd = request.getParameter("hfc_cd");
    String disciplineCode = request.getParameter("disciplineCode");
    String subdisciplineCode = request.getParameter("subdisciplineCode");

    String sqlSelect = "Select hfc_cd from adm_hfc_discipline where discipline_cd = '" + disciplineCode + "' AND subdiscipline_cd = '" + subdisciplineCode + "' and hfc_cd = '"+hfc_cd+"' limit 1";

    ArrayList<ArrayList<String>> dataUse = conn.getData(sqlSelect);

    if (dataUse.size() > 0) {
        
        out.print("You can't delete this item because it is referenced by health facility discipline");

    } else {

        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_subdiscipline WHERE discipline_cd = '" + disciplineCode + "' AND subdiscipline_cd = '" + subdisciplineCode + "' AND subdiscipline_hfc_cd = '"+hfc_cd+"' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }


%>
