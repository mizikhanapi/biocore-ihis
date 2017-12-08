/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADT_helper;

import RIS_helper.EHRMessageSender;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class ADT_EHRMessenger extends EHRMessageSender {

    public ADT_EHRMessenger(String userID, String hfc, String dis, String subdis, String pmiNo, String orderNo, String orderDate, String episodeDate, String encounterDate) {
        super(userID, hfc, dis, subdis, pmiNo, orderNo, orderDate, episodeDate, encounterDate);
    }

    public boolean sendWardCharge(String[] arrCode, String[] arrName, String[] arrDay, String[] arrAmount) {
        /*
            Use this method to send charges to EHR
         */
        boolean success = false;

        RMIConnector rmic = new RMIConnector();

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        /*Sender app varies from 04-PIS, 05-LIS, 06-RIS, 18-POM, 07-ADT 
        but receiver App is here is remain the same: 08-Billing  */
        String MSH_PDI_ORC = getMSH("07", "08") + getPDI() + getORC("T12113", "07", "08");

        String FullEHRHeader = "";

        String EHRSecondHeader = "";

        String eachDetail = "BLI|T^|CH|||||||<cr>\n";

        for (int i = 0; i < arrCode.length; i++) {
            eachDetail = "BLI"
                    + "|T^" + format.format(now) // when to charge
                    + "|CH" //charge type
                    + "|" + pmiNo // account
                    + "|CHG:" + arrCode[i] //item code
                    + "|Charge for Ward: " + arrName[i] //item name
                    + "|" + arrAmount[i] //selling price
                    + "|" + arrDay[i] // amount
                    + "|" + userID // creator
                    + "|" + format.format(now) //created date
                    + "|<cr>\n";
            EHRSecondHeader = EHRSecondHeader + eachDetail;

        }//end for loop

        FullEHRHeader = MSH_PDI_ORC + EHRSecondHeader;

        String PMI_NO = pmiNo;                          // Date 2

        String C_TxnData = FullEHRHeader;               // Date 4

        // Insert Into EHR Central
        String sqlInsert = "INSERT INTO ehr_central (CENTRAL_CODE,PMI_NO,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5) "
                + "Select (max(CENTRAL_CODE)+1), '" + PMI_NO + "', now(), '" + C_TxnData + "', '0', '0', '0', '0', '0', '0' "
                + "from ehr_central;";

        success = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return success;
    }

    public boolean sendWardDeposit(String itemCode, String itemName, String itemPrice) {
        /*
            Use this method the send ward deposit only.
         */

        boolean success = false;

        RMIConnector rmic = new RMIConnector();

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();

        /*Sender app varies from 04-PIS, 05-LIS, 06-RIS, 18-POM, 07-ADT 
        but receiver App is here is remain the same: 08-Billing  */
        String MSH_PDI_ORC = getMSH("07", "08") + getPDI() + getORC("T12113", "07", "08");

        String FullEHRHeader = "";

        String EHRSecondHeader = "";

        String eachDetail = "BLI|T^|CH|||||||<cr>\n";

        eachDetail = "BLI"
                + "|T^" + format.format(now) // when to charge
                + "|CH" //charge type
                + "|" + pmiNo // account
                + "|DEP:" + itemCode //item code
                + "|Deposit for Ward: " + itemName //item name
                + "|" + itemPrice //selling price
                + "|1" // amount
                + "|" + userID // creator
                + "|" + format.format(now) //created date
                + "|<cr>\n";
        EHRSecondHeader = EHRSecondHeader + eachDetail;

        FullEHRHeader = MSH_PDI_ORC + EHRSecondHeader;

        String PMI_NO = pmiNo;                          // Date 2

        String C_TxnData = FullEHRHeader;               // Date 4

        // Insert Into EHR Central
        String sqlInsert = "INSERT INTO ehr_central (CENTRAL_CODE,PMI_NO,C_TXNDATE,C_TxnData,STATUS,STATUS_1,STATUS_2,STATUS_3,STATUS_4,STATUS_5) "
                + "Select (max(CENTRAL_CODE)+1), '" + PMI_NO + "', now(), '" + C_TxnData + "', '0', '0', '0', '0', '0', '0' "
                + "from ehr_central;";

        success = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return success;
    }

}
