/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
Ardhi Surya; rdsurya147@gmail.com; @rdcfc
 */
package RIS_helper;

import dBConn.Conn;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class EHRMessageSender {

    protected String userID;
    protected String hfc;
    private String dis;
    private String subdis;
    protected String pmiNo;
    protected String orderNo;
    private String orderDate;
    private String episodeDate;
    private String encounterDate;
    protected Conn conn;

    public EHRMessageSender(String userID, String hfc, String dis, String subdis, String pmiNo, String orderNo, String orderDate, String episodeDate, String encounterDate) {

        this.userID = userID;
        this.hfc = hfc;
        this.dis = dis;
        this.subdis = subdis;
        this.pmiNo = pmiNo;
        this.orderNo = orderNo;
        this.orderDate = orderDate;
        this.episodeDate = episodeDate;
        this.encounterDate = encounterDate;
        this.conn = new Conn();

    }

    public String getMSH(String senderApp, String receiverApp) {
        String MSH = "";

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        String seperatorMSH = "MSH";                                    // Data 1
        String encodeCharacMSH = "^~";                                  // Data 2
        String sendAppliMSH = senderApp;//"06";                        // Data 3 change here for sender: 06-RIS
        String sendFacilityMSH = hfc + "^" + dis + "^" + subdis;        // Data 4
        String recieveAppliMSH = receiverApp; //"08";                   // Data 5 change here for receiever: 08-billing 14-LHR
        String recieveFacilityMSH = hfc + "^" + dis + "^" + subdis;     // Data 6
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
        MSH = seperatorMSH + "|" + encodeCharacMSH + "|" + sendAppliMSH + "|" + sendFacilityMSH + "|" + recieveAppliMSH + "|" + recieveFacilityMSH + "|" + currentDateMSH + "|"
                + //            8                    9                     10                       11                    12                    13                  14                        15
                securityMSH + "|" + messageTypeMSH + "|" + messageControlMSH + "|" + processingMSH + "|" + versionMSH + "|" + sequenceMSH + "|" + continuationMSH + "|" + acceptAcknowlegmentMSH + "|"
                + //             16                           17                    18                          19                                        21                          22  
                applicaAcknowlegmentMSH + "|" + countryCodeMSH + "|" + characterSetMSH + "|" + principalLanguageMSH + "|";

        return (MSH + "<cr>\n");
    }

    //======================================================== get MSH end ===================================================================================
    public String getPDI() {
        String PDI = "";

        String sqlPatient = "SELECT PMI_NO,PATIENT_NAME,OLD_IC_NO,NEW_IC_NO,ID_TYPE,ID_NO,SEX_CODE,BIRTH_DATE,RACE_CODE,MARITAL_STATUS_CODE,"
                + "RELIGION_CODE,NATIONALITY,HOME_ADDRESS,POSTAL_TOWN_CODE,POSTAL_DISTRICT_CODE,POSTAL_STATE_CODE,POSTAL_COUNTRY_CODE,"
                + "POSTAL_POSTCODE,HOME_PHONE,MOBILE_PHONE,EMAIL_ADDRESS FROM pms_patient_biodata WHERE pmi_no = '" + pmiNo + "' LIMIT 1";
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
        //String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");     // Data 25

        int size = dataPDI.size();
        for (int i = 0; i < size; i++) {
            // Variable PDI
            pmiNoPDI = dataPDI.get(i).get(0);                               // Data 1
            namePDI = dataPDI.get(i).get(1);                                // Data 2
            oldICPDI = dataPDI.get(i).get(2);                               // Data 3
            newICPDI = dataPDI.get(i).get(3);                               // Data 4
            idTypePDI = dataPDI.get(i).get(4);                              // Data 5
            idNoPDI = dataPDI.get(i).get(5);                                // Data 6
            sexPDI = dataPDI.get(i).get(6);                                 // Data 7
            DOBPDI = dataPDI.get(i).get(7);                                 // Data 8
            racePDI = dataPDI.get(i).get(8);                                // Data 9
            maritialPDI = dataPDI.get(i).get(9);                            // Data 10
            religionPDI = dataPDI.get(i).get(10);                            // Data 11
            nationPDI = dataPDI.get(i).get(11);                              // Data 12
            addressPDI = dataPDI.get(i).get(12);                             // Data 13
            address2PDI = "";                                                           // Data 14
            address3PDI = "";                                                           // Data 15
            townPDI = dataPDI.get(i).get(13);                                // Data 16
            districtPDI = dataPDI.get(i).get(14);                            // Data 17
            statePDI = dataPDI.get(i).get(15);                               // Data 18
            countryPDI = dataPDI.get(i).get(16);                             // Data 19
            postcodePDI = dataPDI.get(i).get(17);                            // Data 20
            homeNoPDI = dataPDI.get(i).get(18);                              // Data 21
            officeNoPDI = "";                                                           // Data 22
            mobileNoPDI = dataPDI.get(i).get(19);                            // Data 23
            emailPDI = dataPDI.get(i).get(20);                               // Data 24
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
        PDI = headPDI + "|" + pmiNoPDI + "|" + namePDI + "|" + newICPDI + "|" + oldICPDI + "|" + idTypePDI + "|" + idNoPDI + "|" + sexPDI + "|" + DOBPDI + "|" + racePDI + "|" + maritialPDI + "|"
                + //          11                  12               13                  14                  15                16               17                   18              19                        
                religionPDI + "|" + nationPDI + "|" + addressPDI + "|" + address2PDI + "|" + address3PDI + "|" + townPDI + "|" + districtPDI + "|" + statePDI + "|" + countryPDI + "|"
                + //          20                  21                22                 23                 24
                postcodePDI + "|" + homeNoPDI + "|" + officeNoPDI + "|" + mobileNoPDI + "|" + emailPDI + "|";

        //out.print(PDIFinal + "<cr>");
        return (PDI + "<cr>\n");
    }
    // ====================================================================================== end get PDI ====================================================

    public String getORC(String txn_code, String senderApp, String receiverApp) {
        String ORC = "";

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        String headORC = "ORC";                           // Data 0
        String transactionORC = txn_code; //"T12113";                 // Data 1,T12113 code for billing transaction or T12202 for radiology response
        String orderNoORC = orderNo;                      // Data 2
        String fillerOrderNoORC = "";                     // Data 3
        String orderStatusORC = "NO";                     // Data 4
        String orderPriorityORC = "NORMAL";               // Data 5
        String orderDateORC = orderDate;         // Data 6

        String episodeDateORC = episodeDate;                 // Data 7
        String encounterDateORC = encounterDate;               // Data 8
        String enteredByORC = userID;                      // Data 9
        String verifiedByORC = userID;                     // Data 10
        String designationORC = "";                        // Data 11
        String orderHFCORC = hfc;                    // Data 12
        String orderDispORC = dis;                   // Data 13
        String orderSubDispORC = subdis;                // Data 14

        String orderApplicationORC = senderApp; //"06";            // Data 15 I change here from 04-PIS to 06-RIS sender app
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
        String providerApplicationORC = receiverApp; //"08";         // Data 29 change here for receiver app: 08-billing(FAR), 14-LHR
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

            orderHFCAddress1ORC = dataORDERHFCDETAILS.get(i).get(0);
            orderHFCAddress2ORC = dataORDERHFCDETAILS.get(i).get(1);
            orderHFCAddress3ORC = dataORDERHFCDETAILS.get(i).get(2);
            orderHFCTownORC = dataORDERHFCDETAILS.get(i).get(3);
            orderHFCDistrictORC = dataORDERHFCDETAILS.get(i).get(4);
            orderHFCStateORC = dataORDERHFCDETAILS.get(i).get(5);
            orderHFCCountryORC = dataORDERHFCDETAILS.get(i).get(6);
            orderHFCPostcodeORC = dataORDERHFCDETAILS.get(i).get(7);
            orderHFCPhoneNoORC = dataORDERHFCDETAILS.get(i).get(8);

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
        ORC = headORC + "|" + transactionORC + "|" + orderNoORC + "|" + fillerOrderNoORC + "|" + orderStatusORC + "|" + orderPriorityORC + "|" + orderDateORC + "|"
                + //              7                      8                    9                     10                    11                    12                    13                  14          
                episodeDateORC + "|" + encounterDateORC + "|" + enteredByORC + "|" + verifiedByORC + "|" + designationORC + "|" + orderHFCORC + "|" + orderDispORC + "|" + orderSubDispORC + "|"
                + //              15                          16                           17                         18                          19                        20                        21                          22  
                orderApplicationORC + "|" + orderHFCADMPhoneNoORC + "|" + orderHFCAddress1ORC + "|" + orderHFCAddress2ORC + "|" + orderHFCAddress3ORC + "|" + orderHFCTownORC + "|" + orderHFCDistrictORC + "|" + orderHFCStateORC + "|"
                + //                        
                orderHFCCountryORC + "|" + orderHFCPostcodeORC + "|" + orderHFCPhoneNoORC + "|" + providerHFCORC + "|" + providerDispORC + "|" + providerSubDispORC + "|" + providerApplicationORC + "|" + providerHFCAddress1ORC + "|"
                + //          
                providerHFCAddress2ORC + "|" + providerHFCAddress3ORC + "|" + providerHFCTownORC + "|" + providerHFCDistrictORC + "|" + providerHFCStateORC + "|" + providerHFCCountryORC + "|" + providerHFCPostcodeORC + "|" + providerHFCPhoneNoORC + "|" + commentORC + "|";

        //out.print(ORCFinal + "<cr>");
        return (ORC + "<cr>\n");
    }
//==================================================== end getORC ==============================================================================

    public void insertIntoEHR_FAR(String senderApp) {

        RMIConnector rmic = new RMIConnector();

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        /*Sender app varies from 04-PIS, 05-LIS, 06-RIS 
        but receiver App is here is remain the same: 08-Billing  */
        String MSH_PDI_ORC = getMSH(senderApp, "08") + getPDI() + getORC("T12113", senderApp, "08");

        String FullEHRHeader = "";

        // Requesting Parameter
        //String pmino = request.getParameter("pmino");
        //String EHRFirstHeader = request.getParameter("EHRFirstHeader");
        //String EHRSecondHeader = request.getParameter("EHRSecondHeader");
        String EHRSecondHeader = "";

        String eachDetail = "BLI|T^|CH|||||||<cr>\n";
        //                                     0                    1                       2                   3               4
        String sqlGetOrderDetail = "Select rod.procedure_cd, rpm.ris_procedure_name, rpm.selling_price, rod.created_by, rod.created_date "
                + "from ris_order_detail rod "
                + "left join ris_procedure_master rpm on rod.procedure_cd = rpm.ris_procedure_cd AND rpm.hfc_cd = '" + hfc + "' "
                + "where rod.order_status = '2' AND rod.order_no = '" + orderNo + "';";
        ArrayList<ArrayList<String>> dataOrderDetail = conn.getData(sqlGetOrderDetail);

        if (dataOrderDetail.size() < 1) {
            EHRSecondHeader = eachDetail;
        } else {
            for (int i = 0; i < dataOrderDetail.size(); i++) {
                eachDetail = "BLI"
                        + "|T^" + format.format(now)
                        + "|CH"
                        + "|" + pmiNo
                        + "|" + dataOrderDetail.get(i).get(0)
                        + "|" + dataOrderDetail.get(i).get(1)
                        + "|" + dataOrderDetail.get(i).get(2)
                        + "|1"
                        + "|" + dataOrderDetail.get(i).get(3)
                        + "|" + dataOrderDetail.get(i).get(4)
                        + "|<cr>\n";
                EHRSecondHeader = EHRSecondHeader + eachDetail;
            }//end for

        }

        FullEHRHeader = MSH_PDI_ORC + EHRSecondHeader;

//        String CENTRAL_CODE = "";                       // Date 1
        String PMI_NO = pmiNo;                          // Date 2
//        String C_TXNDATE = format.format(now);          // Date 3
        String C_TxnData = FullEHRHeader;               // Date 4
//        String STATUS = "0";                            // Date 5
//        String STATUS_1 = "0";                          // Date 6
//        String STATUS_2 = "0";                          // Date 7
//        String STATUS_3 = "0";                          // Date 8
//        String STATUS_4 = "0";                          // Date 9
//        String STATUS_5 = "0";                          // Date 10

        //int tempCENTRAL_CODE = 0;
        // Get Max Code Start
//        String sqlCentralCode = "select MAX(CENTRAL_CODE) FROM  ehr_central";
//        ArrayList<ArrayList<String>> dataCENTRALCODE = conn.getData(sqlCentralCode);
//
//        int sizeCENTRALCODE = dataCENTRALCODE.size();
//        for (int i = 0; i < sizeCENTRALCODE; i++) {
//            tempCENTRAL_CODE = Integer.parseInt(dataCENTRALCODE.get(i).get(0).toString());
//        }
//        // Get Max Code End
//
//        // Generate Centarl Code
//        CENTRAL_CODE = String.valueOf(tempCENTRAL_CODE + 1);
        // Insert Into EHR Central
        String sqlInsert = "INSERT INTO ehr_central (CENTRAL_CODE,PMI_NO,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5) "
                + "Select (max(CENTRAL_CODE)+1), '" + PMI_NO + "', now(), '" + C_TxnData + "', '0', '0', '0', '0', '0', '0' "
                + "from ehr_central;";

        rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        String sqlUpdateBillingStatus = "Update ris_order_master set billing_status = '2' Where order_no = '" + orderNo + "';";

        rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateBillingStatus);

    }

//====================================================== end insert EHR FAR ============================================================================
    public void insertIntoEHR_LHR(String senderApp, String bodySystemCode, String modalityCode, String procedureCode) {

        RMIConnector rmic = new RMIConnector();

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        /*================================================================
        Sender app varies from 04-PIS, 05-LIS, 06-RIS 
        but receiver App is here is remain the same: 14-LHR(data warehouse)  
        Transaction code is T12202 for RIS response report
        ==================================================================*/
        String MSH_PDI_ORC = getMSH(senderApp, "14") + getPDI() + getORC("T12202", senderApp, "14");

        String FullEHRHeader = "";

        String EHRSecondHeader = "";

        /*==============RSS format========================
        RSS|
        1<investigation test code>^<investigation test name>^<coding standard(ICD10-PCS)>|
        2<imaging report code>^<imaging report name>^<coding standard(UD)>|  --for time being, let it empty
        3<perform by id>^<perform by name>^<UD>|
        4<date perform>|
        5<report provided by id>^<report provided by name>^<UD>|
        6<report date>|
        7<report notes>|
        <cr>
        =================================================*/
        String eachDetail = "RSS||||||||<cr>\n";

        
        //                                     0                    1                       2             3               4             5                   6
        String sqlGetResultDetail = "select rrd.procedure_cd, rpm.ris_procedure_name, rrd.created_by, au.USER_NAME, rod.exam_date, rrd.created_date, rrd.filler_comments "
                + "from ris_result_detail rrd "
                + "left join ris_order_detail rod on rrd.order_no = rod.order_no AND rrd.body_system_cd = rod.body_system_cd AND rrd.modality_cd = rod.modality_cd AND rrd.procedure_cd = rod.procedure_cd "
                + "left join ris_procedure_master rpm on rrd.procedure_cd = rpm.ris_procedure_cd AND rpm.hfc_cd = '"+hfc+"' "
                + "left join adm_users au on rrd.created_by = au.USER_ID "
                + "where rrd.result_status = '2' AND rrd.order_no = '"+orderNo+"' AND rrd.body_system_cd = '"+bodySystemCode+"' AND rrd.modality_cd='"+modalityCode+"' AND rrd.procedure_cd = '"+procedureCode+"';";
        
        ArrayList<ArrayList<String>> dataResultDetail = conn.getData(sqlGetResultDetail);

        if (dataResultDetail.size() < 1) {
            EHRSecondHeader = eachDetail;
        } else {
            
            eachDetail = "RRS"
                    + "| "+dataResultDetail.get(0).get(0)+" ^ "+dataResultDetail.get(0).get(1)+" ^ ICD10-PCS "
                    + "| ^ ^ "
                    + "| "+dataResultDetail.get(0).get(2)+" ^ "+dataResultDetail.get(0).get(3)+" ^ UD "
                    + "| "+dataResultDetail.get(0).get(4)
                    + "| "+dataResultDetail.get(0).get(2)+" ^ "+dataResultDetail.get(0).get(3)+" ^ UD "
                    + "| "+dataResultDetail.get(0).get(5)
                    + "| "+dataResultDetail.get(0).get(6)
                    + "|<cr>\n";
            
            EHRSecondHeader = eachDetail;
        }

        FullEHRHeader = MSH_PDI_ORC + EHRSecondHeader;

//        String CENTRAL_CODE = "";                       // Date 1
        String PMI_NO = pmiNo;                          // Date 2
//        String C_TXNDATE = format.format(now);          // Date 3
        String C_TxnData = FullEHRHeader;               // Date 4

        // Insert Into EHR Central
        String sqlInsert = "INSERT INTO ehr_central (CENTRAL_CODE,PMI_NO,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5) "
                + "Select (max(CENTRAL_CODE)+1), '" + PMI_NO + "', now(), '" + C_TxnData + "', '1', '0', '0', '0', '0', '0' "
                + "from ehr_central;";

        rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);


    }

}
