package lhr_tables;

import Bean.HPI;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_HPI {

    public void M_HPI() {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_hpi_lhr_health_of_present_illness = true;

        get_ehr_central_data t = new get_ehr_central_data();
        t.getQuery();

        System.out.println("record #" + " " + t.getCentral_Code());

        MainRetrieval mr = new MainRetrieval();
        mr.startProcess(t.getTxndata());

        // DGS
        String dataHPI[][] = mr.getData("HPI");
        int rowsHPI = mr.getRowNums();

        HPI hpiB = new HPI(); //declare outside so can display data outside bracket
        if (rowsHPI > 0) {

            ArrayList<HPI> hpiBr = new ArrayList<HPI>();
            for (int n = 0; n < rowsHPI; n++) {

                try {

                    System.out.println("HPI #" + (n + 1));
                    System.out.println("dataHPI[" + n + "][0]: " + dataHPI[n][0]);

                    hpiB.setPMI_no(t.getPmi_no());
                    hpiB.setEpisode_date(dataHPI[n][0]);
                    hpiB.setNotes(dataHPI[n][1]);
                    hpiB.setEncounter_Date(dataHPI[n][2]);
                    hpiB.setHfc_cd(dataHPI[n][3]);
                    hpiB.setDoctor_ID(dataHPI[n][4]);
                    hpiB.setDoctor_Name(dataHPI[n][5]);

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
                            + "centre_code )"
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
                            + "'" + t.getTxndata() + "')";
                    System.out.println(hpiB.getPMI_no());
                    System.out.println(hpiB.getNotes());
                    status_hpi_lhr_health_of_present_illness = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query2);

                    System.out.println("status_hpi_lhr_health_of_present_illness:" + status_hpi_lhr_health_of_present_illness);

                    ////System.out.println("stat:" + stat);
                    ////System.out.println("query:" + query2);
                    if (status_hpi_lhr_health_of_present_illness == false) {
                        //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                        //System.out.println("Query for DGS: " + query2);
                        total_fail_insert++;
                    }

                    hpiBr.add(hpiB);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            update_ehr_central u = new update_ehr_central();
            u.update_status();

        }

    }
}
