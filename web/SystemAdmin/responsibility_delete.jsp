<%-- 
    Document   : responsibility_delete
    Created on : Mar 2, 2017, 5:44:55 AM
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
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String roleCode = request.getParameter("roleCode");
    String pageCode = request.getParameter("pageCode");

   
   

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM adm_responsibility WHERE role_code = '" + roleCode + "' AND page_code = '"+pageCode+"' AND health_facility_code = '"+hfc_cd+"'";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
    
    if(status){
        sql = "DELETE FROM adm_responsibility_detail WHERE hfc_cd='"+hfc_cd+"' AND role_cd='"+roleCode+"' AND page_cd='"+pageCode+"';";
        status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
    }

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

    


%>

