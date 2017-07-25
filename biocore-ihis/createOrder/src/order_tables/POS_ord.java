package order_tables;

import Bean.POS;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.ORC2;
import bean.POS2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.POS_seq;
import sequence_numbers.orders_no;

public class POS_ord {

    Date datenow = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
    boolean update_ehr_central_boolean = false;
    String Centre_Code = "";
    String Central_Code = "";
    String sql_pos_master = "";
    String sql_pos_detail = "";

    public void M_POS(get_ehr_central_data t, Vector<POS2> pos1, Vector<ORC2> orc) {

        Date datenow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_pos_order_master = true;
        boolean status_pos_order_detail = true;

        try {
            System.out.println("record (ORC for POS) #" + t.getCentral_Code());

            for (int pos_i = 0; pos_i < pos1.size(); pos_i++) {
                ArrayList<ArrayList<String>> poss = pos1.get(pos_i).getValue();
                POS_seq pos = new POS_seq();
                pos.setPOS_seq();
                System.out.println("size column :" + poss.size());
                if (poss.size() == 13) {

                    for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
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
                            System.out.println("This is Normal procedure");

                            sql_pos_master = "INSERT INTO pos_order_master ("
                                    + "pmi_no,"
                                    + " order_no,"
                                    + " txn_type,"
                                    + " HFC_CD,"
                                    + " HFC_NAME,"
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
                                    + "biling_status) "
                                    + "values ('" + t.getPmi_no() + "',"
                                    + "'" + pos.getPOS_orderno() + "',"
                                    + "'" + orcs.get(1).get(0) + "',"
                                    + "'" + orcs.get(12).get(0) + "',"
                                    + "'" + poss.get(10).get(0) + "',"
                                    + "'" + orcs.get(6).get(0) + "',"
                                    + "'" + orcs.get(9).get(0) + "',"
                                    + "'" + poss.get(4).get(0) + "',"
                                    + "'" + orcs.get(7).get(0) + "',"
                                    + "'" + orcs.get(8).get(0) + "',"
                                    + "'" + poss.get(11).get(0) + "',"
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
                                    + "'0')";

                            // System.out.println(poss.get(2).get(1));
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
                                    + "CENTRE_CODE)"
                                    + " values ('" + pos.getPOS_orderno() + "',"
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
                                    + "'" + d + "')";

                        }

                    }
                } else if (poss.size() == 15) {

                    for (int orc_i = 0; orc_i < orc.size(); orc_i++) {
                        ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                        if (orcs.get(1).get(0).equals("T12103")) {
                            System.out.println("This is OT Procedure");
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
                                    + "diagnosis_cd) "
                                    + "values ('" + t.getPmi_no() + "',"
                                    + "'" + pos.getPOS_orderno() + "',"
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
                                    + "'" + poss.get(1).get(0) + "')";

                            try{
                                System.out.println("dah lalu sini :master");
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
                                    + "order_status) values ("
                                    + "'" + pos.getPOS_orderno() + "',"
                                    + "'" + poss.get(2).get(0) + "',"
                                    + "'" + poss.get(2).get(3) + "',"
                                    + "'" + orcs.get(7).get(0) + "',"
                                    + "'" + orcs.get(8).get(0) + "',"
                                    + "'" + poss.get(13).get(0) + "',"
                                    + "'" + poss.get(14).get(1) + "',"
                                    + "'" + poss.get(3).get(0) + " " + poss.get(3).get(1) + "',"
                                    + "'" + poss.get(3).get(2) + " " + poss.get(3).get(3) + "',"
                                    + "'" + poss.get(11).get(0) + "',"
                                    + "'0')";
                            }catch(Exception e){
                                System.out.println(e);
                            }
                            System.out.println("dah lalu sini detail");

                        }
                    }
                }

                try {
                    status_pos_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_master);
                    if (status_pos_order_master) {
                        System.out.println("-------------------------------------------");
                        System.out.println("record (POS OT): #" + " " + t.getCentral_Code());
                        status_pos_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_detail);
                        if (status_pos_order_detail) {
                            System.out.println("Done with pos(OT) MASTER and pos(OT) DETAIL");
                        } else {
                            System.out.println("false insert pos(OT) details");
                            System.out.println(sql_pos_detail);
                        }

                    } else {
                        System.out.println("False pos(OT).");
                    }
                } catch (Exception e) {
                    e.getStackTrace();
                }

            }

        } catch (Exception e) {

            e.getStackTrace();
        }
    }
}
