
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

    String atcCode = request.getParameter("atcCode");
    String atcDesc = request.getParameter("atcDesc");
    String category = request.getParameter("category");
    String hfc = request.getParameter("hfc");
    String discipline = request.getParameter("discipline");
    String subdiscipline = request.getParameter("subdiscipline");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    // subdiscipline_cd  = '"+subdiscipline+"'
    String sqlCheck = "SELECT UD_ATC_Code from pis_atc WHERE UD_ATC_Code = '" + atcCode + "' AND hfc_cd  = '"+hfc+"' AND discipline_cd  = '"+discipline+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO pis_atc (UD_ATC_Code,UD_ATC_Desc,Category_Code,hfc_cd,discipline_cd,subdiscipline_cd,Status)"
                + " VALUES ('" + atcCode + "','" + atcDesc + "','" + category + "','" + hfc + "','" + discipline + "','" + subdiscipline + "','" + status + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }
%>