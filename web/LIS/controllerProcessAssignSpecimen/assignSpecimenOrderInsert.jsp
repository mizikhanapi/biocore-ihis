<%-- 
    Document   : assignSpecimenOrderInsert
    Created on : Jan 15, 2018, 11:44:54 AM
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
    DateTimeFormatter formatSmall = DateTimeFormatter.ofPattern("dd-MM-yyyy");
    LocalDateTime now = LocalDateTime.now();

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String coollection_date = formatSmall.format(now);

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String order_no = request.getParameter("order_no");
    String txn_date = request.getParameter("txn_date");
    String item_cd = request.getParameter("item_cd");
    String customer_id = request.getParameter("customer_id");
    String item_name = request.getParameter("item_name");
    String item_SpeSrc = request.getParameter("item_SpeSrc");
    String item_SpeCont = request.getParameter("item_SpeCont");
    String item_volume = request.getParameter("item_volume");
    String item_SpeInst = request.getParameter("item_SpeInst");
    String comment = request.getParameter("comment");

    String sqlCheck = "SELECT order_no from lis_order_detail"
            + " WHERE order_no = '" + order_no + "' AND item_cd = '" + item_cd + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO lis_order_detail (order_no, txn_date,item_cd, pmi_no, episode_date, encounter_date, "
                + " requestor_comments, filler_comments, verify_by, verify_date, created_by, created_date, spe_source, item_name, "
                + " volume, spe_container, comment, special_inst, order_date, specimen_status, Verification, detail_status, collectionDate) "
                + " VALUES ('" + order_no + "','" + txn_date + "','" + item_cd + "','" + customer_id + "','" + txn_date + "', "
                + " '" + txn_date + "','" + comment + "','-','" + created_by + "','" + created_date + "','" + created_by + "', "
                + " '" + created_date + "','" + item_SpeSrc + "','" + item_name + "','" + item_volume + "','" + item_SpeCont + "', "
                + " '-','" + item_SpeInst + "','" + txn_date + "','1','Pending','0' ,'" + coollection_date + "')";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {

            String sqlCheckTotalOrder = "SELECT SUM(item_amt),SUM(ordered_quantity) FROM stk_order_detail  "
                    + " WHERE order_no = '" + order_no + "' AND (order_status = '0' OR order_status = '1')";
            ArrayList<ArrayList<String>> getOrderSummary = conn.getData(sqlCheckTotalOrder);

            String totalOrderAmount = String.valueOf(getOrderSummary.get(0).get(0));
            String totalOrderQuantity = String.valueOf(getOrderSummary.get(0).get(1));

            String sqlUpdateOrderMasterPartialData = "UPDATE stk_order_master "
                    + " SET item_amt = '" + totalOrderAmount + "' , quantity  = '" + totalOrderQuantity + "' "
                    + " WHERE ORDER_NO = '" + order_no + "' ";

            boolean isUpdateOrderMasterData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterPartialData);

            if (isUpdateOrderMasterData == true) {
                out.print("Success");
            } else {
                out.print("Master Update Failed");
            }

        } else {
            out.print("Failed");
        }

    }

%>