<%-- 
    Document   : receiveSpecimenAccept
    Created on : Jan 16, 2018, 12:26:14 AM
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
    // Date Format
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    DateTimeFormatter formatCDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTimeFormatter formatCTime = DateTimeFormatter.ofPattern("HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    // Gettting Date And Session Variable
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);

    // RMI AND CONN
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    int falseCount = 0;

    // PARAMATER
    String stringMaster = request.getParameter("stringMaster");
    String stringDetail = request.getParameter("stringDetail");

    String stockMasterD[] = stringMaster.split("\\|");

    String customer_id = stockMasterD[0];
    String txt_date = stockMasterD[1];
    String specimen_no = stockMasterD[2];
    String order_no = stockMasterD[3];
    String order_date = stockMasterD[4];
    String episode_date = stockMasterD[5];
    String encounter_date = stockMasterD[6];

    //
    //
    //
    //
    //
    // String String Detail Part Start //
    // Get The Data And Split
    String stockDetailD[] = stringDetail.split("\\|");
    String collectionDate = formatCDate.format(now);
    String collectionTime = formatCTime.format(now);
    String status = "Rejected";

    for (int i = 0; i < stockDetailD.length; i++) {

        String smallData = stockDetailD[i];
        String detailsStockS[] = smallData.split("\\^");

        String item_cdD = detailsStockS[0];
        String item_nameD = detailsStockS[1];

        // Specimen Detail Table Part Start //
        // Process Detail Specimen Start
        boolean isInsertSpecimenDetail = true;

        // Insert Master Distribute
        String sqlInsertSpecimenDetail = "UPDATE lis_specimen_detail "
                + " SET specimen_status = 'Approved' , approval = 'Waiting For Test Result' "
                + " WHERE specimen_no = '" + specimen_no + "' AND item_cd = '" + item_cdD + "' ";

        isInsertSpecimenDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertSpecimenDetail);

        if (isInsertSpecimenDetail == false) {

            falseCount = falseCount + 1;

        }

        //
        //
        //
        // Order Detail Table Part Start //
        // Update Order Detail Table
        boolean isUpdateOrderDetail = true;

        String sqlUpdateOrderDetail = "UPDATE lis_order_detail "
                + " SET Verification = 'Waiting For Test Result' , detail_status = '2' "
                + " WHERE order_no = '" + order_no + "' AND item_cd = '" + item_cdD + "' ";

        isUpdateOrderDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderDetail);

        if (isUpdateOrderDetail == false) {

            falseCount = falseCount + 1;

        }

        // Order Detail Table Part End //
    }
    //
    //
    //
    //
    // Specimen Master Table Part Start //
    // Update Master Specimen
    String sqlCheckMasterSpecimenData = "SELECT * FROM lis_specimen_detail  "
            + " WHERE specimen_no = '" + specimen_no + "' AND (specimen_status = 'Newly Assigned Specimen')";
    ArrayList<ArrayList<String>> getSpecimenSummary = conn.getData(sqlCheckMasterSpecimenData);

    if (getSpecimenSummary.size() == 0) {

        boolean isUpdateSpecimenMasterData = true;

        String sqlUpdateSpecimenMasterPartialData = "UPDATE lis_specimen_master "
                + " SET order_status = '3' "
                + " WHERE specimen_no = '" + specimen_no + "' ";

        isUpdateSpecimenMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateSpecimenMasterPartialData);

        if (isUpdateSpecimenMasterData == false) {

            falseCount = falseCount + 1;

        }

    } else {

    }
    // Update Master Specimen
    // Order Specimen Table Part End //
    //
    //
    //
    // Order Master Table Part Start //
    // Update Master Order
    String sqlCheckMasterData = "SELECT * FROM lis_order_detail  "
            + " WHERE order_no = '" + order_no + "' AND (detail_status = '0' OR detail_status = '1')";
    ArrayList<ArrayList<String>> getOrderSummary = conn.getData(sqlCheckMasterData);

    if (getOrderSummary.size() == 0) {

        boolean isUpdateOrderMasterData = true;

        String sqlUpdateOrderMasterPartialData = "UPDATE lis_order_master "
                + " SET order_status = '2' , billing_status = '0'  "
                + " WHERE order_no = '" + order_no + "' ";

        isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

        if (isUpdateOrderMasterData == false) {

            falseCount = falseCount + 1;

        }

    } else {

    }
    // Update Master Order
    // Order Master Table Part End //
    //
    //
    if (falseCount == 0) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>