package lhr_tables;

import Bean.BLD;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.BLD2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import java.util.Vector;
import main.RMIConnector;

public class lhr_BLD {

    public void M_BLD(Vector<BLD2> bld2,get_ehr_central_data t) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_bld_lhr_blood_group_g6pd = true;

        int rowsBLD = bld2.size();

         //declare outside so can display data outside bracket
        if (rowsBLD > 0) {

            ArrayList<BLD> bldBr = new ArrayList<BLD>();
            for (int n = 0; n < rowsBLD; n++) {
                BLD bldB = new BLD();
                ArrayList<ArrayList<String>> alBld = bld2.get(n).getValue();
                try {

                   

                    bldB.setEpisode_date(alBld.get(1).get(0));
                    bldB.setBlood_type(alBld.get(2).get(0));
                    bldB.setRhesus_type(alBld.get(2).get(2));
                    //bldB.setG6PD_status(alBld.get(2).get(3));
                    bldB.setG6PD_comment(alBld.get(2).get(3));


                    String query_bld_lhr_bld = "insert into lhr_blood_type_g6pd (episode_date, "
                            + "bld_type, "
                            + "rhesus_type, "
                            //+ "bld_status, "
                            + "bld_comment) values( "
                            + "'" + bldB.getEpisode_date() + "',"
                            + "'" + bldB.getBlood_type() + "',"
                            + "'" + bldB.getRhesus_type() + "',"
                            //+ "'" + bldB.getG6PD_status() + "',"
                            + "'" + bldB.getG6PD_comment() + "');";
//                            System.out.println(bldB.getEpisode_date());
//                            System.out.println(bldB.getBlood_type());
//                            System.out.println(bldB.getRhesus_type());
                    status_bld_lhr_blood_group_g6pd = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_bld_lhr_bld);

                   

                   
                    if (status_bld_lhr_blood_group_g6pd == true) {
                        //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                        //System.out.println("Query for DGS: " + query2);
                        //total_fail_insert++;
                        System.out.println("Done extract BLD");
                    }else{
                          System.out.println("False extract BLD");
                           //System.out.println("BLD query:" + query_bld_lhr_bld);
                    }

                    bldBr.add(bldB);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }


        }

    }

}
