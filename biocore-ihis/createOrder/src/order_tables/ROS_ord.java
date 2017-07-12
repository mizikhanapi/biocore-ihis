package order_tables;

import Bean.ROS;
import sequence_numbers.RIS_seq;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.ORC2;
import bean.ROS2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.orders_no;

public class ROS_ord {

    public void M_ROS(get_ehr_central_data t, Vector<ROS2> ros, Vector<ORC2> orc) {
             Date datenow = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_ris_order_master = true;
        boolean status_ris_order_detail = true;
        //import get_ehr_central_data class to get the records from ehr_central
        //get_ehr_central_data t = new get_ehr_central_data();
        //t.getQuery();
        
         
        //import LIO_seq class to get the order number and max order_no
//        LIO_seq lis = new LIO_seq();
//        lis.settLIO_seq();
         
       // lis.setMax_orderno();

        try {

            System.out.println("record (ORC for ROS) #" + t.getCentral_Code()); 

        //Vector<ORC2> orc = sv.getVorc();

                   for (int orc_i = 0; orc_i < orc.size(); orc_i++) {

                  ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                if (orcs.get(1).get(0).equals("T12102")) {
                        RIS_seq ris = new RIS_seq();
                        ris.getRIS_seq();
                      String sql_RIS = "INSERT INTO ris_order_master (PMI_NO, "
                              + "order_no, "
                              + "txn_type, "
                              + "HFC_CD, "
                              + "EPISODE_DATE, "
                              + "ENCOUNTER_DATE, "
                              + "order_date,"
                              + " order_by,"
                              + " order_from_discipline,"
                              + " order_from_subdiscipline,"
                              + " order_to_discipline,"
                              + " order_to_subdiscipline,"
                              + " hfc_from, "
                              + "hfc_to, "
                              + "order_status,"
                              + "diagnosis_cd, "
                              + "created_by,"
                              + " created_date,"
                              + " patient_name)"
                              + " values ('" + t.getPmi_no() + "',"
                              + "'" + ris.getRIS_orderno() + "',"
                              + "'" + orcs.get(1).get(0) + "',"
                              + "'" + orcs.get(12).get(0) + "',"
                              + "'" + orcs.get(7).get(0) + "',"
                              + "'" + orcs.get(8).get(0) + "',"
                              + "'" + orcs.get(6).get(0) + "',"
                              + "'" + orcs.get(9).get(0) + "',"
                              + "'" + orcs.get(13).get(0) + "',"
                              + "'" + orcs.get(14).get(0) + "',"
                              + "'" + orcs.get(27).get(0) + "',"
                              + "'" + orcs.get(28).get(0) + "',"
                              + "'" + orcs.get(12).get(0) + "',"
                              + "'" + orcs.get(26).get(0) + "',"
                              + "'0',"
                              + "'-',"
                              + "'" + orcs.get(9).get(0) + "',"
                              + "'" + orcs.get(7).get(0) + "',"
                              + "'" + orcs.get(9).get(0) + "')";
                        try {
                            
                             status_ris_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_RIS);
                             if (status_ris_order_master == true) {
                        System.out.println("-------------------------------------------");
                        System.out.println("record (ROS): #" + " " + t.getCentral_Code());
                        //Vector<ROS2> ros = sv.getVros();
                         for (int ros_i = 0; ros_i < ros.size(); ros_i++) {
                         ArrayList<ArrayList<String>> ross = ros.get(ros_i).getValue();

                            char pcd[] = ross.get(2).get(0).toCharArray();
                           String sql_ROS = "INSERT INTO ris_order_detail (order_no, modality_cd, body_system_cd, procedure_cd, EPISODE_DATE, ENCOUNTER_DATE, requestor_comments, order_status, verify_by, verify_date, created_by, created_date) values ('" + ris.getRIS_orderno() + "','"+pcd[2]+"','"+pcd[1]+"','"+ross.get(2).get(0)+"','" + orcs.get(7).get(0) + "','" + orcs.get(7).get(0) + "','"+ross.get(7).get(0)+"','tested','" + orcs.get(9).get(0) + "','" + orcs.get(7).get(0) + "','" + orcs.get(9).get(0) + "','" + orcs.get(7).get(0) + "')";
                           status_ris_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_ROS);

                                        if (status_ris_order_detail == true) {
                                            System.out.println("Done with ris MASTER and ris DETAIL");
                                        }
                                    } 

                            }else {
                                    System.out.println("False.");
                                }
                        } catch (Exception e) {
                            e.getStackTrace();
                        }
                    }
                }         

        } catch (Exception e) {

            e.getStackTrace();
        }


    }

}
