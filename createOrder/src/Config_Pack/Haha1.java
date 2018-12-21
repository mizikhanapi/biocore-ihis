package Config_Pack;


import Process.MainRetrieval;
import java.util.ArrayList;
import main.RMIConnector;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ASUS
 */
public class Haha1 {
    
    public void papar() {
        
        RMIConnector rc = new RMIConnector();

        
        
        
//        String sql = "SHOW TABLES";
//        String sql = "SHOW COLUMNS FROM pms_patient_biodata";
//        String sql = "SHOW COLUMNS FROM EHR_CENTRAL";
        String sql = "SELECT * FROM EHR_CENTRAL LIMIT 100 ";
        ArrayList<ArrayList<String>> data = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql);
        String txndata = "";
        for (int i = 0; i < data.size(); i++) {
            txndata += data.get(i).get(3);
        }
        //System.out.println(txndata);
        
        MainRetrieval mr = new MainRetrieval();
        mr.startProcess(txndata);
        String var1[][] = mr.getData("CCN");
        int numVar1 = mr.getRowNums();
        
        for (int i = 0; i < numVar1; i++) {
            //System.out.println();
        }
        
        System.out.println("num ccn: "+numVar1);
        
//        String sql = "drop table tablea";
//        boolean status = rc.setQuerySQL("10.73.32.200", 1099, sql);
//        System.out.println("status: " + status);
    }
    
    public static void main(String[] args) {
        Haha1 h = new Haha1();
        h.papar();
    }
}
