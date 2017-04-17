package lhr_tables;

import Bean.BLD;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_BLD {

    public void M_BLD() {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_bld_lhr_blood_group_g6pd = true;

        get_ehr_central_data t = new get_ehr_central_data();
        t.getQuery();

        System.out.println("record #" + " " + t.getCentral_Code());

        MainRetrieval mr = new MainRetrieval();
        mr.startProcess(t.getTxndata());

        // BLD
        String dataBLD[][] = mr.getData("BLD");
        int rowsBLD = mr.getRowNums();

        BLD bldB = new BLD(); //declare outside so can display data outside bracket
        if (rowsBLD > 0) {

            ArrayList<BLD> bldBr = new ArrayList<BLD>();
            for (int n = 0; n < rowsBLD; n++) {

                try {

                    System.out.println("BLD #" + (n + 1));
                    System.out.println("dataBLD[" + n + "][0]: " + dataBLD[n][0]);

                    bldB.setEpisode_date(dataBLD[n][0]);
                    bldB.setBlood_type(dataBLD[n][1]);
                    bldB.setRhesus_type(dataBLD[n][2]);
                    bldB.setG6PD_status(dataBLD[n][3]);
                    bldB.setG6PD_comment(dataBLD[n][4]);


                    String query_bld_lhr_bld = "insert into lhr_blood_type_g6pd (episode_date, "
                            + "bld_type, "
                            + "rhesus_type, "
                            + "bld_status, "
                            + "bld_comment, "
                            + "'" + bldB.getEpisode_date() + "',"
                            + "'" + bldB.getBlood_type() + "',"
                            + "'" + bldB.getRhesus_type() + "',"
                            + "'" + bldB.getG6PD_status() + "',"
                            + "'" + bldB.getG6PD_comment() + "',";
//                            System.out.println(bldB.getEpisode_date());
//                            System.out.println(bldB.getBlood_type());
//                            System.out.println(bldB.getRhesus_type());
                    status_bld_lhr_blood_group_g6pd = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_bld_lhr_bld);

                    System.out.println("status_bld_lhr_blood_group_g6pd:" + status_bld_lhr_blood_group_g6pd);

                   
                    if (status_bld_lhr_blood_group_g6pd == true) {
                        //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                        //System.out.println("Query for DGS: " + query2);
                        //total_fail_insert++;
                        System.out.println("Done.");
                    }else{
                          System.out.println("False.");
                    }

                    bldBr.add(bldB);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            update_ehr_central u = new update_ehr_central();
            u.update_status();

        }

    }

}
