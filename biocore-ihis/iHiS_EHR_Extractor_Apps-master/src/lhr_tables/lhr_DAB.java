package lhr_tables;

import Bean.DAB;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_DAB {

    public void M_DAB() {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_dab_lhr_disability = true;

        try {
            get_ehr_central_data t = new get_ehr_central_data();
            t.getQuery();

            System.out.println("record #" + " " + t.getCentral_Code());

            MainRetrieval mr = new MainRetrieval();
            mr.startProcess(t.getTxndata());

            // DAB
            String dataDAB[][] = mr.getData("DAB");
            int rowsDAB = mr.getRowNums();

            DAB dabB = new DAB(); //declare outside so can display data outside bracket
            if (rowsDAB > 0) {

                ArrayList<DAB> dabBr = new ArrayList<DAB>();
                for (int n = 0; n < rowsDAB; n++) {

                    try {

                        System.out.println("DAB #" + (n + 1));
                        System.out.println("dataDAB[" + n + "][0]: " + dataDAB[n][0]);

                        dabB.setEpisode_date(dataDAB[n][0]);
                        dabB.setDAB_code(dataDAB[n][1]);
                        dabB.setDAB_type(dataDAB[n][2]);
                        dabB.setDAB_date(dataDAB[n][3]);
                        dabB.setDAB_comment(dataDAB[n][4]);
                        dabB.setIcd10_cd(dataDAB[n][5]);
                        dabB.setIcd10_desc(dataDAB[n][6]);

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
                        String query_dab_lhr_dab = "insert into lhr_disability (episode_date, "
                                + "DAB_type, "
                                + "DAB_cd, "
                                + "DAB_date, "
                                + "DAB_comment, "
                                + "icd10_code, "
                                + "icd10_description, "
                                + "values ('" + dabB.getEpisode_date() + "',"
                                + "'" + dabB.getDAB_type() + "',"
                                + "'" + dabB.getDAB_code() + "',"
                                + "'" + dabB.getDAB_date() + "',"
                                + "'" + dabB.getDAB_comment() + "',"
                                + "'" + dabB.getIcd10_cd() + "',"
                                + "'" + dabB.getIcd10_desc() + "',";
                        System.err.println(dabB.getEpisode_date());
                        System.err.println(dabB.getDAB_type());
                        System.err.println(dabB.getDAB_code());
                        status_dab_lhr_disability = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_dab_lhr_dab);

                        System.out.println("status_dab_lhr_disability:" + status_dab_lhr_disability);

                        ////System.out.println("stat:" + stat);
                        ////System.out.println("query:" + query2);
                        if (status_dab_lhr_disability == false) {
                            //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                            //System.out.println("Query for DGS: " + query2);
                            total_fail_insert++;
                        }

                        dabBr.add(dabB);

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
