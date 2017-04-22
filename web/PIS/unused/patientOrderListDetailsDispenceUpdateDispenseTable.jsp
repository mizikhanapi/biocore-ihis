<%-- 
    Document   : patientOrderListDetailsDispenceUpdateDispenseTable
    Created on : Feb 23, 2017, 8:09:03 AM
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

    String ORDER_NO = request.getParameter("orderNo"); // Data 1
    String DRUG_ITEM_CODE = request.getParameter("drugCode"); // Data 2
    String D_SELL_PRICE = request.getParameter("drugPrice"); // Data 3
    String D_STOCK_QTY = request.getParameter("drugStockQty"); // Data 4
    String QTY_ORDERED = request.getParameter("drugOrderedQty"); // Data 5
    String QTY_SUPPLIED = request.getParameter("drugSuppliedQty"); // Data 6
    String QTY_DISPENSED = request.getParameter("drugDispensedQty"); // Data 7
    String ORDER_STATUS = request.getParameter("drugStatus"); // Data 8
    String ORDER_DATE = request.getParameter("orderDate"); // Data 9
    String LOCATION_CODE = request.getParameter("locationCode"); // Data 10
    String ARRIVAL_DATE = request.getParameter("arrivalDate"); // Data 11
    String DISPENSED_DATE = format.format(now); // Data 12
    String DISPENSED_BY = (String) session.getAttribute("USER_ID"); // Data 13
    String FILLED_BY = (String) session.getAttribute("USER_ID"); // Data 14
    String SCREENED_BY = (String) session.getAttribute("USER_ID"); // Data 15
    String ASSIGNED_BY = (String) session.getAttribute("USER_ID"); // Data 16
    String DISPENSED_UOM = "-";
    int STATUS = 1;

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    // Check For Username
    if (DISPENSED_BY == null || FILLED_BY == null || SCREENED_BY == null || ASSIGNED_BY == null) {

        out.print("User Not Exist");

    } else {

        // Check Master Data
        String sqlFetchMasterData = "SELECT * FROM pis_dispense_master WHERE ORDER_NO = '" + ORDER_NO + "' ";
        ArrayList<ArrayList<String>> checkDispenseMaster = conn.getData(sqlFetchMasterData);

        // No Master Data
        if (checkDispenseMaster.size() == 0) {

            // Insert Master 
            String sqlInsertMaster = "INSERT INTO pis_dispense_master (ORDER_NO, ORDER_DATE, LOCATION_CODE, ARRIVAL_DATE, DISPENSED_DATE, DISPENSED_BY, FILLED_BY, SCREENED_BY, ASSIGNED_BY,STATUS) "
                    + " VALUES ('" + ORDER_NO + "','" + ORDER_DATE + "','" + LOCATION_CODE + "','" + ARRIVAL_DATE + "','" + DISPENSED_DATE + "','" + DISPENSED_BY + "','" + FILLED_BY + "','" + SCREENED_BY + "','" + ASSIGNED_BY + "'," + STATUS + " )";

            
            boolean isInsertMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertMaster);
            

            if (isInsertMaster == true) {
                out.print("Master Dispense Insert Ok");
            } else {
                out.print("Master Dispense Insert Not Ok");
            }

        } else {

            out.print("Master Ok");

        }

        String sqlFetchDetailsData = "SELECT ORDER_NO,DRUG_ITEM_CODE FROM pis_dispense_detail WHERE ORDER_NO = '" + ORDER_NO + "' AND DRUG_ITEM_CODE = '" + DRUG_ITEM_CODE + "' ";
        ArrayList<ArrayList<String>> checkDispenseDetails = conn.getData(sqlFetchDetailsData);

        if (checkDispenseDetails.size() == 0) {

            String sqlInsertDetail = "INSERT INTO pis_dispense_detail (ORDER_NO, DRUG_ITEM_CODE, DISPENSED_QTY, DISPENSED_UOM,STATUS) "
                    + " VALUES ('" + ORDER_NO + "','" + DRUG_ITEM_CODE + "','" + QTY_SUPPLIED + "','" + DISPENSED_UOM + "'," + STATUS + " )";
            

            boolean isInsertDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDetail);

            if (isInsertDetail == true) {
                out.print("Detail Dispense Insert Ok");
            } else {
                out.print("Detail Dispense Insert Not Ok");
            }

        } else {
            
            String sqlUpdateDispenseDetails = "UPDATE pis_dispense_detail SET DISPENSED_QTY = '" + QTY_SUPPLIED + "' "
                    + "WHERE ORDER_NO = '" + ORDER_NO + "' AND DRUG_ITEM_CODE = '" + DRUG_ITEM_CODE + "' ";
            
            
            boolean isUpdateDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDispenseDetails);
            
            if (isUpdateDetail == true) {
                out.print("Detail Dispense Update Ok");
            } else {
                out.print("Detail Dispense Update Not Ok");
            }
        }

    }


%>