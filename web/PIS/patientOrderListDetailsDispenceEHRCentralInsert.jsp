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

    String FullEHRHeaderBLI = "";
    String FullEHRHeaderDDR = "";

    // Requesting Parameter
    String pmino = request.getParameter("pmino");
    String EHRFirstHeaderBLI = request.getParameter("EHRFirstHeaderBLI");
    String EHRSecondHeaderBLI = request.getParameter("EHRSecondHeaderBLI");
    String EHRFirstHeaderDDR = request.getParameter("EHRFirstHeaderDDR");
    String EHRSecondHeaderDDR = request.getParameter("EHRSecondHeaderDDR");
//    String EHRSecondHeaderDDRUpdated = "";
//
//    String drugsDispenseMain[] = EHRSecondHeaderDDR.split("\\<cr>");
//
//    for (int main = 0; main < drugsDispenseMain.length; main++) {
//
//        String drugsDispenseChild[] = drugsDispenseMain[main].split("\\|");
//        
//        String join = "";
//
//        for (int child = 0; child < drugsDispenseChild.length; child++) {
//            
//            String DDR = drugsDispenseChild[0];
//            String ATC = drugsDispenseChild[1];
//            String MDC = drugsDispenseChild[2];
//            String END = "<cr>\n";
//            
//            join = DDR+"|"+ATC+"|"+MDC+"|"+END;
//            
//           
//        }
//        
//        EHRSecondHeaderDDRUpdated = EHRSecondHeaderDDRUpdated + join;
//
//    }

    FullEHRHeaderBLI = EHRFirstHeaderBLI + EHRSecondHeaderBLI;
    FullEHRHeaderDDR = EHRFirstHeaderDDR + EHRSecondHeaderDDR;

    String CENTRAL_CODE = "";                       // Date 1
    String PMI_NO = pmino;                          // Date 2
    String C_TXNDATE = format.format(now);          // Date 3
    String C_TxnDataBLI = FullEHRHeaderBLI;            // Date 4
    String C_TxnDataDDR = FullEHRHeaderDDR;            // Date 4
    String STATUS = "0";                            // Date 5
    String STATUS_1 = "0";                          // Date 6
    String STATUS_2 = "0";                          // Date 7
    String STATUS_3 = "0";                          // Date 8
    String STATUS_4 = "0";                          // Date 9
    String STATUS_5 = "0";                          // Date 10

    // Insert Into EHR Central BLI
    String sqlInsertBLI = "INSERT INTO ehr_central (CENTRAL_CODE,PMI_NO,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5) "
            + " SELECT (MAX(CENTRAL_CODE)+1),'" + PMI_NO + "','" + C_TXNDATE + "','" + C_TxnDataBLI + "','" + STATUS + "','" + STATUS_1 + "','" + STATUS_2 + "','" + STATUS_3 + "', "
            + "'" + STATUS_4 + "','" + STATUS_5 + "' FROM ehr_central ";
    boolean isInsertBLI = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertBLI);

    // Insert Into EHR Central DDR
    String sqlInsertDDR = "INSERT INTO ehr_central (CENTRAL_CODE,PMI_NO,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5)"
            + " SELECT (MAX(CENTRAL_CODE)+1),'" + PMI_NO + "','" + C_TXNDATE + "','" + C_TxnDataDDR + "','" + STATUS + "','" + STATUS_1 + "','" + STATUS_2 + "','" + STATUS_3 + "', "
            + "'" + STATUS_4 + "','" + STATUS_5 + "' FROM ehr_central ";
    boolean isInsertDDR = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsertDDR);

    
    if (isInsertBLI == true && isInsertDDR == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>

