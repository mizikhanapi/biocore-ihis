package lhr_tables;

import Bean.ALG;
import Bean.LIO;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import main.RMIConnector;

public class lhr_LIO {
    
   Date datenow = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");

    public boolean M_LIO() {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_alg_lhr_allergy = true;

        String sql2 = "SELECT "
                + "ec.central_code, " //0
                + "ec.pmi_no, " //1
                + "ec.c_txndate, " //2
                + "ec.c_txndata, " //3
                + "ec.status, " //4
                + "ssi.national_id_no," //5
                + "ssi.person_id_no," //6
                + "ssi.person_status," //7
                + "ssi.location_code " //8
                + "FROM ehr_central ec, pms_patient_biodata ppb "
                + "LEFT JOIN special_integration_information ssi "
                + "ON ppb.new_ic_no = ssi.national_id_no "
                + "WHERE ec.pmi_no = ppb.pmi_no "
                + "AND ec.status_1 = 1"; // select undischarge patient (1)

        ArrayList<ArrayList<String>> data2 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql2);

        for (int j = 0; j < data2.size(); j++) { //Show records in arrayList taken from table ehr_central row

            try {

                String PMI_no = data2.get(j).get(1);
                String NATIONAL_ID_NO = data2.get(j).get(5);
                String PERSON_ID_NO = data2.get(j).get(6);
                String PERSON_STATUS = data2.get(j).get(7);
                String LOCATION_CODE = data2.get(j).get(8);
                String Centre_Code = data2.get(j).get(8);

                String Central_Code = data2.get(j).get(0);

                System.out.println("record #" + (j + 1) + " " + Central_Code);

                String episode = data2.get(j).get(2);
                String txndata1 = data2.get(j).get(3);

                MainRetrieval mr = new MainRetrieval();
                mr.startProcess(txndata1);

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

                            algB.setPMI_no(PMI_no);
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
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + LOCATION_CODE + "')";
                            System.out.println(algB.getPMI_no());
                            System.out.println(algB.getIcd10_cd());
                            System.out.println(algB.getIcd10_description());
                            status_alg_lhr_allergy = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_alg_lhr_alg);

                            System.out.println("status_alg_lhr_allergy:" + status_alg_lhr_allergy);

                            ////System.out.println("stat:" + stat);
                            ////System.out.println("query:" + query2);
                            if (status_alg_lhr_allergy == false) {
                                //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for DGS: " + query2);
                                total_fail_insert++;
                            }

                            algBr.add(algB);

                        } catch (Exception e) {
                            e.printStackTrace();
                            //System.out.println("Not a numbetr!");
                        }
                    }

                }

            } catch (Exception e) {
                e.printStackTrace();
                //System.out.println("Error try to fix it!");
            }
        }
        return true;
    }
    
}
