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

    String id = request.getParameter("iditem");
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String subdis = request.getParameter("subdis");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    // AND subdiscipline_cd = '" + subdis + "' 
    String sql = "DELETE FROM pis_atc WHERE UD_ATC_Code = '" + id + "' AND hfc_cd = '" + hfc + "' AND discipline_cd = '" + dis + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
%>
