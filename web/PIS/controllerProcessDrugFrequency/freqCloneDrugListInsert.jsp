<%-- 
    Document   : freqCloneDrugListInsert
    Created on : Sep 6, 2017, 11:00:54 PM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
    String superUserDIS = "99_iHIS_99";
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);

    String sqlInsert = "";

    String strFREQClone = request.getParameter("strFREQClone");

    String freqs[] = strFREQClone.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isInsert = false;

    for (int i = 0; i < freqs.length; i++) {

        sqlInsert = "INSERT INTO pis_drug_frequency (frequency_code, frequency_desc, frequency_value,hfc_cd,discipline_cd,subdiscipline_cd,"
                + " status,created_by,created_date) "
                + " SELECT frequency_code, frequency_desc, frequency_value, '" + hfc + "','" + dis + "', '" + sub + "',status,'" + created_by + "', '" + created_date + "' "
                + " FROM pis_drug_frequency WHERE frequency_code = '" + freqs[i] + "' AND hfc_cd = '" + superUserHFC + "' ";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>