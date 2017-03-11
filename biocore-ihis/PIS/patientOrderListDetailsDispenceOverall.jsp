<%-- 
    Document   : patientOrderListDetailsDispenceOverall
    Created on : Feb 27, 2017, 10:14:54 PM
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

    QTY_DISPENSED = "0";

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    // Check For Username
    if (DISPENSED_BY == null || FILLED_BY == null || SCREENED_BY == null || ASSIGNED_BY == null) {

        out.print("User Not Exist");

    } else {

        // Dispense Table Part Start //
        
        // Check Master Data Dispense
        String sqlFetchMasterDispenseData = "SELECT * FROM pis_dispense_master WHERE ORDER_NO = '" + ORDER_NO + "' ";
        ArrayList<ArrayList<String>> checkDispenseMaster = conn.getData(sqlFetchMasterDispenseData);

        // No Master Data
        if (checkDispenseMaster.size() == 0) {

            // Insert Master Dispense
            String sqlInsertDispenseMaster = "INSERT INTO pis_dispense_master (ORDER_NO, ORDER_DATE, LOCATION_CODE, ARRIVAL_DATE, DISPENSED_DATE, DISPENSED_BY, FILLED_BY, SCREENED_BY, ASSIGNED_BY,STATUS) "
                    + " VALUES ('" + ORDER_NO + "','" + ORDER_DATE + "','" + LOCATION_CODE + "','" + ARRIVAL_DATE + "','" + DISPENSED_DATE + "','" + DISPENSED_BY + "','" + FILLED_BY + "','" + SCREENED_BY + "','" + ASSIGNED_BY + "'," + STATUS + " )";

            boolean isInsertDispenseMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDispenseMaster);

            if (isInsertDispenseMaster == true) {
                out.print("Master Dispense Insert Ok ");
            } else {
                out.print("Master Dispense Insert Not Ok ");
            }

        } else {

            out.print("Master Ok");

        }

        // Check Details Data Dispense
        String sqlFetchDetailsDispenseData = "SELECT ORDER_NO,DRUG_ITEM_CODE FROM pis_dispense_detail WHERE ORDER_NO = '" + ORDER_NO + "' AND DRUG_ITEM_CODE = '" + DRUG_ITEM_CODE + "' ";
        ArrayList<ArrayList<String>> checkDispenseDetails = conn.getData(sqlFetchDetailsDispenseData);

        if (checkDispenseDetails.size() == 0) {

            // Insert Details Dispense 
            String sqlInsertDispenseDetail = "INSERT INTO pis_dispense_detail (ORDER_NO, DRUG_ITEM_CODE, DISPENSED_QTY, DISPENSED_UOM,STATUS) "
                    + " VALUES ('" + ORDER_NO + "','" + DRUG_ITEM_CODE + "','" + QTY_SUPPLIED + "','" + DISPENSED_UOM + "'," + STATUS + " )";

            boolean isInsertDispenseDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDispenseDetail);

            if (isInsertDispenseDetail == true) {
                out.print("Detail Dispense Insert Ok ");
            } else {
                out.print("Detail Dispense Insert Not Ok ");
            }

        } else {

            // Update Details Dispense
            String sqlUpdateDispenseDetails = "UPDATE pis_dispense_detail SET DISPENSED_QTY = '" + QTY_SUPPLIED + "' "
                    + "WHERE ORDER_NO = '" + ORDER_NO + "' AND DRUG_ITEM_CODE = '" + DRUG_ITEM_CODE + "' ";

            boolean isUpdateDispenseDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDispenseDetails);

            if (isUpdateDispenseDetail == true) {
                out.print("Detail Dispense Update Ok ");
            } else {
                out.print("Detail Dispense Update Not Ok ");
            }
        }

        // Dispense Table Part End //
        //
        //
        //
        //
        //
        // Order Table Part Start //
        // Update Master Order
        String sqlUpdateOrderDetailsData = "UPDATE pis_order_detail SET QTY_SUPPLIED = '" + QTY_SUPPLIED + "',QTY_DISPENSED = '" + QTY_DISPENSED + "',"
                + "ORDER_STATUS = '" + ORDER_STATUS + "' WHERE ORDER_NO = '" + ORDER_NO + "' AND DRUG_ITEM_CODE = '" + DRUG_ITEM_CODE + "' ";
        boolean isUpdateOrderDetailsData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderDetailsData);

        if (isUpdateOrderDetailsData == true) {

            // Update Master Order Total
            String sqlCheckTotalOrder = "SELECT ORDER_NO,DRUG_ITEM_CODE FROM pis_order_detail WHERE ORDER_NO = '" + ORDER_NO + "' AND (ORDER_STATUS = '0' OR ORDER_STATUS = '1')";
            ArrayList<ArrayList<String>> totalOrder = conn.getData(sqlCheckTotalOrder);

            String totalOrderForOrderNo = String.valueOf(totalOrder.size());

            if (totalOrder.size() == 0) {

                String masterStatus = "1";

                // Update Master Order Total Full
                String sqlUpdateOrderMasterFullData = "UPDATE pis_order_master SET ORDER_STATUS = '" + masterStatus + "',TOTAL_ORDER = '" + totalOrderForOrderNo + "' "
                        + "WHERE ORDER_NO = '" + ORDER_NO + "' ";

                boolean isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterFullData);

                if (isUpdateOrderMasterData == true) {
                    out.print("Master Order Status Full Success ");
                } else {
                    out.print("Master Order Status Full Failed ");
                }

            } else {

                // Update Master Order Partial
                String sqlUpdateOrderMasterPartialData = "UPDATE pis_order_master SET TOTAL_ORDER = '" + totalOrderForOrderNo + "' "
                        + "WHERE ORDER_NO = '" + ORDER_NO + "' ";

                boolean isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

                if (isUpdateOrderMasterData == true) {
                    out.print("Master Order Status Partial Success ");
                } else {
                    out.print("Master Order Status Partia Failed ");
                }
            }

        } else {
            out.print("Order Table Update Failed ");
        }

        // Order Table Part End //
        //
        //
        //
        //
        //
        //
        // MDC Table Part Start //
        
        // Update MDC Stock Qty
        String sqlUpdateStockData = "UPDATE pis_mdc2 SET D_STOCK_QTY = '" + D_STOCK_QTY + "' WHERE UD_MDC_CODE = '" + DRUG_ITEM_CODE + "' ";
        boolean isUpdateStockData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateStockData);

        if (isUpdateStockData == true) {
            out.print("Stock Update Success ");
        } else {
            out.print("Stock Update Failed ");
        }
        
        // MDC Table Part End //
    }

%>