package lhr_tables;

import Bean.VTS;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.VTS2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_VTS {
    
    public boolean M_VTS(Vector<VTS2> vts2,get_ehr_central_data t){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_vts_lhr_wh = false;
        boolean status_vts_lhr_bp = false;
        boolean status_vts_lhr_bg = false;
        boolean status_vts_lhr_spo2 = false;
        boolean status_vts_lhr_procedure = false;
        boolean status_vts_lhr_temperature = false;
        
       
            try {

                int rowsVTS = vts2.size();
                
                if (rowsVTS > 0) {

                    ArrayList<VTS> vts_ArrayList = new ArrayList<VTS>();
                    for (int vts_i = 0; vts_i < rowsVTS; vts_i++) {
                        ArrayList<ArrayList<String>> alVts = vts2.get(vts_i).getValue();

                        VTS vts_Obj = new VTS();
                        vts_Obj.setHFC_Cd(alVts.get(2).get(22));
                        vts_Obj.setPMI_no(t.getPmi_no());
                        vts_Obj.setEpisode_Date(alVts.get(1).get(0));

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
                        if(alVts.get(2).get(21).isEmpty() || alVts.get(2).get(21).equalsIgnoreCase("-") || alVts.get(2).get(21).equalsIgnoreCase(" ")){
                            //vts_Obj.setEncounter_Date(null);
                            vts_Obj.setEncounter_Date("'"+alVts.get(1).get(0)+"'");
                        }else{
                            vts_Obj.setEncounter_Date("'"+alVts.get(2).get(21)+"'");
                        }
                        vts_Obj.setWeight_Reading(alVts.get(2).get(7));
                        vts_Obj.setHeight_Reading(alVts.get(2).get(8));
                        vts_Obj.setDoctor_ID(alVts.get(2).get(23));
                        vts_Obj.setDoctor_Name(alVts.get(2).get(24));
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
//                        vts_Obj.setComment(alVts.get(2).get(22));
                        vts_Obj.setSPO2_Reading(alVts.get(2).get(29));
//                        vts_Obj.setECG_Reading(alVts.get(2).get(22));
//                        vts_Obj.setECG_Comments(dataVTS[vts_i][16]);

                    //check whether data is not null, not empty and numeric
                        //sitting
                        if (alVts.get(2).get(1) != null && !alVts.get(2).get(1).isEmpty() && alVts.get(2).get(1).matches("\\d+")) {
                            vts_Obj.setSystolic_Sitting(alVts.get(2).get(1));
                        } else {
                            vts_Obj.setSystolic_Sitting("0");
                        }
                        if (alVts.get(2).get(2) != null && !alVts.get(2).get(2).isEmpty() && alVts.get(2).get(2).matches("\\d+")) {
                            vts_Obj.setDiastolic_Sitting(alVts.get(2).get(2));
                        } else {
                            vts_Obj.setDiastolic_Sitting("0");
                        }
                        if (alVts.get(2).get(32) != null && !alVts.get(2).get(32).isEmpty() && alVts.get(2).get(32).matches("\\d+")) {
                            vts_Obj.setSitting_Pulse(alVts.get(2).get(32));
                        } else {
                            vts_Obj.setSitting_Pulse("0");
                        }

                        //supine
                        if (alVts.get(2).get(3) != null && !alVts.get(2).get(3).isEmpty() && alVts.get(2).get(3).matches("\\d+")) {
                            vts_Obj.setSystolic_Supine(alVts.get(2).get(3));
                        } else {
                            vts_Obj.setSystolic_Supine("0");
                        }
                        if (alVts.get(2).get(4) != null && !alVts.get(2).get(4).isEmpty() && alVts.get(2).get(4).matches("\\d+")) {
                            vts_Obj.setDiastolic_Supine(alVts.get(2).get(4));
                        } else {
                            vts_Obj.setDiastolic_Supine("0");
                        }
                        if (alVts.get(2).get(33) != null && !alVts.get(2).get(33).isEmpty() && alVts.get(2).get(33).matches("\\d+")) {
                            vts_Obj.setSupine_Pulse(alVts.get(2).get(33));
                        } else {
                            vts_Obj.setSupine_Pulse("0");
                        }

                        // standing
                        if (alVts.get(2).get(5) != null && !alVts.get(2).get(5).isEmpty() && alVts.get(2).get(5).matches("\\d+")) {
                            vts_Obj.setSystolic_Standing(alVts.get(2).get(5));
                        } else {
                            vts_Obj.setSystolic_Standing("0");
                        }
                        if (alVts.get(2).get(6) != null && !alVts.get(2).get(6).isEmpty() && alVts.get(2).get(6).matches("\\d+")) {
                            vts_Obj.setDiastolic_Standing(alVts.get(2).get(6));
                        } else {
                            vts_Obj.setDiastolic_Standing("0");
                        }
                        if (alVts.get(2).get(34) != null && !alVts.get(2).get(34).isEmpty() && alVts.get(2).get(34).matches("\\d+")) {
                            vts_Obj.setStanding_Pulse(alVts.get(2).get(34));
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
                                + "" + vts_Obj.getEncounter_Date() + ","
                                + "'" + vts_Obj.getWeight_Reading() + "',"
                                + "'" + vts_Obj.getHeight_Reading() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";

                        try {
                            if (Integer.parseInt(vts_Obj.getWeight_Reading()) > 0 && Integer.parseInt(vts_Obj.getHeight_Reading()) > 0) { 
                                status_vts_lhr_wh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_wh);
                            }
                    //    //System.out.println("status vts:" + status_vts_lhr_wh);
                            //    //System.out.println("sql vts : " + query_vts_lhr_wh);
                            if (status_vts_lhr_wh == false) {
                                System.out.println("false extract vts weight height");
                                //System.out.println("query vts wheight height: "+ query_vts_lhr_wh);
                        //System.out.println("Failed to insert data into lhr_weight_height (VTS_WH) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for VTS_BP: " + query_vts_lhr_wh);
                            }else{
                                System.out.println("done extract vts weight height");
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
                                + "" + vts_Obj.getEncounter_Date() + ","
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
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";

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
                                System.out.println("False extract vts bp");
                                //System.out.println("query vts bp: "+ query_vts_lhr_bp);
                            }else{
                                System.out.println("done extract vts bp");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        //check whether Blood_Glucose_Level data is null or empty
                        if (alVts.get(2).get(31) != null && !alVts.get(2).get(31).isEmpty()) {
                            vts_Obj.setBlood_Glucose_Level(alVts.get(2).get(31));
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
                                + "" + vts_Obj.getEncounter_Date() + ","
                                + "'" + vts_Obj.getBlood_Glucose_Level() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";

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
                                System.out.println("false extract vts blood glucose");
                                //System.out.println("query vts blood: "+ query_vts_lhr_bg);
                            }else{
                                    System.out.println("done extract vts blood glucose");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        //check whether spo2 data is null or empty
                        if (alVts.get(2).get(29) != null && !alVts.get(2).get(29).isEmpty()) {
                            vts_Obj.setSPO2_Reading(alVts.get(2).get(29));
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
                                + "" + vts_Obj.getEncounter_Date() + ","
                                + "'" + vts_Obj.getSPO2_Reading() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";

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
                                System.out.println("false extract vts spo2");
                                //System.out.println("query vts spo2: "+ query_vts_lhr_spo2);
                            }else{
                                 System.out.println("done extract vts spo2");
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
//                                + "comment, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code )"
                                + "values ('" + vts_Obj.getPMI_no() + "',"
                                + "'" + vts_Obj.getHFC_Cd() + "',"
                                + "'" + vts_Obj.getEpisode_Date() + "',"
                                + "" + vts_Obj.getEncounter_Date() + ","
                                + "'" + vts_Obj.getProcedure_Cd() + "',"
                                + "'" + vts_Obj.getProcedure_Name() + "',"
                                + "'" + vts_Obj.getProcedure_Outcome() + "',"
//                                + "'" + vts_Obj.getComment() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";

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
                                System.out.println("false extract vts procedure");
                                //System.out.println("query vts procedure: "+ query_vts_lhr_procedure);
                            }else{
                                System.out.println("done extract vts procedure");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        //check whether temperature_reading data is null or empty
                        if (alVts.get(2).get(0) != null && alVts.get(2).get(0) != "-" && !alVts.get(2).get(0).isEmpty() && alVts.get(2).get(0).matches("\\d+")) {
                            vts_Obj.setTemperature_Reading(alVts.get(2).get(0));
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
//                                + "comment, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code )"
                                + "values ('" + vts_Obj.getPMI_no() + "',"
                                + "'" + vts_Obj.getHFC_Cd() + "',"
                                + "'" + vts_Obj.getEpisode_Date() + "',"
                                + "" + vts_Obj.getEncounter_Date() + ","
                                + "'" + vts_Obj.getTemperature_Reading() + "',"
//                                + "'" + vts_Obj.getComment() + "',"
                                + "'" + vts_Obj.getDoctor_ID() + "',"
                                + "'" + vts_Obj.getDoctor_Name() + "',"
                                + "'" + t.getNational_id_no() + "',"
                                + "'" + t.getPERSON_ID_NO() + "',"
                                + "'" + t.getPERSON_STATUS() + "',"
                                + "'" + t.getCentre_Code() + "')";

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
                                System.out.println("false extract vts temperature");
                                //System.out.println("query vts temperature: "+ query_vts_lhr_temperature);
                            }else{
                                System.out.println("done extract vts temperature");
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
        
        return true;
    }
}
