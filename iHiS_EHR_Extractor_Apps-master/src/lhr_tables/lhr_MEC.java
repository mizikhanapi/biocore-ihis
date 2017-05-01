package lhr_tables;

import Bean.MEC;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.MEC2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_MEC {
    
    public boolean M_MEC(Vector<MEC2> mec,get_ehr_central_data t){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lhr_ml = true;

            try {

                int rowsMEC = mec.size();
                     if (rowsMEC > 0) {

                    ArrayList<MEC> mecBeans = new ArrayList<MEC>();
                    for (int k = 0; k < rowsMEC; k++) {
                        ArrayList<ArrayList<String>> alMec = mec.get(k).getValue();
                        System.out.println("mec #"+(k+1));

                        MEC mecBean = new MEC();
                        mecBean.setPMI_No(t.getPmi_no());
                        mecBean.setEpisode_Date(alMec.get(1).get(0));
//                        mecBean.setDiagnosis_Code_Read_Code(alMec.get(2).get(0));
//                        mecBean.setDiagnosis_Desc_Read_Code(alMec.get(2).get(0));
//                        mecBean.setDiagnosis_Code_ICD10(alMec.get(2).get(0));
//                        mecBean.setDiagnosis_Desc_ICD10(alMec.get(2).get(1));
//                        mecBean.setComplaint_Code_Read_Code(alMec.get(2).get(0));
//                        mecBean.setComplaint_Desc_Read_Code(alMec.get(2).get(0));
//                        mecBean.setComplaint_Code_ICD10(alMec.get(2).get(0));
//                        mecBean.setComplaint_Desc_ICD10(alMec.get(2).get(0));
//                        mecBean.setComments(alMec.get(2).get(0));
                        mecBean.setTime_From(alMec.get(2).get(4));
                        mecBean.setTime_To(alMec.get(2).get(5));
                        mecBean.setDate_From(alMec.get(2).get(6));
                        mecBean.setDate_To(alMec.get(2).get(7));
                        mecBean.setTxn_Date(alMec.get(2).get(0));
                        mecBean.setStatus(alMec.get(2).get(0));

//                        // increase time 5 sec to prevent duplicate during insert.
//                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                        Date date_time = null;
//                        date_time = df.parse(dataMEC[k][16]);
//
//                        Calendar gc = new GregorianCalendar();
//                        gc.setTime(date_time);
//                        int min = 0;
//                        int max = 1000000000;
//                        Random r = new Random();
//                        int rand_num = r.nextInt(max - min + 1) + min;
//                        gc.add(Calendar.SECOND, rand_num);
//                        Date d2 = gc.getTime();
//
//                        mecBean.setEncounter_Date(df.format(d2));
//                            //                            
                        
                        mecBean.setEncounter_Date(alMec.get(1).get(0));

                        //mecBean.setEncounter_Date(dataMEC[k][16]);                              
                        mecBean.setHFC(alMec.get(2).get(11));
                        mecBean.setDoctor_ID(alMec.get(2).get(12));
                        mecBean.setDoctor_Name(alMec.get(2).get(13));

                        String query_lhr_ml = "insert into lhr_med_leave "
                                + "(pmi_no,"
                                + "hfc_cd,"
                                + "episode_date, "
                                + "encounter_date, "
                                //  + "leave_type, "
                                + "start_date, "
                                + "end_date,  "
                                + "start_time,  "
                                + "end_time,  "
                                + "Comment,  "
                                + "doctor_id,  "
                                + "doctor_name,  "
                                + "NATIONAL_ID_NO, "
                                + "PERSON_ID_NO, "
                                + "PERSON_STATUS, "
                                + "Centre_Code)"
                                + "values ('" + mecBean.getPMI_No() + "',"
                                + "'" + mecBean.getHFC() + "',"
                                + "'" + mecBean.getEpisode_Date() + "',"
                                + "'" + mecBean.getEncounter_Date() + "',"
                                //  + "'" + mecBean.getLeave_Type + "',"                                    
                                + "'" + mecBean.getDate_From() + "',"
                                + "'" + mecBean.getDate_To() + "',"
                                + "'" + mecBean.getTime_From() + "',"
                                + "'" + mecBean.getTime_To() + "',"
                                + "'" + mecBean.getComments() + "',"
                                + "'" + mecBean.getDoctor_ID() + "',"
                                + "'" + mecBean.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentral_Code() + "')";

                        try {
                            status_lhr_ml = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_ml);
                    //        //System.out.println("query MEC: " + query_lhr_ml);
                            //        //System.out.println("status MEC " + status_lhr_ml);
                            if (status_lhr_ml == false) {
                        //System.out.println("Failed to insert data into lhr_med_leave (MEC) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for MEC: " + query_lhr_ml);
                                total_fail_insert++;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        mecBeans.add(mecBean);
                    }

                }
            }catch(Exception e){
                  e.printStackTrace();
            }
        
      return true;
    }
}
