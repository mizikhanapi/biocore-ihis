<%-- 
    Document   : freqUpdate
    Created on : Sep 6, 2017, 8:14:54 PM
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
    String freq_Code = request.getParameter("frequencyCode");
    String freq_Desc = request.getParameter("frequencyDesc");
    String freq_Value = request.getParameter("frequencyValue");
    String freq_Status = request.getParameter("frequencyStatus");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE pis_drug_frequency SET frequency_desc = '" + freq_Desc + "',frequency_value = '" + freq_Value + "',status = '" + freq_Status + "' "
            + " WHERE frequency_code = '" + freq_Code + "' AND hfc_cd  = '" + hfc + "' AND discipline_cd   = '" + dis + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>