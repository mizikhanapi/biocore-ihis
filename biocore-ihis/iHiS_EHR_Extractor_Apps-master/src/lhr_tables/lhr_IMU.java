package lhr_tables;

import Bean.IMU;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_IMU {
    
    public boolean M_IMU(){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_imu_lhr_immunisation = true;

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
                + "AND ec.status = 1"; // select undischarge patient (1)

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

                // IMU
                String dataIMU[][] = mr.getData("IMU");
                int rowsIMU = mr.getRowNums();

                IMU imuB = new IMU(); //declare outside so can display data outside bracket
                if (rowsIMU > 0) {

                    ArrayList<IMU> imuBr = new ArrayList<IMU>();
                    for (int n = 0; n < rowsIMU; n++) {

                        try {

                            System.out.println("IMU #" + (n + 1));
                            System.out.println("dataIMU[" + n + "][0]: " + dataIMU[n][0]);

                            imuB.setPMI_no(PMI_no);
                            imuB.setEpisode_date(dataIMU[n][0]);
                            imuB.setimmunization_cd(dataIMU[n][1]);
                            imuB.setOnset_date(dataIMU[n][3]);
                            imuB.setComment(dataIMU[n][4]);
                            imuB.setStatus(dataIMU[n][8]);
                            imuB.setEncounter_Date(dataIMU[n][9]);
                            imuB.setHfc_cd(dataIMU[n][10]);
                            imuB.setDoctor_ID(dataIMU[n][11]);
                            imuB.setDoctor_Name(dataIMU[n][12]);
                            imuB.setTerm_type(dataIMU[n][13]);
                            imuB.setIcd10_cd(dataIMU[n][1]);
                            imuB.setIcd10_description(dataIMU[n][2]);
                            

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
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + LOCATION_CODE + "')";
                           System.err.println(imuB.getPMI_no());
                           System.err.println(imuB.getimmunization_cd());
                           System.err.println(imuB.getIcd10_description());
                            status_imu_lhr_immunisation = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_imu_lhr_imu);

                            System.out.println("status_imu_lhr_immunisation:" + status_imu_lhr_immunisation);

                            ////System.out.println("stat:" + stat);
                            ////System.out.println("query:" + query2);
                            if (status_imu_lhr_immunisation == false) {
                                //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for DGS: " + query2);
                                total_fail_insert++;
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
        }
        return true;
    
    }
    
}
