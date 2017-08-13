<%-- 
    Document   : mdcUpdate
    Created on : Jan 31, 2017, 11:07:39 AM
    Author     : Shammugam
--%>

<%@page import="Formatter.DateFormatter"%>
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
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String UD_MDC_CODE = request.getParameter("UD_MDC_CODE");
    String UD_ATC_CODE = request.getParameter("UD_ATC_CODE");
    String D_TRADE_NAME = request.getParameter("D_TRADE_NAME");
    String D_GNR_NAME = request.getParameter("D_GNR_NAME");
    String D_ROUTE_CODE = request.getParameter("D_ROUTE_CODE");
    String D_FORM_CODE = request.getParameter("D_FORM_CODE");
    String D_STRENGTH = request.getParameter("D_STRENGTH");
    String D_STOCK_QTY = request.getParameter("D_STOCK_QTY");
    String D_MINIMUM_QTY = request.getParameter("D_MINIMUM_QTY");
    String D_MAXIMUM_QTY = request.getParameter("D_MAXIMUM_QTY");
    String D_REORDER_QTY = request.getParameter("D_REORDER_QTY");
    String D_LOCATION_CODE = request.getParameter("D_LOCATION_CODE");
    String STATUS = request.getParameter("STATUS");

    String D_PACKAGING = request.getParameter("D_PACKAGING");
    String D_PACKAGINGT = request.getParameter("D_PACKAGINGT");
    String D_PRICE_PPACK = request.getParameter("D_PRICE_PPACK");
    String D_COST_PRICE = request.getParameter("D_COST_PRICE");
    String D_SELL_PRICE = request.getParameter("D_SELL_PRICE");
    String D_QTY = request.getParameter("D_QTY");
    String D_QTYT = request.getParameter("D_QTYT");
    String D_FREQUENCY = request.getParameter("D_FREQUENCY");
    String D_DURATION = request.getParameter("D_DURATION");
    String D_DURATIONT = request.getParameter("D_DURATIONT");
    String D_ADVISORY_CODE = request.getParameter("D_ADVISORY_CODE");
    String D_CAUTIONARY_CODE = request.getParameter("D_CAUTIONARY_CODE");
    String D_EXP_DATE = request.getParameter("D_EXP_DATE");
    String D_CLASSIFICATION = request.getParameter("D_CLASSIFICATION");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE pis_mdc2 SET d_trade_name = '" + D_TRADE_NAME + "',d_gnr_name = '" + D_GNR_NAME + "',d_route_code = '" + D_ROUTE_CODE + "',"
            + " d_form_code = '" + D_FORM_CODE + "',d_strength = '" + D_STRENGTH + "',d_advisory_code = '" + D_ADVISORY_CODE + "',d_stock_qty = '" + D_STOCK_QTY + "', "
            + " d_minimum_stock_level = '" + D_MINIMUM_QTY + "',d_maximum_stock_level = '" + D_MAXIMUM_QTY + "',d_reorder_stock_level = '" + D_REORDER_QTY + "',"
            + " d_qty = '" + D_QTY + "',d_qtyt = '" + D_QTYT + "',d_duration = '" + D_DURATION + "',d_durationt = '" + D_DURATIONT + "',d_frequency = '" + D_FREQUENCY + "',"
            + " d_caution_code = '" + D_CAUTIONARY_CODE + "',d_exp_date = '" + D_EXP_DATE + "',d_classification = '" + D_CLASSIFICATION + "',status = '" + STATUS + "',"
            + " d_location_code = '" + D_LOCATION_CODE + "',d_sell_price = '" + D_SELL_PRICE + "',d_cost_price = '" + D_COST_PRICE + "',"
            + " d_packaging = '" + D_PACKAGING + "',d_packagingt = '" + D_PACKAGINGT + "',d_price_ppack = '" + D_PRICE_PPACK + "'"
            + " WHERE UD_MDC_CODE = '" + UD_MDC_CODE + "' AND hfc_cd  = '" + hfc + "' AND discipline_cd  = '" + dis + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>