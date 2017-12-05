<%-- 
    Document   : manageMiscInsert
    Created on : Nov 29, 2017, 12:58:29 PM
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

    String miscCode = request.getParameter("miscCode");
    String miscName = request.getParameter("miscName");
    String miscBuyPrice = request.getParameter("miscBuyPrice");
    String miscSellPrice = request.getParameter("miscSellPrice");
    String miscStatus = request.getParameter("miscStatus");
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlCheck = "SELECT item_code from far_miscellaneous_item WHERE item_code = '" + miscCode + "' AND hfc_cd  = '" + hfc + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO far_miscellaneous_item (item_code, hfc_cd, item_desc, buying_price, selling_price, discount,"
                + " status, created_by, created_date)"
                + " VALUES ('" + miscCode + "','" + hfc + "','" + miscName + "','" + miscBuyPrice + "',"
                + "'" + miscSellPrice + "','0','" + miscStatus + "','" + created_by + "','" + created_date + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

%>