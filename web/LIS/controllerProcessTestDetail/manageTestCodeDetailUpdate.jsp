<%-- 
    Document   : manageTestCodeDetailUpdate
    Created on : Jan 12, 2018, 11:31:24 PM
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
    String cateCode = request.getParameter("cateCode");
    String detailCode = request.getParameter("detailCode");
    String detailName = request.getParameter("detailName");
    String detailSpeSource = request.getParameter("detailSpeSource");
    String detailSpeContainer = request.getParameter("detailSpeContainer");
    String detailVolume = request.getParameter("detailVolume");
    String detailSpeInst = request.getParameter("detailSpeInst");
    String detailBuyPrice = request.getParameter("detailBuyPrice");
    String detailSellPrice = request.getParameter("detailSellPrice");
    String detailStatus = request.getParameter("detailStatus");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE lis_item_detail SET item_name = '" + detailName + "',spe_source = '" + detailSpeSource + "',spe_container = '" + detailSpeContainer + "', "
            + " volume = '" + detailVolume + "',special_inst = '" + detailSpeInst + "',buy_price = '" + detailBuyPrice + "',ser_price = '" + detailSellPrice + "',status = '" + detailStatus + "' "
            + " WHERE test_cat = '" + cateCode + "' AND item_cd = '" + detailCode + "'  AND hfc_cd  = '" + hfc + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>