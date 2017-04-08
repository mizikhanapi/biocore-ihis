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
    //String disciplineCode = request.getParameter("disciplineCode");
    //String subdisciplineCode = request.getParameter("subdisciplineCode");
    String status = request.getParameter("status");
    String creator = (String) session.getAttribute("USER_ID");
    //String hfcCode = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    String users[] = userCode.split("\\|");

    RMIConnector rmic = new RMIConnector();
    boolean isInsert = false;

    for (int i = 0; i < users.length; i++) {
        
        String sqlInsert = "UPDATE adm_user_access_role SET role_code = '"+roleCode+"', created_by = '"+creator+"', created_date = now(), status = '"+status+"' "
                + "WHERE user_id = '"+users[i]+"'";
                

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>

