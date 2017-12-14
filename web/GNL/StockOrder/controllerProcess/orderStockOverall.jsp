<%-- 
    Document   : orderStockOverall
    Created on : Dec 13, 2017, 8:11:09 PM
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
    String order_no = request.getParameter("order_no");
    String total_amt = request.getParameter("total_amt");
    String quantity = request.getParameter("quantity");

    boolean isInsertMaster = true;

    String sqlInsertMaster = "INSERT INTO stk_order_master (customer_id,order_no,txt_date,item_amt,quantity,location,hfc_cd,"
            + "discipline_cd,subdiscipline_cd,ordering_hfc_cd,ordering_discipline_cd,ordering_subdiscipline_cd,status,created_by,created_date)"
            + " VALUES ('" + created_by + "','" + order_no + "','" + created_date + "','" + total_amt + "','" + quantity + "','" + hfc + "'"
            + " ,'" + hfc + "','" + dis + "' ,'" + sub + "','" + hfc + "' ,'" + dis + "','" + sub + "','0','" + created_by + "','" + created_date + "' )";

    isInsertMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertMaster);

    if (isInsertMaster == false) {

        falseCount = falseCount + 1;

    }

    // PARAMATER FOR DETAIL
    String stringDetail = request.getParameter("stringDetail");
    String stockDetailD[] = stringDetail.split("\\|");

    for (int i = 0; i < stockDetailD.length; i++) {

        boolean isInsertStockDetail = true;

        String smallData = stockDetailD[i];
        String detailsStockS[] = smallData.split("\\^");

        String item_cd = detailsStockS[0];
        String item_desc = detailsStockS[1];
        String item_price = detailsStockS[2];
        String item_amt = detailsStockS[3];
        String item_quantity = detailsStockS[4];
        String item_comment = detailsStockS[5];

        // Details
        String sqlInsertStockDetail = "INSERT INTO stk_order_detail (order_no,txn_date,item_cd,item_desc,item_amt,ordered_quantity,released_quantity,location,"
                + "customer_id,order_by,comment,order_status,created_by,created_date)"
                + " VALUES ('" + order_no + "','" + created_date + "','" + item_cd + "','" + item_desc + "','" + item_amt + "','" + item_quantity + "',"
                + "'0','" + hfc + "','" + created_by + "','" + created_by + "','" + item_comment + "','0','" + created_by + "','" + created_date + "' )";

        isInsertStockDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertStockDetail);

        if (isInsertStockDetail == false) {

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