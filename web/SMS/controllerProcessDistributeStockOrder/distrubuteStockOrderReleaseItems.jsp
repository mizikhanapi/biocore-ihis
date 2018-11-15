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
    String sqlUpdateItemDetail = "";
    String sqlUpdateOrderMasterPartialData = "";
    // RMI AND CONN
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    int falseCount = 0;

    // PARAMATER
    String stringMaster = request.getParameter("stringMaster");
    String stringDetail = request.getParameter("stringDetail");
    String stringbutton = request.getParameter("button");
    String erroralpah = "";
    String stockMasterD[] = stringMaster.split("\\|");
    String errorsql = "";
    String customer_id = stockMasterD[0];
    String order_no = stockMasterD[1];
    String txt_date = stockMasterD[2];
    String item_amt = stockMasterD[3];
    String quantity = stockMasterD[4];
    String updateOrdering = "";
    String sqlInsertDustributeMaster = "";
    String sqlUpdateDustributeMaster = "";
    boolean isUpdateDistrubiteMasterx = true;
    // Release Master Table Part Start //
    // Check Master Data Release
    String sqlFetchMasterReleaseData = " SELECT item_amt,quantity FROM stk_distribition_master WHERE order_no = '" + order_no + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> checkDistributeMaster = conn.getData(sqlFetchMasterReleaseData);
    String sqlUpdateOrderDetail = "";
    // Process Master Release Start
    if (checkDistributeMaster.size() == 0) {

        //boolean isInsertDistrubiteMaster = true;

        // Insert Master Distribute
        sqlUpdateDustributeMaster = "INSERT INTO stk_distribition_master "
                + " (customer_id, order_no, txt_date, item_amt, quantity, location, hfc_cd, "
                + " discipline_cd, subdiscipline_cd, ordering_hfc_cd, ordering_discipline_cd, "
                + " ordering_subdiscipline_cd, status, created_by, created_date) "
                + " VALUES ('" + customer_id + "','" + order_no + "',STR_TO_DATE('" + txt_date + "', '%d/%m/%Y %H:%i:%s'),'" + item_amt + "','" + quantity + "', "
                + " '" + hfc + "','" + hfc + "','" + dis + "','" + sub + "','" + hfc + "','" + dis + "', "
                + " '" + sub + "','0','" + created_by + "','" + created_date + "' ) ";

//        isInsertDistrubiteMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDustributeMaster);
//
//        if (isInsertDistrubiteMaster == false) {
//
//            falseCount = falseCount + 1;
//            errorsql += sqlInsertDustributeMaster;
//
//        }
    } else if (checkDistributeMaster.size() > 0) {

        item_amt = String.valueOf(Double.parseDouble(item_amt) + Double.parseDouble(checkDistributeMaster.get(0).get(0)));
        quantity = String.valueOf(Integer.parseInt(quantity) + Integer.parseInt(checkDistributeMaster.get(0).get(1)));

        // Update Master Distribute
        sqlUpdateDustributeMaster = "UPDATE stk_distribition_master "
                + " SET item_amt = '" + item_amt + "', quantity = '" + quantity + "' "
                + " WHERE order_no = '" + order_no + "' ";

    }
    isUpdateDistrubiteMasterx = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDustributeMaster);

    if (isUpdateDistrubiteMasterx == false) {

        falseCount = falseCount + 1;
        errorsql = errorsql + sqlUpdateDustributeMaster;
        erroralpah = erroralpah + "A";
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
    String sqlInsertDustributeDetail = "";
    String sqlUpdateDustributeDetail = "";
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
        String itemtype = detailsStockS[11];
        String torelesed = detailsStockS[10];
        String location = detailsStockS[12];
        String customerId = detailsStockS[13];
        String orderingdis = detailsStockS[14];
        String orderingsub = detailsStockS[15];
        boolean isInsertDistrubiteMaster = true;
        // Release Master Table Part Start //
        // Check Master Data Release
        String sqlFetchDetailsReleaseData = " SELECT item_amt,item_quantity FROM stk_distribition_detail "
                + "WHERE order_no = '" + order_no + "' AND item_cd = '" + item_cdD + "' LIMIT 1 ";
        ArrayList<ArrayList<String>> checkDistributeDetails = conn.getData(sqlFetchDetailsReleaseData);

        // Process Master Release Start
        if (checkDistributeDetails.size() == 0) {

            // Insert Master Distribute
            sqlInsertDustributeDetail = "INSERT INTO stk_distribition_detail "
                    + " (order_no, txt_date, item_cd, item_desc, item_amt, item_quantity, order_by, created_date, created_by,item_type,location,customer_id) "
                    + " VALUES ('" + order_no + "',STR_TO_DATE('" + txt_date + "', '%d/%m/%Y %H:%i:%s'),'" + item_cdD + "','" + item_descD + "','" + item_amtD + "'"
                    + ",'" + torelesed + "','" + created_by + "','" + created_date + "','" + created_by + "','" + itemtype + "','" + location + "','" + customerId + "' )";

        } else {

            //boolean isUpdateDistrubiteMaster = true;
            item_amtD = String.valueOf(Double.parseDouble(item_amtD) + Double.parseDouble(checkDistributeDetails.get(0).get(0)));
            item_quantityD = String.valueOf(Integer.parseInt(item_quantityD) + Integer.parseInt(checkDistributeDetails.get(0).get(1)));

            // Update Master Distribute
            sqlInsertDustributeDetail = "UPDATE stk_distribition_detail "
                    + " SET item_amt = '" + item_amtD + "', item_quantity = '" + item_quantityD + "' "
                    + " WHERE order_no = '" + order_no + "' and item_cd = '"+item_cdD+"'";

        }
        isInsertDistrubiteMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDustributeDetail);

        if (isInsertDistrubiteMaster == false) {

            falseCount = falseCount + 1;
            errorsql = errorsql + sqlInsertDustributeDetail;
            erroralpah = erroralpah + "B";

        }
        //
        //
        //
        // Order Detail Table Part Start //
        // Update Order Detail Table
        boolean isUpdateOrderMaster = true;

        sqlUpdateOrderDetail = "UPDATE stk_order_detail "
                + " SET released_quantity = '" + released_quantityUpdatedD + "', "
                + " comment = '" + commentD + "',status = '" + order_statusD + "' "
                + " WHERE order_no = '" + order_no + "' AND item_cd = '" + item_cdD + "' ";

        isUpdateOrderMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderDetail);

        if (isUpdateOrderMaster == false) {

            falseCount = falseCount + 1;
            errorsql = errorsql + sqlUpdateOrderDetail;
            erroralpah = erroralpah + "C";

        }

        // Order Detail Table Part Start //
        //
        //
        //
        // Item Table Part Start //
        boolean isUpdateItem = true;
        // Update Item Detail Table

        if (itemtype.equalsIgnoreCase("other")) {
            sqlUpdateItemDetail = "UPDATE stk_stock_item "
                    + " SET physical_stock = '" + item_StockD + "'"
                    + " WHERE item_cd = '" + item_cdD + "' "
                    + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + dis + "' ";
        } else if (itemtype.equalsIgnoreCase("drug")) {
            sqlUpdateItemDetail = "UPDATE pis_mdc2 "
                    + " SET d_stock_qty = '" + item_StockD + "'"
                    + " WHERE ud_mdc_code = '" + item_cdD + "' "
                    + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + dis + "' ";
        }

        isUpdateItem = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateItemDetail);

        if (isUpdateItem == false) {

            falseCount = falseCount + 1;
            errorsql = errorsql + sqlUpdateItemDetail;
            erroralpah = erroralpah + "D";

        }
        boolean isupdateOrdering = true;
        ArrayList<ArrayList<String>> dataselect, datanumrow, datanumcat, dataselectitem;
        String selectItem = "";
        String selectcategory = "";
        String selectdata = "";
        String selitem = "";
        boolean isinsertcate  = true;
        //////////////////             transferrrrrrrrrrr
        if (stringbutton.equalsIgnoreCase("transfer")) {
            //
            if (itemtype.equalsIgnoreCase("other")) {
                selitem = "SELECT * FROM stk_stock_item WHERE item_cd = '" + item_cdD + "'"
                        + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + orderingdis + "' ";
                datanumrow = conn.getData(selitem);
                //                      0           1           2       3    4          5       6       7       8       9       10              11              
                selectItem = "SELECT item_cd,category_cd,item_name,barcode,oum,supplier_cd,serial_no,brand,location,currency,selling_price,purchase_price,"
                        //      12          13      14      15          16              17              18              19              20          21          
                        + "wholesale_price,tax,min_stock,float_stock,physical_stock,reorder_level,std_material_cost,std_labor_cost,std_expenses,item_condition,"
                        //      22      23
                        + "item_grade,status FROM stk_stoCk_item WHERE item_cd = '" + item_cdD + "' "
                        + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + dis + "' ";

                if (datanumrow.size() > 0) {
                    updateOrdering = "UPDATE stk_stock_item "
                            + " SET physical_stock = physical_stock+" + torelesed + ""
                            + " WHERE item_cd = '" + item_cdD + "' "
                            + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + orderingdis + "' ";
                } else {
                    dataselect = conn.getData(selectItem);
                    selectcategory = "SELECT *  FROM stk_stock_category WHERE hfc_cd = '" + hfc + "' and discipline_cd = '" + orderingdis + "' and category_cd = '" + dataselect.get(0).get(1) + "'";
                    //                     0               1           2   3
                    selectdata = "SELECT category_cd,category_name,gl_cd,status FROM stk_stock_category WHERE hfc_cd = '" + hfc + "' and discipline_cd = '" + dis + "' and category_cd = '" + dataselect.get(0).get(1) + "'";
                    datanumcat = conn.getData(selectcategory);
                    if (datanumcat.size() > 0) {
                    } else {
                        dataselectitem = conn.getData(selectdata);
                        String inscat = "INSERT INTO stk_stock_category (category_cd,category_name,hfc_cd,discipline_cd,subdiscipline_cd,gl_cd,status,created_date,created_by) "
                                + "values ('" + dataselectitem.get(0).get(0) + "','" + dataselectitem.get(0).get(1) + "','" + hfc + "','" + orderingdis + "','" + orderingsub + "','" + dataselectitem.get(0).get(2) + "','" + dataselectitem.get(0).get(3) + "',"
                                + "'" + created_date + "','" + created_by + "')";
                        isinsertcate = rmic.setQuerySQL(conn.HOST, conn.PORT, inscat);
                        if (isinsertcate == false) {
                            falseCount = falseCount + 1;
                            errorsql = errorsql + inscat;
                            erroralpah = erroralpah + "E";
                        }
                    }
                    updateOrdering = "INSERT INTO stk_stock_item (item_cd,category_cd,item_name,barcode,oum,supplier_cd,serial_no,brand,location,currency,selling_price,purchase_price,"
                            + "wholesale_price,tax,min_stock,float_stock,physical_stock,reorder_level,std_material_cost,std_labor_cost,std_expenses,item_condition,item_grade,status,hfc_cd,discipline_cd,subdiscipline_cd,created_date,created_by) VALUES ("
                            + "'" + dataselect.get(0).get(0) + "','" + dataselect.get(0).get(1) + "','" + dataselect.get(0).get(2) + "','" + dataselect.get(0).get(3) + "','" + dataselect.get(0).get(4) + "','" + dataselect.get(0).get(5) + "',"
                            + "'" + dataselect.get(0).get(6) + "','" + dataselect.get(0).get(7) + "','" + dataselect.get(0).get(8) + "','" + dataselect.get(0).get(9) + "','" + dataselect.get(0).get(10) + "','" + dataselect.get(0).get(11) + "',"
                            + "'" + dataselect.get(0).get(12) + "','" + dataselect.get(0).get(13) + "','" + dataselect.get(0).get(14) + "','" + dataselect.get(0).get(15) + "','" + torelesed + "',"
                            + "'" + dataselect.get(0).get(17) + "','" + dataselect.get(0).get(18) + "','" + dataselect.get(0).get(19) + "','" + dataselect.get(0).get(20) + "','" + dataselect.get(0).get(21) + "','" + dataselect.get(0).get(22) + "',"
                            + "'" + dataselect.get(0).get(23) + "','" + hfc + "','" + orderingdis + "','" + orderingsub + "','" + created_date + "','" + created_by + "')";
                }
            } else if (itemtype.equalsIgnoreCase("drug")) {
                //                          0           1           2           3           4           5           6
                selectItem = "SELECT ud_mdc_code,ud_atc_code,d_trade_name,d_gnr_name,d_route_code,d_form_code,d_strength,"
                        //          7               8       9                       10                  11                  12      13          14
                        + "d_advisory_code,d_stock_qty,d_minimuM_stock_level,d_maximum_stock_level,d_reorder_stock_level,d_qty,d_qtyt,d_duration,"
                        //      15          16          17              18      19              20      21                  22      
                        + "d_durationt,d_frequency,d_caution_code,d_exp_date,d_classification,status,d_location_code,d_sell_price,"
                        //      23          24          25              26          27      
                        + "d_cost_price,d_packaging,d_packagingt,d_price_ppack,d_supplier_cd FROM pis_mdc2 WHERE ud_mdc_code = '" + item_cdD + "'"
                        + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + dis + "' ";

                selitem = "SELECT * FROM pis_mdc2 WHERE ud_mdc_code = '" + item_cdD + "'"
                        + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + orderingdis + "' ";

                datanumrow = conn.getData(selitem);
                if (datanumrow.size() > 0) {
                    updateOrdering = "UPDATE pis_mdc2 "
                            + " SET d_stock_qty = d_stock_qty+" + torelesed + ""
                            + " WHERE ud_mdc_code = '" + item_cdD + "' "
                            + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + orderingdis + "' ";
                } else {
                    dataselect = conn.getData(selectItem);
                    updateOrdering = "INSERT INTO pis_mdc2 (ud_mdc_code,ud_atc_code,d_trade_name,d_gnr_name,d_route_code,d_form_code,d_strength,"
                            + "d_advisory_code,d_stock_qty,d_minimum_stock_level,d_maximum_stock_level,d_reorder_stock_level,d_qty,d_qtyt,d_duration,"
                            + "d_durationt,d_frequency,d_caution_code,d_exp_date,d_classification,status,d_location_code,d_sell_price,"
                            + "d_cost_price,d_packaging,d_packagingt,d_price_ppack,d_supplier_cd,"
                            + "hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES("
                            + "'" + item_cdD + "','" + dataselect.get(0).get(1) + "','" + dataselect.get(0).get(2) + "','" + dataselect.get(0).get(3) + "','" + dataselect.get(0).get(4) + "',"
                            + "'" + dataselect.get(0).get(5) + "','" + dataselect.get(0).get(6) + "','" + dataselect.get(0).get(7) + "','" + torelesed + "','" + dataselect.get(0).get(9) + "',"
                            + "'" + dataselect.get(0).get(10) + "','" + dataselect.get(0).get(11) + "','" + dataselect.get(0).get(12) + "','" + dataselect.get(0).get(13) + "','" + dataselect.get(0).get(14) + "',"
                            + "'" + dataselect.get(0).get(15) + "','" + dataselect.get(0).get(16) + "','" + dataselect.get(0).get(17) + "','" + dataselect.get(0).get(18) + "','" + dataselect.get(0).get(19) + "',"
                            + "'" + dataselect.get(0).get(20) + "','" + dataselect.get(0).get(21) + "','" + dataselect.get(0).get(22) + "','" + dataselect.get(0).get(23) + "','" + dataselect.get(0).get(24) + "',"
                            + "'" + dataselect.get(0).get(25) + "','" + dataselect.get(0).get(26) + "','" + dataselect.get(0).get(27) + "','" + hfc + "','" + orderingdis + "',"
                            + "'" + orderingsub + "','" + created_by + "','" + created_date + "')";
                }

            }
            isupdateOrdering = rmic.setQuerySQL(conn.HOST, conn.PORT, updateOrdering);

        if (isupdateOrdering == false) {

            falseCount = falseCount + 1;
            errorsql = errorsql + updateOrdering;
            erroralpah = erroralpah + "F";

        }
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
            + " WHERE order_no = '" + order_no + "' AND (status = '0' OR status = '1')";
    ArrayList<ArrayList<String>> getOrderSummary = conn.getData(sqlCheckMasterData);

    if (getOrderSummary.size() == 0) {

        boolean isUpdateOrderMasterData = true;

        sqlUpdateOrderMasterPartialData = "UPDATE stk_order_master "
                + " SET status = '1' "
                + " WHERE order_no = '" + order_no + "' ";

        isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

        if (isUpdateOrderMasterData == false) {

            falseCount = falseCount + 1;
            errorsql = errorsql + sqlUpdateOrderMasterPartialData;
            erroralpah = erroralpah + "G";

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
        
        out.print("Failed|"+erroralpah);
        //out.print(errorsql);
        //out.print(sqlUpdateDustributeMaster);
        //out.print(sqlUpdateOrderMasterPartialData);
        //out.print(sqlFetchMasterReleaseData);
//        out.print(sqlUpdateOrderDetail);
//        out.print(sqlUpdateItemDetail);
//        out.print(sqlUpdateOrderMasterPartialData);
//        out.print(sqlInsertDustributeDetail);
//        out.print(sqlUpdateItemDetail);

    }

%>