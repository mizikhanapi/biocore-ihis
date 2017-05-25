package lhr_tables;

import Bean.DAB;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.DAB2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_DAB {

    public void M_DAB(Vector<DAB2> dab2,get_ehr_central_data t) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_dab_lhr_disability = true;

        try {
           
            int rowsDAB = dab2.size();

             //declare outside so can display data outside bracket
            if (rowsDAB > 0) {

                ArrayList<DAB> dabBr = new ArrayList<DAB>();
                for (int n = 0; n < rowsDAB; n++) {
                    DAB dabB = new DAB();
                    ArrayList<ArrayList<String>> alDab = dab2.get(n).getValue();
                    try {


                        dabB.setEpisode_date(alDab.get(1).get(0));
                        dabB.setDAB_code(alDab.get(2).get(0));
                        dabB.setDAB_type(alDab.get(2).get(1));
                        
                        String DabDateRaw = alDab.get(2).get(2);
                        String[] spliteDABDate = DabDateRaw.split("-");
                        String newDabDate = spliteDABDate[2]+"-"+spliteDABDate[1]+"-"+spliteDABDate[0];
                        dabB.setDAB_date(newDabDate);
                        
                        dabB.setDAB_comment(alDab.get(2).get(3));
                        
                        if(alDab.get(2).get(4).equals("-")){
                            dabB.setIcd10_cd(alDab.get(2).get(0));
                        }else{
                            dabB.setIcd10_cd(alDab.get(2).get(4));
                        }
                        
                        if(alDab.get(2).get(5).equals("-")){
                            dabB.setIcd10_desc(alDab.get(2).get(1));
                        }else{
                            dabB.setIcd10_desc(alDab.get(2).get(5));
                        }
                        

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
                                + "DAB_code, "
                                + "DAB_date, "
                                + "DAB_comment, "
                                + "icd10_code, "
                                + "icd10_description) "
                                + "values ('" + dabB.getEpisode_date() + "',"
                                + "'" + dabB.getDAB_type() + "',"
                                + "'" + dabB.getDAB_code() + "',"
                                + "'" + dabB.getDAB_date() + "',"
                                + "'" + dabB.getDAB_comment() + "',"
                                + "'" + dabB.getIcd10_cd() + "',"
                                + "'" + dabB.getIcd10_desc() + "');";
//                        System.err.println(dabB.getEpisode_date());
//                        System.err.println(dabB.getDAB_type());
//                        System.err.println(dabB.getDAB_code());
                        status_dab_lhr_disability = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_dab_lhr_dab);

                        //System.out.println("status_dab_lhr_disability:" + status_dab_lhr_disability);

                        ////System.out.println("stat:" + stat);
                        ////System.out.println("query:" + query2);
                        if (status_dab_lhr_disability == false) {
                            //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                            //System.out.println("Query for DAB: " + query_dab_lhr_dab);
                            total_fail_insert++;
                            System.out.println("False extract DAB");
                        }else{
                            System.out.println("Done extract DAB");
                        }

                        dabBr.add(dabB);

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
