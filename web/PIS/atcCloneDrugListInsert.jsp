<%-- 
    Document   : atcCloneDrugListInsert
    Created on : May 4, 2017, 10:02:41 PM
    Author     : Shammugam
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String superUserHFC = "99_iHIS_99";
    String superUserDIS = "BIT1010";
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String sqlInsert = "";

    String strATCClone = request.getParameter("strATCClone");

    String drugs[] = strATCClone.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isInsert = false;

    for (int i = 0; i < drugs.length; i++) {

        sqlInsert = "INSERT INTO pis_atc (UD_ATC_Code, UD_ATC_Desc, Category_Code,hfc_cd,discipline_cd,subdiscipline_cd,Status) "
                + " SELECT UD_ATC_Code, UD_ATC_Desc, Category_Code, '" + hfc + "','" + dis + "', '" + sub + "',Status "
                + " FROM pis_atc WHERE UD_ATC_Code = '" + drugs[i] + "' AND hfc_cd = '" + superUserHFC + "' AND discipline_cd = '" + superUserDIS + "' ";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>