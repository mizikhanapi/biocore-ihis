package sequence_numbers;

import Config_Pack.Config;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import main.RMIConnector;
import order_tables.get_ehr_central_data;

public class POS_seq {
    
    private String POSNo = "";
    private String zero = "";
    private String num = "";
    private String seqId = "";
    private String seqNo = "";
    private String MaxOrderno = "";
    RMIConnector rc = new RMIConnector();
    Date date = new Date();
    DateFormat dateFormatID = new SimpleDateFormat("yyyy");
    String dateForID = dateFormatID.format(date);

  
    //set the order_no
    public void setPOS_seq() {
        
       
        String sql2 = "SELECT module_name,seq_no FROM orders_no where module_name = 'POS'"; 
        ArrayList<ArrayList<String>> data2 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql2);
        for (int j = 0; j < data2.size(); j++) { 
            //Get last sequance number
            seqId = data2.get(0).get(0);
            seqNo = data2.get(0).get(1);
            int seq = Integer.parseInt(seqNo);
            int currSeq = seq + 1;
            String currentSeq = Integer.toString(currSeq);

            //Generate RIS ORDER no
            int length = (int) Math.log10(currSeq) + 1;
            zero = "0";
            num = currentSeq;
            int count;
            for (count = length; count < 10; count++) {
                num = zero + num;
            }
            POSNo = seqId + dateForID + num;

            //UPDATE SEQUENCE NUMBER
            String updateRISNoSequence = "UPDATE orders_no SET seq_no = '" + currentSeq + "' WHERE module_name = 'POS' ";

            boolean isUpdateRISNoSequence = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, updateRISNoSequence);
        }
        System.out.println(POSNo);
    }
    
    //get the order no
    public String getPOS_orderno() {
        return POSNo;
    }

    //test them first in the main before using them
//    public static void main(String[] a) {
//
//        POS_seq pos = new POS_seq();
//        pos.setPOS_seq();
//        pos.getPOS_orderno();
////        ris.getRIS_orderno();
////        ris.setMax_orderno();
////        System.out.println(ris.getMaxOrdern_RIS());
//    }

    
}
