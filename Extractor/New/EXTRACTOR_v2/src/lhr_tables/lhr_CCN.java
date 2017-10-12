package lhr_tables;

import Bean.CCN;
import Bean.ERRCOUNT;
import Bean.MSH;
import Bean.PDI;
import Config_Pack.Config;
import bean.CCN2;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.Vector;
import main.RMIConnector;
import separatorv2.SeparatorV2;

public class lhr_CCN {

    public void M_CCN(Vector<CCN2> ccn2, get_ehr_central_data t,MSH msh,PDI pdi) {

        RMIConnector rc = new RMIConnector();

        int total_fail_insert = 0; //total of failed insert

        boolean status_ccn_lhr_signs = true;

        try {

            int rowsCCN = ccn2.size();

            if (rowsCCN > 0) {
                ArrayList<CCN> ccnBeans = new ArrayList<CCN>();
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

                for (int k = 0; k < rowsCCN; k++) {
                    CCN ccnBean = new CCN();
                    ArrayList<ArrayList<String>> alCcn = ccn2.get(k).getValue();
                    try {

                        //System.out.println("ccn #" + (k + 1));

                        ccnBean.setEpisode_date(alCcn.get(1).get(0));
                        ccnBean.setPMI_no(t.getPmi_no());

//                            // change time to prevent duplicate during insert. http://stackoverflow.com/a/759056/894470
                        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


                        ccnBean.setEncounter_Date(alCcn.get(2).get(14));
                        ccnBean.setHfc_cd(alCcn.get(2).get(15));
                        ccnBean.setTxnDate(alCcn.get(2).get(12));

                        // check if array data is null. if null insert current date time
                        if (alCcn.get(2).get(12).equalsIgnoreCase("-") || alCcn.get(2).get(12).isEmpty() || alCcn.get(2).get(12).equalsIgnoreCase(" ")) {
                            Calendar cal = Calendar.getInstance();
                            ccnBean.setTxnDate(t.getTxndate());
                        }
                        //

                        ccnBean.setSymptom_Code(alCcn.get(2).get(0));
                        ccnBean.setSymptom_Name(alCcn.get(2).get(1));

                        if (alCcn.get(2).get(18).equals(" ") || alCcn.get(2).get(18).equals("-")) {
                            ccnBean.setTerm_Type("CTV3");
                        } else {
                            ccnBean.setTerm_Type(alCcn.get(2).get(18));
                        }

                        ccnBean.setSeverity_Desc(alCcn.get(2).get(3));
                        ccnBean.setComment(alCcn.get(2).get(11));
                        ccnBean.setStatus("0");
                        ccnBean.setDoctor_ID(alCcn.get(2).get(16));
                        ccnBean.setDoctor_Name(alCcn.get(2).get(17));

                        String query1 = "insert into lhr_signs (PMI_no, "
                                + "hfc_cd,"
                                + "episode_date, "
                                + "encounter_date, "
                                + "txn_date, "
                                + "symptom_cd, "
                                + "symptom_name,  "
                                + "term_type,  "
                                + "severity_desc,  "
                                + "comment,  "
                                + "status,  "
                                + "doctor_iD,  "
                                + "doctor_name,  "
                                + "national_id_no, "
                                + "person_id_no, "
                                + "person_status, "
                                + "centre_code,"
                                + "discipline_cd,"
                                + "subdiscipline_cd,"
                                + "created_by,"
                                + "created_date)"
                                + "values ('" + ccnBean.getPMI_no() + "',"
                                + "'" + ccnBean.getHfc_cd() + "',"
                                + "'" + ccnBean.getEpisode_date() + "',"
                                + "'" + ccnBean.getEncounter_Date() + "',"
                                + "'" + ccnBean.getTxnDate() + "',"
                                + "'" + ccnBean.getSymptom_Code() + "',"
                                + "'" + ccnBean.getSymptom_Name() + "',"
                                + "'" + ccnBean.getTerm_Type() + "',"
                                + "'" + ccnBean.getSeverity_Desc() + "',"
                                + "'" + ccnBean.getComment() + "',"
                                + "'" + ccnBean.getStatus() + "',"
                                + "'" + ccnBean.getDoctor_ID() + "',"
                                + "'" + ccnBean.getDoctor_Name() + "',"
                                + "'" + a + "',"
                                + "'" + b + "',"
                                + "'" + c + "',"
                                + "'" + d + "',"
                                + "'"+msh.getSendingFacilityDis()+"',"
                                + "'"+msh.getSendingFacilitySubDis()+"',"
                                + "'"+ ccnBean.getDoctor_ID()+"',"
                                + "'"+msh.getDateTime()+"')";

                        status_ccn_lhr_signs = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query1);
                        ////System.out.println("query CCN: " + query1);
                        ////System.out.println("status CCN " + status);
                        if (status_ccn_lhr_signs == true) {
                            //System.out.println("Failed to insert data into lhr_signs (CCN) where PMI No : " + PMI_no + " & National ID No : " + NATIONAL_ID_NO + " & Person ID No : " + PERSON_ID_NO);   
                            //System.out.println("Query for CCN: " + query1);
                            //total_fail_insert++;
                            System.out.println("Done extract ccn");
                        } else {
                            System.out.println("False extract ccn");
                            System.out.println("query ccn: "+query1);
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("CCN|");
                        }

                        ccnBeans.add(ccnBean);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

//                update_ehr_central u = new update_ehr_central();
//                u.update_status();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
