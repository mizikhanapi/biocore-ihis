<%-- 
    Document   : patientOrderListDetailDispenseEHRCentralGetPDIFinal
    Created on : Apr 21, 2017, 3:13:39 PM
    Author     : Shammugam
--%>

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
    String pmiNo = request.getParameter("pmiNo");
    String PDIFinal = "";

    String sqlPatient = "SELECT PMI_NO,PATIENT_NAME,OLD_IC_NO,NEW_IC_NO,ID_TYPE,ID_NO,SEX_CODE,BIRTH_DATE,RACE_CODE,MARITAL_STATUS_CODE,"
            + "RELIGION_CODE,NATIONALITY,HOME_ADDRESS,POSTAL_TOWN_CODE,POSTAL_DISTRICT_CODE,POSTAL_STATE_CODE,POSTAL_COUNTRY_CODE,"
            + "POSTAL_POSTCODE,HOME_PHONE,MOBILE_PHONE,EMAIL_ADDRESS FROM pms_patient_biodata WHERE pmi_no = '" + pmiNo + "'";
    ArrayList<ArrayList<String>> dataPDI = conn.getData(sqlPatient);

    // Variable PDI
    String headPDI = "PDI";                                                 // Data 0
    String pmiNoPDI = "";                                                   // Data 1
    String namePDI = "";                                                    // Data 2
    String oldICPDI = "";                                                   // Data 3
    String newICPDI = "";                                                   // Data 4
    String idTypePDI = "";                                                  // Data 5
    String idNoPDI = "";                                                    // Data 6
    String sexPDI = "";                                                     // Data 7
    String DOBPDI = "";                                                     // Data 8
    String racePDI = "";                                                    // Data 9
    String maritialPDI = "";                                                // Data 10
    String religionPDI = "";                                                // Data 11
    String nationPDI = "";                                                  // Data 12
    String addressPDI = "";                                                 // Data 13
    String address2PDI = "";                                                // Data 14
    String address3PDI = "";                                                // Data 15
    String townPDI = "";                                                    // Data 16
    String districtPDI = "";                                                // Data 17
    String statePDI = "";                                                   // Data 18
    String countryPDI = "";                                                 // Data 19
    String postcodePDI = "";                                                // Data 20
    String homeNoPDI = "";                                                  // Data 21
    String officeNoPDI = "";                                                // Data 22
    String mobileNoPDI = "";                                                // Data 23
    String emailPDI = "";                                                   // Data 24
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");     // Data 25

    int size = dataPDI.size();
    for (int i = 0; i < size; i++) {
        // Variable PDI
        pmiNoPDI = dataPDI.get(i).get(0).toString();                               // Data 1
        namePDI = dataPDI.get(i).get(1).toString();                                // Data 2
        oldICPDI = dataPDI.get(i).get(2).toString();                               // Data 3
        newICPDI = dataPDI.get(i).get(3).toString();                               // Data 4
        idTypePDI = dataPDI.get(i).get(4).toString();                              // Data 5
        idNoPDI = dataPDI.get(i).get(5).toString();                                // Data 6
        sexPDI = dataPDI.get(i).get(6).toString();                                 // Data 7
        DOBPDI = dataPDI.get(i).get(7).toString();                                 // Data 8
        racePDI = dataPDI.get(i).get(8).toString();                                // Data 9
        maritialPDI = dataPDI.get(i).get(9).toString();                            // Data 10
        religionPDI = dataPDI.get(i).get(10).toString();                            // Data 11
        nationPDI = dataPDI.get(i).get(11).toString();                              // Data 12
        addressPDI = dataPDI.get(i).get(12).toString();                             // Data 13
        address2PDI = "";                                                           // Data 14
        address3PDI = "";                                                           // Data 15
        townPDI = dataPDI.get(i).get(13).toString();                                // Data 16
        districtPDI = dataPDI.get(i).get(14).toString();                            // Data 17
        statePDI = dataPDI.get(i).get(15).toString();                               // Data 18
        countryPDI = dataPDI.get(i).get(16).toString();                             // Data 19
        postcodePDI = dataPDI.get(i).get(17).toString();                            // Data 20
        homeNoPDI = dataPDI.get(i).get(18).toString();                              // Data 21
        officeNoPDI = "";                                                           // Data 22
        mobileNoPDI = dataPDI.get(i).get(19).toString();                            // Data 23
        emailPDI = dataPDI.get(i).get(20).toString();                               // Data 24
    }

    // Update ID Type Start
    String sqlIdType = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0012' AND Detail_Reference_code = '" + idTypePDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataIDTYPE = conn.getData(sqlIdType);

    int sizeIDTYPE = dataIDTYPE.size();
    for (int i = 0; i < sizeIDTYPE; i++) {
        idTypePDI = String.join("^", dataIDTYPE.get(i));
    }
    // Update ID Type End

    // Update Sex Start
    String sqlSex = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0041' AND Detail_Reference_code = '" + sexPDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataSEX = conn.getData(sqlSex);

    int sizeSEX = dataSEX.size();
    for (int i = 0; i < sizeSEX; i++) {
        sexPDI = String.join("^", dataSEX.get(i));
    }
    // Update Sex End

    // Update Race Start
    String sqlRace = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0004' AND Detail_Reference_code = '" + racePDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataRACE = conn.getData(sqlRace);

    int sizeRACE = dataRACE.size();
    for (int i = 0; i < sizeRACE; i++) {
        racePDI = String.join("^", dataRACE.get(i));
    }
    // Update Race End

    // Update Maritial Start
    String sqlMaritial = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0006' AND Detail_Reference_code = '" + maritialPDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataMARITIAL = conn.getData(sqlMaritial);

    int sizeMARITIAL = dataMARITIAL.size();
    for (int i = 0; i < sizeMARITIAL; i++) {
        maritialPDI = String.join("^", dataMARITIAL.get(i));
    }
    // Update Maritial End

    // Update Religion Start
    String sqlReligion = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0005' AND Detail_Reference_code = '" + religionPDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataRELIGION = conn.getData(sqlReligion);

    int sizeRELIGION = dataRELIGION.size();
    for (int i = 0; i < sizeRELIGION; i++) {
        religionPDI = String.join("^", dataRELIGION.get(i));
    }
    // Update Religion End

    // Update Nation Start
    String sqlNation = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0011' AND Detail_Reference_code = '" + nationPDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataNATION = conn.getData(sqlNation);

    int sizeNATION = dataNATION.size();
    for (int i = 0; i < sizeNATION; i++) {
        nationPDI = String.join("^", dataNATION.get(i));
    }
    // Update Nation End

    // Update Town Start
    String sqlTown = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0003' AND Detail_Reference_code = '" + townPDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataTOWN = conn.getData(sqlTown);

    int sizeTOWN = dataTOWN.size();
    for (int i = 0; i < sizeTOWN; i++) {
        townPDI = String.join("^", dataTOWN.get(i));
    }
    // Update Town End

    // Update District Start
    String sqlDistrict = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0078' AND Detail_Reference_code = '" + districtPDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataDISTRICT = conn.getData(sqlDistrict);

    int sizeDISTRICT = dataDISTRICT.size();
    for (int i = 0; i < sizeDISTRICT; i++) {
        districtPDI = String.join("^", dataDISTRICT.get(i));
    }
    // Update District End

    // Update State Start
    String sqlState = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0002' AND Detail_Reference_code = '" + statePDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataSTATE = conn.getData(sqlState);

    int sizeSTATE = dataSTATE.size();
    for (int i = 0; i < sizeSTATE; i++) {
        statePDI = String.join("^", dataSTATE.get(i));
    }
    // Update State End

    // Update Country Start
    String sqlCountry = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0001' AND Detail_Reference_code = '" + countryPDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataCOUNTRY = conn.getData(sqlCountry);

    int sizeCOUNTRY = dataCOUNTRY.size();
    for (int i = 0; i < sizeCOUNTRY; i++) {
        countryPDI = String.join("^", dataCOUNTRY.get(i));
    }
    // Update Country End

    // Update Postcode Start
    String sqlPostcode = "select Master_Reference_code,Detail_Reference_code,Description FROM adm_lookup_detail "
            + "where Master_Reference_code = '0079' AND Detail_Reference_code = '" + postcodePDI + "' AND hfc_cd = '" + hfc + "'";
    ArrayList<ArrayList<String>> dataPOSTCODE = conn.getData(sqlPostcode);

    int sizePOSTCODE = dataPOSTCODE.size();
    for (int i = 0; i < sizePOSTCODE; i++) {
        postcodePDI = String.join("^", dataPOSTCODE.get(i));
    }
    // Update Postcode End

    //             0              1                 2               3               4                5                 6              7              8               9               10            
    PDIFinal = headPDI + "|" + pmiNoPDI + "|" + namePDI + "|" + newICPDI + "|" + oldICPDI + "|" + idTypePDI + "|" + idNoPDI + "|" + sexPDI + "|" + DOBPDI + "|" + racePDI + "|" + maritialPDI + "|"+ 
    //          11                  12               13                  14                  15                16               17                   18              19                        
            religionPDI + "|" + nationPDI + "|" + addressPDI + "|" + address2PDI + "|" + address3PDI + "|" + townPDI + "|" + districtPDI + "|" + statePDI + "|" + countryPDI + "|"+ 
    //          20                  21                22                 23                 24
            postcodePDI + "|" + homeNoPDI + "|" + officeNoPDI + "|" + mobileNoPDI + "|" + emailPDI;

    out.print(PDIFinal+"<cr>");

%>
