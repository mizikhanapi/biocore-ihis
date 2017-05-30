package lhr_tables;

import Bean.IMU;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.IMU2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_IMU {

    public boolean M_IMU(Vector<IMU2> imu2, get_ehr_central_data t) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_imu_lhr_immunisation = true;

        try {

            int rowsIMU = imu2.size();

            //declare outside so can display data outside bracket
            if (rowsIMU > 0) {

                ArrayList<IMU> imuBr = new ArrayList<IMU>();
                for (int n = 0; n < rowsIMU; n++) {
                    IMU imuB = new IMU();
                    ArrayList<ArrayList<String>> alImu = imu2.get(n).getValue();
                    try {

                        imuB.setPMI_no(t.getPmi_no());
                        imuB.setEpisode_date(alImu.get(1).get(0));
                        imuB.setimmunization_cd(alImu.get(2).get(0));

                        String DateRaw = alImu.get(2).get(2);
                        String[] splitedDate = DateRaw.split("-");
                        String newDate = splitedDate[2] + "-" + splitedDate[1] + "-" + splitedDate[0];

                        imuB.setOnset_date(newDate);
                        imuB.setComment(alImu.get(2).get(3));
                        imuB.setStatus(alImu.get(2).get(7));
                        imuB.setEncounter_Date(alImu.get(2).get(8));
                        imuB.setHfc_cd(alImu.get(2).get(9));
                        imuB.setDoctor_ID(alImu.get(2).get(10));
                        imuB.setDoctor_Name(alImu.get(2).get(11));
                        imuB.setTerm_type(alImu.get(2).get(12));

                        
                        if (alImu.get(2).get(13).equals("-")) {
                            imuB.setIcd10_cd(alImu.get(2).get(0));
                        } else {
                            imuB.setIcd10_cd(alImu.get(2).get(13));
                        }

                        if (alImu.get(2).get(14).equals("-")) {
                            imuB.setIcd10_description(alImu.get(2).get(1));

                        } else {
                            imuB.setIcd10_description(alImu.get(2).get(14));

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
                        String query_imu_lhr_imu = "insert into lhr_immunisation (PMI_no, "
                                + "hfc_cd, "
                                + "episode_date, "
                                + "encounter_cd, "
                                + "immunisation_cd, " //insert icd10 code
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
                                + "values ('" + imuB.getPMI_no() + "',"
                                + "'" + imuB.getHfc_cd() + "',"
                                + "'" + imuB.getEpisode_date() + "',"
                                + "'" + imuB.getEncounter_Date() + "',"
                                + "'" + imuB.getimmunization_cd() + "',"
                                + "'" + imuB.getOnset_date() + "',"
                                + "'" + imuB.getTerm_type() + "',"
                                + "'" + imuB.getIcd10_cd() + "',"
                                + "'" + imuB.getIcd10_description() + "',"
                                + "'" + imuB.getTerm_cd() + "',"
                                + "'" + imuB.getTerm_description() + "',"
                                + "'" + imuB.getComment() + "',"
                                + "'" + imuB.getStatus() + "',"
                                + "'" + imuB.getDoctor_ID() + "',"
                                + "'" + imuB.getDoctor_Name() + "'," //temp
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";

                        status_imu_lhr_immunisation = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_imu_lhr_imu);

                        ////System.out.println("stat:" + stat);
                        ////System.out.println("query:" + query2);
                        if (status_imu_lhr_immunisation == false) {
                            //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                            //System.out.println("Query for IMU: " + query_imu_lhr_imu);
                            System.out.println("false extract IMU");
                            total_fail_insert++;
                        } else {
                            System.out.println("done extract IMU");
                        }

                        imuBr.add(imuB);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;

    }

}
