<%-- 
    Document   : manageStockQuantityInvoiceNoCheck
    Created on : Dec 11, 2017, 2:41:59 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String invoiceNumber = request.getParameter("invoiceNumber");

    String sqlCheck = "SELECT invoice_no from fap_vendor_header"
            + " WHERE invoice_no = '" + invoiceNumber + "' AND hfc_cd = '" + hfc + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {
        out.print("Ok");
    }

%>