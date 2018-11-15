<%-- 
    Document   : dataManagementArchiveOrderDelete
    Created on : Sep 12, 2017, 5:46:51 PM
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

    String sqlUpdateMaster = "";
    String sqlUpdateDetail = "";

    String strArchive = request.getParameter("longString");

    String orders[] = strArchive.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isUpdateMaster = false;
    boolean isUpdateDetail = false;

    for (int i = 0; i < orders.length; i++) {

        sqlUpdateMaster = "UPDATE pis_order_master SET ORDER_STATUS = '9' "
                + "WHERE ORDER_NO = '" + orders[i] + "' ";

        isUpdateMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateMaster);

        sqlUpdateDetail = "UPDATE pis_order_detail SET ORDER_STATUS = '9' "
                + "WHERE ORDER_NO = '" + orders[i] + "' ";

        isUpdateDetail = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDetail);
    }

    if (isUpdateMaster == true && isUpdateDetail == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>

