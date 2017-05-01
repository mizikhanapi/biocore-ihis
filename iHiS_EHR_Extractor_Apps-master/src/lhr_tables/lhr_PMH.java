 package lhr_tables;

import Bean.PMH;
import Config_Pack.Config;
import bean.PMH2;
import java.util.ArrayList;

import java.util.Vector;
import main.RMIConnector;

public class lhr_PMH {
    
    public boolean M_PMH(Vector<PMH2> pmh2,get_ehr_central_data t){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lhr_pmh = true;
        

            try {

                int rowsPMH = pmh2.size();
                
                if (rowsPMH > 0) {

                    ArrayList<PMH> pmh_ArrayList = new ArrayList<PMH>();
                    for (int pmh_i = 0; pmh_i < rowsPMH; pmh_i++) {
                        PMH pmh_Obj = new PMH();
                        ArrayList<ArrayList<String>> alPmh = pmh2.get(pmh_i).getValue();
                        
                        pmh_Obj.setPMI_No(t.getPmi_no());
                        pmh_Obj.setEpisode_Date(alPmh.get(1).get(0)); 
                        pmh_Obj.setRead_Code(alPmh.get(2).get(0));
                        pmh_Obj.setRead_Description(alPmh.get(2).get(1));
                        pmh_Obj.setDiagnosis_Status(alPmh.get(2).get(2));
                        pmh_Obj.setDiagnosis_Status_Des(alPmh.get(2).get(3));
                        if(alPmh.get(2).get(4).isEmpty() || alPmh.get(2).get(4).equalsIgnoreCase("-") || alPmh.get(2).get(4).equalsIgnoreCase(" ")){
                            pmh_Obj.setDiagnosis_Date(null);
                        }else{
                        pmh_Obj.setDiagnosis_Date("'"+alPmh.get(2).get(4)+"'");
                        }
                        
                        pmh_Obj.setComments(alPmh.get(2).get(5));
                        pmh_Obj.setAnswer_Code(alPmh.get(2).get(6));
                        pmh_Obj.setAnswer_Desc(alPmh.get(2).get(7));
                        //pmh_Obj.setTxn_Date(alPmh.get(2).get(8));
                        if(alPmh.get(2).get(8).isEmpty() || alPmh.get(2).get(8).equalsIgnoreCase("-") || alPmh.get(2).get(8).equalsIgnoreCase(" ")){
                            pmh_Obj.setTxn_Date(null);
                        }else{
                        pmh_Obj.setTxn_Date("'"+alPmh.get(2).get(8)+"'");
                        }
                        
                        pmh_Obj.setStatus(alPmh.get(2).get(9));

//                        // increase time 5 sec to prevent duplicate during insert.
//                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                        Date date_time = null;
//                        date_time = df.parse(dataPMH[pmh_i][11]);
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
//                        pmh_Obj.setEncounter_Date(df.format(d2));
//                        //
                        if(alPmh.get(2).get(10).isEmpty() || alPmh.get(2).get(10).equalsIgnoreCase("-") || alPmh.get(2).get(10).equalsIgnoreCase(" ")){
                            pmh_Obj.setEncounter_Date(null);
                        }else{
                        pmh_Obj.setEncounter_Date("'"+alPmh.get(2).get(10)+"'");
                        }
                        
                        //pmh_Obj.setEncounter_Date(alPmh.get(2).get(10));

                        pmh_Obj.setHFC(alPmh.get(2).get(11));
                        pmh_Obj.setDoctor_Id(alPmh.get(2).get(12));
                        pmh_Obj.setDoctor_Name(alPmh.get(2).get(13));
                        pmh_Obj.setTerm_Type(alPmh.get(2).get(14));
//                        pmh_Obj.setICD10_Code(alPmh.get(2).get(15)); //Modified By Ahmed (13/3/2017)
//                        pmh_Obj.setICD10_Desc(alPmh.get(2).get(16)); //Modified By Ahmed (13/3/2017)

                        String query_lhr_pmh = "insert into lhr_past_medical_history (PMI_no, "
                                + "hfc_cd, "
                                + "onset_data, "  //Modified By Ahmed (13/3/2017)                                  
                                + "encounter_date, "
                                + "diagnosis_cd, " //insert icd10_code
                                + "diagnosis_date, " //Modified By Ahmed (13/3/2017)                                  
                                + "term_type, "
//                                + "icd10_cd, "
//                                + "icd10_description, "
                                //  + "term_cd, "
                                //  + "term_description, "                               
                                + "comment, "
                                + "status, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "NATIONAL_ID_NO, "
                                + "PERSON_ID_NO, "
                                + "PERSON_STATUS, "
                                + "centre_code )"
                                + "values ('" + pmh_Obj.getPMI_No() + "',"
                                + "'" + pmh_Obj.getHFC() + "',"
                                + "" + pmh_Obj.getEncounter_Date() + "," //Modified By Ahmed (13/3/2017)
                                + "" + pmh_Obj.getEncounter_Date() + ","
                                + "'" + pmh_Obj.getRead_Code()+ "'," //diagnosis_cd
                                + "" + pmh_Obj.getDiagnosis_Date() + "," //Modified By Ahmed (13/3/2017)
                                + "'" + pmh_Obj.getTerm_Type() + "',"
//                                + "'" + pmh_Obj.getICD10_Code() + "'," 
//                                + "'" + pmh_Obj.getICD10_Desc() + "',"
                                + "'" + pmh_Obj.getComments() + "',"
                                + "'" + pmh_Obj.getStatus() + "',"
                                + "'" + pmh_Obj.getDoctor_Id() + "',"
                                + "'" + pmh_Obj.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getLOCATION_CODE() + "')";
//                        System.out.println(pmh_Obj.getICD10_Code());
//                        System.out.println(pmh_Obj.getICD10_Desc());
//                        System.out.println(pmh_Obj.getEncounter_Date());

                        try {
                            status_lhr_pmh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_pmh);
                    //        //System.out.println("status : " + status_lhr_pmh);
                                    
                            if (status_lhr_pmh == false) {
                        //System.out.println("Failed to insert data into lhr_family_history (PMH) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for PMH: " + query_lhr_pmh);
                                total_fail_insert++;
                                System.out.println("false extract pmh");
                                //System.out.println("query : " + query_lhr_pmh);
                            }else{
                                System.out.println("done extract pmh");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        pmh_ArrayList.add(pmh_Obj);
                    }

                } //PMH end

    }catch(Exception e){
        e.printStackTrace();
    }
        
        return true;
    }
}
