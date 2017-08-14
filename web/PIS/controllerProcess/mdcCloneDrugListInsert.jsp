<%-- 
    Document   : mdcCloneDrugListInsert
    Created on : Apr 26, 2017, 9:41:31 PM
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
    String superUserDIS = "BIT1010";
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String created_by = session.getAttribute("USER_ID").toString();

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    String created_date = format.format(now);

    String sqlInsert = "";

    String strMDCClone = request.getParameter("strMDCClone");

    String drugs[] = strMDCClone.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isInsert = false;

    for (int i = 0; i < drugs.length; i++) {

        sqlInsert = "INSERT INTO pis_mdc2 (ud_mdc_code,ud_atc_code,d_trade_name,d_gnr_name,d_route_code,d_form_code,d_strength,d_advisory_code,d_stock_qty, "
                + " d_minimum_stock_level,d_maximum_stock_level,d_reorder_stock_level,d_qty,d_qtyt,d_duration,d_durationt,d_frequency,d_caution_code,d_exp_date, "
                + " d_classification,status,d_location_code,d_sell_price,d_cost_price,d_packaging,d_packagingt,d_price_ppack,hfc_cd,discipline_cd, "
                + " subdiscipline_cd,created_by,created_date) "
                + " SELECT ud_mdc_code,ud_atc_code,d_trade_name,d_gnr_name,d_route_code,d_form_code,d_strength,d_advisory_code,d_stock_qty, "
                + " d_minimum_stock_level,d_maximum_stock_level,d_reorder_stock_level,d_qty,d_qtyt,d_duration,d_durationt,d_frequency,d_caution_code,d_exp_date, "
                + " d_classification,status,d_location_code,d_sell_price,d_cost_price,d_packaging,d_packagingt,d_price_ppack,"
                + " '" + hfc + "','" + dis + "', '" + sub + "','" + created_by + "', '" + created_date + "' "
                + " FROM pis_mdc2 WHERE UD_MDC_CODE = '" + drugs[i] + "' AND hfc_cd = '" + superUserHFC + "' ";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>

