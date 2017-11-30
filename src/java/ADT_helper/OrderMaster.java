/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADT_helper;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author user
 */
public class OrderMaster {
    
    public OrderMaster(){
        //empty constructor;
    }
    
    public String getDepositOrderNo(){
        /*
        This method is only called if the patient is admitted to the ward without going through CIS/ no order number...
        Only used to create bill for the ward deposit.
        */
        
        String depOrderNo="";
        
        String leNo = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        
        depOrderNo="ADP"+leNo;
        
        return depOrderNo;
    }
}
