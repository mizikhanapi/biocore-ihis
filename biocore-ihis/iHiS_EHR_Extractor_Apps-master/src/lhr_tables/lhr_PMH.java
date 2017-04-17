package lhr_tables;

import Bean.MEC;
import Bean.PMH;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_PMH {
    
    public boolean M_PMH(){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lhr_pmh = true;
        
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
                
                // PMH
                String dataPMH[][] = mr.getData("PMH");
                int rowsPMH = mr.getRowNums();
                
                if (rowsPMH > 0) {

                    ArrayList<PMH> pmh_ArrayList = new ArrayList<PMH>();
                    for (int pmh_i = 0; pmh_i < rowsPMH; pmh_i++) {
                        
                        System.out.println("pmh #"+(pmh_i+1));

                        PMH pmh_Obj = new PMH();
                        pmh_Obj.setPMI_No(PMI_no);
                        pmh_Obj.setEpisode_Date(dataPMH[pmh_i][0]); 
                        pmh_Obj.setRead_Code(dataPMH[pmh_i][1]);
                        pmh_Obj.setRead_Description(dataPMH[pmh_i][2]);
                        pmh_Obj.setDiagnosis_Status(dataPMH[pmh_i][3]);
                        pmh_Obj.setDiagnosis_Status_Des(dataPMH[pmh_i][4]);
                        pmh_Obj.setDiagnosis_Date(dataPMH[pmh_i][0]);
                        pmh_Obj.setComments(dataPMH[pmh_i][6]);
                        pmh_Obj.setAnswer_Code(dataPMH[pmh_i][7]);
                        pmh_Obj.setAnswer_Desc(dataPMH[pmh_i][8]);
                        pmh_Obj.setTxn_Date(dataPMH[pmh_i][9]);
                        pmh_Obj.setStatus(dataPMH[pmh_i][10]);

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
                        
                        pmh_Obj.setEncounter_Date(dataPMH[pmh_i][11]);

                        pmh_Obj.setHFC(dataPMH[pmh_i][12]);
                        pmh_Obj.setDoctor_Id(dataPMH[pmh_i][13]);
                        pmh_Obj.setDoctor_Name(dataPMH[pmh_i][14]);
                        pmh_Obj.setTerm_Type(dataPMH[pmh_i][15]);
                        pmh_Obj.setICD10_Code(dataPMH[pmh_i][1]); //Modified By Ahmed (13/3/2017)
                        pmh_Obj.setICD10_Desc(dataPMH[pmh_i][2]); //Modified By Ahmed (13/3/2017)

                        String query_lhr_pmh = "insert into lhr_past_medical_history (PMI_no, "
                                + "hfc_cd, "
                                + "onset_date, "  //Modified By Ahmed (13/3/2017)                                  
                                + "encounter_date, "
                                + "diagnosis_cd, " //insert icd10_code
                                + "diagnosis_date, " //Modified By Ahmed (13/3/2017)                                  
                                + "term_type, "
                                + "icd10_cd, "
                                + "icd10_description, "
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
                                + "'" + pmh_Obj.getEncounter_Date() + "'," //Modified By Ahmed (13/3/2017)
                                + "'" + pmh_Obj.getEncounter_Date() + "',"
                                + "'" + pmh_Obj.getICD10_Code() + "'," //diagnosis_cd
                                + "'" + pmh_Obj.getDiagnosis_Date() + "'," //Modified By Ahmed (13/3/2017)
                                + "'" + pmh_Obj.getTerm_Type() + "',"
                                + "'" + pmh_Obj.getICD10_Code() + "'," 
                                + "'" + pmh_Obj.getICD10_Desc() + "',"
                                + "'" + pmh_Obj.getComments() + "',"
                                + "'" + pmh_Obj.getStatus() + "',"
                                + "'" + pmh_Obj.getDoctor_Id() + "',"
                                + "'" + pmh_Obj.getDoctor_Name() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + LOCATION_CODE + "')";
//                        System.out.println(pmh_Obj.getICD10_Code());
//                        System.out.println(pmh_Obj.getICD10_Desc());
//                        System.out.println(pmh_Obj.getEncounter_Date());

                        try {
                            status_lhr_pmh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_pmh);
                    //        //System.out.println("status : " + status_lhr_pmh);
                            //        //System.out.println("query : " + query_lhr_pmh);
                            if (status_lhr_pmh == false) {
                        //System.out.println("Failed to insert data into lhr_family_history (PMH) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for PMH: " + query_lhr_pmh);
                                total_fail_insert++;
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
        }
        return true;
    }
}
