<%-- 
    Document   : patientOrderListDetailsDispenceEHRCentralInsert
    Created on : Apr 22, 2017, 1:17:05 AM
    Author     : Shammugam
--%>


<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String FullEHRHeader = "";
    
    // Requesting Parameter
    String pmino = request.getParameter("pmino");
    String EHRFirstHeader = request.getParameter("EHRFirstHeader");
    String EHRSecondHeader = request.getParameter("EHRSecondHeader");

    FullEHRHeader = EHRFirstHeader + EHRSecondHeader;

    String CENTRAL_CODE = "";                       // Date 1
    String PMI_NO = pmino;                          // Date 2
    String C_TXNDATE = format.format(now);          // Date 3
    String C_TxnData = FullEHRHeader;               // Date 4
    String STATUS = "0";                            // Date 5
    String STATUS_1 = "0";                          // Date 6
    String STATUS_2 = "0";                          // Date 7
    String STATUS_3 = "0";                          // Date 8
    String STATUS_4 = "0";                          // Date 9
    String STATUS_5 = "0";                          // Date 10
    
    int tempCENTRAL_CODE = 0;

    // Get Max Code Start
    String sqlCentralCode = "select MAX(CENTRAL_CODE) FROM  ehr_central";
    ArrayList<ArrayList<String>> dataCENTRALCODE = conn.getData(sqlCentralCode);

    int sizeCENTRALCODE = dataCENTRALCODE.size();
    for (int i = 0; i < sizeCENTRALCODE; i++) {
        tempCENTRAL_CODE = Integer.parseInt(dataCENTRALCODE.get(i).get(0).toString());
    }
    // Get Max Code End

    // Generate Centarl Code
    CENTRAL_CODE = String.valueOf(tempCENTRAL_CODE + 1);
    
    
    // Insert Into EHR Central
    String sqlInsert = "INSERT INTO ehr_central (CENTRAL_CODE,PMI_NO,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5)"
            + " VALUES ('" + CENTRAL_CODE + "','" + PMI_NO + "','" + C_TXNDATE + "','" + C_TxnData + "','" + STATUS + "','" + STATUS_1 + "','" + STATUS_2 + "','" + STATUS_3 + "','" + STATUS_4 + "','" + STATUS_5 + "' )";

    boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
    if (isInsert == true) {
        out.print("Success"+"|"+sqlInsert);
    } else {
        out.print("Failed"+"|"+sqlInsert);
    }

%>

