/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import Config_Pack.Config;
import bean.ADW2;
import bean.BLI2;
import bean.DCG2;
import bean.DTO2;
import bean.LIO2;
import bean.ORC2;
import bean.POS2;
import bean.ROS2;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import order_tables.get_ehr_central_data;
import separatorv2.SeparatorV2;
import sequence_numbers.PIS_seq;

/**
 *
 * @author user
 */
public class MON {

    public static void main(String[] arg) {

        get_ehr_central_data t = new get_ehr_central_data();
        t.getQuery();
//         PIS_seq pis_seq = new PIS_seq();
//                             pis_seq.settPIS_seq();
        boolean status_pos_order_detail = true;
        boolean status_pis_order_detail = true;
        RMIConnector rc = new RMIConnector();
        SeparatorV2 sv = new SeparatorV2();
        sv.startProcess(t.getTxndata());
        //Vector<POS2> pos = sv.getVpos();
        //Vector<ORC2> orc = sv.getVorc();
        //Vector<POS2> pos1 = sv.getVpos();
        Vector<ROS2> bli1 = sv.getVros();

                        for (int bli_i = 0; bli_i < bli1.size(); bli_i++) {

                            ArrayList<ArrayList<String>> blis = bli1.get(bli_i).getValue();
//        //}
//        for (int adw_i = 0; adw_i < pos.size(); adw_i++) {
//                            ArrayList<ArrayList<String>> adws = pos.get(adw_i).getValue();
//                          System.out.println(adws.get(2).get(1));
                                   System.out.println(blis.get(2).get(2));       
                                  // System.out.println(adws.get(2).get(0));
//                                   System.out.println(lios.get(2).get(2));
//                                   System.out.println(lios.get(3).get(0));
//                                   System.out.println(lios.get(4).get(0));
//                                   System.out.println(lios.get(4).get(1));
//                                   System.out.println(lios.get(4).get(2));
//                                   System.out.println(lios.get(5).get(0));
//                                   System.out.println(lios.get(5).get(1));
//                                   System.out.println(lios.get(5).get(2));
//                                   System.out.println(lios.get(6).get(0));
//                                   System.out.println(lios.get(6).get(1));
//                                   System.out.println(lios.get(6).get(2));
//                                   System.out.println(lios.get(7).get(0));
//                                   System.out.println(lios.get(8).get(0));
//                                   System.out.println(lios.get(8).get(1));
//                                   System.out.println(lios.get(8).get(2));
//                                   System.out.println(lios.get(8).get(3));
//                                   System.out.println(lios.get(8).get(4));
//                                   System.out.println(lios.get(8).get(5));

//                                   System.out.println(ross.get(2).get(2));
//                                   System.out.println(ross.get(3).get(0));
//                                   System.out.println(ross.get(4).get(0));
//                                   System.out.println(ross.get(4).get(1));
//                                   System.out.println(ross.get(4).get(2));
//                                   System.out.println(ross.get(5).get(0));
//                                   System.out.println(ross.get(5).get(1));
//                                   System.out.println(ross.get(5).get(2));
//                                   System.out.println(ross.get(6).get(0));
//                                   System.out.println(ross.get(6).get(1));
//                                   System.out.println(ross.get(6).get(2));
//                                        System.out.println(ross.get(7).get(0));
//                                        System.out.println(ross.get(8).get(0));
//                                        System.out.println(ross.get(8).get(1));
//                                        System.out.println(ross.get(8).get(2));
//                                        System.out.println(ross.get(8).get(3));
//                                        System.out.println(ross.get(8).get(4));
//                                        System.out.println(ross.get(8).get(5));
//                                   System.out.println(orcs.get(3).get(0));
//                                   System.out.println(orcs.get(3).get(1));
//                                   System.out.println(orcs.get(3).get(2));
//                                   System.out.println(orcs.get(4).get(0));
//                               // int year = Calendar.getInstance().get(Calendar.YEAR);
//                               String pis = "SELECT CONCAT('RIS',LPAD(SUBSTRING(COALESCE(MAX(order_no),'RIS'),4,4)+1,4,'0'))FROM ris_order_master";
//                               ArrayList<ArrayList<String>> data2 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, pis);
//                                for (int j = 0; j < data2.size(); j++) {
//                                System.out.println(data2.get(0).get(0));
//                            String sql_bli_det = "INSERT INTO far_order_detail (order_no, txn_date, item_cd, item_desc, item_amt, quantity, location, customer_id, status, created_by, created_date) values ('BLI20170000000026','" +blis.get(1).get(1) + "','" + blis.get(4).get(0) + "','" + blis.get(5).get(0) + "','" + blis.get(6).get(0) + "','" + blis.get(7).get(0) + "','4100142','" + blis.get(3).get(0) + "','0','" + blis.get(8).get(0) + "','" + blis.get(9).get(0) + "')";
//                            status_far_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_bli_det);
//                            if (status_far_detail == true) {
//                                System.out.println("Done with far MASTER and far DETAIL");
//                            }else{
//                                    System.out.println("False.");
////                          System.out.println(status_pis_order_detail);
//                          String sql_bli_det = "INSERT INTO far_order_detail (order_no, txn_date, item_cd, item_desc, item_amt, quantity, location, customer_id, status, created_by, created_date) values ('BLI002123','" +blis.get(1).get(1) + "','" + blis.get(4).get(0) + "','" + blis.get(5).get(0) + "','" + blis.get(6).get(0) + "','" + blis.get(7).get(0) + "','0411401','" + blis.get(3).get(0) + "','0','" + blis.get(8).get(0) + "','" + blis.get(9).get(0) + "')";
//                           status_pis_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_bli_det);
//                                  System.out.println(status_pis_order_detail);
//                            if (status_pis_order_detail == true) {
//                                System.out.println("Done with pis MASTER and pis DETAIL");
//                            }else{
//                                System.out.println("False.");
//                                
//                            }
        }

    }
}
