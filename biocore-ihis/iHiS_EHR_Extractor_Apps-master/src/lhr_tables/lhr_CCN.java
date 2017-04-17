package lhr_tables;

import Bean.CCN;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_CCN {

    public void M_CCN() {

        RMIConnector rc = new RMIConnector();

        int total_fail_insert = 0; //total of failed insert

        boolean status_ccn_lhr_signs = true;

        try {

            get_ehr_central_data t = new get_ehr_central_data();
            t.getQuery();

            System.out.println("record #" + " " + t.getCentral_Code());

            MainRetrieval mr = new MainRetrieval();
            mr.startProcess(t.getTxndata());

            // CCN
            String dataCCN[][] = mr.getData("CCN");
            int rowsCCN = mr.getRowNums();

            if (rowsCCN > 0) {

                ArrayList<CCN> ccnBeans = new ArrayList<CCN>();
                for (int k = 0; k < rowsCCN; k++) {

                    try {

                        System.out.println("ccn #" + (k + 1));

                        CCN ccnBean = new CCN();
                        ccnBean.setEpisode_date(dataCCN[k][0]);
                        ccnBean.setPMI_no(t.getPmi_no());

//                            // change time to prevent duplicate during insert. http://stackoverflow.com/a/759056/894470
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                            Date date_time = null;
//
//                            if (dataCCN[k][15] == null) {
//                                Calendar cal = Calendar.getInstance();
//                                ccnBean.setEncounter_Date(df.format(cal.getTime()));
//                            } else {
//                                date_time = df.parse(dataCCN[k][15]);
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
//                                ccnBean.setEncounter_Date(df.format(d2));
//                            }
//                            //

                        ccnBean.setEncounter_Date(dataCCN[k][15]);
                        ccnBean.setHfc_cd(dataCCN[k][16]);
                        ccnBean.setTxnDate(dataCCN[k][13]);

                        // check if array data is null. if null insert current date time
                        if (dataCCN[k][13] == null) {
                            Calendar cal = Calendar.getInstance();
                            ccnBean.setTxnDate(df.format(cal.getTime()));
                        }
                        //                            

                        ccnBean.setSymptom_Code(dataCCN[k][1]);
                        ccnBean.setSymptom_Name(dataCCN[k][2]);
                        ccnBean.setTerm_Type(dataCCN[k][19]);
                        ccnBean.setSeverity_Desc(dataCCN[k][4]);
                        ccnBean.setComment(dataCCN[k][12]);
                        ccnBean.setStatus(dataCCN[k][14]);
                        ccnBean.setDoctor_ID(dataCCN[k][17]);
                        ccnBean.setDoctor_Name(dataCCN[k][18]);

                        String query1 = "insert into lhr_signs (PMI_no, "
                                + "hfc_cd,"
                                + "episode_date, "
                                + "encounter_date, "
                                + "txn_date, "
                                + "symptom_cd, "
                                + "symptom_name,  "
                                + "term_type,  "
                                + "severity_desc,  "
                                + "comment,  "
                                + "status,  "
                                + "doctor_iD,  "
                                + "doctor_name,  "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code)"
                                + "values ('" + ccnBean.getPMI_no() + "',"
                                + "'" + ccnBean.getHfc_cd() + "',"
                                + "'" + ccnBean.getEpisode_date() + "',"
                                + "'" + ccnBean.getEncounter_Date() + "',"
                                + "'" + ccnBean.getTxnDate() + "',"
                                + "'" + ccnBean.getSymptom_Code() + "',"
                                + "'" + ccnBean.getSymptom_Name() + "',"
                                + "'" + ccnBean.getTerm_Type() + "',"
                                + "'" + ccnBean.getSeverity_Desc() + "',"
                                + "'" + ccnBean.getComment() + "',"
                                + "'" + ccnBean.getStatus() + "',"
                                + "'" + ccnBean.getDoctor_ID() + "',"
                                + "'" + ccnBean.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";

                        status_ccn_lhr_signs = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query1);
                        ////System.out.println("query CCN: " + query1);
                        ////System.out.println("status CCN " + status);
                        if (status_ccn_lhr_signs == true) {
                            //System.out.println("Failed to insert data into lhr_signs (CCN) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                            //System.out.println("Query for CCN: " + query1);
                            //total_fail_insert++;
                            System.out.println("Done.");
                        } else {
                            System.out.println("False.");
                        }

                        ccnBeans.add(ccnBean);

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
