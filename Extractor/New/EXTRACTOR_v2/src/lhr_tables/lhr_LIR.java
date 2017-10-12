package lhr_tables;

import Bean.ERRCOUNT;
import Bean.LIR;
import Bean.MSH;
import Config_Pack.Config;
import bean.LIR2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

public class lhr_LIR {

    public boolean M_LIR(Vector<LIR2> lir, get_ehr_central_data t, MSH msh) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_lhr_test = false;

        try {
            //LIR 
            int rowsLIR = lir.size();

            if (rowsLIR > 0) {

                ArrayList<LIR> lirBeans = new ArrayList<LIR>();
                for (int k = 0; k < rowsLIR; k++) {
                    try {
                        ArrayList<ArrayList<String>> alLir = lir.get(k).getValue();

                        LIR lirBean = new LIR();
                        lirBean.setPMI_No(t.getPmi_no());
                        lirBean.setEpisode_Date(alLir.get(10).get(0));
                        lirBean.setLab_Test_Item_Code(alLir.get(1).get(0));
                        lirBean.setLab_Test_Item_Lab_Test_Item_Name(alLir.get(1).get(1));
                        lirBean.setTest_Date(alLir.get(4).get(0));

                        lirBean.setLab_Test_Result_Code(alLir.get(2).get(0));
                        lirBean.setLab_Test_Result_Name(alLir.get(2).get(1));
                        lirBean.setTest_Perform_By_ID(alLir.get(3).get(0));
                        lirBean.setTest_Perform_By_Name(alLir.get(3).get(1));
                        lirBean.setResult_Provided_By_ID(alLir.get(5).get(0));
                        lirBean.setResult_Provided_By_Name(alLir.get(5).get(1));
                        lirBean.setResult_Date(alLir.get(6).get(0));
                        lirBean.setVerify_By_ID(alLir.get(7).get(0));
                        lirBean.setVerify_By_Name(alLir.get(7).get(1));
                        lirBean.setVerify_Date(alLir.get(8).get(0));
                        lirBean.setVerification_Notes(alLir.get(9).get(0));
                        String a, b, c, d;
                        a = t.getNational_id_no();
                        b = t.getPERSON_STATUS();
                        c = t.getPERSON_ID_NO();
                        d = t.getCentre_Code();

                        if (a == null || a.isEmpty() || a.equals(" ")) {
                            a = "PUBLIC HOSPITAL";
                        }

                        if (b == null || b.isEmpty() || b.equals(" ")) {
                            b = "PUBLIC HOSPITAL";
                        }

                        if (c == null || c.isEmpty() || c.equals(" ")) {
                            c = "PUBLIC HOSPITAL";
                        }

                        if (d == null || d.isEmpty() || d.equals(" ")) {
                            d = "PUBLIC HOSPITAL";
                        }

                        lirBean.setEncounter_Date(alLir.get(4).get(0));

                        String query_lhr_test = "insert into lhr_test (pmi_no, "
                                + "hfc_cd,"
                                + "episode_Date, "
                                + "encounter_date, "
                                + "test_cd, "
                                + "test_name, "
                                + "test_date,  "
                                + "test_result,  "
                                + "perform_by,  "
                                + "report_by,  "
                                + "NATIONAL_ID_NO, "
                                + "PERSON_ID_NO, "
                                + "PERSON_STATUS,"
                                + "Centre_Code,"
                                + "discipline_cd,"
                                + "subdiscipline_cd,"
                                + "created_by,"
                                + "created_date)"
                                + "values ('" + lirBean.getPMI_No() + "',"
                                + "'" + msh.getSendingFacilityCode() + "',"
                                + "'" + lirBean.getEpisode_Date() + "',"
                                + "'" + lirBean.getEncounter_Date() + "',"
                                + "'" + lirBean.getLab_Test_Item_Code() + "',"
                                + "'" + lirBean.getLab_Test_Item_Lab_Test_Item_Name() + "',"
                                + "'" + lirBean.getTest_Date() + "',"
                                + "'" + lirBean.getLab_Test_Result_Name() + "',"
                                + "'" + lirBean.getTest_Perform_By_ID()+ "',"
                                + "'" + lirBean.getResult_Provided_By_ID()+ "',"
                                + "'" + a + "',"
                                + "'" + c + "',"
                                + "'" + b + "',"
                                + "'" + d + "',"
                                + "'" + msh.getSendingFacilityDis() + "',"
                                + "'" + msh.getSendingFacilitySubDis() + "',"
                                + "'" + lirBean.getResult_Provided_By_ID() + "',"
                                + "'" + msh.getDateTime() + "')";

                        status_lhr_test = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_lhr_test);
                        if (status_lhr_test == false) {
                            total_fail_insert++;
                            System.out.println("false extract lir");
                            System.out.println(query_lhr_test);
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("LIR|");
                        } else {
                            System.out.println("done extract lir");
                        }

                        lirBeans.add(lirBean);
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
