package lhr_tables;

import Bean.ERRCOUNT;
import Bean.MSH;
import Bean.VTS;
import Config_Pack.Config;
import bean.VTS2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

public class lhr_VTS {

    public boolean M_VTS(Vector<VTS2> vts2, get_ehr_central_data t, MSH msh) {

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

                    //
                    if (alVts.get(2).get(21).isEmpty() || alVts.get(2).get(21).equalsIgnoreCase("-") || alVts.get(2).get(21).equalsIgnoreCase(" ")) {
                        vts_Obj.setEncounter_Date("'" + alVts.get(1).get(0) + "'");
                    } else {
                        vts_Obj.setEncounter_Date("'" + alVts.get(2).get(21) + "'");
                    }
                   
                    vts_Obj.setHeight_Reading(alVts.get(2).get(8));
                    vts_Obj.setDoctor_ID(alVts.get(2).get(23));
                    vts_Obj.setDoctor_Name(alVts.get(2).get(24));

//                        vts_Obj.setComment(alVts.get(2).get(22));
//                    vts_Obj.setSPO2_Reading(alVts.get(2).get(29));
//                        vts_Obj.setECG_Reading(alVts.get(2).get(22));
//                        vts_Obj.setECG_Comments(dataVTS[vts_i][16]);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    //check whether data is not null, not empty and numeric
                    //wight height
                    if (alVts.get(2).get(7) != null && !alVts.get(2).get(7).isEmpty() && alVts.get(2).get(7).matches("\\d+") && !alVts.get(2).get(7).equals("-")) {
                         vts_Obj.setWeight_Reading(alVts.get(2).get(7));
                    } else {
                         vts_Obj.setWeight_Reading("0");
                    }
                    
                    if (alVts.get(2).get(8) != null && !alVts.get(2).get(8).isEmpty() && alVts.get(2).get(8).matches("\\d+") && !alVts.get(2).get(8).equals("-")) {
                        vts_Obj.setHeight_Reading(alVts.get(2).get(8));
                    } else {
                        vts_Obj.setHeight_Reading("0");
                    }
                    
                    
                    //sitting
                    if (alVts.get(2).get(1) != null && !alVts.get(2).get(1).isEmpty() && alVts.get(2).get(1).matches("\\d+") && !alVts.get(2).get(1).equals("-")) {
                        vts_Obj.setSystolic_Sitting(alVts.get(2).get(1));
                    } else {
                        vts_Obj.setSystolic_Sitting("0");
                    }
                    
                    if (alVts.get(2).get(2) != null && !alVts.get(2).get(2).isEmpty() && alVts.get(2).get(2).matches("\\d+") && !alVts.get(2).get(2).equals("-")) {
                        vts_Obj.setDiastolic_Sitting(alVts.get(2).get(2));
                    } else {
                        vts_Obj.setDiastolic_Sitting("0");
                    }
                    
                    if (alVts.get(2).get(32) != null && !alVts.get(2).get(32).isEmpty() && alVts.get(2).get(32).matches("\\d+") && !alVts.get(2).get(32).equals("-")) {
                        vts_Obj.setSitting_Pulse(alVts.get(2).get(32));
                    } else {
                        vts_Obj.setSitting_Pulse("0");
                    }

                    //supine
                    if (alVts.get(2).get(3) != null && !alVts.get(2).get(3).isEmpty() && alVts.get(2).get(3).matches("\\d+") && !alVts.get(2).get(3).equals("-")) {
                        vts_Obj.setSystolic_Supine(alVts.get(2).get(3));
                    } else {
                        vts_Obj.setSystolic_Supine("0");
                    }
                    if (alVts.get(2).get(4) != null && !alVts.get(2).get(4).isEmpty() && alVts.get(2).get(4).matches("\\d+") && !alVts.get(2).get(4).equals("-")) {
                        vts_Obj.setDiastolic_Supine(alVts.get(2).get(4));
                    } else {
                        vts_Obj.setDiastolic_Supine("0");
                    }
                    if (alVts.get(2).get(33) != null && !alVts.get(2).get(33).isEmpty() && alVts.get(2).get(33).matches("\\d+")&& !alVts.get(2).get(33).equals("-")) {
                        vts_Obj.setSupine_Pulse(alVts.get(2).get(33));
                    } else {
                        vts_Obj.setSupine_Pulse("0");
                    }

                    // standing
                    if (alVts.get(2).get(5) != null && !alVts.get(2).get(5).isEmpty() && alVts.get(2).get(5).matches("\\d+") && !alVts.get(2).get(5).equals("-")) {
                        vts_Obj.setSystolic_Standing(alVts.get(2).get(5));
                    } else {
                        vts_Obj.setSystolic_Standing("0");
                    }
                    if (alVts.get(2).get(6) != null && !alVts.get(2).get(6).isEmpty() && alVts.get(2).get(6).matches("\\d+") && !alVts.get(2).get(6).equals("-")) {
                        vts_Obj.setDiastolic_Standing(alVts.get(2).get(6));
                    } else {
                        vts_Obj.setDiastolic_Standing("0");
                    }
                    if (alVts.get(2).get(34) != null && !alVts.get(2).get(34).isEmpty() && alVts.get(2).get(34).matches("\\d+") && !alVts.get(2).get(34).equals("-")) {
                        vts_Obj.setStanding_Pulse(alVts.get(2).get(34));
                    } else {
                        vts_Obj.setStanding_Pulse("0");
                    }

                    String a, b, c, d;
                    a = t.getNational_id_no();
                    b = t.getPERSON_STATUS();
                    c = t.getPERSON_ID_NO();
                    d = t.getCentre_Code();

                    if (a == null || a.isEmpty() || a.equals(" ")) {
                        a = "PUBLIC HOSPITAL";
                    }

                    if (b == null || b.isEmpty() || b.equals(" ")) {
                        b = "PUBLIC HOSPITAL";
                    }

                    if (c == null || c.isEmpty() || c.equals(" ")) {
                        c = "PUBLIC HOSPITAL";
                    }

                    if (d == null || d.isEmpty() || d.equals(" ")) {
                        d = "PUBLIC HOSPITAL";
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
                            + "centre_code,"
                            + "discipline_cd,"
                            + "subdiscipline_cd,"
                            + "created_by,"
                            + "created_date)"
                            + "values ('" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getWeight_Reading() + "',"
                            + "'" + vts_Obj.getHeight_Reading() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + b + "',"
                            + "'" + d + "',"
                            + "'" + msh.getSendingFacilityDis() + "'"
                            + ",'" + msh.getSendingFacilitySubDis() + "'"
                            + ",'" + vts_Obj.getDoctor_ID() + "'"
                            + ",'" + msh.getDateTime() + "')";

                    try {
                        if (Integer.parseInt(vts_Obj.getWeight_Reading()) > 0 && Integer.parseInt(vts_Obj.getHeight_Reading()) > 0) {
                            status_vts_lhr_wh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_wh);
                        }
                        if (status_vts_lhr_wh == false) {
                            System.out.println("false extract vts weight height");
                            System.out.println(query_vts_lhr_wh);
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("LWH|");
                        } else {
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
                            + "centre_code,"
                            + "discipline_cd,"
                            + "subdiscipline_cd"
                            + ",created_by,"
                            + "created_date)"
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
                            + "'" + a + "',"
                            + "'" + b + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + msh.getSendingFacilityDis() + "',"
                            + "'" + msh.getSendingFacilitySubDis() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + msh.getDateTime() + "')";

                    try {
                        if (Double.parseDouble(vts_Obj.getSystolic_Sitting()) > 0
                                && Double.parseDouble(vts_Obj.getDiastolic_Sitting()) > 0
                                && Double.parseDouble(vts_Obj.getSitting_Pulse()) > 0) {
                            status_vts_lhr_bp = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_bp);
                        }
                        if (status_vts_lhr_bp == false) {
                            total_fail_insert++;
                            System.out.println("False extract vts bp");
                            System.out.println(query_vts_lhr_bp);
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("BPP|");
                        } else {
                            System.out.println("done extract vts bp");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    //check whether Blood_Glucose_Level data is null or empty
                    if (alVts.get(2).get(31) != null && !alVts.get(2).get(31).isEmpty() && !alVts.get(2).get(31).equals("-")) {
                        vts_Obj.setBlood_Glucose_Level(alVts.get(2).get(31) );
                    } else {
                        vts_Obj.setBlood_Glucose_Level("0");
                    }

                    // insert record from ehr_central into lhr_blood_glucose table
                    String query_vts_lhr_bg = "insert into lhr_blood_glucose "
                            + "(PMI_no, "
                            + "HFC_Cd, "
                            + "Episode_Date, "
                            + "Encounter_Date, "
                            + "Blood_Glucose_Level,"
                            + "date_taken, "
                            + "Doctor_ID, "
                            + "Doctor_Name, "
                            + "national_id_no, "
                            + "person_id_no, "
                            + "person_status, "
                            + "centre_code,"
                            + "discipline_cd,"
                            + "subdiscipline_cd,"
                            + "created_by,"
                            + "created_date)"
                            + "values ('" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getBlood_Glucose_Level() + "',"
                            + "now(),"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + b + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + msh.getSendingFacilityDis() + "',"
                            + "'" + msh.getSendingFacilitySubDis() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + msh.getDateTime() + "')";

                    try {
                        if (Integer.parseInt(vts_Obj.getBlood_Glucose_Level()) > 0) {
                            status_vts_lhr_bg = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_bg);
                        }
                        if (status_vts_lhr_bg == false) {
                            total_fail_insert++;
                            System.out.println("false extract vts blood glucose");
                            System.out.println(query_vts_lhr_bg);
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("BLG|");
                        } else {
                            System.out.println("done extract vts blood glucose");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    
                    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
                    //check whether spo2 data is null or empty
                    if (alVts.get(2).get(29) != null && !alVts.get(2).get(29).isEmpty() && !alVts.get(2).get(29).equals("-")) {
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
                            + "centre_code,"
                            + "discipline_cd,"
                            + "subdiscipline_cd,"
                            + "created_by,"
                            + "created_date )"
                            + "values ('" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getSPO2_Reading() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + b + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + msh.getSendingFacilityDis() + "',"
                            + "'" + msh.getSendingFacilitySubDis() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + msh.getDateTime() + "')";

                    try {
                        if (Integer.parseInt(vts_Obj.getSPO2_Reading()) > 0) {
                            status_vts_lhr_spo2 = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_spo2);
                        }
                        if (status_vts_lhr_spo2 == false) {
                            total_fail_insert++;
                            System.out.println("false extract vts spo2");
                            System.out.println(query_vts_lhr_spo2);
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("SPO2|");
                        } else {
                            System.out.println("done extract vts spo2");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    //check whether temperature_reading data is null or empty
                    if (alVts.get(2).get(0) != null && !alVts.get(2).get(0).equals("-") && !alVts.get(2).get(0).isEmpty() && alVts.get(2).get(0).matches("\\d+")) {
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
                            + "comment, "
                            + "doctor_id, "
                            + "doctor_name, "
                            + "national_id_no, "
                            + "person_id_no, "
                            + "person_status, "
                            + "centre_code,"
                            + "discipline_cd,"
                            + "subdiscipline_cd,"
                            + "created_by,"
                            + "created_date)"
                            + "values ('" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getTemperature_Reading() + "',"
                            + "'N/A',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + b + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + msh.getSendingFacilityDis() + "',"
                            + "'" + msh.getSendingFacilitySubDis() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + msh.getDateTime() + "')";

                    try {
                        if (Integer.parseInt(vts_Obj.getTemperature_Reading()) >= 0) {
                            status_vts_lhr_temperature = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_temperature);
                            if (status_vts_lhr_temperature == false) {
                                total_fail_insert++;
                                System.out.println("false extract vts temperature");
                                System.out.println(query_vts_lhr_temperature);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("TEMP|");
                            } else {
                                System.out.println("done extract vts temperature");
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    vts_ArrayList.add(vts_Obj);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }
}
