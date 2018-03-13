<%-- 
    Document   : manageBillParameterUpdate
    Created on : Nov 29, 2017, 12:59:16 PM
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

    String billParameterCode = request.getParameter("billParameterCode");
    String billParameterName = request.getParameter("billParameterName");
    String billParameterValue = request.getParameter("billParameterValue");
    String billParameterEnable = request.getParameter("billParameterEnable");
    //String billParameterStatus = request.getParameter("billParameterStatus");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE far_billing_parameter SET param_name = '" + billParameterName + "',param_value = '" + billParameterValue + "',"
            + " enable = '" + billParameterEnable + "' "
            + " WHERE param_code = '" + billParameterCode + "' AND hfc_cd  = '" + hfc + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>