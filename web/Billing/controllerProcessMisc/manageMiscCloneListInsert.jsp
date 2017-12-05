<%-- 
    Document   : manageMiscCloneListInsert
    Created on : Nov 29, 2017, 12:57:16 PM
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

    String strMISCClone = request.getParameter("strMISCClone");

    String cates[] = strMISCClone.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isInsert = false;

    for (int i = 0; i < cates.length; i++) {

        sqlInsert = "INSERT INTO far_miscellaneous_item (item_code, hfc_cd, item_desc, buying_price, selling_price,"
                + " discount, status, created_by, created_date) "
                + " SELECT item_code, '" + hfc + "',item_desc, buying_price, selling_price, discount, status, '" + created_by + "', '" + created_date + "' "
                + " FROM far_miscellaneous_item WHERE item_code = '" + cates[i] + "' AND hfc_cd = '" + superUserHFC + "' ";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>