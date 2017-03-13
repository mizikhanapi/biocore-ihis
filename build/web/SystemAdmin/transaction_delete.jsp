<%-- 
    Document   : transaction_delete
    Created on : Feb 27, 2017, 6:28:23 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();

    String id = request.getParameter("transactionCode");

    String sqlCheck = "Select transaction_code from adm_page where transaction_code = '" + id + "' limit 1";

    ArrayList<ArrayList<String>> dataUse = conn.getData(sqlCheck);

    if (dataUse.size() > 0) {

        out.print("You can't delete this item because it is referenced by page");

    } else {

        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_txn_code WHERE transaction_code = '" + id + "' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }


%>
