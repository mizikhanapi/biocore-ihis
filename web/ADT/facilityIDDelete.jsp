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

    String id = request.getParameter("wcd");
    String hfc = request.getParameter("hfc");
    String wid = request.getParameter("wid");
   
            out.print(id);
        out.print(hfc);
        out.print(wid);


    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    String sql = "DELETE FROM wis_ward_name WHERE ward_id = '" + wid + "' ";
//   ward_class_code = '" + id + "' AND hfc_cd = '" + hfc + "' 

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>
