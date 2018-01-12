<%-- 
    Document   : manageTestCodeDetailCloneDrugListInsert
    Created on : Jan 13, 2018, 12:23:00 AM
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

    String code = request.getParameter("code");

    String strTESTDETAILSClone = request.getParameter("strTESTDETAILSClone");

    String cates[] = strTESTDETAILSClone.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isInsert = false;

    for (int i = 0; i < cates.length; i++) {

        sqlInsert = "INSERT INTO lis_item_detail (item_cd, hfc_cd, test_cat, item_name, spe_source, spe_container, volume, special_inst, status,"
                + " buy_price, ser_price, discipline_cd, subdiscipline_cd, created_by, created_date) "
                + " SELECT item_cd, '" + hfc + "', test_cat, item_name, spe_source, spe_container, volume, special_inst, status, buy_price, "
                + " ser_price, '" + dis + "', '" + sub + "','" + created_by + "', '" + created_date + "' "
                + " FROM lis_item_detail WHERE item_cd = '" + cates[i] + "' AND hfc_cd = '" + superUserHFC + "' AND test_cat = '" + code + "' ";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>