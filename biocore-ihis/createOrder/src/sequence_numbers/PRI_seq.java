/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sequence_numbers;

/**
 *
 * @author shay
 */
import Config_Pack.Config;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import main.RMIConnector;

public class PRI_seq {

    private String PRIno = "";
    private String zero = "";
    private String num = "";
    private String seqId = "";
    private String seqNo = "";
    RMIConnector rc = new RMIConnector();
    Date date = new Date();
    DateFormat dateFormatID = new SimpleDateFormat("yyyy");
    String dateForID = dateFormatID.format(date);

    //set the order_no
    public void setPRI_seq() {

        String sql2 = "SELECT module_name,seq_no FROM orders_no where module_name = 'PRI'";
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
            PRIno = seqId + dateForID + num;

            //UPDATE SEQUENCE NUMBER
            String updateRISNoSequence = "UPDATE orders_no SET seq_no = '" + currentSeq + "' WHERE module_name = 'PRI' ";

            boolean isUpdateRISNoSequence = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, updateRISNoSequence);
        }
    }

    //get the order no
    public String getPRI_orderno() {
        return PRIno;
    }
}
