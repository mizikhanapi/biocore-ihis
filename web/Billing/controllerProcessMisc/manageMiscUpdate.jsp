<%-- 
    Document   : manageMiscUpdate
    Created on : Nov 29, 2017, 12:58:40 PM
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

    String miscCode = request.getParameter("miscCode");
    String miscName = request.getParameter("miscName");
    String miscBuyPrice = request.getParameter("miscBuyPrice");
    String miscSellPrice = request.getParameter("miscSellPrice");
    String miscStatus = request.getParameter("miscStatus");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE far_miscellaneous_item SET item_desc = '" + miscName + "',buying_price = '" + miscBuyPrice + "',selling_price = '" + miscSellPrice + "',status = '" + miscStatus + "' "
            + " WHERE item_code = '" + miscCode + "' AND hfc_cd  = '" + hfc + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>