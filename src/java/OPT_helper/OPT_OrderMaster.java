/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
Author: Ardhi Surya; rdsurya147@gmail.com; @rdcfc
 */
package OPT_helper;

import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class OPT_OrderMaster {
    
    private Conn con;
    private RMIConnector rmi;
    private String orderNo;
    
    public OPT_OrderMaster(String orderNo){
        this.orderNo = orderNo;
        this.con = new Conn();
        this.rmi = new RMIConnector();
    }
    
    public boolean updateOrderMasterStatus(){
        boolean isSuccess = true;
        
        String query = "Select order_status from opt_order_detail where order_no = '"+orderNo+"' ";
        ArrayList<ArrayList<String>> data = con.getData(query);
        
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
            
            if(totalComplete == totalOrder || (totalComplete+totalCancel)== totalOrder)
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
                sqlUpdate = "Update opt_order_master set order_status = '2', billing_status = '0' where order_no = '"+orderNo+"' ";
            else if(status.equalsIgnoreCase("3"))
                sqlUpdate = "Update opt_order_master set order_status = '3', billing_status = '3' where order_no = '"+orderNo+"' ";
            
            
            isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, sqlUpdate);
        
        }
        
        return isSuccess;
    
    }
    
}
