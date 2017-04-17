package lhr_tables;

import Bean.ALG;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.util.ArrayList;
import main.RMIConnector;

public class lhr_ALG {

    public void M_ALG() {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_alg_lhr_allergy = true;
        
        try{
        get_ehr_central_data t = new get_ehr_central_data();
        t.getQuery();

        System.out.println("record #" + " " + t.getCentral_Code());

        MainRetrieval mr = new MainRetrieval();
        mr.startProcess(t.getTxndata());

        // ALG
        String dataALG[][] = mr.getData("ALG");
        int rowsALG = mr.getRowNums();

        ALG algB = new ALG(); //declare outside so can display data outside bracket
        if (rowsALG > 0) {

            ArrayList<ALG> algBr = new ArrayList<ALG>();
            for (int n = 0; n < rowsALG; n++) {

                try {

                    System.out.println("ALG #" + (n + 1));
                    System.out.println("dataALG[" + n + "][0]: " + dataALG[n][0]);

                    algB.setPMI_no(t.getPmi_no());
                    algB.setEpisode_date(dataALG[n][0]);
                    algB.setAllergy_cd(dataALG[n][1]);
                    algB.setOnset_date(dataALG[n][3]);
                    algB.setComment(dataALG[n][4]);
                    algB.setStatus(dataALG[n][8]);
                    algB.setEncounter_Date(dataALG[n][9]);
                    algB.setHfc_cd(dataALG[n][10]);
                    algB.setDoctor_ID(dataALG[n][11]);
                    algB.setDoctor_Name(dataALG[n][12]);
                    algB.setTerm_type(dataALG[n][13]);
                    algB.setIcd10_cd(dataALG[n][1]);
                    algB.setIcd10_description(dataALG[n][2]);

//                            // increase time 5 sec to prevent duplicate during insert.
//                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                            Date date_time = null;
//
//                            // if null insert current date time
//                            if (dataDGS[n][22] == null) {
//                                Calendar cal = Calendar.getInstance();
//                                dgsB.setEncounter_Date(df.format(cal.getTime()));
//                            } else { // insert random date time
//                                date_time = df.parse(dataDGS[n][22]);
//
//                                Calendar gc = new GregorianCalendar();
//                                gc.setTime(date_time);
//
//                                //create rand number by range http://stackoverflow.com/a/6029518/894470
//                                int min = 0;
//                                int max = 1000000000;
//                                Random r = new Random();
//                                int rand_num = r.nextInt(max - min + 1) + min;
//                                gc.add(Calendar.SECOND, rand_num);
//                                Date d2 = gc.getTime();
//
//                                dgsB.setEncounter_Date(df.format(d2));
//                            }
//                            //
                    // encounter date must get from ecss client.
                    String query_alg_lhr_alg = "insert into lhr_allergy (PMI_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "allergy_cd, " //insert icd10 code
                            + "onset_date, "
                            + "term_type, "
                            //  + "diagnosis_status, "                                    
                            //  + "diagnosis_date, "
                            + "icd10_cd, "
                            + "icd10_description, "
                            + "term_cd, "
                            + "term_description, "
                            + "comment, "
                            + "status, "
                            + "doctor_id, "
                            + "doctor_name, "
                            + "NATIONAL_ID_NO, "
                            + "PERSON_ID_NO, "
                            + "PERSON_STATUS, "
                            + "centre_code )"
                            + "values ('" + algB.getPMI_no() + "',"
                            + "'" + algB.getHfc_cd() + "',"
                            + "'" + algB.getEpisode_date() + "',"
                            + "'" + algB.getEncounter_Date() + "',"
                            + "'" + algB.getAllergy_cd() + "',"
                            + "'" + algB.getOnset_date() + "',"
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
                            + "'" + t.getCentre_Code() + "')";
                    System.out.println(algB.getPMI_no());
                    System.out.println(algB.getIcd10_cd());
                    System.out.println(algB.getIcd10_description());
                    status_alg_lhr_allergy = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_alg_lhr_alg);

                    System.out.println("status_alg_lhr_allergy:" + status_alg_lhr_allergy);

                    ////System.out.println("stat:" + stat);
                    ////System.out.println("query:" + query2);
                    if (status_alg_lhr_allergy == true) {
                        //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                        //System.out.println("Query for DGS: " + query2);
                        //total_fail_insert++;
                        System.out.println("Done.");
                    } else {
                        System.out.println("False.");
                    }

                    algBr.add(algB);

                } catch (Exception e) {
                    e.printStackTrace();
                    //System.out.println("Not a numbetr!");
                }
            }

            update_ehr_central u = new update_ehr_central();
            u.update_status();

        }
        }catch(Exception e){
              e.getStackTrace();
         }
    }

}
