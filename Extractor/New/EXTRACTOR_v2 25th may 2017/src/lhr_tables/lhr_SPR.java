/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lhr_tables;

import Bean.SPR;
import Config_Pack.Config;
import bean.SPR2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

/**
 *
 * @author shay
 */
public class lhr_SPR {

    public boolean M_SPR(Vector<SPR2> rrs, get_ehr_central_data t) {
        boolean status_lhr_spr = false;
        RMIConnector rmic = new RMIConnector();
        try {
            int rowDDR = rrs.size();
            if (rowDDR > 0) {
                ArrayList<SPR> rrsBeans = new ArrayList<SPR>();
                for (int i = 0; i < rowDDR; i++) {
                    try {
                        ArrayList<ArrayList<String>> alSpr = rrs.get(i).getValue();
                        SPR sprbean = new SPR();
                        sprbean.setPMI_no(t.getPmi_no());
                        sprbean.setProcedurecd(alSpr.get(1).get(0));
                        sprbean.setProcedureDesc(alSpr.get(1).get(1));
                        sprbean.setNameOfCodingSystem(alSpr.get(1).get(2));

                        sprbean.setActualProcedureTimeDate(alSpr.get(2).get(0));

                        sprbean.setActualProcedureMinutes(alSpr.get(3).get(0));

                        sprbean.setAssocDiagnosisCD(alSpr.get(4).get(0));

                        sprbean.setActualSurgeonId(alSpr.get(5).get(0));

                        sprbean.setActualSurgeonName(alSpr.get(6).get(0));

                        sprbean.setActualLocationCode(alSpr.get(7).get(0));

                        sprbean.setActualLocationName(alSpr.get(8).get(0));

                        sprbean.setSurgeonNotes(alSpr.get(9).get(0));

                        sprbean.setReceivingHFCcd(alSpr.get(10).get(0));

                        String query_lhr_procedure = "insert into lhr_procedure("
                                + "pmi_no,"
                                + "hfc_cd,"
                                + "episode_date,"
                                + "encounter_date,"
                                + "procedure_cd,"
                                + "procedure_name,"
                                //+ "procedure_outcome,"
                                + "comment,"
                                + "doctor_id,"
                                + "doctor_name,"
                                + "national_id_no,"
                                + "person_id_no,"
                                + "person_status,"
                                + "centre_code) values('"
                                + sprbean.getPMI_no() + "','"
                                + sprbean.getHFC_Cd() + "','"
                                + sprbean.getEpisode_Date() + "','"
                                + sprbean.getEncounter_Date() + "','"
                                + sprbean.getProcedurecd() + "','"
                                + sprbean.getProcedureDesc() + "','"
                                //+ sprbean.get() + "','"
                                + sprbean.getSurgeonNotes() + "','"
                                + sprbean.getActualSurgeonId() + "','"
                                + sprbean.getActualSurgeonName() + "','"
                                + t.getNational_id_no() + "','"
                                + t.getPERSON_ID_NO() + "','"
                                + t.getPERSON_STATUS() + "','"
                                + t.getCentre_Code() + "');";
                        status_lhr_spr = rmic.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_procedure);

                        if (status_lhr_spr == false) {
                            System.out.println("false extracting spr");
                        } else {
                            System.out.println("true extracting spr");
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }
}
