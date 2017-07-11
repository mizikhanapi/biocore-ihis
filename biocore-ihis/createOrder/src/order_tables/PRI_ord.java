/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order_tables;

import Bean.PRI;
import Config_Pack.Config;
import bean.ORC2;
import bean.PRI2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;
import sequence_numbers.PRI_seq;

/**
 *
 * @author shay
 */
public class PRI_ord {

    RMIConnector rc = new RMIConnector();
    private String query_pri_master;
    private String query_pri_detail;
    private int rowPRI;

    public void M_PRI(Vector<ORC2> orc, Vector<PRI2> pri, get_ehr_central_data t) {
        boolean status_pri_master;
        boolean status_pri_detail;

        try {
            rowPRI = pri.size();
            System.out.println("number pri : " + rowPRI);
            for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
                ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                if (orcs.get(1).get(0).equals("T12105")) {
                    PRI priB = new PRI();
                    PRI_seq pri_seq = new PRI_seq();
                    pri_seq.setPRI_seq();
                    if (rowPRI > 0) {
                        for (int n = 0; n < rowPRI; n++) {
                            try {
                                ArrayList<ArrayList<String>> alPRI = pri.get(n).getValue();
                                priB.setTxnCode(alPRI.get(1).get(0));
                                priB.setOrderNo(pri_seq.getPRI_orderno());
                                priB.setFillerOrder(pri_seq.getPRI_orderno());
                                priB.setEpisodeDate(orcs.get(7).get(0));
                                priB.setEncounterDate(orcs.get(8).get(0));
                                priB.setStatus(alPRI.get(6).get(0));
                                priB.setPriority(alPRI.get(7).get(0));
                                priB.setType(alPRI.get(8).get(0));
                                priB.setDisposition(alPRI.get(9).get(0));
                                priB.setCategory(alPRI.get(10).get(0));
                                priB.setReason(alPRI.get(11).get(0));
                                priB.setEffectiveDate(alPRI.get(12).get(0));
                                priB.setExpDate(alPRI.get(13).get(0));
                                priB.setNotes(alPRI.get(14).get(0));
                                priB.setProviderCode(alPRI.get(15).get(0));
                                priB.setProviderName(alPRI.get(15).get(1));
                                priB.setProviderDisciplineCode(alPRI.get(15).get(2));
                                priB.setProviderDisciplineName(alPRI.get(5).get(3));
                                priB.setProviderSubDisciplineCode(alPRI.get(15).get(4));
                                priB.setProviderSubDisciplineName(alPRI.get(5).get(5));

                                query_pri_master = "INSERT INTO pms_order_master ("
                                        + "pmi_no,"
                                        + " order_no,"
                                        + "filler_order_no,"
                                        + " txn_type, "
                                        + "hfc_cd,"
                                        + " episode_date,"
                                        + " encounter_date,"
                                        + " order_date,"
                                        + " order_by, "
                                        + "discipline_cd, "
                                        + "subdiscipline_cd,"
                                        + " ordering_hfc_cd,"
                                        + " ordering_discipline_cd,"
                                        + " ordering_subdiscipline_cd, "
                                        + "order_status,"
                                        //                                        + " diagnosis_cd,"
                                        + " created_by, "
                                        + "create_date) "
                                        + "values ('" + t.getPmi_no() + "',"
                                        + "'" + priB.getOrderNo() + "',"
                                        + "'" + priB.getFillerOrder() + "',"
                                        + "'" + orcs.get(1).get(0) + "',"
                                        + "'" + orcs.get(12).get(0) + "',"
                                        + "'" + orcs.get(7).get(0) + "',"
                                        + "'" + orcs.get(8).get(0) + "',"
                                        + "'" + orcs.get(6).get(0) + "',"
                                        + "'" + orcs.get(9).get(0) + "','"
                                        + "'" + orcs.get(13).get(0) + "',"
                                        + "'" + orcs.get(14).get(0) + "',"
                                        + "'" + orcs.get(12).get(0) + "',"
                                        + "'" + orcs.get(15).get(0) + "',"
                                        + "'" + orcs.get(29).get(0) + "',"
                                        + "'" + priB.getStatus() + "',"
                                        //                                        + "'-',"
                                        + "'" + orcs.get(9).get(0) + "',"
                                        + "'" + orcs.get(7).get(0) + "');";

                                query_pri_detail = "INSERT INTO pms_order_detail("
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
                                        + "'" + priB.getOrderNo() + "',"
                                        + "'" + priB.getFillerOrder() + "',"
                                        + "'" + priB.getStatus() + "',"
                                        + "'" + priB.getPriority() + "',"
                                        + "'" + priB.getType() + "',"
                                        + "'" + priB.getDisposition() + "',"
                                        + "'" + priB.getCategory() + "',"
                                        + "'" + priB.getReason() + "',"
                                        + "'" + priB.getEffectiveDate() + "',"
                                        + "'" + priB.getExpDate() + "',"
                                        + "'" + priB.getNotes() + "',"
                                        + "'" + orcs.get(9).get(0) + "',"
                                        + "'" + orcs.get(6).get(0) + "');";

                                status_pri_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_pri_master);
                                status_pri_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_pri_detail);
                                if (status_pri_master == true && status_pri_detail == true ) {
                                    System.out.println("Done PRI master AND DETAIL");
                                    System.out.println(query_pri_master);
                                    System.out.println(query_pri_detail);
                                } else {
                                    System.out.println("false PRI master AND DETAIL");
                                    System.out.println(query_pri_master);
                                    System.out.println(query_pri_detail);
                                }

                            } catch (Exception e) {
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
        }
    }
}
