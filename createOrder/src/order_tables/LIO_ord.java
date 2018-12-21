package order_tables;

import Bean.LIO;
import Bean.MSH;
import Bean.ROS;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.LIO2;
import bean.ORC2;
import bean.PDI2;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;
import sequence_numbers.All_Seq_no;
import sequence_numbers.LIO_seq;
import sequence_numbers.orders_no;

public class LIO_ord {

    public void M_LIO(Vector<ORC2> orc, Vector<LIO2> lio, get_ehr_central_data t,Vector<PDI2>pdi,MSH msh ) {

               DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

        boolean update_ehr_central_boolean = false;
        String Centre_Code = "";
        String Central_Code = "";

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lio_order_master = true;
        boolean status_lis_order_detail = true;
        //import get_ehr_central_data class to get the records from ehr_central
        //get_ehr_central_data t = new get_ehr_central_data();
        //t.getQuery();
        
         
        //import LIO_seq class to get the order number and max order_no
//        LIO_seq lis = new LIO_seq();
//        lis.settLIO_seq();
         
       // lis.setMax_orderno();

        try {

            System.out.println("record (ORC for LIO) #" + t.getCentral_Code()); 
        //Vector<ORC2> orc = sv.getVorc();

                   for (int orc_i = 0; orc_i < orc.size(); orc_i++) {

                  ArrayList<ArrayList<String>> orcs = orc.get(orc_i).getValue();
                  ArrayList<ArrayList<String>> pdis = pdi.get(0).getValue();
                if (orcs.get(1).get(0).equals("T12101")) {
                        All_Seq_no allSeq = new All_Seq_no();
                        allSeq.genSeq(msh.getSendingFacilityCode(), msh.getSendingFacilityDis(), msh.getSendingFacilitySubDis(), "LIS");
                        Date date = new Date();

                        String sql_lis_master = "INSERT INTO lis_order_master (pmi_no, "
                                + "order_no,"
                                + " txn_type,"
                                + " hfc_cd, "
                                + "episode_date,"
                                + " ENCOUNTER_DATE, "
                                + "order_date, "
                                + "order_by, "
                                + "order_from_discipline,"
                                + " order_from_subdiscipline,"
                                + " order_to_discipline,"
                                + " order_to_subdiscipline,"
                                + " hfc_from,"
                                + " hfc_to, "
                                + "order_status, "
                                + "diagnosis_cd,"
                                + " created_by, "
                                + "created_date,"
                                + " patient_name,"
                                + "txn_date)"
                                + " values ('" + t.getPmi_no() + "',"
                                + "'" + allSeq.getSeq() + "',"
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
                                + "now(),"
                                + "'" + pdis.get(2).get(0) + "',"
                                + "'" + orcs.get(7).get(0) + "')";
                        try {
                            status_lio_order_master = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_lis_master);
                            if (status_lio_order_master == true) {
                                System.out.println("-------------------------------------------");
                                System.out.println("record (LIO): #" + " " + t.getCentral_Code());
                                 //Vector<LIO2> lio = sv.getVlio();
                                for (int lio_i = 0; lio_i < lio.size(); lio_i++) {
                                ArrayList<ArrayList<String>> lios = lio.get(lio_i).getValue();
                                

                                //                              0     1         2          3           4            5     6             7    8          9      10        11         12                 13         14
                                 String selectTest = "SELECT item_cd,item_name,test_cat,spe_source,spe_container,volume,special_inst,status,buy_price,ser_price,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date FROM lis_item_detail WHERE item_cd='"+lios.get(2).get(0)+"' and hfc_cd='"+orcs.get(12).get(0)+"'"; 
                                try{
                                    ArrayList<ArrayList<String>> lis_item = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, selectTest);
                                    if(lis_item.size() > 0){
                                        for(int lis_item_i = 0;lis_item_i < lis_item.size();lis_item_i++){
                                            ArrayList<String> lisI = lis_item.get(lis_item_i);
                                            Date date2 = new Date();
                                            String sql_lis_detail = "INSERT INTO lis_order_detail ("
                                                 + "order_no, "
                                                 + "item_cd, "
                                                 + "episode_date,"
                                                 + " ENCOUNTER_DATE, "
                                                 + "requestor_comments,"
                                                 //+ " filler_comments, "
                                                 + "verify_by,"
                                                 + " verify_date, "
                                                 + "created_by,"
                                                 + " created_date,"
                                                 + " pmi_no,"
                                                 + " spe_source, "
                                                 + "item_name,"
                                                 + " volume,"
                                                 + " spe_container, "
                                                 + "comment, "
                                                 + "special_inst, "
                                                 + "order_date,"
                                                 + " specimen_status,"
                                                 + " verification,"
                                                 + " collectionDate,"
                                                    + "detail_status,"
                                                    + "txn_date)"
                                                 + " values ('" + allSeq.getSeq() + "',"
                                                 + "'" + lisI.get(0) + "',"
                                                 + "'" + orcs.get(7).get(0) + "',"
                                                 + "'" + orcs.get(8).get(0) + "',"
                                                 + "'" + lios.get(7).get(0) + "',"
                                                 //+ "'" + lios.get(4).get(1) + "',"
                                                 + "'" + orcs.get(10).get(0) + "',"
                                                 + "'" + orcs.get(6).get(0) + "',"
                                                 + "'" + orcs.get(9).get(0) + "',"
                                                 + "now(),"
                                                 + "'" + t.getPmi_no() + "',"
                                                 + "'"+lisI.get(3)+"',"
                                                 + "'" + lios.get(2).get(1) + "',"
                                                 + "'"+lisI.get(5)+"',"
                                                 + "'"+lisI.get(4)+"',"
                                                 + "'" + lios.get(5).get(2) + "',"
                                                 + "'"+lisI.get(6)+"',"
                                                 + "'" + orcs.get(6).get(0) + "',"
                                                 + "'"+lisI.get(7)+"',"
                                                 + "'Pending',"
                                                 + "'" + lios.get(3).get(0) + "',"
                                                    + "'0',"
                                                    + "'" + orcs.get(7).get(0) + "')";
                                        status_lis_order_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_lis_detail);

                                        if (status_lis_order_detail == true) {
                                            System.out.println("Done with lis MASTER and lis DETAIL");
                                        }
                                        }
                                        
                                    }
                                }catch(Exception e){}
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
