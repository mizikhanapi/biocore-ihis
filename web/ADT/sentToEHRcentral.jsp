<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String ehr_central = request.getParameter("ehr_central");
    String pmino = request.getParameter("pmiNo");
    String orderNo = request.getParameter("order_no");
    
    String test = "SELECT MAX( CENTRAL_CODE ) + 1 FROM ehr_central";
    ArrayList<ArrayList<String>> q4 = conn.getData(test);

    String id_ehr = q4.get(0).get(0);
    
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = new Date();
   
    String date_now = dateFormat.format(date);
    RMIConnector rmic = new RMIConnector();
    
    String status = "0";
    String status1 = "1";
    String status2 = "0";
    String status3 = "0";
    String status4 = "0";
    String status5 = "0";

    String sqlInsert = "INSERT INTO ehr_central(CENTRAL_CODE,pmi_no,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5) VALUES ('" + id_ehr + "','" + pmino + "','"+date_now+"','" + ehr_central + "','" + status + "','" + status1 + "','" + status2 + "','" + status3 + "','" + status4 + "','" + status5 + "')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
    
//    String sqlUpdate = "UPDATE lis_order_master SET order_status='4' WHERE order_no = '"+orderNo+"' ";
//    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
%>

