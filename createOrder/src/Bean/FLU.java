/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;
import sequence_numbers.RIS_seq;
import Config_Pack.Config;
import java.text.SimpleDateFormat;
import java.util.Date;
import main.RMIConnector;

/**
 *
 * @author user
 */
public class FLU {
    
    public static void main(String[] a){
    RMIConnector rc = new RMIConnector();
    boolean status_lis_master_detail = true;
    Date datenow = new Date();
     SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
     RIS_seq ris = new RIS_seq();
     ris.getRIS_seq();
     try{
                                   String sql_pos_detail = "INSERT INTO lis_order_master (pmi_no, order_no, hfc_cd, episode_date, ENCOUNTER_DATE, order_date, order_by, order_from_discipline, order_from_subdiscipline, order_to_discipline, order_to_subdiscipline, hfc_from, hfc_to, order_status, diagnosis_cd, created_by, created_date, patient_name) values ('1252252256','LIS20170000000051','PPL','2017-04-26 11:26:22.0','2017-04-26 11:26:22.0','2017-4-26 15:8:52','dominic','dominic','PB','PB','02','02','02','05','0','-','dominic','2017-04-26 11:26:22.0','dominic')";                                        
//                                + "'" + "04010101" + "',"
//                                + "'" + sdf.format(datenow)  + "',"
//                                + "'" + sdf.format(datenow) + "'," //Modified By Ahmed (13/3/2017)
//                                + "'" + "19.2" + "',"
//                                + "'" + "Face Mask 5L" + "'," //diagnosis_cd
//                                + "'" + "No outcome" + "'," //Modified By Ahmed (13/3/2017)
//                                + "'" + "No comment" + "',"
//                                + "'" + "Ahmed_93" + "'," //Modified By Ahmed (13/3/2017)
//                                + "'" + "Ahmed Abdullah" + "',"
//                                + "'" + "02323873" + "',"
//                                + "'" + "B011110326" + "',"
//                                + "'" + "F" + "',"
//                                + "'" + "FTMK" + "',";       
//                        System.out.println("ORC #" + (orc_i + 1));
                           try {
                            status_lis_master_detail = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_pos_detail);    
                            if (status_lis_master_detail == true) {
                                System.out.println("Done.");
                            }
                            else{
                                   System.out.println("False.");
                            }
                        } catch (Exception e) {
                            System.out.println(e.getStackTrace());
                            
                            //JOptionPane.showMessageDialog(e.printStackTrace(), "");
                        }
    
    
    }catch(Exception e){
           System.out.println(e.getMessage());
}
    }
}
