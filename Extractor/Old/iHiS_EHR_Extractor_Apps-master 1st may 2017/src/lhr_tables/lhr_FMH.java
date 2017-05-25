package lhr_tables;

import Bean.DGS;
import Bean.FMH;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.FMH2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;


public class lhr_FMH {
    
    public void M_FMH(Vector<FMH2> fmh2,get_ehr_central_data t){
        DGS dgsB = new DGS();
        String query_fmh_lhr_fh;
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_fmh_lhr_fh = true;

                
                int rowsFMH = fmh2.size();
                
                if (rowsFMH > 0) {
                    
                    ArrayList<FMH> fmh_ArrayList = new ArrayList<FMH>();
                    for (int fmh_i = 0; fmh_i < rowsFMH; fmh_i++) {
                        
                        //System.out.println("fmh #"+(fmh_i+1));

                        FMH fmh_Obj = new FMH();
                        ArrayList<ArrayList<String>> alFmh = fmh2.get(fmh_i).getValue();
                        
                        
                        fmh_Obj.setPMI_No(t.getPmi_no());
                        
                        fmh_Obj.setEpisode_Date(alFmh.get(1).get(0));
                        
                        fmh_Obj.setFamily_Relationship_Cd(alFmh.get(2).get(0));
                        
                        fmh_Obj.setICD10_Code(alFmh.get(2).get(1)); //Modified By Ahmed (13/3/2017)
                        
                        fmh_Obj.setICD10_Description(alFmh.get(2).get(2)); //Modified By Ahmed (13/3/2017)
                        
                        fmh_Obj.setRead_Code(alFmh.get(2).get(3));
                        
                        fmh_Obj.setRead_Description(alFmh.get(2).get(4));
                        
                        if(alFmh.get(2).get(5).isEmpty() || alFmh.get(2).get(5).equalsIgnoreCase(" ") || alFmh.get(2).get(5).equalsIgnoreCase("-")){
                            fmh_Obj.setDate_Onset(null);
                        }else{
                            fmh_Obj.setDate_Onset("'"+alFmh.get(2).get(5)+"'");
                        }
                        
                        
                        fmh_Obj.setComments(alFmh.get(2).get(6));
                        
                        fmh_Obj.setAnswer_Code(alFmh.get(2).get(7));
                        
                        fmh_Obj.setAnswer_Desc(alFmh.get(2).get(8));
                        
                        fmh_Obj.setTxn_Date(alFmh.get(2).get(9));
                        
                        fmh_Obj.setStatus(alFmh.get(2).get(10));
                        

//                        // increase time 5 sec to prevent duplicate during insert.
//                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                        Date date_time = null;
//                        date_time = df.parse(dataFMH[fmh_i][12]);
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
//                        fmh_Obj.setEncounter_Date(df.format(d2));
//                        //
                        if(alFmh.get(2).get(11).isEmpty() || alFmh.get(2).get(11).equalsIgnoreCase("-")||alFmh.get(2).get(11).equalsIgnoreCase(" ")){
                            fmh_Obj.setEncounter_Date(null);
                        }else{
                            fmh_Obj.setEncounter_Date("'"+alFmh.get(2).get(11)+"'");
                        }
                        
                        
                        fmh_Obj.setHFC(alFmh.get(2).get(12));
                        
                        fmh_Obj.setDoctor_Id(alFmh.get(2).get(13));
                        
                        fmh_Obj.setDoctor_Name(alFmh.get(2).get(14));
                        
                        fmh_Obj.setTerm_Type(alFmh.get(2).get(15));
                        //System.out.println("da lalu sini");
                        fmh_Obj.setTerm_Code("CTV3"); //Modified By Ahmed (16/3/2017)

                        query_fmh_lhr_fh = "insert into lhr_family_history (PMI_no, "
                                + "hfc_cd, "
                                + "episode_date, "
                                + "encounter_date, "
                                + "diagnosis_cd, " //insert icd10 code
                                + "onset_date, "                                     
                                + "term_type, "
                                //  + "diagnosis_status, "                                    
                                //  + "diagnosis_date, "
                                + "icd10_cd, "
                                + "icd10_description, "
                                + "term_cd, "
                                //  + "term_description, "                               
                                + "comment, "
                                + "status, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "NATIONAL_ID_NO, "
                                + "PERSON_ID_NO, "
                                + "PERSON_STATUS, "
                                + "centre_code )"
                                + "values ('" + fmh_Obj.getPMI_No() + "',"
                                + "'" + fmh_Obj.getHFC() + "',"
                                + "'" + fmh_Obj.getEpisode_Date() + "',"
                                + "" + fmh_Obj.getEncounter_Date() + ","
                                + "'" + dgsB.getICD10_Code() + "'," //Modified By Ahmed (13/3/2017)
                                + "" + fmh_Obj.getDate_Onset() + ","
                                + "'" + fmh_Obj.getTerm_Type() + "',"
                                + "'" + dgsB.getICD10_Code() + "'," //Modified By Ahmed (13/3/2017)
                                + "'" + fmh_Obj.getICD10_Description() + "',"
                                + "'" + fmh_Obj.getTerm_Code() + "',"
                                + "'" + fmh_Obj.getComments() + "',"
                                + "'" + fmh_Obj.getStatus() + "',"
                                + "'" + fmh_Obj.getDoctor_Id() + "',"
                                + "'" + fmh_Obj.getDoctor_Name() + "'," //temp
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";
                        //System.out.println(dgsB.getICD10_Code());
                        //System.out.println(fmh_Obj.getICD10_Description());
                       


                        try {
                            status_fmh_lhr_fh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_fmh_lhr_fh);
                    ////System.out.println("status fmh : " + status_fmh_lhr_fh);
                            
                            if (status_fmh_lhr_fh == false) {
                        //System.out.println("Failed to insert data into lhr_family_history (FMH) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for FMH: " + query_fmh_lhr_fh);
                                total_fail_insert++;
                                System.out.println("false insert fmh");
                                //System.out.println("query fmh : " + query_fmh_lhr_fh);
                                //System.out.println("query fmh : " + query_fmh_lhr_fh);
                            }else{
                                System.out.println("done insert fmh");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        fmh_ArrayList.add(fmh_Obj);
                    }

                } //FMH end
                
    }
}
