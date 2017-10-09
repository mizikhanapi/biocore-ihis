/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
Creator: Ardhi Surya; rdsurya147@gmail.com; insta:@rdcfc
 */
package OPT_helper;

import RIS_helper.EHRMessageSender;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class OPT_EHRMessageSender extends EHRMessageSender
{
    
    public OPT_EHRMessageSender(String userID, String hfc, String dis, String subdis, String pmiNo, String orderNo, String orderDate, String episodeDate, String encounterDate) {
        super(userID, hfc, dis, subdis, pmiNo, orderNo, orderDate, episodeDate, encounterDate);
    }

    @Override
    public void insertIntoEHR_LHR(String senderApp, String bodySystemCode, String modalityCode, String procedureCode) {
         //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void insertIntoEHR_FAR(String senderApp) {
         //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    public boolean isInsertIntoEHR_FAR(String senderApp){
        boolean isSuccess = true;
        
        RMIConnector rmic = new RMIConnector();
        
        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        
        /*Sender app varies from 04-PIS, 05-LIS, 06-RIS, 18-POM 
        but receiver App is here is remain the same: 08-Billing  */        
        String MSH_PDI_ORC = getMSH(senderApp, "08") + getPDI() + getORC("T12113", senderApp, "08");
        
        String FullEHRHeader = "";

        
        String EHRSecondHeader = "";

        String eachDetail = "BLI|T^|CH|||||||<cr>\n";
        //                                      0                   1                       2               3               4
        String sqlGetOrderDetail = "Select d.procedure_cd, p.`procedure_shortName`, p.selling_price, d.consultant_id, d.encounter_date "
                + "from opt_order_detail d "
                +"left join opt_procedure p on p.procedure_cd = d.procedure_cd and p.hfc_cd='"+hfc+"' "
                + "where d.order_status = '2' AND d.order_no = '"+orderNo+"';";
        
        ArrayList<ArrayList<String>> dataOrderDetail = conn.getData(sqlGetOrderDetail);

        if (dataOrderDetail.size() < 1) {
            EHRSecondHeader = eachDetail;
        } else {
            for (int i = 0; i < dataOrderDetail.size(); i++) {
                
                               
                eachDetail = "BLI"
                        + "|T^" + format.format(now)            // when to charge
                        + "|CH"                                 //charge type
                        + "|" + pmiNo                           // account
                        + "|" + dataOrderDetail.get(i).get(0)  //procedure code
                        + "|" + dataOrderDetail.get(i).get(1)  //procedure name
                        + "|" + dataOrderDetail.get(i).get(2)  //selling price
                        + "|1"                                  // amount
                        + "|" + dataOrderDetail.get(i).get(3)   // creator
                        + "|" + dataOrderDetail.get(i).get(4)   //created date
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

        isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
        
        if(isSuccess){
            String sqlUpdateBillingStatus = "Update opt_order_master set billing_status = '2' Where order_no = '" + orderNo + "';";

            isSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateBillingStatus);
        }

      
        
        return isSuccess;
    }
    
}
