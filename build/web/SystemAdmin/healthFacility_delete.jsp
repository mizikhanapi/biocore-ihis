<%-- 
    Document   : healthFacility_delete
    Created on : Feb 10, 2017, 10:45:53 AM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="controller/super_user_check.jsp" %>
<%
    Conn conn = new Conn();

    String id = request.getParameter("hfc_cd");

    RMIConnector rmic = new RMIConnector();
    String sql = "DELETE FROM adm_health_facility WHERE hfc_cd = '" + id + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
        
        //clear lookup detail from db
        sql = "Delete from adm_lookup_detail where hfc_cd = '"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear role from db
        sql = "Delete from adm_role where hfc_cd = '"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear responsibility from db
        sql = "Delete from adm_responsibility where health_facility_code = '"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear hfc discipline from db
        sql = "Delete from adm_hfc_discipline where hfc_cd = '"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear hfc body system code from db
        sql = "Delete from ris_body_system where hfc_cd = '"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear hfc modality from db
        sql = "Delete from ris_modality where hfc_cd = '"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear hfc procedure from db
        sql = "Delete from ris_procedure_master where hfc_cd = '"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear cis procedure
        sql="Delete from cis_procedure where hfc_cd='"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear cis procedure 1
        sql="Delete from cis_procedure_1 where hfc_cd='"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear cis procedure 2
        sql="Delete from cis_procedure_2 where hfc_cd='"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear lis item category 1
        sql="Delete from lis_item_category where hfc_cd='"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear lis item detail 2
        sql="Delete from lis_item_detail where hfc_cd='"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear OT category 
        sql="Delete from opt_procedure_category where hfc_cd='"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        //clear OT procedure
        sql="Delete from opt_procedure where hfc_cd='"+id+"'";
        rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
    } else {
        out.print("Failed");
    }
%>
