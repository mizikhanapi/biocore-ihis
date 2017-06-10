/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POS_helper;

import RIS_helper.EHRMessageSender;

/**
 *
 * @author user
 */
public class POS_EHRMessenger extends EHRMessageSender {
    
    public POS_EHRMessenger(String userID, String hfc, String dis, String subdis, String pmiNo, String orderNo, String orderDate) {
        super(userID, hfc, dis, subdis, pmiNo, orderNo, orderDate);
    }

    @Override
    public void insertIntoEHR_LHR(String senderApp, String bodySystemCode, String modalityCode, String procedureCode) {
        super.insertIntoEHR_LHR(senderApp, bodySystemCode, modalityCode, procedureCode); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void insertIntoEHR_FAR(String senderApp) {
        super.insertIntoEHR_FAR(senderApp); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
