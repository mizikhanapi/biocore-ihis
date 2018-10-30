<%-- 
    Document   : patientOrderListDetailDispenseEHRCentralGetMSH
    Created on : Apr 21, 2017, 7:58:03 PM
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
    Conn conn = new Conn();
    String userID = (String) session.getAttribute("USER_ID");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdis = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String MSHFullBLI = "";
    String MSHFullDDR = "";

    String seperatorMSH = "MSH";                                    // Data 1
    String encodeCharacMSH = "^~";                                  // Data 2
    String sendAppliMSH = "04";                                     // Data 3
    String sendFacilityMSH = hfc + "^" + dis + "^" + subdis;                // Data 4
    String recieveAppliMSHBLI = "08";                                  // Data 5
    String recieveAppliMSHDDR = "14";                                  // Data 5
    String recieveFacilityMSH = hfc + "^" + dis + "^" + subdis;             // Data 6
    String currentDateMSH = format.format(now);                     // Data 7
    String securityMSH = "";                                        // Data 8
    String messageTypeMSH = "";                                     // Data 9
    String messageControlMSH = "";                                  // Data 10
    String processingMSH = "";                                      // Data 11
    String versionMSH = "";                                         // Data 12
    String sequenceMSH = "";                                        // Data 13
    String continuationMSH = "";                                    // Data 14
    String acceptAcknowlegmentMSH = "";                             // Data 15
    String applicaAcknowlegmentMSH = "";                            // Data 16
    String countryCodeMSH = "";                                     // Data 17
    String characterSetMSH = "";                                    // Data 18
    String principalLanguageMSH = "";                               // Data 19

    //              1                      2                     3                      4                       5                       6                         7
    MSHFullBLI = seperatorMSH + "|" + encodeCharacMSH + "|" + sendAppliMSH + "|" + sendFacilityMSH + "|" + recieveAppliMSHBLI + "|" + recieveFacilityMSH + "|" + currentDateMSH + "|"
            + //            8                    9                     10                       11                    12                    13                  14                        15
            securityMSH + "|" + messageTypeMSH + "|" + messageControlMSH + "|" + processingMSH + "|" + versionMSH + "|" + sequenceMSH + "|" + continuationMSH + "|" + acceptAcknowlegmentMSH + "|"
            + //             16                           17                    18                          19                                        21                          22  
            applicaAcknowlegmentMSH + "|" + countryCodeMSH + "|" + characterSetMSH + "|" + principalLanguageMSH;

    //              1                      2                     3                      4                       5                       6                         7
    MSHFullDDR = seperatorMSH + "|" + encodeCharacMSH + "|" + sendAppliMSH + "|" + sendFacilityMSH + "|" + recieveAppliMSHDDR + "|" + recieveFacilityMSH + "|" + currentDateMSH + "|"
            + //            8                    9                     10                       11                    12                    13                  14                        15
            securityMSH + "|" + messageTypeMSH + "|" + messageControlMSH + "|" + processingMSH + "|" + versionMSH + "|" + sequenceMSH + "|" + continuationMSH + "|" + acceptAcknowlegmentMSH + "|"
            + //             16                           17                    18                          19                                        21                          22  
            applicaAcknowlegmentMSH + "|" + countryCodeMSH + "|" + characterSetMSH + "|" + principalLanguageMSH;

    out.print(MSHFullBLI + "<cr>#" + MSHFullDDR + "<cr>");

%>
