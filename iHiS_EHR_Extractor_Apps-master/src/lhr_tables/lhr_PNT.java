package lhr_tables;

import Bean.PNT;
import Config_Pack.Config;
import Process.MainRetrieval;
import bean.PNT2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

public class lhr_PNT {
    
    public boolean M_PNT(Vector<PNT2> pnt2,get_ehr_central_data t){
        
         RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_pnt_lhr_progress_notes = true;

       

            try {

             
                int rowsPNT = pnt2.size();

                 //declare outside so can display data outside bracket
                if (rowsPNT > 0) {

                    ArrayList<PNT> pntBr = new ArrayList<PNT>();
                    for (int n = 0; n < rowsPNT; n++) {
                        PNT pntB = new PNT();
                        ArrayList<ArrayList<String>> alPnt = pnt2.get(n).getValue();
                        try {

      

                            
                            pntB.setEpisode_Date(alPnt.get(1).get(0));
                            pntB.setProgress_Notes(alPnt.get(2).get(0));

//                            // increase time 5 sec to prevent duplicate during insert.
//                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                            Date date_time = null;
//
//                            // if null insert current date time
//                            if (dataDGS[n][22] == null) {
//                                Calendar cal = Calendar.getInstance();
//                                dgsB.setEncounter_Date(df.format(cal.getTime()));
//                            } else { // insert random date time
//                                date_time = df.parse(dataDGS[n][22]);
//
//                                Calendar gc = new GregorianCalendar();
//                                gc.setTime(date_time);
//
//                                //create rand number by range http://stackoverflow.com/a/6029518/894470
//                                int min = 0;
//                                int max = 1000000000;
//                                Random r = new Random();
//                                int rand_num = r.nextInt(max - min + 1) + min;
//                                gc.add(Calendar.SECOND, rand_num);
//                                Date d2 = gc.getTime();
//
//                                dgsB.setEncounter_Date(df.format(d2));
//                            }
//                            //
                            // encounter date must get from ecss client.
                            
                            
                            String query_pnt_lhr_pnt = "insert into lhr_progress_notes (episode_date, "
                                    + "progress_notes) "
                                    + "values ('" + pntB.getEpisode_Date() + "',"
                                    + "'" + pntB.getProgress_Notes() + "');";
                            
                            status_pnt_lhr_progress_notes = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_pnt_lhr_pnt);


                            ////System.out.println("stat:" + stat);
                            ////System.out.println("query:" + query2);
                            if (status_pnt_lhr_progress_notes == false) {
                                //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for PNT: " + query_pnt_lhr_pnt);
                                total_fail_insert++;
                                System.out.println("false extract PNT");
                            }else{
                                System.out.println("done extract PNT");
                            }

                            pntBr.add(pntB);

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
