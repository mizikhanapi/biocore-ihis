<%-- 
    Document   : manageTestCodeDetailInsert
    Created on : Jan 12, 2018, 6:35:19 PM
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
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlCheck = "SELECT item_cd from lis_item_detail WHERE item_cd = '" + detailCode + "' AND test_cat  = '" + cateCode + "' AND hfc_cd  = '" + hfc + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO lis_item_detail (item_cd, hfc_cd, test_cat, item_name, spe_source, spe_container, volume, special_inst, status, "
                + " buy_price, ser_price, discipline_cd, subdiscipline_cd, created_by, created_date)"
                + " VALUES ('" + detailCode + "','" + hfc + "','" + cateCode + "','" + detailName + "','" + detailSpeSource + "','" + detailSpeContainer + "',"
                + "'" + detailVolume + "','" + detailSpeInst + "','" + detailStatus + "','" + detailBuyPrice + "','" + detailSellPrice + "',"
                + " '" + dis + "','" + sub + "','" + created_by + "','" + created_date + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

%>