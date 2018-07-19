/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ADM_helper;

import dBConn.Conn;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class TenantHelper {
    
    Conn con;
    final String WEIGHT= "0850850850";
    final int DIVIDER = 12;

    public  TenantHelper(){
        con = new Conn();
    }
    
    public String getAccountNo(){
        String accountNo = "";
        
        //getLast sequence no
        
        String last_sequence = getLastSequenceNo();
        
        //get Total A
        int total_A = getTotal_A(last_sequence);
        System.out.println("Total A:"+total_A);
        
        int quotient_A = total_A / DIVIDER;
        int remainder_A = total_A % DIVIDER;
        
        int twelveth = 0;
        
        System.out.println("Remainder A:" +remainder_A);
        if(remainder_A==0){
            twelveth = 0;
        }
        else{
            twelveth = getTwelve(total_A);
        }
        
        accountNo = last_sequence + twelveth;
        
        String leadingZeros = "";
        
        for(int i=0; i <= (11 - accountNo.length()); i++){
            leadingZeros += "0";
        }
        
        return leadingZeros+accountNo;
    }
    
    private String getLastSequenceNo(){
        String query = "SELECT ifnull(max(last_no),0) from adm_last_seq_no_accno;";
        String last_no="";
        RMIConnector rmi = new RMIConnector();
        try{
            last_no = rmi.getQuerySQL("10.73.32.200", 1098, query).get(0).get(0);
        }catch(Exception e){
            e.printStackTrace();
            last_no = "0";
        }
         
        
        query = "insert into adm_last_seq_no_accno(last_no) VALUES (null);";
        
        
        rmi.setQuerySQL("10.73.32.200", 1098, query);
        
        return last_no;
    }
    
    private int getTotal_A(String last_seq){
        int A = 0;
        
        int weight_len = WEIGHT.length();
        int seq_len = last_seq.length();
        
        String[] arrSeq = last_seq.split("");
        String[] arrWeight = WEIGHT.split("");
        
        for(int i = seq_len-1, j = weight_len-1; i > -1; i--, j--){
            A += Integer.parseInt(arrWeight[j]) * Integer.parseInt(arrSeq[i]);
            if(j == 0)
                break;
        }
        
        return A;
    }
    
    private int getTwelve(int total_A){
        int total_B = total_A + 12;
        int quotient_B = total_B / DIVIDER;
        int remainder_B = total_B % DIVIDER;
        
        int total_C = total_B - remainder_B;
        
        int total_D = total_C - total_A;
        
        return total_D;
    }
    
    public static void main(String args[]){
        TenantHelper th = new TenantHelper();
        
        System.out.println(th.getAccountNo());
    }
}
