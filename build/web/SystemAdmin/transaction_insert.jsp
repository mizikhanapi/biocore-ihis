<%-- 
    Document   : transaction_insert
    Created on : Feb 27, 2017, 6:03:46 PM
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
    String transactionCode = request.getParameter("transactionCode");
    String transactionName = request.getParameter("transactionName");
    String status = request.getParameter("status");
    String userID = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT transaction_code from adm_txn_code WHERE transaction_code = '"+transactionCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, the transaction code is already used. Please enter different code.");
    }
    else{
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_txn_code(transaction_code, transaction_name, status, created_by, created_date) "+
                    "VALUES('"+transactionCode+"', '"+transactionName+"', '"+status+"', '"+userID+"', now())";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

    

%>
