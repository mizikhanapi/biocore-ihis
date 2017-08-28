<%-- 
    Document   : patientOrderListNewOrderInsert
    Created on : Feb 19, 2017, 4:35:17 PM
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
    LocalDateTime now = LocalDateTime.now();

    String ORDER_NO = request.getParameter("orderNo");
    String TXN_DATE = format.format(now);
    String DRUG_ITEM_CODE = request.getParameter("drugCode");
    String DRUG_ITEM_DESC = request.getParameter("drugDesc");
    String DRUG_FREQUENCY = request.getParameter("drugFrequency");
    String DRUG_ROUTE = request.getParameter("drugRoute");
    String DRUG_FORM = request.getParameter("drugFrom");
    String DRUG_STRENGTH = request.getParameter("drugStrength");
    String DRUG_DOSAGE = request.getParameter("dosage");
    String ORDER_OUM = request.getParameter("orderOUM");
    String DURATION = request.getParameter("drugDuration");

    String ORDER_STATUS = request.getParameter("orderStatus");
    String QTY_ORDERED = request.getParameter("drugQty");
    String QTY_SUPPLIED = request.getParameter("qtySupplied");
    String SUPPLIED_OUM = request.getParameter("suppliedOUM");
    String QTY_DISPENSED = request.getParameter("qtyDispensed");
    String DISPENSE_OUM = request.getParameter("dispensedOUM");
    String DURATIONT = request.getParameter("drugDurationT");
    int STATUS = 1;
    String DRUG_DOSAGE_ORDER_UOM = "-";

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlCheck = "SELECT ORDER_NO from pis_order_detail WHERE ORDER_NO = '" + ORDER_NO + "' AND DRUG_ITEM_CODE = '" + DRUG_ITEM_CODE + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO pis_order_detail (ORDER_NO, TXN_DATE,DRUG_ITEM_CODE, DRUG_ITEM_DESC, DRUG_FREQUENCY, "
                + "DRUG_ROUTE, DRUG_FORM, DRUG_STRENGTH, DRUG_DOSAGE, ORDER_OUM, DURATION, ORDER_STATUS, QTY_ORDERED, "
                + "QTY_SUPPLIED, SUPPLIED_OUM, QTY_DISPENSED, DISPENSE_OUM,STATUS,DRUG_DOSAGE_ORDER_UOM, DURATIONT) "
                + " VALUES ('" + ORDER_NO + "','" + TXN_DATE + "','" + DRUG_ITEM_CODE + "','" + DRUG_ITEM_DESC + "','" + DRUG_FREQUENCY + "','" + DRUG_ROUTE + "', "
                + " '" + DRUG_FORM + "','" + DRUG_STRENGTH + "','" + DRUG_DOSAGE + "','" + ORDER_OUM + "','" + DURATION + "','" + ORDER_STATUS + "', "
                + " '" + QTY_ORDERED + "','" + QTY_SUPPLIED + "','" + SUPPLIED_OUM + "','" + QTY_DISPENSED + "','" + DISPENSE_OUM + "'," + STATUS + ",'" + DRUG_DOSAGE_ORDER_UOM + "','" + DURATIONT + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {

            String sqlCheckTotalOrder = "SELECT ORDER_NO,DRUG_ITEM_CODE FROM pis_order_detail WHERE ORDER_NO = '" + ORDER_NO + "' AND (ORDER_STATUS = '0' OR ORDER_STATUS = '1')";
            ArrayList<ArrayList<String>> totalOrder = conn.getData(sqlCheckTotalOrder);

            String totalOrderForOrderNo = String.valueOf(totalOrder.size());

            String sqlUpdateOrderMasterPartialData = "UPDATE pis_order_master SET TOTAL_ORDER = '" + totalOrderForOrderNo + "' "
                    + "WHERE ORDER_NO = '" + ORDER_NO + "' ";

            boolean isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

            if (isUpdateOrderMasterData == true) {
                out.print("Success");
            } else {
                out.print("Master Total Delete Failed");
            }

        } else {
            out.print("Failed");
        }

    }

%>