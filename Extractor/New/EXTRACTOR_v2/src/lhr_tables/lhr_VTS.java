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
        boolean status_vts_lhr_pupil = false;
        boolean status_vts_lhr_temperature = false;
        boolean status_vts_lhr_circum = false;
        boolean status_vts_lhr_gcs = false;
        boolean status_vts_lhr_pgcs = false;
        boolean status_vts_lhr_pain_scale = false;
        boolean status_vts_lhr_respiratory = false;
        boolean status_vts_lhr_visual = false;
        String singleQuote = "'";
        String strNull = "NULL";
        
        //dynamic query for lhr_bp
//        ArrayList<String> bp_attribute = new ArrayList<String>();
//        ArrayList<String> bp_value = new ArrayList<String>();

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
                    vts_Obj.setDiscipline(msh.getSendingFacilityDis());
                    vts_Obj.setSubdiscipline(msh.getSendingFacilitySubDis());

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

                    //
                    if (alVts.get(2).get(21).isEmpty() || alVts.get(2).get(21).equalsIgnoreCase("-") || alVts.get(2).get(21).equalsIgnoreCase(" ")) {
                        vts_Obj.setEncounter_Date("'" + alVts.get(1).get(0) + "'");
                    } else {
                        vts_Obj.setEncounter_Date("'" + alVts.get(2).get(21) + "'");
                    }

                    vts_Obj.setHeight_Reading(alVts.get(2).get(8));
                    vts_Obj.setDoctor_ID(alVts.get(2).get(23));
                    vts_Obj.setDoctor_Name(alVts.get(2).get(24));
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                  PUPIL THINGS
                    if (alVts.get(2).get(13) != null && !alVts.get(2).get(13).isEmpty() && !alVts.get(2).get(13).equals("-")) {
                        vts_Obj.setLeft_pupil_condition(singleQuote+alVts.get(2).get(13)+singleQuote);
                    } else {
                        vts_Obj.setLeft_pupil_condition(strNull);
                    }

                    if (alVts.get(2).get(14) != null && !alVts.get(2).get(14).isEmpty() && !alVts.get(2).get(14).equals("-")) {
                        vts_Obj.setLeft_pupil_option(singleQuote+alVts.get(2).get(14)+singleQuote);
                    } else {
                        vts_Obj.setLeft_pupil_option(strNull);
                    }

                    if (alVts.get(2).get(15) != null && !alVts.get(2).get(15).isEmpty() && !alVts.get(2).get(15).equals("-")) {
                        vts_Obj.setLeft_pupil_size(alVts.get(2).get(15));
                    } else {
                        vts_Obj.setLeft_pupil_size(strNull);
                    }

                    if (alVts.get(2).get(16) != null && !alVts.get(2).get(16).isEmpty() && !alVts.get(2).get(16).equals("-")) {
                        vts_Obj.setLeft_pupil_reflex(singleQuote+alVts.get(2).get(16)+singleQuote);
                    } else {
                        vts_Obj.setLeft_pupil_reflex(strNull);
                    }

                    if (alVts.get(2).get(18) != null && !alVts.get(2).get(18).isEmpty() && !alVts.get(2).get(18).equals("-")) {
                        vts_Obj.setLeft_accom_reflex(singleQuote+alVts.get(2).get(18)+singleQuote);
                    } else {
                        vts_Obj.setLeft_accom_reflex(strNull);
                    }

                    if (alVts.get(2).get(35) != null && !alVts.get(2).get(35).isEmpty() && !alVts.get(2).get(35).equals("-")) {
                        vts_Obj.setRight_pupil_condition(singleQuote+alVts.get(2).get(35)+singleQuote);
                    } else {
                        vts_Obj.setRight_pupil_condition(strNull);
                    }

                    if (alVts.get(2).get(36) != null && !alVts.get(2).get(36).isEmpty() && !alVts.get(2).get(36).equals("-")) {
                        vts_Obj.setRight_pupil_option(singleQuote+alVts.get(2).get(36)+singleQuote);
                    } else {
                        vts_Obj.setRight_pupil_option(strNull);
                    }

                    if (alVts.get(2).get(37) != null && !alVts.get(2).get(37).isEmpty() && !alVts.get(2).get(37).equals("-")) {
                        vts_Obj.setRight_pupil_size(alVts.get(2).get(37));
                    } else {
                        vts_Obj.setRight_pupil_size(strNull);
                    }

                    if (alVts.get(2).get(17) != null && !alVts.get(2).get(17).isEmpty() && !alVts.get(2).get(16).equals("-")) {
                        vts_Obj.setRight_pupil_reflex(singleQuote+alVts.get(2).get(17)+singleQuote);
                    } else {
                        vts_Obj.setRight_pupil_reflex(strNull);
                    }

                    if (alVts.get(2).get(19) != null && !alVts.get(2).get(19).isEmpty() && !alVts.get(2).get(19).equals("-")) {
                        vts_Obj.setRight_accom_reflex(singleQuote+alVts.get(2).get(19)+singleQuote);
                    } else {
                        vts_Obj.setRight_accom_reflex(strNull);
                    }

                    String query_vts_lhr_pupil = "insert into lhr_pupil "
                            + "(pmi_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "discipline_cd, "
                            + "subdiscipline_cd,"
                            + "doctor_id,"
                            + "doctor_name,"
                            + "national_id_no,"
                            + "person_id_no,"
                            + "centre_code,"
                            + "created_by,"
                            + "created_date,"
                            + "left_accom_reflex,"
                            + "left_light_reflex,"
                            + "left_pupil_condition,"
                            + "left_pupil_option,"
                            + "left_pupil_size,"
                            + "right_accom_reflex,"
                            + "right_light_reflex,"
                            + "right_pupil_condition,"
                            + "right_pupil_option,"
                            + "right_pupil_size) values("
                            + "'" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getDiscipline() + "',"
                            + "'" + vts_Obj.getSubdiscipline() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "" + vts_Obj.getLeft_accom_reflex() + ","
                            + "" + vts_Obj.getLeft_pupil_reflex() + ","
                            + "" + vts_Obj.getLeft_pupil_condition() + ","
                            + "" + vts_Obj.getLeft_pupil_option() + ","
                            + "" + vts_Obj.getLeft_pupil_size() + ","
                            + "" + vts_Obj.getRight_accom_reflex() + ","
                            + "" + vts_Obj.getRight_pupil_reflex() + ","
                            + "" + vts_Obj.getRight_pupil_condition() + ","
                            + "" + vts_Obj.getRight_pupil_option() + ","
                            + "" + vts_Obj.getRight_pupil_size() + ");";

                    try {
                        if (!vts_Obj.getRight_pupil_size().equalsIgnoreCase(strNull)|| !vts_Obj.getLeft_pupil_size().equalsIgnoreCase(strNull)
                                || !vts_Obj.getLeft_accom_reflex().equalsIgnoreCase(strNull) || !vts_Obj.getLeft_pupil_reflex().equalsIgnoreCase(strNull) || !vts_Obj.getLeft_pupil_condition().equalsIgnoreCase(strNull) || !vts_Obj.getLeft_pupil_option().equalsIgnoreCase(strNull)
                                || !vts_Obj.getRight_accom_reflex().equalsIgnoreCase(strNull) || !vts_Obj.getRight_pupil_reflex().equalsIgnoreCase(strNull) || !vts_Obj.getRight_pupil_condition().equalsIgnoreCase(strNull) || !vts_Obj.getRight_pupil_option().equalsIgnoreCase(strNull)) 
                        {
                            status_vts_lhr_pupil = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_pupil);

                            if (status_vts_lhr_pupil == false) {
                                System.out.println("false extract vts pupil");
                                System.out.println(query_vts_lhr_pupil);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("PUP|");
                            } else {
                                System.out.println("done extract vts PUPIL");
                            }
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                  circumference
                    if (alVts.get(2).get(9) != null && !alVts.get(2).get(9).isEmpty() && !alVts.get(2).get(9).equals("-")) {
                        vts_Obj.setHead_cicum(alVts.get(2).get(9));
                    } else {
                        vts_Obj.setHead_cicum("0");
                    }

                    String query_vts_lhr_circum = "insert into lhr_head_circumference "
                            + "(pmi_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "discipline_cd, "
                            + "subdiscipline_cd,"
                            + "doctor_id,"
                            + "doctor_name,"
                            + "national_id_no,"
                            + "person_id_no,"
                            + "centre_code,"
                            + "created_by,"
                            + "created_date,"
                            + "person_status,"
                            + "circumference_size) values("
                            + "'" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getDiscipline() + "',"
                            + "'" + vts_Obj.getSubdiscipline() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + b + "',"
                            + "'" + vts_Obj.getHead_cicum() + "');";

                    try {
                        if (Float.parseFloat(vts_Obj.getHead_cicum()) > 0) {
                            status_vts_lhr_circum = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_circum);
                            if (status_vts_lhr_circum == false) {
                                System.out.println("false extract vts CIRCUM");
                                System.out.println(query_vts_lhr_circum);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("CIRCUM|");
                            } else {
                                System.out.println("done extract vts CIRCUM");
                            }
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                  glasgow coma scale
                    if (alVts.get(2).get(25) != null && !alVts.get(2).get(25).isEmpty() && !alVts.get(2).get(25).equals("-")) {
                        vts_Obj.setGsc_point(alVts.get(2).get(25));
                    } else {
                        vts_Obj.setGsc_point("0");
                    }

                    if (alVts.get(2).get(26) != null && !alVts.get(2).get(26).isEmpty() && !alVts.get(2).get(26).equals("-")) {
                        vts_Obj.setGcs_result(alVts.get(2).get(26));
                    } else {
                        vts_Obj.setGcs_result("");
                    }

                    String query_vts_lhr_gcs = "insert into lhr_gcs "
                            + "(pmi_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "discipline_cd, "
                            + "subdiscipline_cd,"
                            + "doctor_id,"
                            + "doctor_name,"
                            + "national_id_no,"
                            + "person_id_no,"
                            + "centre_code,"
                            + "created_by,"
                            + "created_date,"
                            + "person_status,"
                            + "gcs_point,"
                            + "gcs_result) values("
                            + "'" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getDiscipline() + "',"
                            + "'" + vts_Obj.getSubdiscipline() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + b + "',"
                            + "'" + vts_Obj.getGsc_point() + "',"
                            + "'" + vts_Obj.getGcs_result() + "');";

                    try {
                        if (Integer.parseInt(vts_Obj.getGsc_point()) > 0 && !vts_Obj.getGcs_result().equals("")) {
                            status_vts_lhr_gcs = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_gcs);
                            if (status_vts_lhr_gcs == false) {
                                System.out.println("false extract vts GCS");
                                System.out.println(query_vts_lhr_gcs);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("GCS|");
                            } else {
                                System.out.println("done extract vts GCS");
                            }
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                  paedetric glasgow coma scale
                    if (alVts.get(2).get(27) != null && !alVts.get(2).get(27).isEmpty() && !alVts.get(2).get(27).equals("-")) {
                        vts_Obj.setPgsc_point(alVts.get(2).get(27));
                    } else {
                        vts_Obj.setPgsc_point("0");
                    }

                    if (alVts.get(2).get(28) != null && !alVts.get(2).get(28).isEmpty() && !alVts.get(2).get(28).equals("-")) {
                        vts_Obj.setPgcs_result(alVts.get(2).get(28));
                    } else {
                        vts_Obj.setPgcs_result("");
                    }

                    String query_vts_lhr_pgcs = "insert into lhr_pgcs "
                            + "(pmi_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "discipline_cd, "
                            + "subdiscipline_cd,"
                            + "doctor_id,"
                            + "doctor_name,"
                            + "national_id_no,"
                            + "person_id_no,"
                            + "centre_code,"
                            + "created_by,"
                            + "created_date,"
                            + "person_status,"
                            + "pgcs_point,"
                            + "pgcs_result) values("
                            + "'" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getDiscipline() + "',"
                            + "'" + vts_Obj.getSubdiscipline() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + b + "',"
                            + "'" + vts_Obj.getPgsc_point() + "',"
                            + "'" + vts_Obj.getPgcs_result() + "');";

                    try {
                        if (Integer.parseInt(vts_Obj.getPgsc_point()) > 0 && !vts_Obj.getPgcs_result().equals("")) {
                            status_vts_lhr_pgcs = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_pgcs);
                            if (status_vts_lhr_pgcs == false) {
                                System.out.println("false extract vts PGCS");
                                System.out.println(query_vts_lhr_pgcs);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("PGCS|");
                            } else {
                                System.out.println("done extract vts PGCS");
                            }
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                  pain scale
                    if (alVts.get(2).get(30) != null && !alVts.get(2).get(30).isEmpty() && !alVts.get(2).get(30).equals("-")) {
                        vts_Obj.setPain_scale_point(alVts.get(2).get(30));
                    } else {
                        vts_Obj.setPain_scale_point("0");
                    }

                    if (alVts.get(2).get(43) != null && !alVts.get(2).get(43).isEmpty() && !alVts.get(2).get(43).equals("-")) {
                        vts_Obj.setPain_scale_result(alVts.get(2).get(43));
                    } else {
                        vts_Obj.setPain_scale_result("");
                    }

                    String query_vts_lhr_pain_scale = "insert into lhr_pain_scale "
                            + "(pmi_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "discipline_cd, "
                            + "subdiscipline_cd,"
                            + "doctor_id,"
                            + "doctor_name,"
                            + "national_id_no,"
                            + "person_id_no,"
                            + "centre_code,"
                            + "created_by,"
                            + "created_date,"
                            + "person_status,"
                            + "point,"
                            + "result) values("
                            + "'" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getDiscipline() + "',"
                            + "'" + vts_Obj.getSubdiscipline() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + b + "',"
                            + "'" + vts_Obj.getPain_scale_point() + "',"
                            + "'" + vts_Obj.getPain_scale_result() + "');";

                    try {
                        if (Integer.parseInt(vts_Obj.getPain_scale_point()) >= 0 && !vts_Obj.getPain_scale_result().equals("")) {
                            status_vts_lhr_pain_scale = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_pain_scale);
                            if (status_vts_lhr_pain_scale == false) {
                                System.out.println("false extract vts PAINS");
                                System.out.println(query_vts_lhr_pain_scale);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("PAINS|");
                            } else {
                                System.out.println("done extract vts PAINS");
                            }
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                  respiratory rate
                    if (alVts.get(2).get(30) != null && !alVts.get(2).get(30).isEmpty() && !alVts.get(2).get(30).equals("-")) {
                        vts_Obj.setRespiratory_rate(alVts.get(2).get(30));
                    } else {
                        vts_Obj.setRespiratory_rate("0");
                    }

                    String query_vts_lhr_respiratory = "insert into lhr_respiratory_rate "
                            + "(pmi_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "discipline_cd, "
                            + "subdiscipline_cd,"
                            + "doctor_id,"
                            + "doctor_name,"
                            + "national_id_no,"
                            + "person_id_no,"
                            + "centre_code,"
                            + "created_by,"
                            + "created_date,"
                            + "person_status,"
                            + "rate) values("
                            + "'" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getDiscipline() + "',"
                            + "'" + vts_Obj.getSubdiscipline() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + b + "',"
                            + "'" + vts_Obj.getRespiratory_rate() + "');";

                    try {
                        if (Integer.parseInt(vts_Obj.getRespiratory_rate()) > 0) {
                            status_vts_lhr_respiratory = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_respiratory);
                            if (status_vts_lhr_respiratory == false) {
                                System.out.println("false extract vts RR");
                                System.out.println(query_vts_lhr_respiratory);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("RR|");
                            } else {
                                System.out.println("done extract vts RR");
                            }
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                  visual
                    if (alVts.get(2).get(38) != null && !alVts.get(2).get(38).isEmpty() && !alVts.get(2).get(38).equals("-")) {
                        vts_Obj.setVision_type(singleQuote+alVts.get(2).get(38)+singleQuote);
                    } else {
                        vts_Obj.setVision_type(strNull);
                    }

                    if (alVts.get(2).get(39) != null && !alVts.get(2).get(39).isEmpty() && !alVts.get(2).get(39).equals("-")) {
                        vts_Obj.setLeft_eye_score(singleQuote+alVts.get(2).get(39)+singleQuote);
                    } else {
                        vts_Obj.setLeft_eye_score(strNull);
                    }

                    if (alVts.get(2).get(40) != null && !alVts.get(2).get(40).isEmpty() && !alVts.get(2).get(40).equals("-")) {
                        vts_Obj.setRight_eye_score(singleQuote+alVts.get(2).get(40)+singleQuote);
                    } else {
                        vts_Obj.setRight_eye_score(strNull);
                    }

                    if (alVts.get(2).get(41) != null && !alVts.get(2).get(41).isEmpty() && !alVts.get(2).get(41).equals("-")) {
                        vts_Obj.setColor_vision(singleQuote+alVts.get(2).get(41)+singleQuote);
                    } else {
                        vts_Obj.setColor_vision(strNull);
                    }

                    if (alVts.get(2).get(42) != null && !alVts.get(2).get(42).isEmpty() && !alVts.get(2).get(42).equals("-")) {
                        vts_Obj.setComment(singleQuote+alVts.get(2).get(42)+singleQuote);
                    } else {
                        vts_Obj.setComment(strNull);
                    }

                    String query_vts_lhr_visual = "insert into lhr_visual "
                            + "(pmi_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "discipline_cd, "
                            + "subdiscipline_cd,"
                            + "doctor_id,"
                            + "doctor_name,"
                            + "national_id_no,"
                            + "person_id_no,"
                            + "centre_code,"
                            + "created_by,"
                            + "created_date,"
                            + "person_status,"
                            + "vision_type,"
                            + "right_eye_score,"
                            + "left_eye_score,"
                            + "colour_vision,"
                            + "comment) values("
                            + "'" + vts_Obj.getPMI_no() + "',"
                            + "'" + vts_Obj.getHFC_Cd() + "',"
                            + "'" + vts_Obj.getEpisode_Date() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + vts_Obj.getDiscipline() + "',"
                            + "'" + vts_Obj.getSubdiscipline() + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "'" + vts_Obj.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + d + "',"
                            + "'" + vts_Obj.getDoctor_ID() + "',"
                            + "" + vts_Obj.getEncounter_Date() + ","
                            + "'" + b + "',"
                            + "" + vts_Obj.getVision_type() + ","
                            + "" + vts_Obj.getRight_eye_score() + ","
                            + "" + vts_Obj.getLeft_eye_score() + ","
                            + "" + vts_Obj.getColor_vision() + ","
                            + "" + vts_Obj.getComment() + ");";

                    try {
                        if (!vts_Obj.getRight_eye_score().equalsIgnoreCase("") && !vts_Obj.getLeft_eye_score().equalsIgnoreCase("")) {
                            status_vts_lhr_visual = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_visual);
                            if (status_vts_lhr_visual == false) {
                                System.out.println("false extract vts VS");
                                System.out.println(query_vts_lhr_visual);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("VS|");
                            } else {
                                System.out.println("done extract vts VS");
                            }
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    //check whether data is not null, not empty and numeric
                    //wight height
                    if (alVts.get(2).get(7) != null && !alVts.get(2).get(7).isEmpty()  && !alVts.get(2).get(7).equals("-")) {
                        vts_Obj.setWeight_Reading(alVts.get(2).get(7));
                    } else {
                        vts_Obj.setWeight_Reading("NULL");
                    }

                    if (alVts.get(2).get(8) != null && !alVts.get(2).get(8).isEmpty()  && !alVts.get(2).get(8).equals("-")) {
                        vts_Obj.setHeight_Reading(alVts.get(2).get(8));
                    } else {
                        vts_Obj.setHeight_Reading("NULL");
                    }

                    //sitting
                    if (alVts.get(2).get(1) != null && !alVts.get(2).get(1).isEmpty() && !alVts.get(2).get(1).equals("-")) {
                        vts_Obj.setSystolic_Sitting(alVts.get(2).get(1));
                    } else {
                        vts_Obj.setSystolic_Sitting("NULL");
                    }

                    if (alVts.get(2).get(2) != null && !alVts.get(2).get(2).isEmpty()  && !alVts.get(2).get(2).equals("-")) {
                        vts_Obj.setDiastolic_Sitting(alVts.get(2).get(2));
                    } else {
                        vts_Obj.setDiastolic_Sitting("NULL");
                    }

                    if (alVts.get(2).get(32) != null && !alVts.get(2).get(32).isEmpty()  && !alVts.get(2).get(32).equals("-")) {
                        vts_Obj.setSitting_Pulse(alVts.get(2).get(32));
                    } else {
                        vts_Obj.setSitting_Pulse("NULL");
                    }

                    //supine
                    if (alVts.get(2).get(3) != null && !alVts.get(2).get(3).isEmpty()  && !alVts.get(2).get(3).equals("-")) {
                        vts_Obj.setSystolic_Supine(alVts.get(2).get(3));
                    } else {
                        vts_Obj.setSystolic_Supine("NULL");
                    }
                    if (alVts.get(2).get(4) != null && !alVts.get(2).get(4).isEmpty() && !alVts.get(2).get(4).equals("-")) {
                        vts_Obj.setDiastolic_Supine(alVts.get(2).get(4));
                    } else {
                        vts_Obj.setDiastolic_Supine("NULL");
                    }
                    if (alVts.get(2).get(33) != null && !alVts.get(2).get(33).isEmpty()  && !alVts.get(2).get(33).equals("-")) {
                        vts_Obj.setSupine_Pulse(alVts.get(2).get(33));
                    } else {
                        vts_Obj.setSupine_Pulse("NULL");
                    }

                    // standing
                    if (alVts.get(2).get(5) != null && !alVts.get(2).get(5).isEmpty() && !alVts.get(2).get(5).equals("-")) {
                        vts_Obj.setSystolic_Standing(alVts.get(2).get(5));
                    } else {
                        vts_Obj.setSystolic_Standing("NULL");
                    }
                    if (alVts.get(2).get(6) != null && !alVts.get(2).get(6).isEmpty() && !alVts.get(2).get(6).equals("-")) {
                        vts_Obj.setDiastolic_Standing(alVts.get(2).get(6));
                    } else {
                        vts_Obj.setDiastolic_Standing("NULL");
                    }
                    if (alVts.get(2).get(34) != null && !alVts.get(2).get(34).isEmpty() && !alVts.get(2).get(34).equals("-")) {
                        vts_Obj.setStanding_Pulse(alVts.get(2).get(34));
                    } else {
                        vts_Obj.setStanding_Pulse("NULL");
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
                            + "" + vts_Obj.getWeight_Reading() + ","
                            + "" + vts_Obj.getHeight_Reading() + ","
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
                        if(!vts_Obj.getWeight_Reading().equalsIgnoreCase("NULL") || !vts_Obj.getHeight_Reading().equalsIgnoreCase("NULL")){
                            status_vts_lhr_wh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_wh);
                            if (status_vts_lhr_wh == false) {
                                System.out.println("false extract vts weight height");
                                System.out.println(query_vts_lhr_wh);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("LWH|");
                            } else {
                                System.out.println("done extract vts WEIGHT HEIGHT");
                            }
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
                            + "" + vts_Obj.getSystolic_Sitting() + ","
                            + "" + vts_Obj.getDiastolic_Sitting() + ","
                            + "" + vts_Obj.getSitting_Pulse() + ","
                            + "" + vts_Obj.getSystolic_Standing() + ","
                            + "" + vts_Obj.getDiastolic_Standing() + ","
                            + "" + vts_Obj.getStanding_Pulse() + ","
                            + "" + vts_Obj.getSystolic_Supine() + ","
                            + "" + vts_Obj.getDiastolic_Supine() + ","
                            + "" + vts_Obj.getSupine_Pulse() + ","
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
                        if(!vts_Obj.getSystolic_Sitting().equalsIgnoreCase("NULL") || !vts_Obj.getSystolic_Standing().equalsIgnoreCase("NULL") || !vts_Obj.getSystolic_Supine().equalsIgnoreCase("NULL") 
                                || !vts_Obj.getDiastolic_Sitting().equalsIgnoreCase("NULL") || !vts_Obj.getDiastolic_Standing().equalsIgnoreCase("NULL") || !vts_Obj.getDiastolic_Supine().equalsIgnoreCase("NULL") 
                                || !vts_Obj.getSitting_Pulse().equalsIgnoreCase("NULL") || !vts_Obj.getStanding_Pulse().equalsIgnoreCase("NULL") || !vts_Obj.getSupine_Pulse().equalsIgnoreCase("NULL")){
                            status_vts_lhr_bp = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_bp);
                            if (status_vts_lhr_bp == false) {
                                total_fail_insert++;
                                System.out.println("False extract vts bp");
                                System.out.println(query_vts_lhr_bp);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("BPP|");
                            } else {
                                System.out.println("done extract vts BP");
                            }
                        }
//                        if (Double.parseDouble(vts_Obj.getSystolic_Sitting()) > 0
//                                && Double.parseDouble(vts_Obj.getDiastolic_Sitting()) > 0
//                                && Double.parseDouble(vts_Obj.getSitting_Pulse()) > 0) {
//                            
//                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    //check whether Blood_Glucose_Level data is null or empty
                    if (alVts.get(2).get(31) != null && !alVts.get(2).get(31).isEmpty() && !alVts.get(2).get(31).equals("-")) {
                        vts_Obj.setBlood_Glucose_Level(alVts.get(2).get(31));
                    } else {
                        vts_Obj.setBlood_Glucose_Level("x");
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
                        if(vts_Obj.getBlood_Glucose_Level().equalsIgnoreCase("x")){
                            System.out.println("Skip extract vts BLOOD GLUCOSE");                        
                        }
                        else if (Float.parseFloat(vts_Obj.getBlood_Glucose_Level()) >= 0) {
                            status_vts_lhr_bg = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_bg);
                            if (status_vts_lhr_bg == false) {
                                total_fail_insert++;
                                System.out.println("false extract vts blood glucose");
                                System.out.println(query_vts_lhr_bg);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("BLG|");
                            } else {
                                System.out.println("done extract vts BLOOD GLUCOSE");
                            }
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                    
                    //check whether spo2 data is null or empty
                    if (alVts.get(2).get(29) != null && !alVts.get(2).get(29).isEmpty() && !alVts.get(2).get(29).equals("-")) {
                        vts_Obj.setSPO2_Reading(alVts.get(2).get(29));
                    } else {
                        vts_Obj.setSPO2_Reading("x");
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
                        if(vts_Obj.getSPO2_Reading().equalsIgnoreCase("x")){
                            System.out.println("Skip extract vts SPO2");
                        }
                        else if (Float.parseFloat(vts_Obj.getSPO2_Reading()) >= 0) {
                            status_vts_lhr_spo2 = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_spo2);
                            if (status_vts_lhr_spo2 == false) {
                                total_fail_insert++;
                                System.out.println("false extract vts spo2");
                                System.out.println(query_vts_lhr_spo2);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("SPO2|");
                            } else {
                                System.out.println("done extract vts SPO2");
                            }
                        }
                        
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    //check whether temperature_reading data is null or empty
                    if (alVts.get(2).get(0) != null && !alVts.get(2).get(0).equals("-") && !alVts.get(2).get(0).isEmpty() /*&& alVts.get(2).get(0).matches("\\d+")*/) {
                        vts_Obj.setTemperature_Reading(alVts.get(2).get(0));
                    } else {
//                        vts_Obj.setTemperature_Reading("0");
                        vts_Obj.setTemperature_Reading("x");
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
                        if(vts_Obj.getTemperature_Reading().equalsIgnoreCase("x")){
                            System.out.println("Skip extract vts TEMPERATURE");
                        }
                        else if (Float.parseFloat(vts_Obj.getTemperature_Reading()) >= 0) {
                            status_vts_lhr_temperature = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_vts_lhr_temperature);
                            if (status_vts_lhr_temperature == false) {
                                total_fail_insert++;
                                System.out.println("false extract vts temperature");
                                System.out.println(query_vts_lhr_temperature);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("TEMP|");
                            } else {
                                System.out.println("done extract vts TEMPERATURE");
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
