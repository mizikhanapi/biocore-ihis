package lhr_tables;

import Bean.ERRCOUNT;
import Bean.HPI;
import Bean.MSH;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.HPI2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_HPI {

    public void M_HPI(Vector<HPI2> hpi2,get_ehr_central_data t,MSH msh) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_hpi_lhr_health_of_present_illness = true;

        int rowsHPI = hpi2.size();

         //declare outside so can display data outside bracket
        if (rowsHPI > 0) {

            ArrayList<HPI> hpiBr = new ArrayList<HPI>();
            for (int n = 0; n < rowsHPI; n++) {
                HPI hpiB = new HPI();
                ArrayList<ArrayList<String>> alHpi= hpi2.get(n).getValue();
                try {

                    hpiB.setPMI_no(t.getPmi_no());
                    hpiB.setEpisode_date(alHpi.get(1).get(0));
                    hpiB.setNotes(alHpi.get(2).get(0));
                    hpiB.setEncounter_Date(alHpi.get(2).get(1));
                    hpiB.setHfc_cd(alHpi.get(2).get(2));
                    hpiB.setDoctor_ID(alHpi.get(2).get(3));
                    hpiB.setDoctor_Name(alHpi.get(2).get(4));

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
                    
                    String query2 = "insert into lhr_health_of_present_illness (PMI_no, "
                            + "hfc_cd, "
                            + "episode_date, "
                            + "encounter_date, "
                            + "details, "
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
                            + "values ('" + hpiB.getPMI_no() + "',"
                            + "'" + hpiB.getHfc_cd() + "',"
                            + "'" + hpiB.getEpisode_date() + "',"
                            + "'" + hpiB.getEncounter_Date() + "',"
                            + "'" + hpiB.getNotes() + "',"
                            + "'" + hpiB.getDoctor_ID() + "',"
                            + "'" + hpiB.getDoctor_Name() + "',"
                            + "'" + a + "',"
                            + "'" + c + "',"
                            + "'" + b + "',"
                            + "'" + d + "',"
                            + "'"+msh.getSendingFacilityDis()+"',"
                            + "'"+msh.getSendingFacilitySubDis()+"',"
                            + "'"+hpiB.getDoctor_ID()+"',"
                            + "'"+msh.getDateTime()+"')";
                    
                    status_hpi_lhr_health_of_present_illness = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query2);
                    if (status_hpi_lhr_health_of_present_illness == false) {
                        total_fail_insert++;
                        System.out.println("false extract hpi");
                        System.out.println(query2);
                        ERRCOUNT.plusOne();
                        ERRCOUNT.msgErr("HPI|");
                    }else{
                        System.out.println("done extract hpi");
                    }

                    hpiBr.add(hpiB);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }

    }
}
