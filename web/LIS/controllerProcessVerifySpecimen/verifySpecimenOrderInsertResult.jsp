<%-- 
    Document   : verifySpecimenOrderInsertResult
    Created on : Jan 16, 2018, 4:23:41 AM
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
    String result = request.getParameter("result");
    String remark = request.getParameter("remark");
    String item_cd = request.getParameter("item_cd");
    String item_name = request.getParameter("test_name");
    String pmi_no = request.getParameter("pmi_no");
    String specimen_no = request.getParameter("specimen_no");
    String order_no = request.getParameter("order_no");
    String picture = request.getParameter("picture");

    String sqlInsert = "INSERT INTO lis_result "
            + " (result_no, result, remark, test_date, test_time, item_cd, pmi_no, specimen_no, test_name, "
            + " performBy, verification, order_no, picture, verify_by) "
            + " VALUES ('" + result_no + "','" + result + "','" + remark + "','" + collectionDate + "','" + collectionTime + "', "
            + " '" + item_cd + "','" + pmi_no + "','" + specimen_no + "','" + item_name + "','" + created_by + "', "
            + " 'Waiting For Approval','" + order_no + "','" + picture + "','" + created_by + "')";

    boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    if (isInsert == true) {

        String sqlUpdateDetailData = "UPDATE lis_specimen_detail "
                + " SET result_no = '" + result_no + "' , approval = 'Waiting For Approval' "
                + " WHERE specimen_no = '" + specimen_no + "' AND item_cd = '" + item_cd + "' ";

        boolean isUpdateDetailData = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDetailData);

        if (isUpdateDetailData == true) {
            out.print("Success");
        } else {
            out.print("Update Failed");
        }

    } else {
        out.print("Failed" + sqlInsert);
    }


%>