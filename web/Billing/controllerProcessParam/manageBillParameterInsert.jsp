<%-- 
    Document   : manageBillParameterInsert
    Created on : Nov 29, 2017, 12:59:02 PM
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

    String billParameterCode = request.getParameter("billParameterCode");
    String billParameterName = request.getParameter("billParameterName");
    String billParameterValue = request.getParameter("billParameterValue");
    String billParameterEnable = request.getParameter("billParameterEnable");
    //String billParameterStatus = request.getParameter("billParameterStatus");
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlCheck = "SELECT param_code from far_billing_parameter WHERE param_code = '" + billParameterCode + "' AND hfc_cd  = '" + hfc + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO far_billing_parameter (param_code, hfc_cd, param_name, param_value, param_type, display_option,"
                + " enable, status, created_by, created_date)"
                + " VALUES ('" + billParameterCode + "','" + hfc + "','" + billParameterName + "','" + billParameterValue + "',"
                + "'Double','check box','" + billParameterEnable + "','1','" + created_by + "','" + created_date + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

%>