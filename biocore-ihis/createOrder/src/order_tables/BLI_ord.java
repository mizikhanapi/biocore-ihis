package order_tables;

import Config_Pack.Config;
import Process.MainRetrieval;
import bean.BLI2;
import bean.ORC2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.BLI_seq;

public class BLI_ord {

    public void M_BLI(Vector<ORC2> orc, Vector<BLI2> bli1, get_ehr_central_data t) {

        Date datenow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_far_master = true;
        boolean status_far_detail = true;
        //import get_ehr_central_data class to get the records from ehr_central
       // get_ehr_central_data t = new get_ehr_central_data();
      //  t.getQuery();
        
         
        //import LIO_seq class to get the order number and max order_no
//        LIO_seq lis = new LIO_seq();
//        lis.settLIO_seq();
         
       // lis.setMax_orderno();

        try {

            System.out.println("record (ORC for BLI) #" + t.getCentral_Code()); 
        SeparatorV2 sv = new SeparatorV2();
        sv.startProcess(t.getTxndata());
       // Vector<ORC2> orc = sv.getVorc();

                   for (int orc_i = 0; orc_i < orc.size(); orc_i++) {

                  ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                if (orcs.get(1).get(0).equals("T12113")) {
                        BLI_seq bli = new BLI_seq();
                        bli.setBLI_seq();
                String sql_BLI = "INSERT INTO far_order_master (customer_id, order_no, txn_date, item_desc, item_amt, bill_no, quantity, location, payment, amt_paid, hfc_cd, discipline_cd, subdiscipline_cd, ordering_hfc_cd, ordering_subdiscipline, ordering_subdiscipline_cd, txn_type, status, created_by, created_date) values ('" + t.getPmi_no() + "','" + bli.getBLI_orderno() + "','" + orcs.get(7).get(0) + "','-','2','-','2','" + orcs.get(12).get(0) + "','unpaid','10','" + orcs.get(12).get(0) + "','" + orcs.get(13).get(0) + "','" + orcs.get(14).get(0) + "','" + orcs.get(12).get(0) + "','-','-','"+orcs.get(1).get(0)+"','0','" + orcs.get(9).get(0) + "','" + orcs.get(7).get(0) + "')";
                          try {
                    status_far_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_BLI);
                    if (status_far_master == true  && orcs.get(29).get(0).equals("08")) {
                        System.out.println("-------------------------------------------");
                        System.out.println("record (BLI): #" + " " + t.getCentral_Code());
                        // Vector<BLI2> bli1 = sv.getVbli();

                        for (int bli_i = 0; bli_i < bli1.size(); bli_i++) {

                            ArrayList<ArrayList<String>> blis = bli1.get(bli_i).getValue();
//                            System.out.println(blis.get(1).get(0));
//                            System.out.println(blis.get(1).get(1)); //txn_date
//                            System.out.println(blis.get(2).get(0)); //CH >> unknown
//                            System.out.println(blis.get(3).get(0)); //customer_id
//                            System.out.println(blis.get(4).get(0)); //item_cd
//                            System.out.println(blis.get(5).get(0)); //item_desc
//                            System.out.println(blis.get(6).get(0)); //item_amt
//                            System.out.println(blis.get(7).get(0)); //quantity
//                            System.out.println(blis.get(8).get(0)); // created_by
//                            System.out.println(blis.get(9).get(0)); // created_date

                                      
                          String sql_bli_det = "INSERT INTO far_order_detail (order_no, txn_date, item_cd, item_desc, item_amt, quantity, location, customer_id, status, created_by, created_date) values ('" + bli.getBLI_orderno() + "','" +blis.get(1).get(1) + "','" + blis.get(4).get(0) + "','" + blis.get(5).get(0) + "','" + blis.get(6).get(0) + "','" + blis.get(7).get(0) + "','" + orcs.get(12).get(0) + "','" + blis.get(3).get(0) + "','0','" + blis.get(8).get(0) + "','" + blis.get(9).get(0) + "')";
                            status_far_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_bli_det);
                            if (status_far_detail == true) {
                                System.out.println("Done with far MASTER and far DETAIL");
                            }
                                    } 

                            }else {
                                    System.out.println("False.");
                                }
                        } catch (Exception e) {
                            e.getStackTrace();
                        }
                    }
                }         

        } catch (Exception e) {

            e.getStackTrace();
        }
    }

}
