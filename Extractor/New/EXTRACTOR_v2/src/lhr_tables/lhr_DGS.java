package lhr_tables;

import Bean.DGS;
import Bean.ERRCOUNT;
import Bean.MSH;
import Config_Pack.Config;
import bean.DGS2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;

public class lhr_DGS {

    public void M_DGS(Vector<DGS2> dgs2, get_ehr_central_data t, MSH msh) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_dgs_lhr_diagnosis = true;

        try {

            int rowsDGS = dgs2.size();

            //declare outside so can display data outside bracket
            if (rowsDGS > 0) {

                ArrayList<DGS> dgsBr = new ArrayList<DGS>();
                for (int n = 0; n < rowsDGS; n++) {
                    DGS dgsB = new DGS();

                    try {
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
                        ArrayList<ArrayList<String>> alDgs = dgs2.get(n).getValue();

                        dgsB.setPMI_no(t.getPmi_no());
                        dgsB.setEpisode_Date(alDgs.get(1).get(0));

                        dgsB.setDiagnosis_Type(alDgs.get(2).get(0));
                        dgsB.setDiagnosis_Type_Desc(alDgs.get(2).get(1));
                        dgsB.setDiagnosis_Status(alDgs.get(2).get(2));
                        if (alDgs.get(2).get(3).isEmpty() || alDgs.get(2).get(3).equalsIgnoreCase("-") || alDgs.get(2).get(3).equalsIgnoreCase(" ")) {
                            dgsB.setDiagnosis_Date(null);
                        } else {
                            dgsB.setDiagnosis_Date("'" + alDgs.get(2).get(3) + "'");
                        }
                        dgsB.setRead_Code(alDgs.get(2).get(4));
                        dgsB.setRead_Description(alDgs.get(2).get(5));
                        dgsB.setDiagnosis_Cd(alDgs.get(2).get(6));
                        dgsB.setDiagnosis_Desc(alDgs.get(2).get(7));
                        dgsB.setSeverity_Cd(alDgs.get(2).get(8));
                        dgsB.setSeverity_Desc(alDgs.get(2).get(9));
                        dgsB.setSite_Cd(alDgs.get(2).get(10));
                        dgsB.setSite_Desc(alDgs.get(2).get(11));
                        dgsB.setEpisodicity_Cd(alDgs.get(2).get(12));
                        dgsB.setEpisodicity_Desc(alDgs.get(2).get(13));
                        dgsB.setLaterality_Cd(alDgs.get(2).get(14));
                        dgsB.setLaterality_Desc(alDgs.get(2).get(15));
                        dgsB.setCausative_Cd(alDgs.get(2).get(16));
                        dgsB.setCausative_Desc(alDgs.get(2).get(17));
                        dgsB.setComment(alDgs.get(2).get(18));
                        if (alDgs.get(2).get(19).isEmpty() || alDgs.get(2).get(19).equalsIgnoreCase("-") || alDgs.get(2).get(19).equalsIgnoreCase(" ")) {
                            dgsB.setTxn_Date(null);
                        } else {
                            dgsB.setTxn_Date("'" + alDgs.get(2).get(19) + "'");
                        }

                        dgsB.setStatus(alDgs.get(2).get(20));

                        // encounter date must get from ecss client.
                        if (alDgs.get(2).get(21).isEmpty() || alDgs.get(2).get(21).equalsIgnoreCase("-") || alDgs.get(2).get(21).equalsIgnoreCase(" ")) {
                            dgsB.setEncounter_Date(null);
                        } else {
                            dgsB.setEncounter_Date("'" + alDgs.get(2).get(21) + "'");
                        }

                        dgsB.setHFC(alDgs.get(2).get(22));
                        dgsB.setDoctor_ID(alDgs.get(2).get(23));
                        dgsB.setDoctor_Name(alDgs.get(2).get(24));
                        dgsB.setTerm_Type(alDgs.get(2).get(25));
                        dgsB.setICD10_Code(alDgs.get(2).get(6)); //Modified By Ahmed (13/3/2017)
                        dgsB.setICD10_Desc(alDgs.get(2).get(7)); //Modified By Ahmed (13/3/2017)

                        String query2 = "insert into lhr_diagnosis (PMI_no, "
                                + "hfc_cd, "
                                + "episode_date, "
                                + "encounter_date, "
                                + "diagnosis_cd, "
                                + "term_type, "
                                + "diagnosis_status, "
                                + "diagnosis_date, "
                                + "icd10_cd, "
                                + "icd10_description, "
                                + "term_cd, "
                                + "term_description, "
                                + "severity, "
                                + "site, "
                                + "comment, "
                                + "status, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "NATIONAL_ID_NO, "
                                + "PERSON_ID_NO, "
                                + "PERSON_STATUS, "
                                + "centre_code,"
                                + "txnDate,"
                                + "discipline_cd,"
                                + "subdiscipline_cd,"
                                + "created_by,"
                                + "created_date)"
                                + "values ('" + dgsB.getPMI_no() + "',"
                                + "'" + dgsB.getHFC() + "',"
                                + "'" + dgsB.getEpisode_Date() + "',"
                                + "" + dgsB.getEncounter_Date() + ","
                                + "'" + dgsB.getDiagnosis_Cd() + "',"
                                + "'" + dgsB.getTerm_Type() + "',"
                                + "'" + dgsB.getDiagnosis_Status() + "',"
                                + "" + dgsB.getDiagnosis_Date() + ","
                                + "'" + dgsB.getDiagnosis_Cd() + "',"
                                + "'" + dgsB.getDiagnosis_Desc() + "',"
                                + "'ICD10'," //temp
                                + "'ICD10'," //temp
                                + "'" + dgsB.getSeverity_Desc() + "',"
                                + "'" + dgsB.getSite_Desc() + "',"
                                + "'" + dgsB.getComment() + "',"
                                + "'0',"
                                + "'" + dgsB.getDoctor_ID() + "',"
                                + "'" + dgsB.getDoctor_Name() + "',"
                                + "'" + a + "',"
                                + "'" + c + "',"
                                + "'" + b + "',"
                                + "'" + d + "',"
                                + "'" + t.getTxndate() + "',"
                                + "'"+msh.getSendingFacilityDis()+"',"
                                + "'"+msh.getSendingFacilitySubDis()+"',"
                                + "'"+dgsB.getDoctor_ID()+"',"
                                + "'"+msh.getDateTime()+"')";
                        status_dgs_lhr_diagnosis = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query2);
                        if (status_dgs_lhr_diagnosis == true) {
                            System.out.println("Done extract DGS");
                        } else {
                            System.out.println("False extract DGS");
                            System.out.println(query2);
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("DGS|");
                        }
                        dgsBr.add(dgsB);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
