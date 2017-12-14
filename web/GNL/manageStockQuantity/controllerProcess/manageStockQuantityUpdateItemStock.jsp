<%-- 
    Document   : manageStockQuantityUpdateItemStock
    Created on : Dec 11, 2017, 4:13:48 PM
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

    // PARAMATER FOR MASTER
    String invoiceOrderFor = request.getParameter("invoiceOrderFor");
    String invoice_no = request.getParameter("invoice_no");
    String vendor_id = request.getParameter("vendor_id");
    String order_no = request.getParameter("order_no");
    String invoice_date = request.getParameter("invoice_date");
    String delivery_date = request.getParameter("delivery_date");
    String description = request.getParameter("description");
    String total_amt = request.getParameter("total_amt");
    String quantity = request.getParameter("quantity");

    boolean isInsertMaster = true;

    String sqlInsertMaster = "INSERT INTO fap_vendor_header (vendor_id,invoice_no,txt_date,hfc_cd,discipline,sub_discipline,location,"
            + "total_amt,quantity,order_no,subledger_type,invoice_date,delivery_date,description,do_number,created_by,created_date)"
            + " VALUES ('" + vendor_id + "','" + invoice_no + "','" + created_date + "','" + hfc + "','" + dis + "',"
            + "'" + sub + "','" + hfc + "','" + total_amt + "','" + quantity + "','" + order_no + "','" + invoiceOrderFor + "','" + invoice_date + "',"
            + "'" + delivery_date + "','" + description + "','-','" + created_by + "','" + created_date + "' )";

    isInsertMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertMaster);

    if (isInsertMaster == false) {

        falseCount = falseCount + 1;

    }

    // PARAMATER FOR DETAIL
    String stringDetail = request.getParameter("stringDetail");
    String stockDetailD[] = stringDetail.split("\\|");

    for (int i = 0; i < stockDetailD.length; i++) {

        boolean isInsertStockDetail = true;
        boolean isUpdateStockDetail = true;

        String smallData = stockDetailD[i];
        String detailsStockS[] = smallData.split("\\^");

        String item_cd = detailsStockS[0];
        String item_desc = detailsStockS[1];
        String item_amt = detailsStockS[3];
        String item_quantity = detailsStockS[4];
        String quantityStockNew = detailsStockS[5];

        // Details
        String sqlInsertStockDetail = "INSERT INTO fap_vendor_detail (invoice_no,txt_date,item_cd,item_desc,item_amt,quantity,location,"
                + "reference_id,created_by,created_date)"
                + " VALUES ('" + invoice_no + "','" + created_date + "','" + item_cd + "','" + item_desc + "','" + item_amt + "','" + item_quantity + "',"
                + "'" + hfc + "','" + invoiceOrderFor + "','" + created_by + "','" + created_date + "' )";

        isInsertStockDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertStockDetail);

        if (isInsertStockDetail == false) {

            falseCount = falseCount + 1;

        }

        String sqlUpdateStockDetail = "";

        if (invoiceOrderFor.equalsIgnoreCase("04")) {

            // Update Item Detail Table (Pharmacy)
            sqlUpdateStockDetail = "UPDATE pis_mdc2 "
                    + " SET d_stock_qty = '" + quantityStockNew + "'"
                    + " WHERE ud_mdc_code = '" + item_cd + "' "
                    + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + dis + "' ";

        } else if (invoiceOrderFor.equalsIgnoreCase("22")) {

            // Update Item Detail Table (Stock)
            sqlUpdateStockDetail = "UPDATE stk_stock_item "
                    + " SET physical_stock = '" + quantityStockNew + "'"
                    + " WHERE item_cd = '" + item_cd + "' "
                    + " AND hfc_cd = '" + hfc + "'  AND discipline_cd = '" + dis + "' ";

        }

        isUpdateStockDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateStockDetail);

        if (isUpdateStockDetail == false) {

            falseCount = falseCount + 1;

        }

    }
    // Item Details Part End //
    //
    //
    //
    if (falseCount == 0) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>