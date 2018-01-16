<%-- 
    Document   : verifySpecimenOrderVerifyResult
    Created on : Jan 16, 2018, 5:30:46 AM
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
    DateTimeFormatter formatCDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTimeFormatter formatCTime = DateTimeFormatter.ofPattern("HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String collectionDate = formatCDate.format(now);
    String collectionTime = formatCTime.format(now);

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String result_no = request.getParameter("result_no");
    String specimen_no = request.getParameter("specimen_no");
    String order_no = request.getParameter("order_no");
    String status = request.getParameter("status");

    String sqlInsert = "UPDATE lis_result "
            + " SET verification = '" + status + "' "
            + " WHERE result_no = '" + result_no + "' ";

    boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    String sqlUpdateDetailData = "UPDATE lis_order_master "
            + " SET order_status = '3' "
            + " WHERE order_no = '" + order_no + "' ";

    boolean isUpdateDetailData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDetailData);

    if (isUpdateDetailData == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>