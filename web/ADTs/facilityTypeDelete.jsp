<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    String id = request.getParameter("idtype");
        String hfc = request.getParameter("hfc");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    String sql = "DELETE FROM wis_ward_class WHERE ward_class_code = '" + id + "' AND  hfc_cd = '" + hfc + "'  ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>
