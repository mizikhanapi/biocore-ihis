<%-- 
    Document   : patientOrderListDetailsDispenceFarTableBillNoUpdate
    Created on : Mar 6, 2017, 6:00:49 PM
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

    //module name - > // B = Billing // R = Receipt // I = Invoice //
    String sqlGetSql = "SELECT Id,last_seq_no FROM far_last_seq_no WHERE module_name = 'B' ";
    ArrayList<ArrayList<String>> dataSeq = conn.getData(sqlGetSql);

    //Get last sequance number
    String seqId = dataSeq.get(0).get(0);
    String seqNo = dataSeq.get(0).get(1);
    int seq = Integer.parseInt(seqNo);
    int currSeq = seq + 1;
    String currentSeq = Integer.toString(currSeq);

    
    //Update last sequance number
    String updateBillNoSequence = "UPDATE far_last_seq_no SET last_seq_no = '" + currentSeq + "' WHERE module_name = 'B' ";

    boolean isUpdateBillNoSequence = rmic.setQuerySQL(conn.HOST, conn.PORT, updateBillNoSequence);

    if (isUpdateBillNoSequence == true) {
        out.print("Bill Seq Updated ");
    } else {
        out.print("Bill Seq Update Fail ");
    }


%>