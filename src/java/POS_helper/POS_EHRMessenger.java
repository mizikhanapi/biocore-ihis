/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
Ardhi Surya; rdsurya147@gmail.com; @rdcfc
 */
package POS_helper;

import RIS_helper.EHRMessageSender;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class POS_EHRMessenger extends EHRMessageSender {
    
    public POS_EHRMessenger(String userID, String hfc, String dis, String subdis, String pmiNo, String orderNo, String orderDate, String episodeDate, String encounterDate) {
        super(userID, hfc, dis, subdis, pmiNo, orderNo, orderDate, episodeDate, encounterDate);
    }

    public void insertIntoEHR_LHR(String senderApp, String procedureCode, String procedureName, String userName, String hfcName, String episodeDate, String durationMin, String comments, String outcome) {
        RMIConnector rmic = new RMIConnector();

        DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String timeStamp = timeFormat.format(now);

        /*================================================================
        Sender app varies from 04-PIS, 05-LIS, 06-RIS , 18-POS
        but receiver App is here is remain the same: 14-LHR(data warehouse)  
        Transaction code is T12202 for RIS response report
        ==================================================================*/
        String MSH_PDI_ORC = getMSH(senderApp, "14") + getPDI() + getORC("T12203", senderApp, "14");

        String FullEHRHeader = "";

        String EHRSecondHeader = "";

        /*==============Old ARP format========================
        ARP|
        1<procedure code>^<procedure name>^<coding standard(iHIS)>|
        2<actual date/time dd/mm/yyyy hh:mm:ss>|  
        3<Procedure duration in whole minutes>|
        4<diagnosis code>| -- let empty first
        5<doctor ID/ user id>|
        6<doctor name / user name>|
        7<location code>|
        8<location name>|
        9<doctor notes/ comment>|
        10<receiving hfc code>|
        11<episode date>|
        <cr>
        =================================================*/
        
        /*================ ARP format 12/9/2017===========
        ARP|
        1<procedure code>^<procedure name>^<coding standard (iHIS)>| 
        2<actual date/time dd/mm/yyyy hh:mm:ss>| 
        3<Procedure duration in whole minutes>|
        4<diagnosis code>| -- let empty first
        5<doctor ID/ user id>|
        6<doctor name / user name>|
        7<location code>|
        8<location name>|
        9<doctor notes/ comment>|
       10<receiving hfc code>|
       11<episode date>|
       12<procedure outcome>|
        <cr>
        ================================================*/
        String eachDetail = "ARP||||||||||||<cr>\n";

              
            
        eachDetail = "ARP"
                + "| "+procedureCode+" ^ "+procedureName+" ^ iHIS "
                + "| "+timeStamp +" "
                + "| "+durationMin +" "
                + "| unknown "
                + "| "+userID +" "
                + "| "+userName + " "
                + "| "+hfc + " "
                + "| "+ hfcName +" "
                + "| "+comments +" "
                + "| "+hfc +" "
                + "| "+ episodeDate +" "
                + "| "+ outcome +" "
                + "|<cr>\n";

        EHRSecondHeader = eachDetail;
        

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

    @Override
    public void insertIntoEHR_FAR(String senderApp) {
        RMIConnector rmic = new RMIConnector();

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        /*Sender app varies from 04-PIS, 05-LIS, 06-RIS, 18-POM 
        but receiver App is here is remain the same: 08-Billing  */
        String MSH_PDI_ORC = getMSH(senderApp, "08") + getPDI() + getORC("T12113", senderApp, "08");

        String FullEHRHeader = "";

        
        String EHRSecondHeader = "";

        String eachDetail = "BLI|T^|CH|||||||<cr>\n";
        //                                     0               1                   2 
        String sqlGetOrderDetail = "Select pod.procedure_cd, pod.DOCTOR_ID, pod.ENCOUNTER_DATE "
                + "from pos_order_detail pod "
                //+ "left join ris_procedure_master rpm on rod.procedure_cd = rpm.ris_procedure_cd AND rpm.hfc_cd = '" + hfc + "' "
                + "where pod.order_status = '2' AND pod.order_no = '" + orderNo + "';";
        ArrayList<ArrayList<String>> dataOrderDetail = conn.getData(sqlGetOrderDetail);

        if (dataOrderDetail.size() < 1) {
            EHRSecondHeader = eachDetail;
        } else {
            for (int i = 0; i < dataOrderDetail.size(); i++) {
                
                OrderMaster om = new OrderMaster();
                String[] name_price = om.getProcedureDetail(dataOrderDetail.get(i).get(0), hfc);
                
                eachDetail = "BLI"
                        + "|T^" + format.format(now)            // when to charge
                        + "|CH"                                 //charge type
                        + "|" + pmiNo                           // account
                        + "|" + dataOrderDetail.get(i).get(0)  //procedure code
                        + "|" + name_price[0]                  //procedure name
                        + "|" + name_price[1]                  //selling price
                        + "|1"                                  // amount
                        + "|" + dataOrderDetail.get(i).get(1)   // creator
                        + "|" + dataOrderDetail.get(i).get(2)   //created date
                        + "|<cr>\n";
                EHRSecondHeader = EHRSecondHeader + eachDetail;
            }//end for

        }

        FullEHRHeader = MSH_PDI_ORC + EHRSecondHeader;


        String PMI_NO = pmiNo;                          // Date 2

        String C_TxnData = FullEHRHeader;               // Date 4

        // Insert Into EHR Central
        String sqlInsert = "INSERT INTO ehr_central (CENTRAL_CODE,PMI_NO,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5) "
                + "Select (max(CENTRAL_CODE)+1), '" + PMI_NO + "', now(), '" + C_TxnData + "', '0', '0', '0', '0', '0', '0' "
                + "from ehr_central;";

        rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        String sqlUpdateBillingStatus = "Update pos_order_master set billing_status = '2' Where order_no = '" + orderNo + "';";

        rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateBillingStatus);
    }
    
    
}
