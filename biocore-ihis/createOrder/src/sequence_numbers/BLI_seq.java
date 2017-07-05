package sequence_numbers;

import Config_Pack.Config;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import main.RMIConnector;

public class BLI_seq {
    
    private String BLINo = "";
    private String zero = "";
    private String num = "";
    private String seqId = "";
    private String seqNo = "";
    private String MaxOrderno = "";
    RMIConnector rc = new RMIConnector();
    Date date = new Date();
    DateFormat dateFormatID = new SimpleDateFormat("yyyy");
    String dateForID = dateFormatID.format(date);
    
    public void setBLI_seq(){
    
      String sql2 = "SELECT module_name,seq_no FROM orders_no where module_name = 'BLI'"; 
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
            BLINo = seqId + dateForID + num;

            //UPDATE SEQUENCE NUMBER
            String updateRISNoSequence = "UPDATE orders_no SET seq_no = '" + currentSeq + "' WHERE module_name = 'BLI' ";

            boolean isUpdateRISNoSequence = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, updateRISNoSequence);
        }
        System.out.println(BLINo);    
    }
    
    public String getBLI_orderno() {
        return BLINo;
    }
    
  //  test them first in the main before using them
    public static void main(String[] a) {

        BLI_seq bli = new BLI_seq();
        //lis.settLIO_seq();
       bli.setBLI_seq();
       bli.getBLI_orderno();
//        ris.getRIS_orderno();
//        ris.setMax_orderno();
//        System.out.println(ris.getMaxOrdern_RIS());
    }
    
}
