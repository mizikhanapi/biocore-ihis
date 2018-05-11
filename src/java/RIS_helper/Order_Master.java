/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
Ardhi Surya; rdsurya147@gmail.com; @rdcfc
 */
package RIS_helper;

import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class Order_Master {
    private String orderNo;
    private Conn conn; 
    private RMIConnector rmic;
    
    public Order_Master(String orderNo){
        this.orderNo = orderNo;   
        this.conn = new Conn();
        this.rmic = new RMIConnector();
    }
    
    public boolean updateOrderMasterStatus(){
        String query = "Select order_status from ris_order_detail where order_no = '"+orderNo+"' ";
        ArrayList<ArrayList<String>> data = conn.getData(query);
        
        int totalOrder = data.size();
        int totalCancel = 0, totalComplete = 0;
        
        String status = "";
        boolean proceedUpdate = true;
        
        if(totalOrder > 0){
            
            for(int i = 0; i < totalOrder; i++){
            
                if(data.get(i).get(0).equalsIgnoreCase("2"))
                    totalComplete++;
                else if(data.get(i).get(0).equalsIgnoreCase("3"))
                    totalCancel++;
            
            }
            
            if(totalComplete == totalOrder)
                status = "2";
            else if(totalCancel == totalOrder)
                status = "3";
            else
                proceedUpdate = false;
        
        }else{
            status = "3";
        }
        
        if(proceedUpdate){
            String sqlUpdate = "";
            
            if(status.equalsIgnoreCase("2"))
                sqlUpdate = "Update ris_order_master set order_status = '2', billing_status = '0' where order_no = '"+orderNo+"' ";
            else if(status.equalsIgnoreCase("3"))
                sqlUpdate = "Update ris_order_master set order_status = '3', billing_status = '3' where order_no = '"+orderNo+"' ";
            
            
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
        
        }
        
        return proceedUpdate;
    
    }
    
}
