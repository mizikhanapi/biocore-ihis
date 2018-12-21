/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order_tables;

import Bean.MSH;
import Bean.PRI;
import Config_Pack.Config;
import bean.ORC2;
import bean.PRI2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;
import sequence_numbers.All_Seq_no;
import sequence_numbers.PRI_seq;

/**
 *
 * @author shay
 */
public class PRI_ord {

    RMIConnector rc = new RMIConnector();

    public void M_PRI(Vector<ORC2> orc, Vector<PRI2> pri, get_ehr_central_data t,MSH msh) {
        boolean status_pri_master = false;
        boolean status_pri_detail = false;
        String query_pri_master;
        String query_pri_detail;
        int rowPRI;
        System.out.println("record (ORC for PRI) #" + t.getCentral_Code());
        try {
            rowPRI = pri.size();
            System.out.println("number pri : " + rowPRI);
            System.out.println("number pri orc : " + orc.size());
            for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
                ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                if (orcs.get(1).get(0).equals("T12105")) {
                    PRI priB = new PRI();
                    All_Seq_no allSeq = new All_Seq_no();
                        allSeq.genSeq(msh.getSendingFacilityCode(), msh.getSendingFacilityDis(), msh.getSendingFacilitySubDis(), "PRI");
                    if (rowPRI > 0) {
                        for (int n = 0; n < rowPRI; n++) {

                            ArrayList<ArrayList<String>> alPRI = pri.get(n).getValue();
                            priB.setTxnCode(alPRI.get(1).get(0));
                            priB.setOrderNo(allSeq.getSeq());
                            priB.setFillerOrder(allSeq.getSeq());
                            priB.setEpisodeDate(orcs.get(7).get(0));
                            priB.setEncounterDate(orcs.get(8).get(0));
                            priB.setStatus(alPRI.get(6).get(0));
                            priB.setPriority(alPRI.get(7).get(0));
                            priB.setType(alPRI.get(8).get(0));
                            priB.setDisposition(alPRI.get(9).get(0));
                            priB.setCategory(alPRI.get(10).get(0));
                            priB.setReason(alPRI.get(11).get(0));

                            String eDate = alPRI.get(12).get(0);
                            if (!eDate.isEmpty()) {
                                String[] sDate = eDate.split("\\-", -1);
                                String nDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
                                priB.setEffectiveDate(nDate);
                            } else {
                                priB.setEffectiveDate("0000-00-00");
                            }
                            String expDate = alPRI.get(13).get(0);
                            if(!expDate.isEmpty()){
                                priB.setExpDate(expDate);
                            }else{
                                priB.setExpDate("0000-00-00");
                            }
                            
                            priB.setNotes(alPRI.get(14).get(0));
                            priB.setProviderCode(alPRI.get(15).get(0));
                            priB.setProviderName(alPRI.get(15).get(1));
                            priB.setProviderDisciplineCode(alPRI.get(15).get(2));
                            priB.setProviderDisciplineName(alPRI.get(15).get(3));
                            priB.setProviderSubDisciplineCode(alPRI.get(15).get(4));
                            priB.setProviderSubDisciplineName(alPRI.get(15).get(5));

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
                                    + "'" + orcs.get(9).get(0) + "',"
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
//                                System.out.println(query_pri_master);
//                                System.out.println(query_pri_detail);
                            try {
                                status_pri_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_pri_master);
                                status_pri_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_pri_detail);
                                if (status_pri_master == true && status_pri_detail == true) {
                                    System.out.println("Done PRI master AND DETAIL");
//                                    System.out.println(query_pri_master);
//                                    System.out.println(query_pri_detail);
                                } else {
                                    System.out.println("false PRI master AND DETAIL");
                                    System.out.println(query_pri_master);
                                    System.out.println(query_pri_detail);
                                }

                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                } else {
                    System.out.println("NO data");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
