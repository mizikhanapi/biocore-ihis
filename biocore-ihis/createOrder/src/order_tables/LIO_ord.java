package order_tables;

import Bean.LIO;
import Bean.ROS;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.LIO2;
import bean.ORC2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.LIO_seq;
import sequence_numbers.orders_no;

public class LIO_ord {

    public void M_LIO(Vector<ORC2> orc, Vector<LIO2> lio, get_ehr_central_data t ) {

       Date datenow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lio_order_master = true;
        boolean status_lis_order_detail = true;
        //import get_ehr_central_data class to get the records from ehr_central
        //get_ehr_central_data t = new get_ehr_central_data();
        //t.getQuery();
        
         
        //import LIO_seq class to get the order number and max order_no
//        LIO_seq lis = new LIO_seq();
//        lis.settLIO_seq();
         
       // lis.setMax_orderno();

        try {

            System.out.println("record (ORC for LIO) #" + t.getCentral_Code()); 
        //Vector<ORC2> orc = sv.getVorc();

                   for (int orc_i = 0; orc_i < orc.size(); orc_i++) {

                  ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                if (orcs.get(1).get(0).equals("T12101")) {
                        LIO_seq lis = new LIO_seq();
                        lis.settLIO_seq();
                        String sql_lis_master = "INSERT INTO lis_order_master (pmi_no, order_no, txn_type, hfc_cd, episode_date, ENCOUNTER_DATE, order_date, order_by, order_from_discipline, order_from_subdiscipline, order_to_discipline, order_to_subdiscipline, hfc_from, hfc_to, order_status, diagnosis_cd, created_by, created_date, patient_name) values ('" + t.getPmi_no() + "','" + lis.getLIO_orderno() + "','" + orcs.get(1).get(0) + "','" + orcs.get(12).get(0) + "','" + orcs.get(7).get(0) + "','" + orcs.get(8).get(0) + "','" + orcs.get(6).get(0) + "','" + orcs.get(9).get(0) + "','" + orcs.get(13).get(0) + "','" + orcs.get(14).get(0) + "','" + orcs.get(13).get(0) + "','" + orcs.get(14).get(0) + "','" + orcs.get(15).get(0) + "','" + orcs.get(29).get(0) + "','0','-','" + orcs.get(9).get(0) + "','" + orcs.get(6).get(0) + "','" + orcs.get(10).get(0) + "')";
                        try {
                            status_lio_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_lis_master);
                            if (status_lio_order_master == true) {
                                System.out.println("-------------------------------------------");
                                System.out.println("record (LIO): #" + " " + t.getCentral_Code());
                                 //Vector<LIO2> lio = sv.getVlio();
                                for (int lio_i = 0; lio_i < orc.size(); lio_i++) {
                                ArrayList<ArrayList<String>> lios = lio.get(lio_i).getValue();

                                      
                                         String sql_lis_detail = "INSERT INTO lis_order_detail (order_no, item_cd, episode_date, ENCOUNTER_DATE, requestor_comments, filler_comments, verify_by, verify_date, created_by, created_date, pmi_no, spe_source, item_name, volume, spe_container, comment, special_inst, order_date, specimen_status, verification, collectionDate) values ('" + lis.getLIO_orderno() + "','" + lios.get(2).get(0) + "','" + orcs.get(7).get(0) + "','" + orcs.get(7).get(0) + "','" + lios.get(2).get(2) + "','" + lios.get(4).get(1) + "','Ahmed abdullah','" + orcs.get(7).get(0) + "','Ahmed abdullah','" + orcs.get(7).get(0) + "','" + t.getPmi_no() + "','-','" + lios.get(2).get(1) + "','2','-','" + lios.get(5).get(2) + "','-','" + orcs.get(6).get(0) + "','-','-','" + lios.get(3).get(0) + "')";
                                        status_lis_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_lis_detail);

                                        if (status_lis_order_detail == true) {
                                            System.out.println("Done with lis MASTER and lis DETAIL");
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
