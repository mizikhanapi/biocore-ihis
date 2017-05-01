package lhr_tables;

import Bean.CCN;
import Config_Pack.Config;
import bean.CCN2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;

public class lhr_CCN {

    public void M_CCN(Vector<CCN2> ccn2,get_ehr_central_data t) {

        RMIConnector rc = new RMIConnector();

        int total_fail_insert = 0; //total of failed insert

        boolean status_ccn_lhr_signs = true;

        try {

            int rowsCCN = ccn2.size();

            if (rowsCCN > 0) {
                ArrayList<CCN> ccnBeans = new ArrayList<CCN>();
                
                for (int k = 0; k < rowsCCN; k++) {
                    CCN ccnBean = new CCN();
                    ArrayList<ArrayList<String>> alCcn = ccn2.get(k).getValue();
                    try {

                        System.out.println("ccn #" + (k + 1));

                        
                        ccnBean.setEpisode_date(alCcn.get(1).get(0));
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

                        ccnBean.setEncounter_Date(alCcn.get(2).get(14));
                        ccnBean.setHfc_cd(alCcn.get(2).get(15));
                        ccnBean.setTxnDate(alCcn.get(2).get(12));

                        // check if array data is null. if null insert current date time
                        if (alCcn.get(2).get(12).equalsIgnoreCase("-") || alCcn.get(2).get(12).isEmpty() || alCcn.get(2).get(12).equalsIgnoreCase(" ")) {
                            Calendar cal = Calendar.getInstance();
                            ccnBean.setTxnDate(df.format(cal.getTime()));
                        }
                        //                            

                        ccnBean.setSymptom_Code(alCcn.get(2).get(0));
                        ccnBean.setSymptom_Name(alCcn.get(2).get(1));
                        ccnBean.setTerm_Type(alCcn.get(2).get(18));
                        ccnBean.setSeverity_Desc(alCcn.get(2).get(3));
                        ccnBean.setComment(alCcn.get(2).get(11));
                        ccnBean.setStatus(alCcn.get(2).get(13));
                        ccnBean.setDoctor_ID(alCcn.get(2).get(16));
                        ccnBean.setDoctor_Name(alCcn.get(2).get(17));

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
                            System.out.println("Done extract ccn");
                        } else {
                            System.out.println("False extract ccn");
                            //System.out.println("query ccn: "+query1);
                        }

                        ccnBeans.add(ccnBean);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

//                update_ehr_central u = new update_ehr_central();
//                u.update_status();

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}
