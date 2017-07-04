package lhr_tables;

import Bean.ALG;
import Config_Pack.Config;
import bean.ALG2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;

public class lhr_ALG {

    RMIConnector rc = new RMIConnector();
    private String query_alg_lhr_alg;
    //private Vector<ALG2> alg2;
    private int rowsALG;

    public void M_ALG(Vector<ALG2> alg2, get_ehr_central_data t) {

        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_alg_lhr_allergy;

        try {

            rowsALG = alg2.size();
            System.out.println("number: " + rowsALG);

            ALG algB = new ALG(); //declare outside so can display data outside bracket
            if (rowsALG > 0) {

                ArrayList<ALG> algBr = new ArrayList<ALG>();
                for (int n = 0; n < rowsALG; n++) {

                    try {

                        ArrayList<ArrayList<String>> alAlg = alg2.get(n).getValue();

                        algB.setPMI_no(t.getPmi_no());
                        algB.setEpisode_date(alAlg.get(1).get(0));
                        algB.setAllergy_cd(alAlg.get(2).get(0));

                        if (alAlg.get(2).get(6).isEmpty() || alAlg.get(2).get(6).equalsIgnoreCase("-") || alAlg.get(2).get(6).equalsIgnoreCase(" ")) {
                            algB.setOnset_date(null);
                        } else {
                            algB.setOnset_date("'" + alAlg.get(2).get(6) + "'");
                        }

                        algB.setComment(alAlg.get(2).get(3));
                        algB.setStatus(alAlg.get(2).get(7));
                        algB.setEncounter_Date(alAlg.get(2).get(8));
                        algB.setHfc_cd(alAlg.get(2).get(9));
                        algB.setDoctor_ID(alAlg.get(2).get(10));
                        algB.setDoctor_Name(alAlg.get(2).get(11));
                        algB.setTerm_type(alAlg.get(2).get(12));

                        if (alAlg.get(2).get(13).equals("-")) {
                            algB.setIcd10_cd(alAlg.get(2).get(0));
                        } else {
                            algB.setIcd10_cd(alAlg.get(2).get(13));
                        }

                        if (alAlg.get(2).get(13).equals("-")) {
                            algB.setIcd10_description(alAlg.get(2).get(1));
                        } else {
                            algB.setIcd10_description(alAlg.get(2).get(14));
                        }

                        query_alg_lhr_alg = "insert into lhr_allergy (PMI_no,"
                                + "hfc_cd,"
                                + "episode_date,"
                                + "encounter_cd,"
                                + "allergy_cd," //insert icd10 code
                                + "onset_date,"
                                + "term_type,"
                                + "icd10_cd,"
                                + "icd10_description,"
                                + "term_cd,"
                                + "term_description,"
                                + "comment,"
                                + "status,"
                                + "doctor_id,"
                                + "doctor_name,"
                                + "NATIONAL_ID_NO,"
                                + "PERSON_ID_NO,"
                                + "PERSON_STATUS,"
                                + "centre_code)"
                                + "values ('" + algB.getPMI_no() + "',"
                                + "'" + algB.getHfc_cd() + "',"
                                + "'" + algB.getEpisode_date() + "',"
                                + "'" + algB.getEncounter_Date() + "',"
                                + "'" + algB.getAllergy_cd() + "',"
                                + "" + algB.getOnset_date() + ","
                                + "'" + algB.getTerm_type() + "',"
                                + "'" + algB.getIcd10_cd() + "',"
                                + "'" + algB.getIcd10_description() + "',"
                                + "'" + algB.getTerm_cd() + "',"
                                + "'" + algB.getTerm_description() + "',"
                                + "'" + algB.getComment() + "',"
                                + "'" + algB.getStatus() + "',"
                                + "'" + algB.getDoctor_ID() + "',"
                                + "'" + algB.getDoctor_Name() + "'," //temp
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "');";

                        status_alg_lhr_allergy = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_alg_lhr_alg);

                        if (status_alg_lhr_allergy == true) {
                            System.out.println("Done extract alg");
                        } else {
                            System.out.println("False extract alg");
                            //System.out.println("query alg: "+query_alg_lhr_alg);
                        }
                        algBr.add(algB);

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

    public String getQuery_alg_lhr_alg() {
        return query_alg_lhr_alg;
    }

}
