/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lhr_tables;

import Bean.ERRCOUNT;
import Bean.MSH;
import Bean.RRS;
import Config_Pack.Config;
import bean.ORC2;

import bean.RRS2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

/**
 *
 * @author shay
 */
public class lhr_RRS {
    public boolean M_RRS(Vector<RRS2> rrs, get_ehr_central_data t,Vector<ORC2> orc,MSH msh) {
        boolean status_lhr_ddr = false;
        RMIConnector rmic = new RMIConnector();
        try {
            int rowDDR = rrs.size();
            if (rowDDR > 0) {
                ArrayList<RRS> rrsBeans = new ArrayList<RRS>();
                for (int i = 0; i < rowDDR; i++) {
                    try {
                        RRS rrsbean = new RRS();
                        ArrayList<ArrayList<String>> orcs = orc.get(i).getValue();
                        if (orcs.get(1).get(0).equals("T12202")) {
                            rrsbean.setEpisode_Date(orcs.get(7).get(0));
                            rrsbean.setEncounter_Date(orcs.get(8).get(0));
                            rrsbean.setHFC_Cd(orcs.get(12).get(0));
                        }
                        
                        
                        ArrayList<ArrayList<String>> alRrr = rrs.get(i).getValue();
                        
                        rrsbean.setPMI_no(t.getPmi_no());
                        rrsbean.setInvestigationTestCode(alRrr.get(1).get(0));
                        rrsbean.setInvestigationTestName(alRrr.get(1).get(1));
                        rrsbean.setCodingStandardInvestigation(alRrr.get(1).get(2));
                        
                        rrsbean.setImagingReportCode(alRrr.get(2).get(0));
                        rrsbean.setImagingReportName(alRrr.get(2).get(1));
                        rrsbean.setCodingStandardImaging(alRrr.get(2).get(2));
                        
                        rrsbean.setPerformById(alRrr.get(3).get(0));
                        rrsbean.setPerformByName(alRrr.get(3).get(1));
                        rrsbean.setCodingStandardPerformBy(alRrr.get(3).get(2));
                        
                        rrsbean.setPerformDateTime(alRrr.get(4).get(0));
                        
                        rrsbean.setReportProvideById(alRrr.get(5).get(0));
                        rrsbean.setReportProvideByName(alRrr.get(5).get(1));
                        rrsbean.setCodingStandardReportProvide(alRrr.get(5).get(2));
                        
                        rrsbean.setReportProvideDateTime(alRrr.get(6).get(0));
                        
                        rrsbean.setReportNotes(alRrr.get(7).get(0));
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

                        String query_lhr_radiology_result = "insert into lhr_radiology_result("
                                + "pmi_no,"
                                + "hfc_cd,"
                                + "episode_date,"
                                + "encounter_date,"
                                + "investigation_cd,"
                                + "investigation_name,"
                                + "image_report_cd,"
                                + "image_report_name,"
                                + "perform_by_id,"
                                + "perform_name,"
                                + "perform_date_time,"
                                + "provide_by_id,"
                                + "provide_by_name,"
                                + "report_date_time,"
                                + "report_notes,"
                                + "national_id_no,"
                                + "person_id_no,"
                                + "person_status,"
                                + "centre_code,"
                                + "discipline_cd,"
                                + "subdiscipline_cd,"
                                + "created_by,"
                                + "created_date) values('"
                                + rrsbean.getPMI_no() + "','"
                                + rrsbean.getHFC_Cd() + "','"
                                + rrsbean.getEpisode_Date() + "','"
                                + rrsbean.getEncounter_Date() + "','"
                                + rrsbean.getInvestigationTestCode()+ "','"
                                + rrsbean.getInvestigationTestName()+ "','"
                                + rrsbean.getImagingReportCode()+ "','"
                                + rrsbean.getImagingReportName()+ "','"
                                + rrsbean.getPerformById()+ "','"
                                + rrsbean.getPerformByName()+ "','"
                                + rrsbean.getPerformDateTime() + "','"
                                + rrsbean.getReportProvideById()+ "','"
                                + rrsbean.getReportProvideByName()+ "','"
                                + rrsbean.getReportProvideDateTime()+ "','"
                                + rrsbean.getReportNotes()+ "','"
                                + a + "','"
                                + c + "','"
                                + b + "','"
                                + d + "',"
                                + "'"+msh.getSendingFacilityDis()+"',"
                                + "'"+msh.getSendingFacilitySubDis()+"',"
                                + "'"+rrsbean.getDoctor_Id()+"',"
                                + "'"+msh.getDateTime()+"');";
                        status_lhr_ddr = rmic.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_radiology_result);

                        if (status_lhr_ddr == false) {
                            System.out.println("false extracting rrs");
                            System.out.println(query_lhr_radiology_result);
                            ERRCOUNT.plusOne();
                        } else {
                            System.out.println("true extracting rrs");
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
