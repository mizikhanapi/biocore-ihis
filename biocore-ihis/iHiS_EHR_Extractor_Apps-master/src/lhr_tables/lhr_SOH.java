package lhr_tables;

import Bean.SOH;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_SOH {
    
    public boolean M_SOH(){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_hpi_lhr_health_of_present_illness = true;

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

                //SOH
                String dataSOH[][] = mr.getData("SOH");
                int rowsSOH = mr.getRowNums();

                SOH sohB = new SOH(); //declare outside so can display data outside bracket
                if (rowsSOH > 0) {

                    ArrayList<SOH> sohBr = new ArrayList<SOH>();
                    for (int n = 0; n < rowsSOH; n++) {

                        try {

                            System.out.println("SOH #" + (n + 1));
                            System.out.println("dataSOH[" + n + "][0]: " + dataSOH[n][0]);

                            sohB.setPMI_no(PMI_no);
                            sohB.setEpisode_date(dataSOH[n][0]);
                            sohB.setSOH_code(dataSOH[n][1]);
                            sohB.setSOH_name(dataSOH[n][2]);
                            sohB.setSOH_date(dataSOH[n][8]);
                            sohB.setSOH_comment(dataSOH[n][8]);
                            sohB.setEncounter_Date(dataSOH[n][10]);
                            sohB.setHfc_cd(dataSOH[n][11]);
                            sohB.setDoctor_ID(dataSOH[n][12]);
                            sohB.setDoctor_Name(dataSOH[n][13]);

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
                            
                            
                            String query_soh_lhr_soh = "insert into lhr_social_history (PMI_no, "
                                    + "hfc_cd, "
                                    + "episode_date, "
                                    + "encounter_date, "
                                    + "soh_name, "
                                    + "soh_cd, "
                                    + "soh_date, "
                                    + "soh_comment, "
                                    + "doctor_id, "
                                    + "doctor_name, "
                                    + "NATIONAL_ID_NO, "
                                    + "PERSON_ID_NO, "
                                    + "PERSON_STATUS, "
                                    + "centre_code )"
                                    + "values ('" + sohB.getPMI_no() + "',"
                                    + "'" + sohB.getHfc_cd() + "',"
                                    + "'" + sohB.getEpisode_date() + "',"
                                    + "'" + sohB.getEncounter_Date() + "',"
                                    + "'" + sohB.getSOH_name() + "',"
                                    + "'" + sohB.getSOH_code() + "',"
                                    + "'" + sohB.getSOH_date() + "',"
                                    + "'" + sohB.getSOH_comment() + "',"
                                    + "'" + sohB.getDoctor_ID() + "',"
                                    + "'" + sohB.getDoctor_Name() + "',"
                                    + "'" + NATIONAL_ID_NO + "',"
                                    + "'" + PERSON_ID_NO + "',"
                                    + "'" + PERSON_STATUS + "',"
                                    + "'" + LOCATION_CODE + "')";
//                            System.out.println(sohB.getPMI_no());
//                            System.out.println(sohB.getSOH_code());
//                            System.out.println(sohB.getSOH_name());
                            status_hpi_lhr_health_of_present_illness = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_soh_lhr_soh);

                            System.out.println("status_hpi_lhr_health_of_present_illness:" + status_hpi_lhr_health_of_present_illness);

                            ////System.out.println("stat:" + stat);
                            ////System.out.println("query:" + query2);
                            if (status_hpi_lhr_health_of_present_illness == false) {
                                //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for DGS: " + query2);
                                total_fail_insert++;
                            }

                            sohBr.add(sohB);

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
