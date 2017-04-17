package lhr_tables;

import Bean.PNT;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.util.ArrayList;
import main.RMIConnector;

public class lhr_PNT {
    
    public boolean M_PNT(){
        
         RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_pnt_lhr_progress_notes = true;

        String sql2 = "SELECT "
                + "ec.central_code, " //0
                + "ec.pmi_no, " //1
                + "ec.c_txndate, " //2
                + "ec.c_txndata, " //3
                + "ec.status, " //4
                + "ssi.national_id_no," //5
                + "ssi.person_id_no," //6
                + "ssi.person_status," //7
                + "ssi.location_code " //8
                + "FROM ehr_central ec, pms_patient_biodata ppb "
                + "LEFT JOIN special_integration_information ssi "
                + "ON ppb.new_ic_no = ssi.national_id_no "
                + "WHERE ec.pmi_no = ppb.pmi_no "
                + "AND ec.status = 1"; // select undischarge patient (1)

        ArrayList<ArrayList<String>> data2 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql2);

        for (int j = 0; j < data2.size(); j++) { //Show records in arrayList taken from table ehr_central row

            try {

                String PMI_no = data2.get(j).get(1);
                String NATIONAL_ID_NO = data2.get(j).get(5);
                String PERSON_ID_NO = data2.get(j).get(6);
                String PERSON_STATUS = data2.get(j).get(7);
                String LOCATION_CODE = data2.get(j).get(8);
                String Centre_Code = data2.get(j).get(8);

                String Central_Code = data2.get(j).get(0);

                System.out.println("record #" + (j + 1) + " " + Central_Code);

                String episode = data2.get(j).get(2);
                String txndata1 = data2.get(j).get(3);

                MainRetrieval mr = new MainRetrieval();
                mr.startProcess(txndata1);

                // PNT
                String dataPNT[][] = mr.getData("PNT");
                int rowsPNT = mr.getRowNums();

                PNT pntB = new PNT(); //declare outside so can display data outside bracket
                if (rowsPNT > 0) {

                    ArrayList<PNT> pntBr = new ArrayList<PNT>();
                    for (int n = 0; n < rowsPNT; n++) {

                        try {

                            System.out.println("PNT #" + (n + 1));
                            System.out.println("dataPNT[" + n + "][0]: " + dataPNT[n][0]);

                            
                            pntB.setEpisode_Date(dataPNT[n][0]);
                            pntB.setProgress_Notes(dataPNT[n][1]);

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
                                    + "progress_notes, "
                                    + "values ('" + pntB.getEpisode_Date() + "',"
                                    + "'" + pntB.getProgress_Notes() + "',";
                            System.err.println(pntB.getEpisode_Date());
                            System.err.println(pntB.getProgress_Notes());
                            status_pnt_lhr_progress_notes = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_pnt_lhr_pnt);

                            System.out.println("status_pnt_lhr_progress_notes:" + status_pnt_lhr_progress_notes);

                            ////System.out.println("stat:" + stat);
                            ////System.out.println("query:" + query2);
                            if (status_pnt_lhr_progress_notes == false) {
                                //System.out.println("Failed to insert data into lhr_diagnosis (DGS) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                                //System.out.println("Query for DGS: " + query2);
                                total_fail_insert++;
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
        }
        return true;
    
    
    }
    
}
