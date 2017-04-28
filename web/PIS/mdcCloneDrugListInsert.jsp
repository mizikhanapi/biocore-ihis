<%-- 
    Document   : mdcCloneDrugListInsert
    Created on : Apr 26, 2017, 9:41:31 PM
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

    // Variables From Database
    String UD_MDC_CODE = "";
    String UD_ATC_CODE = "";
    String D_TRADE_NAME = "";
    String D_GNR_NAME = "";
    String D_ROUTE_CODE = "";
    String D_FORM_CODE = "";
    String D_STRENGTH = "";
    String D_ADVISORY_CODE = "";
    String D_STOCK_QTY = "";
    String D_QTY = "";
    String D_QTYT = "";
    String D_DURATION = "";
    String D_DURATIONT = "";
    String D_FREQUENCY = "";
    String D_CAUTION_CODE = "";
    String D_EXP_DATE = "";
    String D_CLASSIFICATION = "";
    String STATUS = "";
    String D_LOCATION_CODE = "";
    String D_SELL_PRICE = "";
    String D_COST_PRICE = "";
    String D_PACKAGING = "";
    String D_PACKAGINGT = "";
    String D_PRICE_PPACK = "";

    String sqlInsert = "";

    String strMDCClone = request.getParameter("strMDCClone");

    String drugs[] = strMDCClone.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isInsert = false;

    for (int i = 0; i < drugs.length; i++) {

        sqlInsert = "INSERT INTO pis_mdc2 (UD_MDC_CODE, UD_ATC_CODE, D_TRADE_NAME, D_GNR_NAME, D_ROUTE_CODE, D_FORM_CODE, D_STRENGTH, D_ADVISORY_CODE, D_STOCK_QTY, D_QTY, "
                + " D_QTYT,D_DURATION,D_DURATIONT, D_FREQUENCY, D_CAUTION_CODE, D_EXP_DATE, D_CLASSIFICATION, STATUS, D_LOCATION_CODE, D_SELL_PRICE, D_COST_PRICE, "
                + " D_PACKAGING,D_PACKAGINGT, D_PRICE_PPACK,hfc_cd,discipline_cd,subdiscipline_cd) "
                + " SELECT UD_MDC_CODE, UD_ATC_CODE, D_TRADE_NAME, D_GNR_NAME, D_ROUTE_CODE, D_FORM_CODE, D_STRENGTH, D_ADVISORY_CODE, D_STOCK_QTY, D_QTY, D_QTYT, "
                + " D_DURATION, D_DURATIONT, D_FREQUENCY, D_CAUTION_CODE, D_EXP_DATE, D_CLASSIFICATION, STATUS, D_LOCATION_CODE, D_SELL_PRICE, D_COST_PRICE, D_PACKAGING, "
                + " D_PACKAGINGT, D_PRICE_PPACK, '" + hfc + "','" + dis + "', '" + sub + "' "
                + " FROM pis_mdc2 WHERE UD_MDC_CODE = '" + drugs[i] + "' AND hfc_cd = '" + superUserHFC + "' AND discipline_cd = '" + superUserDIS + "' ";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>

