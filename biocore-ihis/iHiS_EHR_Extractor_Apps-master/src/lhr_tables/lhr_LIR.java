package lhr_tables;

import Bean.LIR;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_LIR {

   public boolean M_LIR(){
   
       RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lhr_test = true;
        
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
                
                System.out.println("record #"+(j+1)+" "+Central_Code);
                
                String episode = data2.get(j).get(2);
                String txndata1 = data2.get(j).get(3);

                MainRetrieval mr = new MainRetrieval();
                mr.startProcess(txndata1);
                
                //LIR 
                String dataLIR[][] = mr.getData("LIR");
                int rowsLIR = mr.getRowNums();
                
                if (rowsLIR > 0) {

                    ArrayList<LIR> lirBeans = new ArrayList<LIR>();
                    for (int k = 0; k < rowsLIR; k++) {

                        try {
                            
                            System.out.println("lir #"+(k+1));
                            
                            LIR lirBean = new LIR();
                            lirBean.setPMI_No(PMI_no);
                            lirBean.setEpisode_Date(dataLIR[k][0]);
                            lirBean.setLab_Test_Item_Code(dataLIR[k][15]);

//                            // increase time 5 sec to prevent duplicate during insert.
//                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                            Date date_time = null;
//                            date_time = df.parse(dataLIR[k][0]);
//
//                            Calendar gc = new GregorianCalendar();
//                            gc.setTime(date_time);
//                            int min = 0;
//                            int max = 1000000000;
//                            Random r = new Random();
//                            int rand_num = r.nextInt(max - min + 1) + min;
//                            gc.add(Calendar.SECOND, rand_num);
//                            Date d2 = gc.getTime();
//
//                            lirBean.setEncounter_Date(df.format(d2));
//                            //    
                            
                            lirBean.setEncounter_Date(dataLIR[k][0]);

                            String query_lhr_test = "insert into lhr_test (pmi_no, "
                                    //    + "hfc_cd,"
                                    + "episode_Date, "
                                    + "encounter_date, "
                                    + "test_cd, "
                                    + "test_name, "
                                    + "test_date,  "
                                    + "test_result,  "
                                    //    + "order_by,  "
                                    + "perform_by,  "
                                    + "report_by,  "
                                    + "NATIONAL_ID_NO, "
                                    + "PERSON_ID_NO, "
                                    + "PERSON_STATUS, Centre_Code)"
                                    + "values ('" + lirBean.getPMI_No() + "',"
                                    //  + "'" + lirBean.getHFC() + "',"
                                    + "'" + lirBean.getEpisode_Date() + "',"
                                    + "'" + lirBean.getEncounter_Date() + "',"
                                    + "'" + lirBean.getLab_Test_Item_Code() + "',"
                                    + "'" + lirBean.getLab_Test_Item_Lab_Test_Item_Name() + "',"
                                    + "'" + lirBean.getTest_Date() + "',"
                                    + "'" + lirBean.getLab_Test_Result_Name() + "',"
                                    + "'" + lirBean.getTest_Perform_By_Name() + "',"
                                    + "'" + lirBean.getResult_Provided_By_Name() + "',"
                                    + "'" + NATIONAL_ID_NO + "',"
                                    + "'" + PERSON_ID_NO + "',"
                                    + "'" + PERSON_STATUS + "',"
                                    + "'" + Centre_Code + "')";

//                            status_lhr_test = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_test);
                            ////System.out.println("query LRI : " + query_lhr_test);
                            ////System.out.println("status LRI : " + status_lhr_test);
                            if (status_lhr_test == false) {
                        //System.out.println("Failed to insert data into lhr_med_leave (LIR) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for LIR: " + query_lhr_test);
//                                total_fail_insert++;
                            }

//                            lirBeans.add(lirBean);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }

                }
           }catch(Exception e){
             e.printStackTrace();
           }   
        }
        return true;
   } 
}
