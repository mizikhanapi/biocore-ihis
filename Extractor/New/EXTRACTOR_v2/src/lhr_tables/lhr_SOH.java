package lhr_tables;

import Bean.ERRCOUNT;
import Bean.MSH;
import Bean.SOH;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.SOH2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_SOH {
    
    public boolean M_SOH(Vector<SOH2> soh2,get_ehr_central_data t,MSH msh){
        
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_hpi_lhr_health_of_present_illness = true;


            try {

                
                int rowsSOH = soh2.size();

                 //declare outside so can display data outside bracket
                if (rowsSOH > 0) {

                    ArrayList<SOH> sohBr = new ArrayList<SOH>();
                    for (int n = 0; n < rowsSOH; n++) {
                        SOH sohB = new SOH();
                        ArrayList<ArrayList<String>> alSoh = soh2.get(n).getValue();
                        try {

 

                            sohB.setPMI_no(t.getPmi_no());
                            sohB.setEpisode_date(alSoh.get(1).get(0));
                            sohB.setSOH_code(alSoh.get(2).get(0));
                            sohB.setSOH_name(alSoh.get(2).get(1));
                            
                            String DateRaw = alSoh.get(2).get(7);
                            String[] splitedDate = DateRaw.split("-");
                            String newDate = splitedDate[2]+"-"+splitedDate[1]+"-"+splitedDate[0];
                            
                            sohB.setSOH_date(newDate);
                            sohB.setSOH_comment(alSoh.get(2).get(11));
                            sohB.setEncounter_Date(alSoh.get(2).get(14));
                            sohB.setHfc_cd(alSoh.get(2).get(15));
                            sohB.setDoctor_ID(alSoh.get(2).get(16));
                            sohB.setDoctor_Name(alSoh.get(2).get(17));
                            
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
                            String query_soh_lhr_soh = "insert into lhr_social_history (PMI_no, "
                                    + "hfc_cd, "
                                    + "episode_date, "
                                    + "encounter_date, "
                                    + "soh_name, "
                                    + "soh_code, "
                                    + "soh_date, "
                                    + "soh_comment, "
                                    + "doctor_id, "
                                    + "doctor_name, "
                                    + "NATIONAL_ID_NO, "
                                    + "PERSON_ID_NO, "
                                    + "PERSON_STATUS, "
                                    + "center_code,"
                                    + "discipline_cd,"
                                    + "subdiscipline_cd,"
                                    + "created_by,"
                                    + "created_date)"
                                    + "values ('" + sohB.getPMI_no() + "',"
                                    + "'" + sohB.getHfc_cd() + "',"
                                    + "'" + sohB.getEpisode_date() + "',"
                                    + "'" + sohB.getEncounter_Date() + "',"
                                    + "'" + sohB.getSOH_name() + "',"
                                    + "'" + sohB.getSOH_code() + "',"
                                    + "'" + sohB.getSOH_date() + "',"
                                    + "'" + sohB.getSOH_comment() + "',"
                                    + "'" + sohB.getDoctor_ID() + "',"
                                    + "'" + sohB.getDoctor_Name() + "',"
                                    + "'" + a + "',"
                                    + "'" + c + "',"
                                    + "'" + b + "',"
                                    + "'" + d + "',"
                                    + "'"+msh.getSendingFacilityDis()+"',"
                                    + "'"+msh.getSendingFacilitySubDis()+"',"
                                    + "'"+sohB.getDoctor_ID()+"',"
                                    + "'"+msh.getDateTime()+"')";

                            status_hpi_lhr_health_of_present_illness = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_soh_lhr_soh);

                            if (status_hpi_lhr_health_of_present_illness == false) {
                                System.out.println("Query for SOH: " + query_soh_lhr_soh);
                                total_fail_insert++;
                                System.out.println("false extract SOH");
                                ERRCOUNT.plusOne();
                                ERRCOUNT.msgErr("SOH|");
                            }else{
                                System.out.println("done extract SOH");
                            }


                            sohBr.add(sohB);

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
