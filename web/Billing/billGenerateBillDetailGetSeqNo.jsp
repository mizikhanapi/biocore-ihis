<%-- 
    Document   : billGenerateBillDetailGetSeqNo
    Created on : Nov 15, 2017, 11:39:27 AM
    Author     : Shammugam
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="main.RMIConnector"%>

<%
    // Generate Date Format
    DateFormat dateFormat = new SimpleDateFormat("MMyyyy");
    Date date = new Date();
    String dateString = dateFormat.format(date);

    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();

    //module name - > 
    //B = Billing
    //R = Receipt
    //I = Invoice
    String sqlSeqSelect = "SELECT last_seq_no "
            + "FROM far_last_seq_no "
            + "WHERE module_name = 'B'";
    ArrayList<ArrayList<String>> dataSeqBillBoss = conn.getData(sqlSeqSelect);

    //Get last sequance number
    String seqNo = dataSeqBillBoss.get(0).get(0);
    
    int seq = Integer.parseInt(seqNo);
    int currSeq = seq + 1;
    String currentSeq = Integer.toString(currSeq);

    //Update last sequance number
    String sqlSeqUpdate = "UPDATE far_last_seq_no "
            + "SET last_seq_no = '" + currentSeq + "' "
            + "WHERE module_name = 'B'";
    
    boolean isInsertMaster = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlSeqUpdate);

    //Generate bill no
    int length = (int) Math.log10(currSeq) + 1;
    
    String zero = "0";
    String num = currentSeq;
    
    int count;
    
    for (count = length; count < 10; count++) {
        
        num = zero + num;
        
    }
    
    String billNo = num + dateString;

    out.print(billNo);
%>