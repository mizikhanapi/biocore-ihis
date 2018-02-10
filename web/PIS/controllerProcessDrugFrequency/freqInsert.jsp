<%-- 
    Document   : freqInsert
    Created on : Sep 6, 2017, 7:10:44 PM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String freq_Code = request.getParameter("frequencyCode");
    String freq_Desc = request.getParameter("frequencyDesc");
    String freq_Value = request.getParameter("frequencyValue");
    String freq_Status = request.getParameter("frequencyStatus");
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlCheck = "SELECT frequency_code from pis_drug_frequency WHERE frequency_code = '" + freq_Code + "' AND hfc_cd  = '" + hfc + "'  AND discipline_cd   = '" + dis + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO pis_drug_frequency (frequency_code,frequency_desc,frequency_value,hfc_cd,discipline_cd,subdiscipline_cd,"
                + "created_by,created_date,status)"
                + " VALUES ('" + freq_Code + "','" + freq_Desc + "','" + freq_Value + "','" + hfc + "','" + dis + "',"
                + "'" + sub + "','" + created_by + "','" + created_date + "','" + freq_Status + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

%>