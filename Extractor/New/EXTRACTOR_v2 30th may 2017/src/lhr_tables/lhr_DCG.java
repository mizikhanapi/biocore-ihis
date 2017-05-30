/*
 * Copyright 2017 shay.
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
import Bean.DCG;
import Config_Pack.Config;
import bean.DCG2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;
/**
 *
 * @author shay
 */

public class lhr_DCG {
    
    public boolean M_DCG(Vector<DCG2> dcg, get_ehr_central_data t) {
        boolean status_lhr_dcg = false;
        RMIConnector rmic = new RMIConnector();
        try {
            int rowDCG = dcg.size();
            if (rowDCG > 0) {
                ArrayList<DCG> dcgBeanss = new ArrayList<DCG>();
                for (int i = 0; i < rowDCG; i++) {
                    try {
                        ArrayList<ArrayList<String>> alDcg = dcg.get(i).getValue();
                        DCG dcgbean = new DCG();
                        dcgbean.setEpisodeDate(alDcg.get(1).get(0));
                        
                        dcgbean.setEncounterDate(alDcg.get(2).get(0));
                        dcgbean.setHfcCd(alDcg.get(2).get(1));
                        dcgbean.setHfcName(alDcg.get(2).get(2));
                        dcgbean.setPatientCategory(alDcg.get(2).get(3));
                        dcgbean.setConsultingDoctorID(alDcg.get(2).get(4));
                        dcgbean.setConsultingDoctorName(alDcg.get(2).get(5));
                        dcgbean.setAttainDoctorID(alDcg.get(2).get(6));
                        dcgbean.setAttainDoctorName(alDcg.get(2).get(7));
                        dcgbean.setDischargeDateTime(alDcg.get(2).get(8));
                        dcgbean.setDischargeDisposition(alDcg.get(2).get(9));
                        dcgbean.setComment(alDcg.get(2).get(10));
                        dcgbean.setMessageType(alDcg.get(2).get(11)); 
                        
                        dcgbean.setDischargeSummary(alDcg.get(3).get(0));
                       

                        String query_lhr_discharge_summary = "insert into lhr_discharge_summary("
                                + "pmi_no,"
                                + "hfc_cd,"
                                + "episode_date,"
                                + "encounter_date,"
                                //+ "discipline_cd,"
                                //+ "subdiscipline_cd,"
                                + "discharge_type,"
                                + "discharge_date,"
                                + "discharge_disposition,"
                                + "consulting_doctor_id,"
                                + "message_type,"
                                + "discharge_summary_notes,"
                                + "created_by,"
                                + "created_date,"
                                + "message) values('"
                                + t.getPmi_no()+ "','"
                                + dcgbean.getHfcCd()+ "','"
                                + dcgbean.getEpisodeDate()+ "','"
                                + dcgbean.getEncounterDate()+ "','"
                                //+ dcgbean.getReqDrugCod() + "','"
                                //+ dcgbean.getPMI_no()+"',"
                                + dcgbean.getMessageType()+ "','"
                                + dcgbean.getDischargeDateTime()+ "','"
                                + dcgbean.getDischargeDisposition()+ "','"
                                + dcgbean.getConsultingDoctorID()+ "','"
                                + dcgbean.getMessageType()+ "','"
                                + dcgbean.getComment()+ "','"
                                + dcgbean.getAttainDoctorID()+ "','"
                                + dcgbean.getEncounterDate()+ "','"
                                + dcgbean.getDischargeSummary()+ "');";
                        status_lhr_dcg = rmic.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_discharge_summary);

                        if (status_lhr_dcg == false) {
                            System.out.println("false extracting dcg");
                        } else {
                            System.out.println("true extracting dcg");
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }
}
