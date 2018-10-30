<%-- 
    Document   : patientScreenListScreeningProcess
    Created on : Oct 30, 2018, 5:27:11 PM
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

    String ORDER_NO = request.getParameter("orderNo"); // Data 1
    String ORDER_DATE = request.getParameter("orderDate"); // Data 2
    String ARRIVAL_DATE = request.getParameter("arrivalDate"); // Data 3
    String TOTAL_QUANTITY = request.getParameter("totalQuantity"); // Data 4
    String TOTAL_PRICE = request.getParameter("totalPrice"); // Data 5
    String PMI_NO = request.getParameter("pmino"); // Data 5
    String P_NAME = request.getParameter("pname"); // Data 5
    String USER_ID = (String) session.getAttribute("USER_ID");
    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");
    String SUBDISCIPLINE_CD = (String) session.getAttribute("SUB_DISCIPLINE_CODE");

    int STATUS = 1;

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    boolean isScreeningProcess = false;

    // Check For Username
    if (USER_ID == null) {

        out.print("User Not Exist");

    } else {

        // Order Table Part End //
        String masterStatus = "1";

        // Insert Master Dispense
        String sqlInsertDispenseMaster = ""
                + " INSERT INTO pis_dispense_master "
                + " (ORDER_NO, ORDER_DATE, LOCATION_CODE, ARRIVAL_DATE, DISPENSED_DATE, DISPENSED_BY, "
                + " FILLED_BY, SCREENED_BY, ASSIGNED_BY,STATUS,DISCIPLINE_CODE,SUBDISCIPLINE_CD) "
                + " VALUES ('" + ORDER_NO + "','" + ORDER_DATE + "','" + HEALTH_FACILITY_CODE + "', "
                + " '" + ARRIVAL_DATE + "','0000-00-00 00:00:00.000','','" + USER_ID + "', "
                + " '" + USER_ID + "','" + USER_ID + "'," + STATUS + ",'" + DISCIPLINE_CODE + "','" + SUBDISCIPLINE_CD + "' ) ";

        isScreeningProcess = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDispenseMaster);

        // Update Master Order Total Full
        String sqlUpdateOrderMasterFullData = ""
                + " UPDATE pis_order_master "
                + " SET ORDER_STATUS = '" + masterStatus + "', TOTAL_ORDER = '" + TOTAL_QUANTITY + "' "
                + " WHERE ORDER_NO = '" + ORDER_NO + "' AND HEALTH_FACILITY_CODE = '" + HEALTH_FACILITY_CODE + "' ";

        isScreeningProcess = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateOrderMasterFullData);

        if (isScreeningProcess == true) {
            out.print("Screening Complete");
        } else {
            out.print("Failed");
        }
    }

%>