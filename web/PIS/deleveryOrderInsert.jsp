<%-- 
    Document   : deleveryOrderInsert
    Created on : May 10, 2017, 8:28:50 AM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String vendor_id = request.getParameter("vendor_id");
    String invoice_no = request.getParameter("invoice_no");
    String txt_date = format.format(now);
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_discipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String location = "-";
    String reference_id = "-";
    String total_amt = request.getParameter("total_amt");
    String quantity = request.getParameter("quantity");
    String order_no = request.getParameter("order_no");
    String subledger_type = "-";
    String do_number = "-";
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String detailData = request.getParameter("vendorDetail");

    String sqlInsertMaster = "";
    String sqlInsertDetails = "";
    String sqlUpdateStock = "";
    boolean isInsertMaster = false;
    boolean isInsertMasterDuplicate = false;
    boolean isInsertDetails = false;
    boolean isUpdateStock = false;

    String drugsL[] = detailData.split("\\#");

    RMIConnector rmic = new RMIConnector();

    for (int i = 0; i < drugsL.length; i++) {

        String smallData = drugsL[i];
        String drugsS[] = smallData.split("\\|");

        String item_cd = drugsS[0];
        String item_desc = drugsS[1];
        String item_amt = drugsS[2];
        String item_quantity = drugsS[3];
        String update_stock = drugsS[4];

        // Master
        String sqlCheckMaster = "SELECT vendor_id from fap_vendor_header WHERE vendor_id = '" + vendor_id + "' AND invoice_no  = '" + invoice_no + "' AND txt_date  = '" + txt_date + "' LIMIT 1 ";
        ArrayList<ArrayList<String>> duplicateMaster = conn.getData(sqlCheckMaster);

        if (duplicateMaster.size() > 0) {
            isInsertMasterDuplicate = true;
        } else {

            sqlInsertMaster = "INSERT INTO fap_vendor_header (vendor_id,invoice_no,txt_date,hfc_cd,discipline,sub_discipline,location,"
                    + "total_amt,quantity,order_no,subledger_type,do_number,created_by,created_date)"
                    + " VALUES ('" + vendor_id + "','" + invoice_no + "','" + txt_date + "','" + hfc_cd + "','" + discipline + "',"
                    + "'" + sub_discipline + "','" + location + "','" + total_amt + "','" + quantity + "','" + order_no + "','" + subledger_type + "',"
                    + "'" + do_number + "','" + created_by + "','" + created_date + "' )";

            isInsertMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertMaster);

        }

        // Details
        sqlInsertDetails = "INSERT INTO fap_vendor_detail (invoice_no,txt_date,item_cd,item_desc,item_amt,quantity,location,"
                + "reference_id,created_by,created_date)"
                + " VALUES ('" + invoice_no + "','" + txt_date + "','" + item_cd + "','" + item_desc + "','" + item_amt + "','" + item_quantity + "',"
                + "'" + location + "','" + reference_id + "','" + created_by + "','" + created_date + "' )";

        isInsertDetails = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDetails);

        // Stock Update
        sqlUpdateStock = "UPDATE pis_mdc2 SET D_STOCK_QTY = '"+update_stock+"' WHERE UD_MDC_CODE = '"+item_cd+"' AND hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline+"'";

        isUpdateStock = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateStock);

    }

    if (isInsertMaster == true && isInsertDetails == true) {
        out.print("Success");
    } else if (isInsertMasterDuplicate == true) {
        out.print("Duplicate");
    } else {
        out.print("Failed");
    }

%>