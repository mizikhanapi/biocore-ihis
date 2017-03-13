<%-- 
    Document   : transaction_update
    Created on : Feb 27, 2017, 6:24:27 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    Conn conn  = new Conn();
    
    String transactionCode = request.getParameter("transactionCode");
    String transactionName = request.getParameter("transactionName");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_txn_code SET transaction_name = '"+transactionName+"', status = '"+status+"'"+
                        " WHERE transaction_code = '"+transactionCode+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>
