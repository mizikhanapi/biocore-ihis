package order_tables;

import Bean.MSH;
import Bean.PDI;
import Config_Pack.Config;
import bean.ADW2;
import bean.ORC2;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.ADW_seq;
import sequence_numbers.All_Seq_no;

public class ADW_ord {

    public void M_ADW(Vector<ORC2> orc, Vector<ADW2> adw1, get_ehr_central_data t,MSH msh) {

        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_adw_master = true;
        boolean status_adw_detail = true;
        //import get_ehr_central_data class to get the records from ehr_central
        //get_ehr_central_data t = new get_ehr_central_data();
        // t.getQuery();

        try {

            System.out.println("record (ORC for ADW) #" + t.getCentral_Code());

            for (int orc_i = 0; orc_i < orc.size(); orc_i++) {

                ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                if (orcs.get(1).get(0).equals("T12111")) {
                    All_Seq_no allSeq = new All_Seq_no();
                        allSeq.genSeq(msh.getSendingFacilityCode(), msh.getSendingFacilityDis(), msh.getSendingFacilitySubDis(), "ADW");
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                    Date date = new Date();
                    String sql_ADW = "INSERT INTO wis_order_master (pmi_no,"
                            + " order_no,"
                            + " txn_type,"
                            + " hfc_cd,"
                            + " episode_date, "
                            + "encounter_date,"
                            + " order_date,"
                            + " order_by,"
                            + " discipline_cd,"
                            + "subdiscipline_cd,"
                            + " ordering_hfc_cd,"
                            + " ordering_discipline_cd, "
                            + "ordering_subdiscipline_cd,"
                            + " order_status, "
                            + "diagnosis_cd, "
                            + "created_by,"
                            + " create_date,"
                            + "txn_date) values ("
                            + "'" + t.getPmi_no() + "',"
                            + "'" + allSeq.getSeq() + "',"
                            + "'" + orcs.get(1).get(0) + "',"
                            + "'" + orcs.get(12).get(0) + "',"
                            + "'" + orcs.get(7).get(0) + "',"
                            + "'" + orcs.get(8).get(0) + "',"
                            + "'" + orcs.get(6).get(0) + "',"
                            + "'" + orcs.get(9).get(0) + "',"
                            + "'" + orcs.get(13).get(0) + "',"
                            + "'" + orcs.get(14).get(0) + "',"
                            + "'" + orcs.get(12).get(0) + "',"
                            + "'" + orcs.get(13).get(0) + "',"
                            + "'" + orcs.get(14).get(0) + "',"
                            + "'0',"
                            + "'-',"
                            + "'" + orcs.get(9).get(0) + "',"
                            + "now(),"
                            + "'" + orcs.get(7).get(0) + "')";
                    try {
                        status_adw_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_ADW);
                        if (status_adw_master == true) {
                            System.out.println("-------------------------------------------");
                            System.out.println("record (ADW): #" + " " + t.getCentral_Code());
                            // Vector<ADW2> adw1 = sv.getVadw();

                            for (int adw_i = 0; adw_i < adw1.size(); adw_i++) {
                                ArrayList<ArrayList<String>> adws = adw1.get(adw_i).getValue();
                                DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                                Date date2 = new Date();
                                String sql_adw_det = "INSERT INTO wis_order_detail ("
                                        + "order_no,"
                                        //+ " item_cd, "
                                        + "episode_date,"
                                        + " encounter_date,"
                                        + " requestor_comments,"
                                        + " admission_reason,"
                                        + " order_by,"
                                        + " order_date,"
                                        + " ward_class_code,"
                                        + " ward_id,"
                                        //+ " bed_id,"
                                        + " order_status,"
                                        + " created_by,"
                                        + " created_date,"
                                        + "txn_date"
                                        + ") values ("
                                        + "'" + allSeq.getSeq() + "',"
                                        //+ "'-',"
                                        + "'" + adws.get(1).get(0) + "',"
                                        + "'" + orcs.get(8).get(0) + "',"
                                        + "'" + adws.get(2).get(7) + "',"
                                        + "'" + adws.get(2).get(8) + "',"
                                        + "'" + orcs.get(9).get(0) + "',"
                                        + "'" + orcs.get(6).get(0) + "',"
                                        + "'" + adws.get(2).get(5) + "',"
                                        + "'" + adws.get(2).get(4) + "',"
                                        //+ "'-',"
                                        + "'0',"
                                        + "'" + adws.get(2).get(14) + "',"
                                        + "now(),"
                                        + "'" + orcs.get(7).get(0) + "')";
                                status_adw_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_adw_det);
                                if (status_adw_detail == true) {
                                    System.out.println("Done with wis MASTER and wis DETAIL");
                                }
                            }

                        } else {
                            System.out.println("False.");
                        }
                    } catch (Exception e) {
                        e.getStackTrace();
                    }
                }else if (orcs.get(1).get(0).equals("T12115")) {
                    All_Seq_no allSeq = new All_Seq_no();
                    allSeq.genSeq(msh.getSendingFacilityCode(), msh.getSendingFacilityDis(), msh.getSendingFacilitySubDis(), "ADW");
                    String sql_ADWD = "INSERT INTO wis_order_master (pmi_no,"
                            + " order_no,"
                            + " txn_type,"
                            + " hfc_cd,"
                            + " episode_date, "
                            + "encounter_date,"
                            + " order_date,"
                            + " order_by,"
                            + " discipline_cd,"
                            + "subdiscipline_cd,"
                            + " ordering_hfc_cd,"
                            + " ordering_discipline_cd, "
                            + "ordering_subdiscipline_cd,"
                            + " order_status, "
                            + "diagnosis_cd, "
                            + "created_by,"
                            + " create_date,"
                            + "txn_date) values ("
                            + "'" + t.getPmi_no() + "',"
                            + "'" + allSeq.getSeq() + "',"
                            + "'" + orcs.get(1).get(0) + "',"
                            + "'" + orcs.get(12).get(0) + "',"
                            + "'" + orcs.get(7).get(0) + "',"
                            + "'" + orcs.get(8).get(0) + "',"
                            + "'" + orcs.get(6).get(0) + "',"
                            + "'" + orcs.get(9).get(0) + "',"
                            + "'" + orcs.get(13).get(0) + "',"
                            + "'" + orcs.get(14).get(0) + "',"
                            + "'" + orcs.get(12).get(0) + "',"
                            + "'" + orcs.get(13).get(0) + "',"
                            + "'" + orcs.get(14).get(0) + "',"
                            + "'0',"
                            + "'-',"
                            + "'" + orcs.get(9).get(0) + "',"
                            + "now(),"
                            + "'" + orcs.get(7).get(0) + "')";
                    try {
                        status_adw_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_ADWD);
                        if (status_adw_master == true) {
                            System.out.println("-------------------------------------------");
                            System.out.println("record (ADW): #" + " " + t.getCentral_Code());
                            System.out.println("Done with WIS MASTER");
                        }
                    }catch(Exception e){
                    }
                }
            }

        } catch (Exception e) {

            e.getStackTrace();
        }
    }

}
