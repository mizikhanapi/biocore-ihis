package lhr_tables;

import Bean.DGS;
import Bean.ERRCOUNT;
import Bean.FMH;
import Bean.MSH;
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
    
    public void M_FMH(Vector<FMH2> fmh2,get_ehr_central_data t,MSH msh){
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
                        
                                                        String a,b,c,d;
                a= t.getNational_id_no();
                b = t.getPERSON_STATUS();
                c = t.getPERSON_ID_NO();
                d =t.getCentre_Code();
                
                if (a == null || a.isEmpty() || a.equals(" ")) {
                   a =  "PUBLIC HOSPITAL";
                }

                if (b == null || b.isEmpty() || b.equals(" ")) {
                    b ="PUBLIC HOSPITAL";
                }

                if (c == null || c.isEmpty() || c.equals(" ")) {
                    c = "PUBLIC HOSPITAL";
                }

                if (d == null || d.isEmpty() || d.equals(" ")) {
                    d = "PUBLIC HOSPITAL";
                }
                        if(alFmh.get(2).get(11).isEmpty() || alFmh.get(2).get(11).equalsIgnoreCase("-")||alFmh.get(2).get(11).equalsIgnoreCase(" ")){
                            fmh_Obj.setEncounter_Date(null);
                        }else{
                            fmh_Obj.setEncounter_Date("'"+alFmh.get(2).get(11)+"'");
                        }
                        
                        
                        fmh_Obj.setHFC(alFmh.get(2).get(12));
                        
                        fmh_Obj.setDoctor_Id(alFmh.get(2).get(13));
                        
                        fmh_Obj.setDoctor_Name(alFmh.get(2).get(14));
                        
                        fmh_Obj.setTerm_Type(alFmh.get(2).get(15));
                        fmh_Obj.setTerm_Code("CTV3"); //Modified By Ahmed (16/3/2017)

                        query_fmh_lhr_fh = "insert into lhr_family_history ("
                                + "PMI_no, "
                                + "hfc_cd, "
                                + "episode_date, "
                                + "encounter_date, "
                                + "diagnosis_cd, " //insert icd10 code
                                + "onset_date, "                                     
                                + "term_type, "
                                + "icd10_cd, "
                                + "icd10_description, "
                                + "term_cd, "
                                + "comment, "
                                + "status, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "NATIONAL_ID_NO, "
                                + "PERSON_ID_NO, "
                                + "PERSON_STATUS, "
                                + "centre_code,"
                                + "discipline_cd,"
                                + "subdiscipline_cd,"
                                + "created_by,"
                                + "created_date)"
                                + "values ('" + fmh_Obj.getPMI_No() + "',"
                                + "'" + fmh_Obj.getHFC() + "',"
                                + "'" + fmh_Obj.getEpisode_Date() + "',"
                                + "" + fmh_Obj.getEncounter_Date() + ","
                                + "'" + fmh_Obj.getICD10_Code() + "'," //Modified By Ahmed (13/3/2017)
                                + "'"+msh.getDateTime()+"',"
                                + "'CTV3',"
                                + "'" + fmh_Obj.getICD10_Code() + "'," //Modified By Ahmed (13/3/2017)
                                + "'" + fmh_Obj.getICD10_Description() + "',"
                                + "'" + fmh_Obj.getTerm_Code() + "',"
                                + "'" + fmh_Obj.getComments() + "',"
                                + "'0',"
                                + "'" + fmh_Obj.getDoctor_Id() + "',"
                                + "'" + fmh_Obj.getDoctor_Name() + "'," //temp
                                + "'" + a + "',"
                                + "'" + c + "',"
                                + "'" + b + "',"
                                + "'" + d + "',"
                                + "'"+msh.getSendingFacilityDis()+"',"
                                + "'"+msh.getSendingFacilitySubDis()+"',"
                                + "'"+fmh_Obj.getDoctor_Id()+"',"
                                + "'"+msh.getDateTime()+"')";

                        try {
                            status_fmh_lhr_fh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_fmh_lhr_fh);
                            
                            if (status_fmh_lhr_fh == false) {
                                total_fail_insert++;
                                System.out.println("false insert fmh");
                                System.out.println(query_fmh_lhr_fh);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("FMH|");
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
