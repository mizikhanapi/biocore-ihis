<%-- 
    Document   : assignSpecimenOrderAssign
    Created on : Jan 15, 2018, 4:23:14 PM
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
    String seqNo = request.getParameter("seqNo");
    String stringMaster = request.getParameter("stringMaster");
    String stringDetail = request.getParameter("stringDetail");

    String stockMasterD[] = stringMaster.split("\\|");

    String customer_id = stockMasterD[0];
    String txt_date = stockMasterD[1];
    String order_no = stockMasterD[2];
    String order_date = stockMasterD[3];
    String episode_date = stockMasterD[4];
    String encounter_date = stockMasterD[4];

    // Specimen Master Table Part Start //
    // Process Master Specimen Start
    boolean isInsertSpecimenMaster = true;

    // Insert Master Distribute
    String sqlInsertSpecimenMaster = "INSERT INTO lis_specimen_master "
            + " (pmi_no, txt_date, hfc_cd, order_no, specimen_no, episode_date, encounter_date, "
            + " order_date, order_by, hfc_from, hfc_to, discipline_from, discipline_to, "
            + " subdiscipline_from, subdiscipline_to, order_status, created_by,created_date) "
            + " VALUES ('" + customer_id + "','" + txt_date + "','" + hfc + "','" + order_no + "','" + seqNo + "', "
            + " '" + episode_date + "','" + encounter_date + "','" + order_date + "','" + created_by + "', "
            + " '" + hfc + "','" + hfc + "','" + dis + "','" + dis + "','" + sub + "','" + sub + "', "
            + " '0','" + created_by + "','" + created_date + "' ) ";

    isInsertSpecimenMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertSpecimenMaster);

    if (isInsertSpecimenMaster == false) {

        falseCount = falseCount + 1;

    }

    // Process Master Specimen End
    // Specimen Master Table Part End //
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
    String status = "Waiting For Approval";

    for (int i = 0; i < stockDetailD.length; i++) {

        String smallData = stockDetailD[i];
        String detailsStockS[] = smallData.split("\\^");

        String item_cdD = detailsStockS[0];
        String item_nameD = detailsStockS[1];
        String item_commentD = detailsStockS[2];
        String ordered_statusD = detailsStockS[3];

        // Release Master Table Part Start //
        // Process Master Release Start
        boolean isInsertSpecimenDetail = true;

        // Insert Master Distribute
        String sqlInsertSpecimenDetail = "INSERT INTO lis_specimen_detail "
                + " (txt_date, specimen_no, item_cd, collection_date, collection_time, comment, specimen_status, approval) "
                + " VALUES ('" + txt_date + "','" + seqNo + "','" + item_cdD + "','" + collectionDate + "','" + collectionTime + "',"
                + " '" + item_commentD + "', 'Newly Assigned Specimen', 'Test Is Not Performed Yet' )";

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
                + " SET Verification = 'Wait for Specimen Verification' , detail_status='1'  "
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
                + " SET order_status = '1' , billing_status = '0' "
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