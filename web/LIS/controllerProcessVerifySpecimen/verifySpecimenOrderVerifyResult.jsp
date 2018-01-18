<%-- 
    Document   : verifySpecimenOrderVerifyResult
    Created on : Jan 16, 2018, 5:30:46 AM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    DateTimeFormatter formatCDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTimeFormatter formatCTime = DateTimeFormatter.ofPattern("HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String collectionDate = formatCDate.format(now);
    String collectionTime = formatCTime.format(now);

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    int falseCount = 0;

    String result_no = request.getParameter("result_no");
    String specimen_no = request.getParameter("specimen_no");
    String order_no = request.getParameter("order_no");
    String item_cd = request.getParameter("item_cd");
    String item_name = request.getParameter("item_name");
    String status = request.getParameter("status");
    //
    //
    //
    //
    //
    // Update Result Part Start //
    String sqlUpdateResult = "UPDATE lis_result "
            + " SET verification = '" + status + "' "
            + " WHERE result_no = '" + result_no + "' ";

    boolean isUpdateResult = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateResult);

    if (isUpdateResult == false) {

        falseCount = falseCount + 1;

    }
    // Update Result Part End //
    //
    //
    //
    //
    //
    // Update Specimen Detail Part Start //
    String sqlUpdateSpecimenDetail = "UPDATE lis_specimen_detail "
            + " SET approval = '" + status + "' "
            + " WHERE specimen_no = '" + specimen_no + "' AND item_cd = '" + item_cd + "'  ";

    boolean isUpdateSpecimenDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateSpecimenDetail);

    if (isUpdateSpecimenDetail == false) {

        falseCount = falseCount + 1;

    }
    // Update Specimen Detail Part End //
    //
    //
    //
    //
    //
    //
    // Specimen Master Table Part Start //
    String sqlCheckMasterSpecimenData = "SELECT * FROM lis_specimen_detail  "
            + " WHERE specimen_no = '" + specimen_no + "' AND (specimen_status = 'Newly Assigned Specimen')";
    ArrayList<ArrayList<String>> getSpecimenSummary = conn.getData(sqlCheckMasterSpecimenData);

    if (getSpecimenSummary.size() == 0) {

        boolean isUpdateSpecimenMasterData = true;

        String sqlUpdateSpecimenMasterPartialData = "UPDATE lis_specimen_master "
                + " SET order_status = '4' "
                + " WHERE specimen_no = '" + specimen_no + "' ";

        isUpdateSpecimenMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateSpecimenMasterPartialData);

        if (isUpdateSpecimenMasterData == false) {

            falseCount = falseCount + 1;

        }

    } else {

    }
    // Specimen Master Table Part End //
    //
    //
    //
    // Order Master Table Part Start //
    String sqlCheckMasterData = "SELECT * FROM lis_order_detail  "
            + " WHERE order_no = '" + order_no + "' AND (detail_status = '0' OR detail_status = '1')";
    ArrayList<ArrayList<String>> getOrderSummary = conn.getData(sqlCheckMasterData);

    if (getOrderSummary.size() == 0) {

        boolean isUpdateOrderMasterData = true;

        String sqlUpdateOrderMasterPartialData = "UPDATE lis_order_master "
                + " SET order_status = '3' "
                + " WHERE order_no = '" + order_no + "' ";

        isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

        if (isUpdateOrderMasterData == false) {

            falseCount = falseCount + 1;

        }

    } else {

    }
    // Order Master Table Part End //
    //
    //

    if (falseCount == 0) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>