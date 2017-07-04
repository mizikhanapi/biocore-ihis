package lhr_tables;

import Bean.HPI;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.HPI2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_HPI {

    public void M_HPI(Vector<HPI2> hpi2,get_ehr_central_data t) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_hpi_lhr_health_of_present_illness = true;

        int rowsHPI = hpi2.size();

         //declare outside so can display data outside bracket
        if (rowsHPI > 0) {

            ArrayList<HPI> hpiBr = new ArrayList<HPI>();
            for (int n = 0; n < rowsHPI; n++) {
                HPI hpiB = new HPI();
                ArrayList<ArrayList<String>> alHpi= hpi2.get(n).getValue();
                try {

                    hpiB.setPMI_no(t.getPmi_no());
                    hpiB.setEpisode_date(alHpi.get(1).get(0));
                    hpiB.setNotes(alHpi.get(2).get(0));
                    hpiB.setEncounter_Date(alHpi.get(2).get(1));
                    hpiB.setHfc_cd(alHpi.get(2).get(2));
                    hpiB.setDoctor_ID(alHpi.get(2).get(3));
                    hpiB.setDoctor_Name(alHpi.get(2).get(4));

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
                    String query2 = "insert into lhr_health_of_present_illness (PMI_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "details, "
                            + "doctor_id, "
                            + "doctor_name, "
                            + "NATIONAL_ID_NO, "
                            + "PERSON_ID_NO, "
                            + "PERSON_STATUS, "
                            + "center_code )"
                            + "values ('" + hpiB.getPMI_no() + "',"
                            + "'" + hpiB.getHfc_cd() + "',"
                            + "'" + hpiB.getEpisode_date() + "',"
                            + "'" + hpiB.getEncounter_Date() + "',"
                            + "'" + hpiB.getNotes() + "',"
                            + "'" + hpiB.getDoctor_ID() + "',"
                            + "'" + hpiB.getDoctor_Name() + "',"
                            + "'" + t.getNational_id_no() + "',"
                            + "'" + t.getPERSON_ID_NO() + "',"
                            + "'" + t.getPERSON_STATUS() + "',"
                            + "'" + t.getCentre_Code() + "')";
                    
                    status_hpi_lhr_health_of_present_illness = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query2);


                    ////System.out.println("stat:" + stat);
                    ////System.out.println("query:" + query2);
                    if (status_hpi_lhr_health_of_present_illness == false) {
                        //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                        //System.out.println("Query for HPI: " + query2);
                        total_fail_insert++;
                        System.out.println("false extract hpi");
                    }else{
                        System.out.println("done extract hpi");
                    }

                    hpiBr.add(hpiB);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }

    }
}
