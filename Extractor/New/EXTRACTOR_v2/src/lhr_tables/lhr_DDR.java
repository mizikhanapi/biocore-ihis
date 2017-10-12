/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lhr_tables;

import Bean.DDR;
import Bean.ERRCOUNT;
import Bean.MSH;
import Config_Pack.Config;
import bean.DDR2;
import bean.ORC2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

/**
 *
 * @author shay
 */
public class lhr_DDR {

    public boolean M_DDR(Vector<DDR2> ddr, get_ehr_central_data t, MSH msh, Vector<ORC2> orc) {
        boolean status_lhr_ddr = false;
        RMIConnector rmic = new RMIConnector();
        try {
            for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
                ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                int rowDDR = ddr.size();
                if (rowDDR > 0) {
                    ArrayList<DDR> ddrBeanss = new ArrayList<DDR>();
                    for (int i = 0; i < rowDDR; i++) {
                        try {
                            ArrayList<ArrayList<String>> alDdr = ddr.get(i).getValue();
                            DDR ddrbean = new DDR();
                            ddrbean.setPMI_no(t.getPmi_no());
                            ddrbean.setEncounter_Date(alDdr.get(14).get(0));
                            ddrbean.setHFC_Cd(msh.getSendingFacilityCode());

                            ddrbean.setReqDrugCod(alDdr.get(1).get(0));
                            ddrbean.setReqDruoDesc(alDdr.get(1).get(1));
                            ddrbean.setCodingStandardReqDrug(alDdr.get(1).get(2));

                            ddrbean.setDisDrugCod(alDdr.get(2).get(0));
                            ddrbean.setDisDrugDesc(alDdr.get(2).get(1));
                            ddrbean.setCodingStandardDisDrug(alDdr.get(2).get(2));

                            ddrbean.setActDrugStregth(alDdr.get(3).get(0));

                            ddrbean.setActDrugFormCod(alDdr.get(4).get(0));
                            ddrbean.setActDrugFormDesc(alDdr.get(4).get(1));
                            ddrbean.setCodingStandardDrugForm(alDdr.get(4).get(2));

                            ddrbean.setActDrugRouteMasterRefCode(alDdr.get(5).get(0));
                            ddrbean.setActDrugRouteDetailRefCode(alDdr.get(5).get(1));
                            ddrbean.setActDrugRouteDescription(alDdr.get(5).get(2));

                            ddrbean.setActDrugFreqCod(alDdr.get(6).get(0));
                            ddrbean.setActDrugFreqDesc(alDdr.get(6).get(1));
                            ddrbean.setCodingStandardActDrugFreq(alDdr.get(6).get(2));

                            ddrbean.setActDrugFreqUnit(alDdr.get(7).get(0));

                            ddrbean.setActDosage(alDdr.get(8).get(0));

                            ddrbean.setActUOMmasterRefCod(alDdr.get(9).get(0));
                            ddrbean.setActUOMDetailRefCod(alDdr.get(9).get(1));
                            ddrbean.setActOUMDescription(alDdr.get(9).get(2));

                            ddrbean.setActDuration(alDdr.get(10).get(0));

                            ddrbean.setActDispenseQuantity(alDdr.get(11).get(0));

                            ddrbean.setActDispenCounterCOde(alDdr.get(12).get(0));
                            ddrbean.setActDispenCounterDesc(alDdr.get(12).get(1));
                            ddrbean.setCodingStandardActDispenLocation(alDdr.get(12).get(2));

                            ddrbean.setDispenNotes(alDdr.get(13).get(0));

                            ddrbean.setDispenDateTime(alDdr.get(14).get(0));

                            ddrbean.setDispenProviderCode(alDdr.get(15).get(0));
                            ddrbean.setDispenProviderName(alDdr.get(15).get(1));
                            ddrbean.setCodingStandardDispenProvider(alDdr.get(15).get(2));

                            ddrbean.setEpisode_Date(orcs.get(7).get(0));

                            ddrbean.setTransactionIndicator(alDdr.get(17).get(0));

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

                            String query_lhr_medication = "insert into lhr_medication("
                                    + "pmi_no,"
                                    + "hfc_cd,"
                                    + "episode_date,"
                                    + "encounter_date,"
                                    + "drug_cd,"
                                    + "drug_name,"
                                    + "product_name,"
                                    + "drug_form,"
                                    + "drug_form_desc,"
                                    + "drug_route_code,"
                                    + "drug_route_desc,"
                                    + "drug_freq_code,"
                                    + "drug_freq_desc,"
                                    + "drug_freq_unit,"
                                    + "drug_dosage,"
                                    + "drug_strength,"
                                    + "drug_uom,"
                                    + "duration,"
                                    + "quantity,"
                                    + "doctor_id,"
                                    + "doctor_name,"
                                    + "national_id_no,"
                                    + "person_id_no,"
                                    + "person_status,"
                                    + "centre_code,"
                                    + "discipline_cd,"
                                    + "subdiscipline_cd,"
                                    + "created_by,"
                                    + "created_date) values('"
                                    + ddrbean.getPMI_no() + "','"
                                    + ddrbean.getHFC_Cd() + "','"
                                    + ddrbean.getEpisode_Date() + "','"
                                    + ddrbean.getEncounter_Date() + "','"
                                    + ddrbean.getDisDrugCod() + "','"
                                    + ddrbean.getDisDrugDesc() + "','"
                                    + ddrbean.getDisDrugDesc() + "','"
                                    + ddrbean.getActDrugFormCod() + "','"
                                    + ddrbean.getActDrugFormDesc() + "','"
                                    + ddrbean.getActDrugRouteDetailRefCode() + "','"
                                    + ddrbean.getActDrugRouteDescription() + "','"
                                    + ddrbean.getActDrugFreqCod() + "','"
                                    + ddrbean.getActDrugFreqDesc() + "','"
                                    + ddrbean.getActDrugFreqUnit() + "','"
                                    + ddrbean.getActDosage() + "','"
                                    + ddrbean.getActDrugStregth() + "','"
                                    + ddrbean.getActUOMDetailRefCod() + "','"
                                    + ddrbean.getActDuration() + "','"
                                    + ddrbean.getActDispenseQuantity() + "','"
                                    + ddrbean.getDoctor_Id() + "','"
                                    + ddrbean.getDoctor_Name() + "','"
                                    + a + "','"
                                    + c + "','"
                                    + b + "','"
                                    + d + "',"
                                    + "'" + msh.getSendingFacilityDis() + "',"
                                    + "'" + msh.getSendingFacilitySubDis() + "',"
                                    + "'" + ddrbean.getDoctor_Id() + "',"
                                    + "'" + msh.getDateTime() + "');";
                            status_lhr_ddr = rmic.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_medication);

                            if (status_lhr_ddr == false) {
                                System.out.println("false extracting ddr");
                                System.out.println(query_lhr_medication);
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("DDR|");
                            } else {
                                System.out.println("true extracting ddr");
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }
}
