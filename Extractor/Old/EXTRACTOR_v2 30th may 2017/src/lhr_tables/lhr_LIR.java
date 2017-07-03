package lhr_tables;

import Bean.LIR;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.LIR2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_LIR {

   public boolean M_LIR(Vector<LIR2> lir,get_ehr_central_data t){
   
       RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lhr_test = false;


            try {
            
                //LIR 
//                String dataLIR[][] = mr.getData("LIR");
                int rowsLIR = lir.size();
                
                if (rowsLIR > 0) {

                    ArrayList<LIR> lirBeans = new ArrayList<LIR>();
                    for (int k = 0; k < rowsLIR; k++) {
                        try {
                            ArrayList<ArrayList<String>> alLir = lir.get(k).getValue();
                            
                            LIR lirBean = new LIR();
                            lirBean.setPMI_No(t.getPmi_no());
                            lirBean.setEpisode_Date(alLir.get(4).get(0));
                            lirBean.setLab_Test_Item_Code(alLir.get(1).get(0));
                            lirBean.setLab_Test_Item_Lab_Test_Item_Name(alLir.get(1).get(1));
                            lirBean.setTest_Date(alLir.get(4).get(0));
                            
                            lirBean.setLab_Test_Result_Code(alLir.get(2).get(0));
                            lirBean.setLab_Test_Result_Name(alLir.get(2).get(1));
                            lirBean.setTest_Perform_By_ID(alLir.get(3).get(0));
                            lirBean.setTest_Perform_By_Name(alLir.get(3).get(1));
                            lirBean.setResult_Provided_By_ID(alLir.get(5).get(0));
                            lirBean.setResult_Provided_By_Name(alLir.get(5).get(1));
                            lirBean.setResult_Date(alLir.get(6).get(0));
                            lirBean.setVerify_By_ID(alLir.get(7).get(0));
                            lirBean.setVerify_By_Name(alLir.get(7).get(1));
                            lirBean.setVerify_Date(alLir.get(8).get(0));
                            lirBean.setVerification_Notes(alLir.get(9).get(0));

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
                            
                            lirBean.setEncounter_Date(alLir.get(4).get(0));

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
                                    + "'" + t.getNational_id_no() + "',"
                                    + "'" + t.getPERSON_ID_NO() + "',"
                                    + "'" + t.getPERSON_STATUS() + "',"
                                    + "'" + t.getCentre_Code() + "')";

                            status_lhr_test = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_test);
                            ////System.out.println("query LRI : " + query_lhr_test);
                            ////System.out.println("status LRI : " + status_lhr_test);
                            if (status_lhr_test == false) {
                        //System.out.println("Failed to insert data into lhr_family_history (PMH) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for PMH: " + query_lhr_pmh);
                                total_fail_insert++;
                                System.out.println("false extract lir");
                                //System.out.println("query : " + query_lhr_pmh);
                            }else{
                                System.out.println("done extract lir");
                            }

                            lirBeans.add(lirBean);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }

                }
           }catch(Exception e){
             e.printStackTrace();
           }   
        
        return true;
   } 
}
