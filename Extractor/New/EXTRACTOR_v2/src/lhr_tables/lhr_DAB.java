package lhr_tables;

import Bean.DAB;
import Bean.ERRCOUNT;
import Bean.MSH;
import Config_Pack.Config;
import bean.DAB2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

public class lhr_DAB {

    public void M_DAB(Vector<DAB2> dab2,get_ehr_central_data t,MSH msh) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_dab_lhr_disability = true;

        try {
           
            int rowsDAB = dab2.size();

             //declare outside so can display data outside bracket
            if (rowsDAB > 0) {

                ArrayList<DAB> dabBr = new ArrayList<DAB>();
                for (int n = 0; n < rowsDAB; n++) {
                    DAB dabB = new DAB();
                    ArrayList<ArrayList<String>> alDab = dab2.get(n).getValue();
                    try {

                        
                        dabB.setEpisode_date(alDab.get(1).get(0));
                        dabB.setDAB_code(alDab.get(2).get(0));
                        dabB.setDAB_type(alDab.get(2).get(1));
                        
                        String DabDateRaw = alDab.get(2).get(2);
                        String[] spliteDABDate = DabDateRaw.split("-");
                        String newDabDate = spliteDABDate[2]+"-"+spliteDABDate[1]+"-"+spliteDABDate[0];
                        dabB.setDAB_date(newDabDate);
                        
                        dabB.setDAB_comment(alDab.get(2).get(3));
                        
                        if(alDab.get(2).get(4).equals("-")){
                            dabB.setIcd10_cd(alDab.get(2).get(0));
                        }else{
                            dabB.setIcd10_cd(alDab.get(2).get(4));
                        }
                        
                        if(alDab.get(2).get(5).equals("-")){
                            dabB.setIcd10_desc(alDab.get(2).get(1));
                        }else{
                            dabB.setIcd10_desc(alDab.get(2).get(5));
                        }
                        // encounter date must get from ecss client.
                        String query_dab_lhr_dab = "insert into lhr_disability ("
                                + "pmi_no,"
                                + "hfc_cd,"
                                + "episode_date, "
                                + "DAB_type, "
                                + "DAB_code, "
                                + "DAB_date, "
                                + "DAB_comment, "
                                + "icd10_code, "
                                + "icd10_description,"
                                + "encounter_date,"
                                + "discipline_cd,"
                                + "subdiscipline_cd,"
                                + "created_by,"
                                + "created_date) "
                                + "values ('"+t.getPmi_no()+"','"+msh.getSendingFacilityCode()+"','" + dabB.getEpisode_date() + "',"
                                + "'" + dabB.getDAB_type() + "',"
                                + "'" + dabB.getDAB_code() + "',"
                                + "'" + dabB.getDAB_date() + "',"
                                + "'" + dabB.getDAB_comment() + "',"
                                + "'" + dabB.getIcd10_cd() + "',"
                                + "'" + dabB.getIcd10_desc() + "',"
                                + "'"+alDab.get(2).get(6)+"',"
                                + "'"+msh.getSendingFacilityDis()+"',"
                                + "'"+msh.getSendingFacilitySubDis()+"',"
                                + "'"+alDab.get(2).get(7)+"',"
                                + "'"+msh.getDateTime()+"');";

                        status_dab_lhr_disability = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_dab_lhr_dab);

                        if (status_dab_lhr_disability == false) {
                            System.out.println("Query for DAB: " + query_dab_lhr_dab);
                            total_fail_insert++;
                            System.out.println("False extract DAB");
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("DAB|");
                        }else{
                            System.out.println("Done extract DAB");
                        }

                        dabBr.add(dabB);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
