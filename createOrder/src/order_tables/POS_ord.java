package order_tables;

import Bean.MSH;
import Bean.POS;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.ORC2;
import bean.POS2;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.All_Seq_no;
import sequence_numbers.POS_seq;
import sequence_numbers.orders_no;

public class POS_ord {

    boolean update_ehr_central_boolean = false;
    String Centre_Code = "";
    String Central_Code = "";
    String sql_pos_master = "";
    String sql_pos_detail = "";

    public void M_POS(get_ehr_central_data t, Vector<POS2> pos1, Vector<ORC2> orc,MSH msh) {

        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_pos_order_master = true;
        boolean status_pos_order_detail = true;
        for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
            All_Seq_no allSeq = new All_Seq_no();
            
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

            ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
            if (orcs.get(1).get(0).equals("T12114")) {
                DateFormat dateFormat4 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                Date date4 = new Date();
                allSeq.genSeq(msh.getSendingFacilityCode(), msh.getSendingFacilityDis(), msh.getSendingFacilitySubDis(), "POS");
                sql_pos_master = "INSERT INTO pos_order_master ("
                        + "pmi_no,"
                        + " order_no,"
                        + " txn_type,"
                        + " HFC_CD,"
                        + " order_date,"
                        + " order_by, "
                        + "order_priority, "
                        + "episode_date, "
                        + "ENCOUNTER_DATE, "
                        + "comment,"
                        + " created_by, "
                        + "created_date,"
                        + " order_from_dicipline,"
                        + " order_to_dicipline,"
                        + " order_from_subdicipline, "
                        + "order_to_subdicipline,"
                        + " hfc_from,"
                        + " hfc_to, "
                        + "doctor_id, "
                        + "national_id_no, "
                        + "person_id_no, "
                        + "person_status, "
                        + "centre_code,"
                        + "order_status,"
                        + "billing_status,"
                        + "txn_date) "
                        + "values ('" + t.getPmi_no() + "',"
                        + "'" + allSeq.getSeq() + "',"
                        + "'" + orcs.get(1).get(0) + "',"
                        + "'" + orcs.get(12).get(0) + "',"
                        + "'" + orcs.get(6).get(0) + "',"
                        + "'" + orcs.get(9).get(0) + "',"
                        + "'" + orcs.get(5).get(0) + "',"
                        + "'" + orcs.get(7).get(0) + "',"
                        + "'" + orcs.get(8).get(0) + "',"
                        + "'" + orcs.get(39).get(0) + "',"
                        + "'" + orcs.get(9).get(0) + "',"
                        + "now(),"
                        + "'" + orcs.get(13).get(0) + "',"
                        + "'" + orcs.get(27).get(0) + "',"
                        + "'" + orcs.get(14).get(0) + "',"
                        + "'" + orcs.get(28).get(0) + "',"
                        + "'" + orcs.get(12).get(0) + "',"
                        + "'" + orcs.get(26).get(0) + "',"
                        + "'" + orcs.get(9).get(0) + "',"
                        + "'" + a + "',"
                        + "'" + b + "',"
                        + "'" + c + "',"
                        + "'" + d + "',"
                        + "'0',"
                        + "'0',"
                        + "'" + orcs.get(7).get(0) + "')";
                try {
                    status_pos_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_master);
                    if (status_pos_order_master) {
                        System.out.println("-------------------------------------------");
                        System.out.println("record (POS): #" + " " + t.getCentral_Code());
                        for (int pos_i = 0; pos_i < pos1.size(); pos_i++) {
                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                            Date date = new Date();
                            ArrayList<ArrayList<String>> poss = pos1.get(pos_i).getValue();
                            sql_pos_detail = "INSERT INTO pos_order_detail ("
                                    + "order_no,"
                                    + " PMI_NO,"
                                    + " HFC_CD,"
                                    + " HFC_NAME,"
                                    + " EPISODE_DATE,"
                                    + " ENCOUNTER_DATE,"
                                    + " PROCEDURE_CD, "
                                    + "PROCEDURE_NAME,"
                                    //+ " PROCEDURE_OUTCOME,"
                                    + " COMMENT, "
                                    + "DOCTOR_ID, "
                                    + "NATIONAL_ID_NO,"
                                    + " PERSON_ID_NO,"
                                    + " PERSON_STATUS, "
                                    + "CENTRE_CODE,"
                                    + "txn_date)"
                                    + " values ('" + allSeq.getSeq() + "',"
                                    + "'" + t.getPmi_no() + "',"
                                    + "'" + poss.get(9).get(0) + "',"
                                    + "'" + poss.get(10).get(0) + "',"
                                    + "'" + orcs.get(7).get(0) + "',"
                                    + "'" + orcs.get(8).get(0) + "',"
                                    + "'" + poss.get(2).get(0) + "',"
                                    + "'" + poss.get(2).get(1) + "',"
                                    //+ "'" + poss.get(2).get(3) + "',"
                                    + "'" + poss.get(11).get(0) + "',"
                                    + "'" + orcs.get(9).get(0) + "',"
                                    + "'" + a + "',"
                                    + "'" + c + "',"
                                    + "'" + b + "',"
                                    + "'" + d + "',"
                                    + "'" + orcs.get(7).get(0) + "')";

                            status_pos_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_detail);
                            if (status_pos_order_detail) {
                                System.out.println("Done with pos MASTER and pos DETAIL");
                            } else {
                                System.out.println("false insert pos details");
                                System.out.println(sql_pos_detail);
                            }
                        }

                    } else {
                        System.out.println("False pos.");
                        System.out.println(sql_pos_master);
                        System.out.println(sql_pos_detail);
                    }
                } catch (Exception e) {
                    e.getStackTrace();
                }

            } else if (orcs.get(1).get(0).equals("T12103")) {
                allSeq.genSeq(msh.getSendingFacilityCode(), msh.getSendingFacilityDis(), msh.getSendingFacilitySubDis(), "OPT");
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                Date date = new Date();
                sql_pos_master = "INSERT INTO opt_order_master ("
                        + "pmi_no,"
                        + " order_no,"
                        + " HFC_CD,"
                        + " order_by, "
                        + "episode_date, "
                        + "ENCOUNTER_DATE, "
                        + " discipline_from,"
                        + " discipline_to,"
                        + " subdiscipline_from, "
                        + "subdiscipline_to,"
                        + " hfc_from,"
                        + " hfc_to, "
                        + "order_status,"
                        + "billing_status,"
                        + "diagnosis_cd,"
                        + "txn_date) "
                        + "values ('" + t.getPmi_no() + "',"
                        + "'" + allSeq.getSeq() + "',"
                        + "'" + orcs.get(12).get(0) + "',"
                        + "'" + orcs.get(9).get(0) + "',"
                        + "'" + orcs.get(7).get(0) + "',"
                        + "'" + orcs.get(8).get(0) + "',"
                        + "'" + orcs.get(13).get(0) + "',"
                        + "'" + orcs.get(27).get(0) + "',"
                        + "'" + orcs.get(14).get(0) + "',"
                        + "'" + orcs.get(28).get(0) + "',"
                        + "'" + orcs.get(12).get(0) + "',"
                        + "'" + orcs.get(26).get(0) + "',"
                        + "'0',"
                        + "'0',"
                        + "'-',"
                        + "'" + orcs.get(7).get(0) + "')";
                try {
                    status_pos_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_master);
                    if (status_pos_order_master) {
                        System.out.println("-------------------------------------------");
                        System.out.println("record (POS OPT): #" + " " + t.getCentral_Code());
                        for (int pos_i = 0; pos_i < pos1.size(); pos_i++) {
                            DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                            Date date2 = new Date();
                            ArrayList<ArrayList<String>> poss = pos1.get(pos_i).getValue();
                            sql_pos_detail = "INSERT INTO opt_order_detail ("
                                    + "order_no,"
                                    + "category_cd,"
                                    + "procedure_cd,"
                                    + "episode_date,"
                                    + "encounter_date,"
                                    + "consultant_id,"
                                    + "ot_room_no,"
                                    + "startDateTime,"
                                    + "endDateTime,"
                                    + "comments,"
                                    + "order_status,"
                                    + "txn_date) values ("
                                    + "'" + allSeq.getSeq() + "',"
                                    + "'" + poss.get(2).get(0) + "',"
                                    + "'" + poss.get(2).get(3) + "',"
                                    + "'" + orcs.get(7).get(0) + "',"
                                    + "'" + orcs.get(8).get(0) + "',"
                                    + "'" + poss.get(13).get(0) + "',"
                                    + "'" + poss.get(14).get(0) + "',"
                                    + "'" + poss.get(3).get(0) + " " + poss.get(3).get(1).trim() + ":00',"
                                    + "'" + poss.get(3).get(2) + " " + poss.get(3).get(3).trim() + ":00',"
                                    + "'" + poss.get(11).get(0) + "',"
                                    + "'0',"
                                    + "'" + orcs.get(7).get(0) + "')";

                            status_pos_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_detail);
                            if (status_pos_order_detail) {
                                System.out.println("Done with pos(OPT) MASTER and pos(OPT) DETAIL");
                            } else {
                                System.out.println("false insert pos(OPT) details");
                                System.out.println(sql_pos_detail);
                            }
                        }

                    } else {
                        System.out.println("False pos.");
                    }
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }
        }
    }

}
