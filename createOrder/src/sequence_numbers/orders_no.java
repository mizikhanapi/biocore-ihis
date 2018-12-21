package sequence_numbers;

import Config_Pack.Config;
import java.util.ArrayList;
import main.RMIConnector;

public class orders_no {
    
    //declaration of varibales and RMIConnector
    private String pos_orderno;
    private String lis_orderno;
    private String pis_orderno;
    private String ris_orderno;
    private String tempLISno;
    private String tempRISno;
   RMIConnector rc = new RMIConnector();
   
   //getter and setter
    public String getPos_orderno() {
        return pos_orderno;
    }

    public void setPos_orderno() {

        String pos = "SELECT CONCAT('POS',LPAD(SUBSTRING(COALESCE(MAX(order_no),'POS000'),4,4)+1,4,'0'))FROM POS_order_master";
        ArrayList<ArrayList<String>> data1 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, pos);
        for (int j = 0; j < data1.size(); j++) {

            this.pos_orderno = data1.get(0).get(0);
        }
    }

    public String getLis_orderno() {
        return lis_orderno;
    }

    public void setLis_orderno() {
         String lis = "SELECT CONCAT('LIS',LPAD(SUBSTRING(COALESCE(MAX(order_no),'LIS'),4,4)+1,4,'0'))FROM lis_order_master";
         ArrayList<ArrayList<String>> data2 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, lis);
        for (int j = 0; j < data2.size(); j++) {

            this.lis_orderno = data2.get(0).get(0);
           // this.lis_orderno = this.tempLISno + 1;
        }
    }

    public String getPis_orderno() {
        return pis_orderno;
    }

    public void setPis_orderno() {
       String pis = "SELECT CONCAT('PIS',LPAD(SUBSTRING(COALESCE(MAX(order_no),'PIS'),4,4)+1,4,'0'))FROM pis_order_master";
        ArrayList<ArrayList<String>> data3 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, pis);
        for (int j = 0; j < data3.size(); j++) {

            this.pis_orderno = data3.get(0).get(0);
        }
    }

    public String getRis_orderno() {
        return ris_orderno;
    }

    public void setRis_orderno() {
        String ris = "select max(order_no) from ris_order_master";
        ArrayList<ArrayList<String>> data4 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, ris);
        for (int j = 0; j < data4.size(); j++) {
            this.tempRISno = data4.get(0).get(0);
            this.ris_orderno = this.tempRISno + 1;
        }
    }

}
