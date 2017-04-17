package lhr_tables;

import Bean.MEC;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_MEC {
    
    public boolean M_MEC(){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lhr_ml = true;
        
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
                
                //PMH
                String dataMEC[][] = mr.getData("MEC");
                int rowsMEC = mr.getRowNums();
                
                     if (rowsMEC > 0) {

                    ArrayList<MEC> mecBeans = new ArrayList<MEC>();
                    for (int k = 0; k < rowsMEC; k++) {
                        
                        System.out.println("mec #"+(k+1));

                        MEC mecBean = new MEC();
                        mecBean.setPMI_No(PMI_no);
                        mecBean.setEpisode_Date(dataMEC[k][0]);
                        mecBean.setDiagnosis_Code_Read_Code(dataMEC[k][1]);
                        mecBean.setDiagnosis_Desc_Read_Code(dataMEC[k][2]);
                        mecBean.setDiagnosis_Code_ICD10(dataMEC[k][3]);
                        mecBean.setDiagnosis_Desc_ICD10(dataMEC[k][4]);
                        mecBean.setComplaint_Code_Read_Code(dataMEC[k][5]);
                        mecBean.setComplaint_Desc_Read_Code(dataMEC[k][6]);
                        mecBean.setComplaint_Code_ICD10(dataMEC[k][7]);
                        mecBean.setComplaint_Desc_ICD10(dataMEC[k][8]);
                        mecBean.setComments(dataMEC[k][9]);
                        mecBean.setTime_From(dataMEC[k][10]);
                        mecBean.setTime_To(dataMEC[k][11]);
                        mecBean.setDate_From(dataMEC[k][12]);
                        mecBean.setDate_To(dataMEC[k][13]);
                        mecBean.setTxn_Date(dataMEC[k][14]);
                        mecBean.setStatus(dataMEC[k][15]);

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
                        
                        mecBean.setEncounter_Date(dataMEC[k][16]);

                        //mecBean.setEncounter_Date(dataMEC[k][16]);                              
                        mecBean.setHFC(dataMEC[k][17]);
                        mecBean.setDoctor_ID(dataMEC[k][18]);
                        mecBean.setDoctor_Name(dataMEC[k][19]);

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
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + Centre_Code + "')";

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
        }
      return true;
    }
}
