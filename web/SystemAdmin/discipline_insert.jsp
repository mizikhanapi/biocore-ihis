<%-- 
    Document   : discipline_insert
    Created on : Feb 3, 2017, 5:48:02 PM
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
    String disciplineCode = request.getParameter("disciplineCode");
    String disciplineName = request.getParameter("disciplineName");
    String groupCode = request.getParameter("groupCode");
    String categoryCode = request.getParameter("categoryCode");
    String specialtyCode = request.getParameter("specialtyCode");
    String status = request.getParameter("status");
    String D_hfc_cd = request.getParameter("hfc_cd");
   
    String userID = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT discipline_cd from adm_discipline WHERE discipline_cd = '"+disciplineCode+"' and discipline_hfc_cd = '"+D_hfc_cd+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, the code is already used. Please enter different code.");
    }
    else{
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_discipline values('"+disciplineCode+"', '"+disciplineName+"', '"+groupCode+"', '"+categoryCode+"', '"+specialtyCode+"', '"+userID+"', now(), '"+status+"', '"+D_hfc_cd+"' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            String sqlInsertSub = "INSERT INTO adm_subdiscipline values('"+disciplineCode+"', '"+disciplineCode+"', '"+disciplineName+"', '', '"+userID+"', now(), '"+status+"', '"+D_hfc_cd+"')";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertSub);
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

    

%>
