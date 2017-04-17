package lhr_tables;

import Bean.VTS;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_VTS {
    
    public boolean M_VTS(){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_vts_lhr_wh = true;
        boolean status_vts_lhr_bp = true;
        boolean status_vts_lhr_bg = true;
        boolean status_vts_lhr_spo2 = true;
        boolean status_vts_lhr_procedure = true;
        boolean status_vts_lhr_temperature = true;
        
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
                
                
                // VTS
                String dataVTS[][] = mr.getData("VTS");
                int rowsVTS = mr.getRowNums();
                
                if (rowsVTS > 0) {

                    ArrayList<VTS> vts_ArrayList = new ArrayList<VTS>();
                    for (int vts_i = 0; vts_i < rowsVTS; vts_i++) {
                        
                        System.out.println("vts #"+(vts_i+1));

                        VTS vts_Obj = new VTS();
                        vts_Obj.setHFC_Cd(dataVTS[vts_i][23]);
                        vts_Obj.setPMI_no(PMI_no);
                        vts_Obj.setEpisode_Date(dataVTS[vts_i][0]);

                        // increase time 5 sec to prevent duplicate during insert.
//                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                        Date date_time = null;
//                        date_time = df.parse(dataVTS[vts_i][22]);
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
//                        vts_Obj.setEncounter_Date(df.format(d2));
                        //
                        
                        vts_Obj.setEncounter_Date(dataVTS[vts_i][22]);

                        vts_Obj.setWeight_Reading(dataVTS[vts_i][8]);
                        vts_Obj.setHeight_Reading(dataVTS[vts_i][9]);
                        vts_Obj.setDoctor_ID(dataVTS[vts_i][24]);
                        vts_Obj.setDoctor_Name(dataVTS[vts_i][25]);
                    //vts_Obj.setSystolic_Sitting(dataVTS[vts_i][2]);
                        //vts_Obj.setDiastolic_Sitting(dataVTS[vts_i][3]);
                        //vts_Obj.setSitting_Pulse(dataVTS[vts_i][33]);
                        //vts_Obj.setSystolic_Supine(dataVTS[vts_i][4]);
                        //vts_Obj.setDiastolic_Supine(dataVTS[vts_i][5]);
                        //vts_Obj.setSupine_Pulse(dataVTS[vts_i][34]);                            
                        //vts_Obj.setSystolic_Standing(dataVTS[vts_i][6]);
                        //vts_Obj.setDiastolic_Standing(dataVTS[vts_i][7]);
                        //vts_Obj.setStanding_Pulse(dataVTS[vts_i][35]);
                        //vts_Obj.setBlood_Glucose_Level(dataVTS[vts_i][32]);
                        //vts_Obj.setTemperature_Reading(dataVTS[vts_i][1]);
                        vts_Obj.setComment(dataVTS[vts_i][16]);
                        vts_Obj.setSPO2_Reading(dataVTS[vts_i][17]);
                        vts_Obj.setECG_Reading(dataVTS[vts_i][16]);
                        vts_Obj.setECG_Comments(dataVTS[vts_i][16]);

                    //check whether data is not null, not empty and numeric
                        //sitting
//                        if (dataVTS[vts_i][2] != null && !dataVTS[vts_i][2].isEmpty() && dataVTS[vts_i][2].matches("\\d+")) {
                            vts_Obj.setSystolic_Sitting(dataVTS[vts_i][2]);
//                        } else {
//                            vts_Obj.setSystolic_Sitting("0");
//                        }
//                        if (dataVTS[vts_i][3] != null && !dataVTS[vts_i][3].isEmpty() && dataVTS[vts_i][3].matches("\\d+")) {
                            vts_Obj.setDiastolic_Sitting(dataVTS[vts_i][3]);
//                        } else {
//                            vts_Obj.setDiastolic_Sitting("0");
//                        }
//                        if (dataVTS[vts_i][13] != null && !dataVTS[vts_i][13].isEmpty() && dataVTS[vts_i][13].matches("\\d+")) {
                            vts_Obj.setSitting_Pulse(dataVTS[vts_i][13]);
//                        } else {
//                            vts_Obj.setSitting_Pulse("0");
//                        }

                        //supine
                        if (dataVTS[vts_i][4] != null && !dataVTS[vts_i][4].isEmpty() && dataVTS[vts_i][4].matches("\\d+")) {
                            vts_Obj.setSystolic_Supine(dataVTS[vts_i][4]);
                        } else {
                            vts_Obj.setSystolic_Supine("0");
                        }
                        if (dataVTS[vts_i][5] != null && !dataVTS[vts_i][5].isEmpty() && dataVTS[vts_i][5].matches("\\d+")) {
                            vts_Obj.setDiastolic_Supine(dataVTS[vts_i][5]);
                        } else {
                            vts_Obj.setDiastolic_Supine("0");
                        }
                        if (dataVTS[vts_i][13] != null && !dataVTS[vts_i][13].isEmpty() && dataVTS[vts_i][13].matches("\\d+")) {
                            vts_Obj.setSupine_Pulse(dataVTS[vts_i][13]);
                        } else {
                            vts_Obj.setSupine_Pulse("0");
                        }

                        // standing
                        if (dataVTS[vts_i][6] != null && !dataVTS[vts_i][6].isEmpty() && dataVTS[vts_i][6].matches("\\d+")) {
                            vts_Obj.setSystolic_Standing(dataVTS[vts_i][6]);
                        } else {
                            vts_Obj.setSystolic_Standing("0");
                        }
                        if (dataVTS[vts_i][7] != null && !dataVTS[vts_i][7].isEmpty() && dataVTS[vts_i][7].matches("\\d+")) {
                            vts_Obj.setDiastolic_Standing(dataVTS[vts_i][7]);
                        } else {
                            vts_Obj.setDiastolic_Standing("0");
                        }
                        if (dataVTS[vts_i][13] != null && !dataVTS[vts_i][13].isEmpty() && dataVTS[vts_i][13].matches("\\d+")) {
                            vts_Obj.setStanding_Pulse(dataVTS[vts_i][13]);
                        } else {
                            vts_Obj.setStanding_Pulse("0");
                        }

                        String query_vts_lhr_wh = "insert into lhr_weight_height "
                                + "(pmi_no, "
                                + "hfc_cd, "
                                + "episode_date, "
                                + "encounter_date, "
                                + "weight_reading, "
                                + "height_reading, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code )"
                                + "values ('" + vts_Obj.getPMI_no() + "',"
                                + "'" + vts_Obj.getHFC_Cd() + "',"
                                + "'" + vts_Obj.getEpisode_Date() + "',"
                                + "'" + vts_Obj.getEncounter_Date() + "',"
                                + "'" + vts_Obj.getWeight_Reading() + "',"
                                + "'" + vts_Obj.getHeight_Reading() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + Centre_Code + "')";

                        try {
                            if (Integer.parseInt(vts_Obj.getWeight_Reading()) > 0 && Integer.parseInt(vts_Obj.getHeight_Reading()) > 0) { 
                                status_vts_lhr_wh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_wh);
                            }
                    //    //System.out.println("status vts:" + status_vts_lhr_wh);
                            //    //System.out.println("sql vts : " + query_vts_lhr_wh);
                            if (status_vts_lhr_wh == false) {
                        //System.out.println("Failed to insert data into lhr_weight_height (VTS_WH) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for VTS_BP: " + query_vts_lhr_wh);
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        String query_vts_lhr_bp = "insert into lhr_bp "
                                + "(PMI_no, "
                                + "HFC_Cd, "
                                + "Episode_Date, "
                                + "Encounter_Date, "
                                + "Systolic_Sitting, "
                                + "Diastolic_Sitting, "
                                + "Sitting_Pulse, "
                                + "Systolic_Standing, "
                                + "Diastolic_Standing, "
                                + "Standing_Pulse, "
                                + "Systolic_Supine, "
                                + "Diastolic_Supine, "
                                + "Supine_Pulse, "
                                + "Doctor_ID, "
                                + "Doctor_Name, "
                                + "person_id_no, "
                                + "national_id_no, "
                                + "person_status, "
                                + "centre_code )"
                                + "values ('" + vts_Obj.getPMI_no() + "',"
                                + "'" + vts_Obj.getHFC_Cd() + "',"
                                + "'" + vts_Obj.getEpisode_Date() + "',"
                                + "'" + vts_Obj.getEncounter_Date() + "',"
                                + "'" + vts_Obj.getSystolic_Sitting() + "',"
                                + "'" + vts_Obj.getDiastolic_Sitting() + "',"
                                + "'" + vts_Obj.getSitting_Pulse() + "',"
                                + "'" + vts_Obj.getSystolic_Standing() + "',"
                                + "'" + vts_Obj.getDiastolic_Standing() + "',"
                                + "'" + vts_Obj.getStanding_Pulse() + "',"
                                + "'" + vts_Obj.getSystolic_Supine() + "',"
                                + "'" + vts_Obj.getDiastolic_Supine() + "',"
                                + "'" + vts_Obj.getSupine_Pulse() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + Centre_Code + "')";

                        try {
                            if (Double.parseDouble(vts_Obj.getSystolic_Sitting()) > 0 
                                    && Double.parseDouble(vts_Obj.getDiastolic_Sitting()) > 0 
                                    && Double.parseDouble(vts_Obj.getSitting_Pulse()) > 0) {
                                status_vts_lhr_bp = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_bp);
                            }
                    //    //System.out.println("status vts_lhr_bp:" + status_vts_lhr_bp);
                            //    //System.out.println("sql vts_lhr_bp : " + query_vts_lhr_bp);     
                            if (status_vts_lhr_bp == false) {
                        //System.out.println("Failed to insert data into lhr_bp (VTS_BP) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for VTS_BP: " + query_vts_lhr_bp);
                                total_fail_insert++;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        //check whether Blood_Glucose_Level data is null or empty
                        if (dataVTS[vts_i][32] != null && !dataVTS[vts_i][32].isEmpty()) {
                            vts_Obj.setBlood_Glucose_Level(dataVTS[vts_i][32]);
                        } else {
                            vts_Obj.setBlood_Glucose_Level("0");
                        }

                        // insert record from ehr_central into lhr_blood_glucose table
                        String query_vts_lhr_bg = "insert into lhr_blood_glucose "
                                + "(PMI_no, "
                                + "HFC_Cd, "
                                + "Episode_Date, "
                                + "Encounter_Date, "
                                + "Blood_Glucose_Level, "
                                + "Doctor_ID, "
                                + "Doctor_Name, "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code )"
                                + "values ('" + vts_Obj.getPMI_no() + "',"
                                + "'" + vts_Obj.getHFC_Cd() + "',"
                                + "'" + vts_Obj.getEpisode_Date() + "',"
                                + "'" + vts_Obj.getEncounter_Date() + "',"
                                + "'" + vts_Obj.getBlood_Glucose_Level() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + Centre_Code + "')";

                        try {
                            if (Integer.parseInt(vts_Obj.getBlood_Glucose_Level()) > 0) {
                                status_vts_lhr_bg = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_bg);
                            }
                    //        //System.out.println("status vts_lhr_bg:" + status_vts_lhr_bg);
                            //        //System.out.println("sql vts_lhr_bg : " + query_vts_lhr_bg);                            
                            if (status_vts_lhr_bg == false) {
                        //System.out.println("Failed to insert data into lhr_blood_glucose (VTS_BG) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for VTS_BG: " + query_vts_lhr_bg);
                                total_fail_insert++;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        //check whether spo2 data is null or empty
                        if (dataVTS[vts_i][17] != null && !dataVTS[vts_i][17].isEmpty()) {
                            vts_Obj.setSPO2_Reading(dataVTS[vts_i][17]);
                        } else {
                            vts_Obj.setSPO2_Reading("0");
                        }

                        // insert into lhr_spo2 table for VTS
                        String query_vts_lhr_spo2 = "insert into lhr_spo2 "
                                + "(PMI_no, "
                                + "HFC_Cd, "
                                + "Episode_Date, "
                                + "Encounter_Date, "
                                + "SPO2_Reading, "
                                + "Doctor_ID, "
                                + "Doctor_Name, "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code )"
                                + "values ('" + vts_Obj.getPMI_no() + "',"
                                + "'" + vts_Obj.getHFC_Cd() + "',"
                                + "'" + vts_Obj.getEpisode_Date() + "',"
                                + "'" + vts_Obj.getEncounter_Date() + "',"
                                + "'" + vts_Obj.getSPO2_Reading() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + Centre_Code + "')";

                        try {
                            if (Integer.parseInt(vts_Obj.getSPO2_Reading()) > 0) {
                                status_vts_lhr_spo2 = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_spo2);
                            }
                    //        //System.out.println("status vts_lhr_spo2:" + status_vts_lhr_spo2);
                            //        //System.out.println("sql vts_lhr_spo2 : " + query_vts_lhr_spo2);     
                            if (status_vts_lhr_spo2 == false) {
                        //System.out.println("Failed to insert data into lhr_spo2 (VTS_SPO2) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for VTS_SPO2: " + query_vts_lhr_spo2);
                                total_fail_insert++;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        // insert into lhr_procedure table for VTS
                        String query_vts_lhr_procedure = "insert into lhr_procedure "
                                + "(pmi_no, "
                                + "hfc_cd, "
                                + "episode_date, "
                                + "encounter_date, "
                                + "procedure_cd, "
                                + "procedure_name, "
                                + "procedure_outcome, "
                                + "comment, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code )"
                                + "values ('" + vts_Obj.getPMI_no() + "',"
                                + "'" + vts_Obj.getHFC_Cd() + "',"
                                + "'" + vts_Obj.getEpisode_Date() + "',"
                                + "'" + vts_Obj.getEncounter_Date() + "',"
                                + "'" + vts_Obj.getProcedure_Cd() + "',"
                                + "'" + vts_Obj.getProcedure_Name() + "',"
                                + "'" + vts_Obj.getProcedure_Outcome() + "',"
                                + "'" + vts_Obj.getComment() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + Centre_Code + "')";

                        try {
                            if (vts_Obj.getProcedure_Cd() != "" && vts_Obj.getProcedure_Cd() != null) {
                                status_vts_lhr_procedure = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_procedure);
                            }
                    //    //System.out.println("status vts_lhr_procedure:" + status_vts_lhr_procedure);
                            //    //System.out.println("sql vts_lhr_procedure : " + query_vts_lhr_procedure);     
                            if (status_vts_lhr_procedure == false) {
                        //System.out.println("Failed to insert data into lhr_procedure (VTS_PROC) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for VTS_PROC: " + query_vts_lhr_procedure);
                                total_fail_insert++;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        //check whether temperature_reading data is null or empty
                        if (dataVTS[vts_i][1] != null && dataVTS[vts_i][1] != "-" && !dataVTS[vts_i][1].isEmpty() && dataVTS[vts_i][1].matches("\\d+")) {
                            vts_Obj.setTemperature_Reading(dataVTS[vts_i][1]);
                        } else {
                            vts_Obj.setTemperature_Reading("0");
                        }

                        // insert into lhr_procedure table for VTS
                        String query_vts_lhr_temperature = "insert into lhr_temperature "
                                + "(PMI_no, "
                                + "HFC_Cd, "
                                + "Episode_Date, "
                                + "Encounter_Date, "
                                + "temperature_reading, "
                                + "comment, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code )"
                                + "values ('" + vts_Obj.getPMI_no() + "',"
                                + "'" + vts_Obj.getHFC_Cd() + "',"
                                + "'" + vts_Obj.getEpisode_Date() + "',"
                                + "'" + vts_Obj.getEncounter_Date() + "',"
                                + "'" + vts_Obj.getTemperature_Reading() + "',"
                                + "'" + vts_Obj.getComment() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + NATIONAL_ID_NO + "',"
                                + "'" + PERSON_ID_NO + "',"
                                + "'" + PERSON_STATUS + "',"
                                + "'" + Centre_Code + "')";

                        try {
                            if (Integer.parseInt(vts_Obj.getTemperature_Reading()) > 0) {
                                status_vts_lhr_temperature = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_temperature);
                            }
                    //        //System.out.println("status status_vts_lhr_temperature :" + status_vts_lhr_temperature);
                            //        //System.out.println("sql vts_lhr_temperature : " + query_vts_lhr_temperature);     
                            if (status_vts_lhr_temperature == false) {
                        //System.out.println("Failed to insert data into lhr_temperature (VTS_temp) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for VTS_TEMP: " + query_vts_lhr_temperature);
                                total_fail_insert++;
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        vts_ArrayList.add(vts_Obj);
                    }

                }

    
    }catch(Exception e){
         e.printStackTrace();
    }
        }
        return true;
    }
}
