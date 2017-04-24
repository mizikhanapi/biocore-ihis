<%-- 
    Document   : patientOrderListDetailsDispenceFarTable
    Created on : Mar 3, 2017, 6:23:51 AM
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

    
    // Data For Both Header And Detail
    String customer_id = request.getParameter("pmino"); // Data 1
    String bill_no = request.getParameter("dispenseFarBillNo"); // Data 2
    String txn_date = request.getParameter("orderDate"); // Data 3
    String location = request.getParameter("locationCode"); // Data 4
    String created_by = (String) session.getAttribute("USER_ID"); // Data 5
    String created_date = format.format(now); // Data 6
    int status = 0; // Data 7
    
    
    // Data For Header
    String item_desc_header = request.getParameter("pname"); // Data 8
    String item_amt_header = request.getParameter("dispenseDrugMasterTotalChecked"); // Data 9
    String quantity_header = request.getParameter("dispenseDrugMasterQuantityChecked"); // Data 10
    String order_no_header = request.getParameter("orderNo"); // Data 11
    String payment = "Unpaid"; // Data 12
    int amt_paid = 0; // Data 13
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE"); // Data 14
    String discipline_cd = (String) session.getAttribute("DISCIPLINE_CODE"); // Data 15
    String subdiscipline_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE"); // data 16
    String txn_type = "PIS"; // Data 17
    
   
    // Data For Detail
    String item_cd = request.getParameter("drugCode"); // Data 8
    String item_desc = request.getParameter("drugDesc"); // Data 9
    String item_amt = request.getParameter("drugTotalPrice"); // Data 10
    String quantity = request.getParameter("drugDispensedQty"); // Data 11


    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    // Check For Username
    if (created_by == null) {

        out.print("User Not Exist");

    } else {

        // Far Table Part Start //
        
        // Far Master Table Part Start //
        // Check Master Data Dispense
        String sqlFetchMasterDispenseData = "SELECT * FROM far_customer_hdr WHERE customer_id = '" + customer_id + "' AND bill_no = '" + bill_no + "' AND txn_date = '" + txn_date + "' LIMIT 1 ";
        ArrayList<ArrayList<String>> checkFarMaster = conn.getData(sqlFetchMasterDispenseData);

        // No Master Data
        if (checkFarMaster.size() == 0) {
            
            // Insert Master Far
            String sqlInsertFarMaster = "INSERT INTO far_customer_hdr (customer_id, bill_no, txn_date, item_desc, item_amt, quantity, location, order_no, payment, amt_paid, "
                    + "hfc_cd, discipline_cd, subdiscipline_cd, status, created_by, created_date, txn_type) "
                    + " VALUES ('" + customer_id + "','" + bill_no + "','" + txn_date + "','" + item_desc_header + "','" + item_amt_header + "','" + quantity_header + "','" + location + "', "
                    + " '" + order_no_header + "','" + payment + "','" + amt_paid + "','" + hfc_cd + "','" + discipline_cd + "','" + subdiscipline_cd + "','" + status + "',"
                    + " '" + created_by + "','" + created_date + "','" + txn_type + "' );";


            boolean isInsertFarMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertFarMaster);

            if (isInsertFarMaster == true) {
                out.print("Master Far Insert Ok ");
            } else {
                out.print("Master Far Insert Not Ok ");
            }

        } else {

            out.print("Master Ok");

        }
        // Far Master Table Part End //
        
        
        // Far Detail Table Part Start //
        // Check Detail Data Dispense
        String sqlFetchDetailDispenseData = "SELECT * FROM far_customer_dtl WHERE bill_no = '" + bill_no + "' AND txn_date = '" + txn_date + "' AND item_cd = '" + item_cd + "' LIMIT 1 ";
        ArrayList<ArrayList<String>> checkFarDetail = conn.getData(sqlFetchDetailDispenseData);

        // No Master Data
        if (checkFarDetail.size() == 0) {
            
            // Insert Detail Far
            String sqlInsertFarDetail = "INSERT INTO far_customer_dtl (bill_no, txn_date, item_cd, item_desc, item_amt, quantity, location, customer_id, status, created_by, created_date) "
                    + " VALUES ('" + bill_no + "','" + txn_date + "','" + item_cd + "','" + item_desc + "','" + item_amt + "','" + quantity + "','" + location + "', "
                    + " '" + customer_id + "','" + status + "','" + created_by + "','" + created_date + "' );";

            boolean isInsertFarDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertFarDetail);

            if (isInsertFarDetail == true) {
                out.print("Detail Far Insert Ok ");
            } else {
                out.print("Detail Far Insert Not Ok ");
            }

        } else {

            out.print("Detail Ok");

        }
        // Far Detail Table Part End //         
      // Far Table Part Start //
      
    }

%>