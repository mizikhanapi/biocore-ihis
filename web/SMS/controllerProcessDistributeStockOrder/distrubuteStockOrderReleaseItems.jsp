<%-- 
    Document   : distrubuteStockOrderReleaseItems
    Created on : Dec 10, 2017, 5:07:53 PM
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
    String order_no = stockMasterD[1];
    String txt_date = stockMasterD[2];
    String item_amt = stockMasterD[3];
    String quantity = stockMasterD[4];

    // Release Master Table Part Start //
    // Check Master Data Release
    String sqlFetchMasterReleaseData = " SELECT item_amt,quantity FROM stk_distribition_master WHERE order_no = '" + order_no + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> checkDistributeMaster = conn.getData(sqlFetchMasterReleaseData);

    // Process Master Release Start
    if (checkDistributeMaster.size() == 0) {

        boolean isInsertDistrubiteMaster = true;

        // Insert Master Distribute
        String sqlInsertDustributeMaster = "INSERT INTO stk_distribition_master "
                + " (customer_id, order_no, txt_date, item_amt, quantity, location, hfc_cd, "
                + " discipline_cd, subdiscipline_cd, ordering_hfc_cd, ordering_discipline_cd, "
                + " ordering_subdiscipline_cd, status, created_by, created_date) "
                + " VALUES ('" + customer_id + "','" + order_no + "','" + txt_date + "','" + item_amt + "','" + quantity + "', "
                + " '" + hfc + "','" + hfc + "','" + dis + "','" + sub + "','" + hfc + "','" + dis + "', "
                + " '" + sub + "','0','" + created_by + "','" + created_date + "' ) ";

        isInsertDistrubiteMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDustributeMaster);

        if (isInsertDistrubiteMaster == false) {

            falseCount = falseCount + 1;

        }

    } else {

        boolean isUpdateDistrubiteMaster = true;

        item_amt = String.valueOf(Double.parseDouble(item_amt) + Double.parseDouble(checkDistributeMaster.get(0).get(0)));
        quantity = String.valueOf(Integer.parseInt(quantity) + Integer.parseInt(checkDistributeMaster.get(0).get(1)));

        // Update Master Distribute
        String sqlUpdateDustributeMaster = "UPDATE stk_distribition_master "
                + " SET item_amt = '" + item_amt + "', quantity = '" + quantity + "' "
                + " WHERE order_no = '" + order_no + "' ";

        isUpdateDistrubiteMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDustributeMaster);

        if (isUpdateDistrubiteMaster == false) {

            falseCount = falseCount + 1;

        }

    }
    // Process Master Release End
    // Release Master Table Part End //
    //
    //
    //
    //
    //
    // String String Detail Part Start //
    // Get The Data And Split
    String stockDetailD[] = stringDetail.split("\\|");

    for (int i = 0; i < stockDetailD.length; i++) {

        String smallData = stockDetailD[i];
        String detailsStockS[] = smallData.split("\\^");

        String item_cdD = detailsStockS[0];
        String item_descD = detailsStockS[1];
        String item_StockD = detailsStockS[2];
        String ordered_quantityD = detailsStockS[3];
        String released_quantityD = detailsStockS[4];
        String released_quantityUpdatedD = detailsStockS[5];
        String item_amtD = detailsStockS[6];
        String item_quantityD = detailsStockS[7];
        String commentD = detailsStockS[8];
        String order_statusD = detailsStockS[9];

        // Release Master Table Part Start //
        // Check Master Data Release
        String sqlFetchDetailsReleaseData = " SELECT item_amt,item_quantity FROM stk_distribition_detail "
                + "WHERE order_no = '" + order_no + "' AND item_cd = '" + item_cdD + "' LIMIT 1 ";
        ArrayList<ArrayList<String>> checkDistributeDetails = conn.getData(sqlFetchDetailsReleaseData);

        // Process Master Release Start
        if (checkDistributeDetails.size() == 0) {

            boolean isInsertDistrubiteMaster = true;

            // Insert Master Distribute
            String sqlInsertDustributeDetail = "INSERT INTO stk_distribition_detail "
                    + " (order_no, txt_date, item_cd, item_desc, item_amt, item_quantity, order_by, created_date, created_by) "
                    + " VALUES ('" + order_no + "','" + txt_date + "','" + item_cdD + "','" + item_descD + "','" + item_amtD + "',"
                    + " '" + item_quantityD + "','" + created_by + "','" + created_date + "','" + created_by + "' )";

            isInsertDistrubiteMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDustributeDetail);

            if (isInsertDistrubiteMaster == false) {

                falseCount = falseCount + 1;

            }

        } else {

            boolean isUpdateDistrubiteMaster = true;

            item_amtD = String.valueOf(Double.parseDouble(item_amtD) + Double.parseDouble(checkDistributeDetails.get(0).get(0)));
            item_quantityD = String.valueOf(Integer.parseInt(item_quantityD) + Integer.parseInt(checkDistributeDetails.get(0).get(1)));

            // Update Master Distribute
            String sqlUpdateDustributeDetail = "UPDATE stk_distribition_detail "
                    + " SET item_amt = '" + item_amtD + "', item_quantity = '" + item_quantityD + "' "
                    + " WHERE order_no = '" + order_no + "' ";

            isUpdateDistrubiteMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDustributeDetail);

            if (isUpdateDistrubiteMaster == false) {

                falseCount = falseCount + 1;

            }

        }

        //
        //
        //
        // Order Detail Table Part Start //
        // Update Order Detail Table
        boolean isUpdateOrderMaster = true;

        String sqlUpdateOrderDetail = "UPDATE stk_order_detail "
                + " SET released_quantity = '" + released_quantityUpdatedD + "', "
                + " comment = '" + commentD + "',order_status = '" + order_statusD + "' "
                + " WHERE order_no = '" + order_no + "' AND item_cd = '" + item_cdD + "' ";

        isUpdateOrderMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderDetail);

        if (isUpdateOrderMaster == false) {

            falseCount = falseCount + 1;

        }

        // Order Detail Table Part Start //
        //
        //
        //
        // Item Table Part Start //
        boolean isUpdateItem = true;
        // Update Item Detail Table
        String sqlUpdateItemDetail = "UPDATE stk_stock_item "
                + " SET physical_stock = '" + item_StockD + "'"
                + " WHERE item_cd = '" + item_cdD + "' "
                + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + dis + "' ";

        isUpdateItem = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateItemDetail);

        if (isUpdateItem == false) {

            falseCount = falseCount + 1;

        }

        // Item Table Part Start //
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
    String sqlCheckMasterData = "SELECT * FROM stk_order_detail  "
            + " WHERE order_no = '" + order_no + "' AND (order_status = '0' OR order_status = '1')";
    ArrayList<ArrayList<String>> getOrderSummary = conn.getData(sqlCheckMasterData);

    if (getOrderSummary.size() == 0) {

        boolean isUpdateOrderMasterData = true;

        String sqlUpdateOrderMasterPartialData = "UPDATE stk_order_master "
                + " SET status = '1' "
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