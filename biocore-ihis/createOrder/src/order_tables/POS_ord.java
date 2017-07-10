package order_tables;

import Bean.POS;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.ORC2;
import bean.POS2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.POS_seq;
import sequence_numbers.orders_no;

public class POS_ord {

    Date datenow = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
    boolean update_ehr_central_boolean = false;
    String Centre_Code = "";
    String Central_Code = "";

    public void M_POS(get_ehr_central_data t, Vector<POS2> pos1, Vector<ORC2> orc) {
        
       Date datenow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_pos_order_master = true;
        boolean status_pos_order_detail = true;
        //import get_ehr_central_data class to get the records from ehr_central
        //get_ehr_central_data t = new get_ehr_central_data();
        //t.getQuery();
        try{
        System.out.println("record (ORC for POS) #" + t.getCentral_Code());

       // Vector<ORC2> orc = sv.getVorc();
        //Vector<LIO2> orc = sv.getVlio();
        for (int orc_i = 0; orc_i < orc.size(); orc_i++) {

            ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
            if (orcs.get(1).get(0).equals("T12103")) {
               POS_seq pos = new POS_seq();
               pos.setPOS_seq();

          
                  String sql_pos_master = "INSERT INTO pos_order_master (pmi_no, order_no, txn_type, HFC_CD, HFC_NAME, order_date, order_by, order_priority, episode_date, ENCOUNTER_DATE, comment, created_by, created_date, order_from_dicipline, order_to_dicipline, order_from_subdicipline, order_to_subdicipline, hfc_from, hfc_to, doctor_id, national_id_no, person_id_no, person_status, centre_code) values ('" + t.getPmi_no() + "','" + pos.getPOS_orderno() + "','" + orcs.get(1).get(0) + "','" + orcs.get(12).get(0) + "','" + orcs.get(12).get(0) + "','"+orcs.get(6).get(0)+"','-','-','" + orcs.get(7).get(0) + "','" + orcs.get(7).get(0) + "','no comment','" + orcs.get(9).get(0) + "','" + orcs.get(7).get(0) + "','" + orcs.get(16).get(0) + "','" + orcs.get(29).get(0) + "','001','001','" + orcs.get(12).get(0) + "','" + orcs.get(12).get(0) + "','" + orcs.get(9).get(0) + "','"+t.getPERSON_ID_NO()+"','"+t.getPERSON_ID_NO()+"','"+t.getPERSON_STATUS()+"','"+t.getCentre_Code()+"')";

                   try {
                        status_pos_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_master);
                        if (status_pos_order_master == true) {
                            System.out.println("-------------------------------------------");
                            System.out.println("record (POS): #" + " " + t.getCentral_Code());
                            //Vector<POS2> pos1 = sv.getVpos();

                            for (int pos_i = 0; pos_i < pos1.size(); pos_i++) {
                            ArrayList<ArrayList<String>> poss = pos1.get(pos_i).getValue();
                            // System.out.println(poss.get(2).get(1));
                                String sql_pos_detail = "INSERT INTO pos_order_detail (order_no, PMI_NO, HFC_CD, HFC_NAME, EPISODE_DATE, ENCOUNTER_DATE, PROCEDURE_CD, PROCEDURE_NAME, PROCEDURE_OUTCOME, COMMENT, DOCTOR_ID, NATIONAL_ID_NO, PERSON_ID_NO, PERSON_STATUS, CENTRE_CODE) values ('"+pos.getPOS_orderno()+"','"+t.getPmi_no()+"','"+poss.get(9).get(0)+"','"+poss.get(10).get(0)+"','"+orcs.get(7).get(0)+"','"+orcs.get(7).get(0)+"','"+poss.get(2).get(1)+"','"+poss.get(2).get(2)+"','"+poss.get(2).get(3)+"','-','"+orcs.get(9).get(0)+"','"+t.getNational_id_no()+"','"+t.getPERSON_ID_NO()+"','"+t.getPERSON_STATUS()+"','"+t.getCentre_Code()+"')";                                        
                                status_pos_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_detail);
                                if (status_pos_order_detail == true) {
                                    System.out.println("Done with pos MASTER and pos DETAIL");
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

    }catch(Exception e) {

            e.getStackTrace();
        }
         }
    }


