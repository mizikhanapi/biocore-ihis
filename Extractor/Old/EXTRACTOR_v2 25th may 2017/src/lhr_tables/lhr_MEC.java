package lhr_tables;

import Bean.MEC;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.CCN2;
import bean.DGS2;
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
    
    public boolean M_MEC(Vector<MEC2> mec,Vector<DGS2> dgs2,Vector<CCN2> ccn2,get_ehr_central_data t){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lhr_ml = true;

            try {
                int rowdgs = dgs2.size();
                int numsCol = (rowdgs*2)+2;
                int rowCcn = ccn2.size();
                int numsCol2 = (rowCcn*2)+2;
                int total = numsCol + numsCol2;
                int rowsMEC = mec.size();
                System.out.println("row dgs num: "+rowdgs);
                System.out.println("row ccn num: "+rowCcn);
                System.out.println("row total num: "+total);
                
                    if (rowsMEC > 0) {
                    ArrayList<MEC> mecBeans = new ArrayList<MEC>();
                    for (int k = 0; k < rowsMEC; k++) {
                        ArrayList<ArrayList<String>> alMec = mec.get(k).getValue();
                        int rowsize = alMec.get(2).size();
                        System.out.println("row rowsize num: "+rowsize);
                        
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
                        mecBean.setTime_From(alMec.get(2).get(total+1));
                        mecBean.setTime_To(alMec.get(2).get(total+2));
                        mecBean.setDate_From(alMec.get(2).get(total+3));
                        mecBean.setDate_To(alMec.get(2).get(total+4));
                        mecBean.setTxn_Date(alMec.get(2).get(total+5));
                        mecBean.setStatus(alMec.get(2).get(total+6));

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
                        if(alMec.get(2).get(total+7).isEmpty() || alMec.get(2).get(total+7).equalsIgnoreCase("-") || alMec.get(2).get(total+7).equalsIgnoreCase(" ")){
                            mecBean.setEncounter_Date(alMec.get(1).get(0));
                        }else{
                            mecBean.setEncounter_Date(alMec.get(2).get(total+7));
                        }
                        

                        //mecBean.setEncounter_Date(dataMEC[k][16]);                              
                        mecBean.setHFC(alMec.get(2).get(total+8));
                        mecBean.setDoctor_ID(alMec.get(2).get(total+9));
                        mecBean.setDoctor_Name(alMec.get(2).get(total+10));

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
                                System.out.println("false extract MEC");
                            }else{
                                //System.out.println("Query for MEC: " + query_lhr_ml);
                                System.out.println("done extract MEC");
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
