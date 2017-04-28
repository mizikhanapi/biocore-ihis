<%-- 
    Document   : patientOrderListDetailDispenseEHRCentralGetORC
    Created on : Apr 16, 2017, 7:55:25 AM
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
    String orderNo = request.getParameter("orderNo");
    String orderDate = request.getParameter("orderDate");
    String userID = (String) session.getAttribute("USER_ID");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdis = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String ORCFinal = "";

    String headORC = "ORC";                           // Data 0
    String transactionORC = "T12113";                 // Data 1
    String orderNoORC = orderNo;                      // Data 2
    String fillerOrderNoORC = "";                     // Data 3
    String orderStatusORC = "NO";                     // Data 4
    String orderPriorityORC = "NORMAL";               // Data 5
    String orderDateORC = format.format(now);         // Data 6

    String episodeDateORC = orderDate;                 // Data 7
    String encounterDateORC = orderDate;               // Data 8
    String enteredByORC = userID;                      // Data 9
    String verifiedByORC = userID;                     // Data 10
    String designationORC = "";                        // Data 11
    String orderHFCORC = hfc;                    // Data 12
    String orderDispORC = dis;                   // Data 13
    String orderSubDispORC = subdis;                // Data 14
    
    String orderApplicationORC = "04";            // Data 15
    String orderHFCADMPhoneNoORC = "";          // Data 16
    String orderHFCAddress1ORC = "";            // Data 17
    String orderHFCAddress2ORC = "";            // Data 18
    String orderHFCAddress3ORC = "";            // Data 19
    String orderHFCTownORC = "";                // Data 20
    String orderHFCDistrictORC = "";            // Data 21
    String orderHFCStateORC = "";               // Data 22
    
    String orderHFCCountryORC = "";             // Data 23
    String orderHFCPostcodeORC = "";            // Data 24
    String orderHFCPhoneNoORC = "";             // Data 25
    String providerHFCORC = hfc;                 // Data 26
    String providerDispORC = dis;                // Data 27
    String providerSubDispORC = subdis;             // Data 28
    String providerApplicationORC = "08";         // Data 29
    String providerHFCAddress1ORC = "";         // Data 30
    
    String providerHFCAddress2ORC = "";         // Data 31
    String providerHFCAddress3ORC = "";         // Data 32
    String providerHFCTownORC = "";             // Data 33
    String providerHFCDistrictORC = "";         // Data 34
    String providerHFCStateORC = "";            // Data 35
    String providerHFCCountryORC = "";          // Data 36
    String providerHFCPostcodeORC = "";         // Data 37
    String providerHFCPhoneNoORC = "";          // Data 38
    String commentORC = "";                     // Data 39
    
    
    // Get HFC Simple Details Start
    String sqlOrderHfc = "select hfc_cd,hfc_name FROM adm_health_facility"
            + " where hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataORDERHFC = conn.getData(sqlOrderHfc);

    int sizeORDERHFC = dataORDERHFC.size();
    for (int i = 0; i < sizeORDERHFC; i++) {
        orderHFCORC = providerHFCORC = String.join("^", dataORDERHFC.get(i));
    }
    // Get HFC Simple Details End
    
    
    // Get DIS Details Start
    String sqlOrderDis = "select discipline_cd,discipline_name FROM adm_discipline"
            + " where discipline_cd = '" + dis + "'";
    ArrayList<ArrayList<String>> dataORDERDIS = conn.getData(sqlOrderDis);

    int sizeORDERDIS = dataORDERDIS.size();
    for (int i = 0; i < sizeORDERDIS; i++) {
        orderDispORC = providerDispORC = String.join("^", dataORDERDIS.get(i));
    }
    // Get DIS Details End
    
    
    // Get SUBDIS Details Start
    String sqlOrderSubDis = "select subdiscipline_cd,subdiscipline_name FROM adm_subdiscipline"
            + " where discipline_cd = '" + dis + "' AND subdiscipline_cd = '" + subdis + "'";
    ArrayList<ArrayList<String>> dataORDERSUBDIS = conn.getData(sqlOrderSubDis);

    int sizeORDERSUBDIS = dataORDERSUBDIS.size();
    for (int i = 0; i < sizeORDERSUBDIS; i++) {
        orderSubDispORC = providerSubDispORC = String.join("^", dataORDERSUBDIS.get(i));
    }
    // Get SUBDIS Details End
    
    
    
        // Get HFC Simple Details Start
    String sqlOrderHfcDetails = "select address1,address2,address3,town_cd,district_cd,state_cd,country_cd,postcode,telephone_no FROM adm_health_facility"
            + " where hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataORDERHFCDETAILS = conn.getData(sqlOrderHfcDetails);

    int sizeORDERHFCDETAILS = dataORDERHFCDETAILS.size();
    for (int i = 0; i < sizeORDERHFCDETAILS; i++) {
        
        orderHFCAddress1ORC = dataORDERHFCDETAILS.get(i).get(0).toString();
        orderHFCAddress2ORC = dataORDERHFCDETAILS.get(i).get(1).toString();    
        orderHFCAddress3ORC = dataORDERHFCDETAILS.get(i).get(2).toString();    
        orderHFCTownORC = dataORDERHFCDETAILS.get(i).get(3).toString();          
        orderHFCDistrictORC = dataORDERHFCDETAILS.get(i).get(4).toString();     
        orderHFCStateORC = dataORDERHFCDETAILS.get(i).get(5).toString();            
        orderHFCCountryORC = dataORDERHFCDETAILS.get(i).get(6).toString();           
        orderHFCPostcodeORC = dataORDERHFCDETAILS.get(i).get(7).toString();            
        orderHFCPhoneNoORC = dataORDERHFCDETAILS.get(i).get(8).toString();           
        
    }
    // Get HFC Simple Details End
    
    
    
        // Update Town Start
    String sqlTown = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0003' AND Detail_Reference_code = '" + orderHFCTownORC + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataTOWN = conn.getData(sqlTown);

    int sizeTOWN = dataTOWN.size();
    for (int i = 0; i < sizeTOWN; i++) {
        orderHFCTownORC = providerHFCTownORC = String.join("^", dataTOWN.get(i));
    }
    // Update Town End

    // Update District Start
    String sqlDistrict = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0078' AND Detail_Reference_code = '" + orderHFCDistrictORC + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataDISTRICT = conn.getData(sqlDistrict);

    int sizeDISTRICT = dataDISTRICT.size();
    for (int i = 0; i < sizeDISTRICT; i++) {
        orderHFCDistrictORC = providerHFCDistrictORC = String.join("^", dataDISTRICT.get(i));
    }
    // Update District End

    // Update State Start
    String sqlState = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0002' AND Detail_Reference_code = '" + orderHFCStateORC + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataSTATE = conn.getData(sqlState);

    int sizeSTATE = dataSTATE.size();
    for (int i = 0; i < sizeSTATE; i++) {
        orderHFCStateORC = providerHFCStateORC = String.join("^", dataSTATE.get(i));
    }
    // Update State End

    // Update Country Start
    String sqlCountry = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0001' AND Detail_Reference_code = '" + orderHFCCountryORC + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataCOUNTRY = conn.getData(sqlCountry);

    int sizeCOUNTRY = dataCOUNTRY.size();
    for (int i = 0; i < sizeCOUNTRY; i++) {
        orderHFCCountryORC = providerHFCCountryORC = String.join("^", dataCOUNTRY.get(i));
    }
    // Update Country End

    // Update Postcode Start
    String sqlPostcode = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0079' AND Detail_Reference_code = '" + orderHFCPostcodeORC + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataPOSTCODE = conn.getData(sqlPostcode);

    int sizePOSTCODE = dataPOSTCODE.size();
    for (int i = 0; i < sizePOSTCODE; i++) {
        orderHFCPostcodeORC = providerHFCPostcodeORC = String.join("^", dataPOSTCODE.get(i));
    }
    // Update Postcode End
    
    
    

    //             0                1                      2                     3                      4                       5                       6     
    ORCFinal = headORC + "|" + transactionORC + "|" + orderNoORC + "|" + fillerOrderNoORC + "|" + orderStatusORC + "|" + orderPriorityORC + "|" + orderDateORC + "|" + 
    //              7                      8                    9                     10                    11                    12                    13                  14          
            episodeDateORC + "|" + encounterDateORC + "|" + enteredByORC + "|" + verifiedByORC + "|" + designationORC + "|" + orderHFCORC + "|" + orderDispORC + "|" + orderSubDispORC + "|" +
    //              15                          16                           17                         18                          19                        20                        21                          22  
            orderApplicationORC+ "|" + orderHFCADMPhoneNoORC + "|" + orderHFCAddress1ORC + "|"+ orderHFCAddress2ORC + "|" + orderHFCAddress3ORC + "|" + orderHFCTownORC + "|" + orderHFCDistrictORC + "|" + orderHFCStateORC + "|" +
    //                        
            orderHFCCountryORC + "|" + orderHFCPostcodeORC + "|" + orderHFCPhoneNoORC + "|" + providerHFCORC + "|" + providerDispORC + "|" + providerSubDispORC + "|" + providerApplicationORC + "|" + providerHFCAddress1ORC + "|" + 
    //          
            providerHFCAddress2ORC + "|" + providerHFCAddress3ORC + "|" + providerHFCTownORC + "|" + providerHFCDistrictORC + "|" + providerHFCStateORC + "|" + providerHFCCountryORC + "|" + providerHFCPostcodeORC +"|" + providerHFCPhoneNoORC + "|" + commentORC;

    out.print(ORCFinal + "<cr>");

%>
