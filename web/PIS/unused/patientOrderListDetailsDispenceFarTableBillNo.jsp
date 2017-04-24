<%-- 
    Document   : patientOrderListDetailsDispenceFarTableBillNo
    Created on : Mar 3, 2017, 9:40:17 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
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
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    Date date = new Date();
    DateFormat dateFormatID = new SimpleDateFormat("ddMMyyyy");
    String dateForID = dateFormatID.format(date);
    
    //module name - > // B = Billing // R = Receipt // I = Invoice //
    String sqlGetSql = "SELECT Id,last_seq_no FROM far_last_seq_no WHERE module_name = 'B' ";
    ArrayList<ArrayList<String>> dataSeq = conn.getData(sqlGetSql);

    //Get last sequance number
    String seqId = dataSeq.get(0).get(0);
    String seqNo = dataSeq.get(0).get(1);
    int seq = Integer.parseInt(seqNo);
    int currSeq = seq + 1;
    String currentSeq = Integer.toString(currSeq);

    //Generate bill no
    int length = (int) Math.log10(currSeq) + 1;
    String zero = "0";
    String num = currentSeq;
    int count;
    for (count = length; count < 10; count++) {
        num = zero + num;
    }
    String billNo = seqId + num + dateForID;

    // return billno
    out.print(billNo);

%>