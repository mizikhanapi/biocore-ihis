package order_tables;

import Bean.LIO;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.DTO2;
import bean.ORC2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.LIO_seq;
import sequence_numbers.PIS_seq;
import sequence_numbers.orders_no;

public class PIS_ord {

    public void M_PIS(Vector<ORC2> orc, Vector<DTO2> pis, get_ehr_central_data t) {
        Date datenow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_pis_order_master = true;
        boolean status_pis_order_detail = true;

        for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
            ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
            if (orcs.get(1).get(0).equals("T12100")) {
                PIS_seq pis_seq = new PIS_seq();
                pis_seq.settPIS_seq();
                String sql_pis_master = "INSERT INTO pis_order_master ("
                        + "order_no, "
                        + "pmi_no,"
                        + " txn_type,"
                        + " health_facility_code,"
                        + " episode_code,"
                        + " ENCOUNTER_DATE,"
                        + " order_date,"
                        + " order_by,"
                        + " order_from,"
                        + " order_to,"
                        + " hfc_from,"
                        + " hfc_to,"
                        //+ " spub_no,"
                        + " keyin_by,"
                        //+ " total_order,"
                        + " status,"
                        + " order_status,"
                        + " discipline_code) values "
                        + "('" + pis_seq.getPIS_orderno() + "',"
                        + "'" + t.getPmi_no() + "',"
                        + "'" + orcs.get(1).get(0) + "',"
                        + "'" + orcs.get(12).get(0) + "',"
                        + "'" + orcs.get(7).get(0) + "',"
                        + "'" + orcs.get(8).get(0) + "',"
                        + "'" + orcs.get(6).get(0) + "',"
                        + "'" + orcs.get(9).get(0) + "',"
                        + "'" + orcs.get(15).get(0) + "',"
                        + "'" + orcs.get(29).get(0) + "',"
                        + "'" + orcs.get(12).get(0) + "',"
                        + "'" + orcs.get(26).get(0) + "',"
                        //+ "'2',"
                        + "'" + orcs.get(9).get(0) + "',"
                        //+ "'2',"
                        + "'0',"
                        + "'0',"
                        + "'" + orcs.get(13).get(0) + "')";
                try {

                    status_pis_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pis_master);
                    if (status_pis_order_master == true) {
                        System.out.println("-------------------------------------------");
                        System.out.println("record2 (PIS): #" + " " + t.getCentral_Code());
                        //System.out.println(sql_pis_master);
                        //Vector<DTO2> pis = sv.getVdto();

                        for (int pis_i = 0; pis_i < pis.size(); pis_i++) {
                            ArrayList<ArrayList<String>> piss = pis.get(pis_i).getValue();

                            String sql_pis_detail = "INSERT INTO pis_order_detail  ("
                                    + "order_no,"
                                    + " drug_item_code,"
                                    + " drug_item_desc,"
                                    + " drug_frequency, "
                                    + "drug_route,"
                                    + " drug_form,"
                                    + " drug_strength, "
                                    + "drug_dosage,"
                                    + " order_oum,"
                                    + " duration, "
                                    + "order_status,"
                                    + " qty_ordered,"
                                    //+ " qty_supplied,"
                                   // + " supplied_oum,"
                                    //+ " qty_dispensed,"
                                    //+ " dispense_oum, "
                                    + "status"
                                    //+ " drug_dosage_order_uom,"
                                    //+ " drug_selling_price"
                                    + ")"
                                    + " values ("
                                    + "'" + pis_seq.getPIS_orderno() + "',"
                                    + "'" + piss.get(2).get(0) + "',"
                                    + "'" + piss.get(2).get(1) + "',"
                                    + "'" + piss.get(5).get(1) + "',"
                                    + "'" + piss.get(4).get(1) + "',"
                                    + "'" + piss.get(3).get(0) + "',"
                                    + "'" + piss.get(8).get(0) + "',"
                                    + "'" + piss.get(7).get(0) + "',"
                                    + "'" + piss.get(9).get(2) + "',"
                                    + "'" + piss.get(10).get(0) + "',"
                                    + "'0',"
                                    + "'" + piss.get(11).get(0) + "',"
                                   // + "'0',"
                                    //+ "'-',"
                                   // + "'0',"
                                    + "'0'"
                                    //+ "'-',"
                                    //+ "'1'"
                                    + ")";
                            try {
                                status_pis_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pis_detail);
                                if (status_pis_order_detail == true) {
                                    System.out.println("Done with pis MASTER and pis DETAIL");
                                }else{
                                    System.out.println(sql_pis_detail);
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
