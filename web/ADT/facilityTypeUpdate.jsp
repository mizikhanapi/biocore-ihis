
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
    
    String wclass = request.getParameter("MWClass");
    String wclassid = request.getParameter("MWID");
    String wstatus = request.getParameter("status");
     String hfc = request.getParameter("hfc");
     String dis = request.getParameter("dis");
      String sub = request.getParameter("sub");

    String createdBy = request.getParameter("id");
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE wis_ward_class SET  discipline_cd = '" + dis + "',subdiscipline_cd = '" + sub + "', created_by = '" + createdBy + "', ward_class_code = '" + wclassid + "',ward_class_name = '" + wclass + "', ward_class_status = '" + wstatus + "' WHERE ward_class_code = '" + wclassid + "' AND  hfc_cd = '" + hfc + "' ";
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>