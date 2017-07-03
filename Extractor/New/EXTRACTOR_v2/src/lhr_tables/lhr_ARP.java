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
import Config_Pack.Config;
import bean.ARP2;
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
    
    public void M_ARP(Vector<ARP2> arp2, get_ehr_central_data t) {

        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_alg_lhr_arp;

        try {

            rowsARP = arp2.size();
            System.out.println("number: " + rowsARP);

            ARP arpB = new ARP(); //declare outside so can display data outside bracket
            if (rowsARP > 0) {

                ArrayList<ARP> arpBr = new ArrayList<ARP>();
                for (int n = 0; n < rowsARP; n++) {

                    try {

                        ArrayList<ArrayList<String>> alArp = arp2.get(n).getValue();

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
                        arpB.setEncounter_Date(query_alg_lhr_arp);

                        query_alg_lhr_arp = "";

                        status_alg_lhr_arp = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_alg_lhr_arp);

                        if (status_alg_lhr_arp == true) {
                            System.out.println("Done extract alg");
                        } else {
                            System.out.println("False extract alg");
                            //System.out.println("query alg: "+query_alg_lhr_alg);
                        }
                        arpBr.add(arpB);

                        //System.out.println(query_alg_lhr_alg);
                    } catch (Exception e) {
                        e.printStackTrace();
                        //System.out.println("Not a numbetr!");
                    }
                }

//            update_ehr_central u = new update_ehr_central();
//            u.update_status();
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    public String getQuery_alg_lhr_arp() {
        return query_alg_lhr_arp;
    }
}
