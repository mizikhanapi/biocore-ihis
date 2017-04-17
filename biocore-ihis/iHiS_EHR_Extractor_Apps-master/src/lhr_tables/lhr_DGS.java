package lhr_tables;

import Bean.DGS;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_DGS {

    public void M_DGS() {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_dgs_lhr_diagnosis = true;

        try {

            get_ehr_central_data t = new get_ehr_central_data();
            t.getQuery();

            System.out.println("record #" + " " + t.getCentral_Code());

            MainRetrieval mr = new MainRetrieval();
            mr.startProcess(t.getTxndata());

            // DGS
            String dataDGS[][] = mr.getData("DGS");
            int rowsDGS = mr.getRowNums();

            DGS dgsB = new DGS(); //declare outside so can display data outside bracket
            if (rowsDGS > 0) {

                ArrayList<DGS> dgsBr = new ArrayList<DGS>();
                for (int n = 0; n < rowsDGS; n++) {

                    try {

                        System.out.println("dgs #" + (n + 1));
                        System.out.println("dataDGS[" + n + "][0]: " + dataDGS[n][0]);

                        dgsB.setPMI_no(t.getPmi_no());
                        dgsB.setEpisode_Date(dataDGS[n][0]);
                        dgsB.setDiagnosis_Type(dataDGS[n][1]);
                        dgsB.setDiagnosis_Type_Desc(dataDGS[n][2]);
                        dgsB.setDiagnosis_Status(dataDGS[n][3]);
                        dgsB.setDiagnosis_Date(dataDGS[n][4]);
                        dgsB.setRead_Code(dataDGS[n][5]);
                        dgsB.setRead_Description(dataDGS[n][6]);
                        dgsB.setDiagnosis_Cd(dataDGS[n][7]);
                        dgsB.setDiagnosis_Desc(dataDGS[n][8]);
                        dgsB.setSeverity_Cd(dataDGS[n][9]);
                        dgsB.setSeverity_Desc(dataDGS[n][10]);
                        dgsB.setSite_Cd(dataDGS[n][11]);
                        dgsB.setSite_Desc(dataDGS[n][12]);
                        dgsB.setEpisodicity_Cd(dataDGS[n][13]);
                        dgsB.setEpisodicity_Desc(dataDGS[n][14]);
                        dgsB.setLaterality_Cd(dataDGS[n][15]);
                        dgsB.setLaterality_Desc(dataDGS[n][16]);
                        dgsB.setCausative_Cd(dataDGS[n][17]);
                        dgsB.setCausative_Desc(dataDGS[n][18]);
                        dgsB.setComment(dataDGS[n][19]);
                        dgsB.setTxn_Date(dataDGS[n][20]);
                        dgsB.setStatus(dataDGS[n][21]);

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
                        dgsB.setEncounter_Date(dataDGS[n][22]);

                        dgsB.setHFC(dataDGS[n][23]);
                        dgsB.setDoctor_ID(dataDGS[n][24]);
                        dgsB.setDoctor_Name(dataDGS[n][25]);
                        dgsB.setTerm_Type(dataDGS[n][26]);
                        dgsB.setICD10_Code(dataDGS[n][5]); //Modified By Ahmed (13/3/2017)
                        dgsB.setICD10_Desc(dataDGS[n][6]); //Modified By Ahmed (13/3/2017)

                        String query2 = "insert into lhr_diagnosis (PMI_no, "
                                + "hfc_cd, "
                                + "episode_date, "
                                + "encounter_date, "
                                + "diagnosis_cd, "
                                + "term_type, "
                                + "diagnosis_status, "
                                + "diagnosis_date, "
                                + "icd10_cd, "
                                + "icd10_description, "
                                + "term_cd, "
                                + "term_description, "
                                + "severity, "
                                + "site, "
                                + "comment, "
                                + "status, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "NATIONAL_ID_NO, "
                                + "PERSON_ID_NO, "
                                + "PERSON_STATUS, "
                                + "centre_code )"
                                + "values ('" + dgsB.getPMI_no() + "',"
                                + "'" + dgsB.getHFC() + "',"
                                + "'" + dgsB.getEpisode_Date() + "',"
                                + "'" + dgsB.getEncounter_Date() + "',"
                                + "'" + dgsB.getDiagnosis_Cd() + "',"
                                + "'" + dgsB.getTerm_Type() + "',"
                                + "'" + dgsB.getDiagnosis_Status() + "',"
                                + "'" + dgsB.getDiagnosis_Date() + "',"
                                + "'" + dgsB.getICD10_Code() + "',"
                                + "'" + dgsB.getICD10_Desc() + "',"
                                + "'" + dgsB.getTerm_Type() + "'," //temp
                                + "'" + dgsB.getTerm_Type() + "'," //temp
                                + "'" + dgsB.getSeverity_Desc() + "',"
                                + "'" + dgsB.getSite_Desc() + "',"
                                + "'" + dgsB.getComment() + "',"
                                + "'" + dgsB.getStatus() + "',"
                                + "'" + dgsB.getDoctor_ID() + "',"
                                + "'" + dgsB.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";
                        //System.out.println(dgsB.getICD10_Code());
                        //System.out.println(dgsB.getICD10_Desc());
                        status_dgs_lhr_diagnosis = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query2);

                        System.out.println("status_dgs_lhr_diagnosis:" + status_dgs_lhr_diagnosis);

                        ////System.out.println("stat:" + stat);
                        ////System.out.println("query:" + query2);
                        if (status_dgs_lhr_diagnosis == true) {
                            //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                            //System.out.println("Query for DGS: " + query2);
                            //total_fail_insert++;
                            System.out.println("Done.");
                        } else {
                            System.out.println("False.");
                        }

                        dgsBr.add(dgsB);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                update_ehr_central u = new update_ehr_central();
                u.update_status();

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
