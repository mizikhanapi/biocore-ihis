<%-- 
    Document   : assignRole_insert
    Created on : Feb 23, 2017, 5:37:24 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String userCode = request.getParameter("userCode");
    String roleCode = request.getParameter("roleCode");
    String disciplineCode = request.getParameter("disciplineCode");
    String subdisciplineCode = request.getParameter("subdisciplineCode");
    String status = request.getParameter("status");
    String creator = (String) session.getAttribute("USER_ID");
    String hfcCode = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    String users[] = userCode.split("\\|");

    RMIConnector rmic = new RMIConnector();
    boolean isInsert = false;

    for (int i = 0; i < users.length; i++) {
        
        String sqlInsert = "INSERT INTO adm_user_access_role(user_id, role_code, health_facility_code, discipline_code, subdiscipline_code, created_by, created_date, status) "
                + "VALUES('" + users[i] + "', '" + roleCode + "', '" + hfcCode + "', '" + disciplineCode + "', '" + subdisciplineCode + "', '" + creator + "', now(), '" + status + "')";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>

