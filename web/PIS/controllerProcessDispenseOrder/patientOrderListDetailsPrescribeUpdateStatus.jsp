<%-- 
    Document   : patientOrderListDetailsPrescribeUpdateStatus
    Created on : Mar 13, 2017, 2:47:47 AM
    Author     : Shammugam
--%>

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

    String longString = request.getParameter("longString");
    int STATUS = 1;

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdateStatus = "";
    boolean isUpdateStatus = false;

    String drugsL[] = longString.split("\\#");

    for (int i = 0; i < drugsL.length; i++) {

        String smallData = drugsL[i];
        String drugsS[] = smallData.split("\\|");

        String orderNo = drugsS[0];
        String drugCode = drugsS[1];

        sqlUpdateStatus = "UPDATE pis_order_detail SET STATUS = " + STATUS + " WHERE ORDER_NO = '" + orderNo + "' AND DRUG_ITEM_CODE = '" + drugCode + "'; ";
        isUpdateStatus = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateStatus);

    }

    if (isUpdateStatus == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>