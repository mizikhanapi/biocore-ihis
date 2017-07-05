/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import Config_Pack.Config;
import Process.MainRetrieval;
import bean.ADW2;
import bean.BLI2;
import bean.DCG2;
import bean.DTO2;
import bean.LIO2;
import bean.ORC2;
import bean.POS2;
import bean.ROS2;
import static java.lang.System.out;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import javax.swing.JOptionPane;
import main.RMIConnector;
import order_tables.get_ehr_central_data;
import order_tables.update_ehr_central;
import separatorv2.SeparatorV2;
import sequence_numbers.ADW_seq;
import sequence_numbers.BLI_seq;
import sequence_numbers.DCG_seq;
import sequence_numbers.LIO_seq;
import sequence_numbers.PIS_seq;
import sequence_numbers.POS_seq;
import sequence_numbers.RIS_seq;
import sequence_numbers.orders_no;

/**
 *
 * @author user
 */
public class ADW {

    public static void main(String[] agr) {
        Date datenow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_adw_master = true;
        boolean status_adw_detail = true;
        //import get_ehr_central_data class to get the records from ehr_central
        get_ehr_central_data t = new get_ehr_central_data();
        t.getQuery();

        try {
            System.out.println("record (ORC for DCG) #" + t.getCentral_Code());
            SeparatorV2 sv = new SeparatorV2();
            sv.startProcess(t.getTxndata());
            Vector<ORC2> orc = sv.getVorc();
            Vector<DCG2> dcg1 = sv.getVdcg();
            for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
                for (int dcg_i = 0; dcg_i < dcg1.size(); dcg_i++) {
                    ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                    ArrayList<ArrayList<String>> dcgs = dcg1.get(dcg_i).getValue();
                    if (orcs.get(1).get(0).equals("T12115") && dcgs.get(2).get(2).equals("003")) {
                        DCG_seq dcg = new DCG_seq();
                        dcg.setDCG_seq();
                        String sql_ADW = "INSERT INTO wis_order_master (pmi_no, order_no, txn_type, hfc_cd, episode_date, encounter_date, order_date, order_by, discipline_cd, subdiscipline_cd, ordering_hfc_cd, ordering_discipline_cd, ordering_subdiscipline_cd, order_status, diagnosis_cd, created_by, create_date) values ('" + t.getPmi_no() + "','" + dcg.getDCG_orderno() + "','" + orcs.get(1).get(0) + "','" + orcs.get(12).get(0) + "','" + orcs.get(7).get(0) + "','" + orcs.get(7).get(0) + "','" + orcs.get(6).get(0) + "','" + orcs.get(9).get(0) + "','" + orcs.get(13).get(0) + "','" + orcs.get(14).get(0) + "','" + orcs.get(12).get(0) + "','" + orcs.get(15).get(0) + "','" + orcs.get(29).get(0) + "','0','-','" + orcs.get(9).get(0) + "','" + orcs.get(7).get(0) + "')";
                        try {
                            status_adw_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_ADW);
                            if (status_adw_master == true) {
                                System.out.println("-------------------------------------------");
                                System.out.println("record (DCG): #" + " " + t.getCentral_Code());

                                String sql_adw_det = "INSERT INTO wis_order_detail (order_no, item_cd, episode_date, encounter_date, requestor_comments, admission_reason, order_by, order_date, ward_class_code, ward_id, bed_id, order_status, created_by, created_date) values ('" + dcg.getDCG_orderno() + "','-','" + dcgs.get(1).get(0) + "','" + dcgs.get(2).get(0) + "','" + dcgs.get(5).get(7) + "','-','" + dcgs.get(2).get(3) + "','" + dcgs.get(1).get(0) + "','-','" + dcgs.get(5).get(4) + "','-','0','" + dcgs.get(2).get(4) + "','" + dcgs.get(1).get(0) + "')";
                                status_adw_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_adw_det);
                                if (status_adw_detail == true) {
                                    System.out.println("Done with dcg MASTER and dcg DETAIL");
                                }

                            } else {
                                System.out.println("False.");
                            }
                        } catch (Exception e) {
                            e.getStackTrace();
                        }
                    }
                }
            }

        } catch (Exception e) {

            e.getStackTrace();
        }
    }

}
