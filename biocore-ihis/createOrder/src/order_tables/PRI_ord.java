/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order_tables;

import Config_Pack.Config;
import bean.DTO2;
import bean.ORC2;
import bean.PRI2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import sequence_numbers.PIS_seq;
import sequence_numbers.PRI_seq;

/**
 *
 * @author shay
 */
public class PRI_ord {
    public void M_PRI(Vector<ORC2> orc, Vector<PRI2> pri, get_ehr_central_data t) {
        Date datenow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_pri_order_master = true;
        boolean status_pri_order_detail = true;

        for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
            ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
            if (orcs.get(1).get(0).equals("T12105")) {
                PRI_seq pri_sqe = new PRI_seq();
                pri_sqe.setPRI_seq();
                String sql_pri_master = "INSERT INTO pms_order_master (pmi_no, order_no,filler_order_no, txn_type, hfc_cd, episode_date, encounter_date, order_date, order_by, discipline_cd, subdiscipline_cd, ordering_hfc_cd, ordering_discipline_cd, ordering_subdiscipline_cd, order_status, diagnosis_cd, created_by, create_date) values ('" + t.getPmi_no() + "','" + pri_sqe.getPRI_orderno() + "','" + pri_sqe.getPRI_orderno() + "','" + orcs.get(1).get(0) + "','" + orcs.get(12).get(0) + "','" + orcs.get(7).get(0) + "','" + orcs.get(7).get(0) + "','" + orcs.get(6).get(0) + "','" + orcs.get(9).get(0) + "','" + orcs.get(13).get(0) + "','" + orcs.get(14).get(0) + "','" + orcs.get(12).get(0) + "','" + orcs.get(15).get(0) + "','" + orcs.get(29).get(0) + "','0','-','" + orcs.get(9).get(0) + "','" + orcs.get(7).get(0) + "')";
                try {

                    status_pri_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pri_master);
                    if (status_pri_order_master == true) {
                        System.out.println("-------------------------------------------");
                        System.out.println("record (PRI): #" + " " + t.getCentral_Code());
                        //System.out.println(sql_pis_master);
                        //Vector<DTO2> pis = sv.getVdto();

                        for (int pri_i = 0; pri_i < pri.size(); pri_i++) {
                            ArrayList<ArrayList<String>> priAL = pri.get(pri_i).getValue();
                            
                            String sql_pri_detail = "INSERT INTO pms_order_detail("
                                    + "order_no,"
                                    + "filler_order_no,"
                                    + "referral_status,"
                                    + "referral_priority,"
                                    + "referral_type,"
                                    + "referral_disposition,"
                                    + "referral_category,"
                                    + "referral_reason,"
                                    + "effective_date,"
                                    + "expiration_date,"
                                    + "referral_note,"
                                    + "created_by,"
                                    + "created_date)VALUES("
                                    + "'"+pri_sqe.getPRI_orderno()+"',"
                                    + "'"+pri_sqe.getPRI_orderno()+"',"
                                    + "'"+priAL.get(6).get(0)+"',"
                                    + "'"+priAL.get(7).get(0)+"',"
                                    + "'"+priAL.get(8).get(0)+"',"
                                    + "'"+priAL.get(9).get(0)+"',"
                                    + "'"+priAL.get(10).get(0)+"',"
                                    + "'"+priAL.get(11).get(0)+"',"
                                    + "'"+priAL.get(12).get(0)+"',"
                                    + "'"+priAL.get(13).get(0)+"',"
                                    + "'"+priAL.get(14).get(0)+"',"
                                    + "'"+orcs.get(9).get(0)+"',"
                                    + "'"+orcs.get(6).get(0)+"')";
                            try {
                                status_pri_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pri_detail);
                                if (status_pri_order_detail == true) {
                                    System.out.println("Done with pri MASTER and pri DETAIL");
                                }
                            } catch (Exception e) {

                            }

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
}
