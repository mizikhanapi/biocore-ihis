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
    Pattern regex = Pattern.compile("[$&+,:;'=?@#|]");
    Matcher matcher;

    for (int i = 0; i < drugs.length; i++) {

        sqlInsert = "INSERT INTO pis_mdc2 (UD_MDC_CODE, UD_ATC_CODE, D_TRADE_NAME, D_GNR_NAME, D_ROUTE_CODE, D_FORM_CODE, D_STRENGTH, D_ADVISORY_CODE, D_STOCK_QTY, D_QTY, "
                + " D_QTYT,D_DURATION,D_DURATIONT, D_FREQUENCY, D_CAUTION_CODE, D_EXP_DATE, D_CLASSIFICATION, STATUS, D_LOCATION_CODE, D_SELL_PRICE, D_COST_PRICE, "
                + " D_PACKAGING,D_PACKAGINGT, D_PRICE_PPACK,hfc_cd,discipline_cd,subdiscipline_cd) "
                + " SELECT UD_MDC_CODE, UD_ATC_CODE, D_TRADE_NAME, D_GNR_NAME, D_ROUTE_CODE, D_FORM_CODE, D_STRENGTH, D_ADVISORY_CODE, D_STOCK_QTY, D_QTY, D_QTYT, "
                + " D_DURATION, D_DURATIONT, D_FREQUENCY, D_CAUTION_CODE, D_EXP_DATE, D_CLASSIFICATION, STATUS, D_LOCATION_CODE, D_SELL_PRICE, D_COST_PRICE, D_PACKAGING, "
                + " D_PACKAGINGT, D_PRICE_PPACK, '"+hfc+"','"+dis+"', '"+sub+"' "
                + " FROM pis_mdc2 WHERE UD_MDC_CODE = '" + drugs[i] + "' AND hfc_cd = '" + superUserHFC + "' AND discipline_cd = '" + superUserDIS + "' ";

//        //                              1           2               3           4           5           6               7           8               9       10         11
//        String sqlSelect = "SELECT UD_MDC_CODE, UD_ATC_CODE, D_TRADE_NAME, D_GNR_NAME, D_ROUTE_CODE, D_FORM_CODE, D_STRENGTH, D_ADVISORY_CODE, D_STOCK_QTY, D_QTY, D_QTYT, "
//                //       12          13          14              15          16              17             18           19              20          21          22
//                + " D_DURATION, D_DURATIONT, D_FREQUENCY, D_CAUTION_CODE, D_EXP_DATE, D_CLASSIFICATION, STATUS, D_LOCATION_CODE, D_SELL_PRICE, D_COST_PRICE, D_PACKAGING, "
//                //        23              24
//                + " D_PACKAGINGT, D_PRICE_PPACK FROM pis_mdc2 WHERE UD_MDC_CODE = '" + drugs[i] + "' AND hfc_cd = '" + superUserHFC + "' AND discipline_cd = '" + superUserDIS + "' ";
//
//        ArrayList<ArrayList<String>> dataMDCSUPERHFC = conn.getData(sqlSelect);
//
//        int size = dataMDCSUPERHFC.size();
//        for (int s = 0; s < size; s++) {
//
//            UD_MDC_CODE = dataMDCSUPERHFC.get(s).get(0).toString();
//            UD_ATC_CODE = dataMDCSUPERHFC.get(s).get(1).toString();
//            D_TRADE_NAME = dataMDCSUPERHFC.get(s).get(2).toString();
//            D_GNR_NAME = dataMDCSUPERHFC.get(s).get(3).toString();
//            D_ROUTE_CODE = dataMDCSUPERHFC.get(s).get(4).toString();
//            D_FORM_CODE = dataMDCSUPERHFC.get(s).get(5).toString();
//            D_STRENGTH = dataMDCSUPERHFC.get(s).get(6).toString();
//            D_ADVISORY_CODE = dataMDCSUPERHFC.get(s).get(7).toString();
//            D_STOCK_QTY = dataMDCSUPERHFC.get(s).get(8).toString();
//            D_QTY = dataMDCSUPERHFC.get(s).get(9).toString();
//            D_QTYT = dataMDCSUPERHFC.get(s).get(10).toString();
//            D_DURATION = dataMDCSUPERHFC.get(s).get(11).toString();
//            D_DURATIONT = dataMDCSUPERHFC.get(s).get(12).toString();
//            D_FREQUENCY = dataMDCSUPERHFC.get(s).get(13).toString();
//            D_CAUTION_CODE = dataMDCSUPERHFC.get(s).get(14).toString();
//            D_EXP_DATE = dataMDCSUPERHFC.get(s).get(15).toString();
//            D_CLASSIFICATION = dataMDCSUPERHFC.get(s).get(16).toString();
//            STATUS = dataMDCSUPERHFC.get(s).get(17).toString();
//            D_LOCATION_CODE = dataMDCSUPERHFC.get(s).get(18).toString();
//            D_SELL_PRICE = dataMDCSUPERHFC.get(s).get(19).toString();
//            D_COST_PRICE = dataMDCSUPERHFC.get(s).get(20).toString();
//            D_PACKAGING = dataMDCSUPERHFC.get(s).get(21).toString();
//            D_PACKAGINGT = dataMDCSUPERHFC.get(s).get(22).toString();
//            D_PRICE_PPACK = dataMDCSUPERHFC.get(s).get(23).toString();
//
//            matcher = regex.matcher(D_CAUTION_CODE);
//
//            if (matcher.find()) {
//                // Do something
//                String segments[] = D_CAUTION_CODE.split("'");
//                D_CAUTION_CODE = "";
//
//                for (int b = 0; b < segments.length; b++) {
//                    D_CAUTION_CODE = D_CAUTION_CODE + segments[b];
//                }
//
//            }
//
//        }
//
//        sqlInsert = "INSERT INTO pis_mdc2 (UD_MDC_CODE, UD_ATC_CODE, D_TRADE_NAME, D_GNR_NAME, D_ROUTE_CODE, D_FORM_CODE, D_STRENGTH, D_ADVISORY_CODE, D_STOCK_QTY, D_QTY, D_QTYT,D_DURATION, "
//                + " D_DURATIONT, D_FREQUENCY, D_CAUTION_CODE, D_EXP_DATE, D_CLASSIFICATION, STATUS, D_LOCATION_CODE, D_SELL_PRICE, D_COST_PRICE, D_PACKAGING,D_PACKAGINGT, D_PRICE_PPACK,hfc_cd,discipline_cd,subdiscipline_cd)"
//                + " VALUES ('" + UD_MDC_CODE + "','" + UD_ATC_CODE + "','" + D_TRADE_NAME + "','" + D_GNR_NAME + "','" + D_ROUTE_CODE + "','" + D_FORM_CODE + "','" + D_STRENGTH + "',"
//                + " '" + D_ADVISORY_CODE + "','" + D_STOCK_QTY + "','" + D_QTY + "','" + D_QTYT + "','" + D_DURATION + "','" + D_DURATIONT + "','" + D_FREQUENCY + "','" + D_CAUTION_CODE + "',"
//                + " '" + D_EXP_DATE + "','" + D_CLASSIFICATION + "','" + STATUS + "','" + D_LOCATION_CODE + "','" + D_SELL_PRICE + "','" + D_COST_PRICE + "','" + D_PACKAGING + "','" + D_PACKAGINGT + "',"
//                + " '" + D_PRICE_PPACK + "','" + hfc + "','" + dis + "','" + sub + "' );";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>

