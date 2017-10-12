/*
 * Copyright 2017 Shay.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package lhr_tables;

import Bean.ARP;
import Bean.ERRCOUNT;
import Bean.MSH;
import Bean.PDI;
import Config_Pack.Config;
import bean.ARP2;
import bean.ORC2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

/**
 *
 * @author Shay
 */
public class lhr_ARP {

    RMIConnector rc = new RMIConnector();
    private String query_alg_lhr_arp;
    //private Vector<ALG2> alg2;
    private int rowsARP;

    public void M_ARP(Vector<ARP2> arp2, get_ehr_central_data t, Vector<ORC2> orc, MSH msh, PDI pdi) {

        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_alg_lhr_arp;

        try {

            rowsARP = arp2.size();
            System.out.println("number: " + rowsARP);
            for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
                ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                if (orcs.get(1).get(0).equals("T12203")) {
                    ARP arpB = new ARP(); //declare outside so can display data outside bracket
                    if (rowsARP > 0) {

                        ArrayList<ARP> arpBr = new ArrayList<ARP>();
                        for (int n = 0; n < rowsARP; n++) {

                            try {

                                ArrayList<ArrayList<String>> alArp = arp2.get(n).getValue();

                                String a, b, c, d;
                                a = t.getNational_id_no();
                                b = t.getPERSON_STATUS();
                                c = t.getPERSON_ID_NO();
                                d = t.getCentre_Code();

                                if (a == null || a.isEmpty() || a.equals(" ")) {
                                    a = "PUBLIC HOSPITAL";
                                }

                                if (b == null || b.isEmpty() || b.equals(" ")) {
                                    b = "PUBLIC HOSPITAL";
                                }

                                if (c == null || c.isEmpty() || c.equals(" ")) {
                                    c = "PUBLIC HOSPITAL";
                                }

                                if (d == null || d.isEmpty() || d.equals(" ")) {
                                    d = "PUBLIC HOSPITAL";
                                }

                                arpB.setPMI_no(t.getPmi_no());
                                arpB.setDateTime(alArp.get(2).get(0));
                                arpB.setPrCode(alArp.get(1).get(0));
                                arpB.setPrName(alArp.get(1).get(1));
                                arpB.setPrCodeStd(alArp.get(1).get(2));
                                arpB.setPrDuration(alArp.get(3).get(0));
                                arpB.setDcgCode(alArp.get(4).get(0));
                                arpB.setDocId(alArp.get(5).get(0));
                                arpB.setDocName(alArp.get(6).get(0));
                                arpB.setLocCode(alArp.get(7).get(0));
                                arpB.setLocName(alArp.get(8).get(0));
                                arpB.setComment(alArp.get(9).get(0));
                                arpB.setRecHFCcode(alArp.get(10).get(0));
                                arpB.setEpisodeDate(alArp.get(11).get(0));
                                arpB.setEncounter_Date(orcs.get(8).get(0));
                                arpB.setProcedureOutcome(alArp.get(12).get(0));

                                query_alg_lhr_arp = "INSERT INTO lhr_procedure ("
                                        + "pmi_no,"
                                        + "hfc_cd,"
                                        + "episode_date,"
                                        + "encounter_date,"
                                        + "procedure_cd,"
                                        + "procedure_name,"
                                        + "procedure_outcome,"
                                        + "comment,"
                                        + "doctor_id,"
                                        + "doctor_name,"
                                        + "national_id_no,"
                                        + "person_id_no,"
                                        + "person_status,"
                                        + "centre_code,"
                                        + "discipline_cd,"
                                        + "subdiscipline_cd,"
                                        + "created_by,"
                                        + "created_date) VALUES("
                                        + "'" + arpB.getPMI_no().trim() + "',"
                                        + "'" + arpB.getRecHFCcode().trim() + "',"
                                        + "'" + arpB.getEpisodeDate().trim() + "',"
                                        + "'" + arpB.getEncounter_Date().trim() + "',"
                                        + "'" + arpB.getPrCode().trim() + "',"
                                        + "'" + arpB.getPrName().trim() + "',"
                                        + "'" + arpB.getProcedureOutcome().trim() + "',"
                                        + "'" + arpB.getComment().trim() + "',"
                                        + "'" + arpB.getDocId().trim() + "',"
                                        + "'" + arpB.getDocName().trim() + "',"
                                        + "'" + a.trim() + "',"
                                        + "'" + c.trim() + "',"
                                        + "'" + b.trim() + "',"
                                        + "'" + d.trim() + "',"
                                        + "'" + msh.getSendingFacilityDis() + "',"
                                        + "'" + msh.getSendingFacilitySubDis() + "',"
                                        + "'" + arpB.getDocId() + "',"
                                        + "'" + msh.getDateTime() + "')";

                                status_alg_lhr_arp = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_alg_lhr_arp);

                                if (status_alg_lhr_arp == true) {
                                    System.out.println("Done extract arp");
                                } else {
                                    System.out.println("False extract arp");
                                    System.out.println("query arp: " + query_alg_lhr_arp);
                                    ERRCOUNT.plusOne();
                                    ERRCOUNT.msgErr("ARP|");
                                }
                                arpBr.add(arpB);

                                //System.out.println(query_alg_lhr_alg);
                            } catch (Exception e) {
                                e.printStackTrace();
                                //System.out.println("Not a numbetr!");
                            }
                        }
                    }

//            update_ehr_central u = new update_ehr_central();
//            u.update_status();
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    public String getQuery_alg_lhr_arp() {
        return query_alg_lhr_arp;
    }
}
