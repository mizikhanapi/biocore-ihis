package lhr_tables;

import Bean.DGS;
import Bean.FMH;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;


public class lhr_FMH {
    
    public void M_FMH(){
         DGS dgsB = new DGS();
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_fmh_lhr_fh = true;
        
                get_ehr_central_data t = new get_ehr_central_data();
                t.getQuery();
        
                System.out.println("record #" + " "+ t.getCentral_Code());
                
                
                MainRetrieval mr = new MainRetrieval();
                mr.startProcess(t.getTxndata());
                
                // DGS
                String dataDGS[][] = mr.getData("DGS");
                int rowsDGS = mr.getRowNums();
                
                // FMH
                String dataFMH[][] = mr.getData("FMH");
                int rowsFMH = mr.getRowNums();
                
                if (rowsFMH > 0) {

                    ArrayList<FMH> fmh_ArrayList = new ArrayList<FMH>();
                    for (int fmh_i = 0; fmh_i < rowsFMH; fmh_i++) {
                        
                        System.out.println("fmh #"+(fmh_i+1));

                        FMH fmh_Obj = new FMH();
                        fmh_Obj.setPMI_No(t.getPmi_no());
                        fmh_Obj.setEpisode_Date(dataFMH[fmh_i][0]);
                        fmh_Obj.setFamily_Relationship_Cd(dataFMH[fmh_i][1]);
                        fmh_Obj.setICD10_Code(dataDGS[fmh_i][4]); //Modified By Ahmed (13/3/2017)
                        fmh_Obj.setICD10_Description(dataFMH[fmh_i][5]); //Modified By Ahmed (13/3/2017)
                        fmh_Obj.setRead_Code(dataDGS[fmh_i][4]);
                        fmh_Obj.setRead_Description(dataFMH[fmh_i][5]);
                        fmh_Obj.setDate_Onset(dataFMH[fmh_i][6]);
                        fmh_Obj.setComments(dataFMH[fmh_i][7]);
                        fmh_Obj.setAnswer_Code(dataFMH[fmh_i][8]);
                        fmh_Obj.setAnswer_Desc(dataFMH[fmh_i][9]);
                        fmh_Obj.setTxn_Date(dataFMH[fmh_i][10]);
                        fmh_Obj.setStatus(dataFMH[fmh_i][11]);

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
                        
                        fmh_Obj.setEncounter_Date(dataFMH[fmh_i][12]);
                        
                        fmh_Obj.setHFC(dataFMH[fmh_i][13]);
                        fmh_Obj.setDoctor_Id(dataFMH[fmh_i][14]);
                        fmh_Obj.setDoctor_Name(dataFMH[fmh_i][15]);
                        fmh_Obj.setTerm_Type(dataFMH[fmh_i][16]);
                        fmh_Obj.setTerm_Code("CTV3"); //Modified By Ahmed (16/3/2017)

                        String query_fmh_lhr_fh = "insert into lhr_family_history (PMI_no, "
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
                                + "'" + fmh_Obj.getEncounter_Date() + "',"
                                + "'" + dgsB.getICD10_Code() + "'," //Modified By Ahmed (13/3/2017)
                                + "'" + fmh_Obj.getDate_Onset() + "',"
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
                            ////System.out.println("query fmh : " + query_fmh_lhr_fh);
                            if (status_fmh_lhr_fh == false) {
                        //System.out.println("Failed to insert data into lhr_family_history (FMH) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for FMH: " + query_fmh_lhr_fh);
                                total_fail_insert++;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        fmh_ArrayList.add(fmh_Obj);
                    }
                    update_ehr_central u = new update_ehr_central();
                    u.update_status();

                } //FMH end
                
    }
}
