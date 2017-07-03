package lhr_tables;

import Bean.DGS;
import Bean.ROS;
import Config_Pack.Config;
import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;

public class lhr_ROS {
    
    public boolean M_ROS(){
        DGS dgsB = new DGS();
        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_dto_lhr_medication = true;
        
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
                
                System.out.println("record #"+(j+1)+" "+Central_Code);
                
                String episode = data2.get(j).get(2);
                String txndata1 = data2.get(j).get(3);

                MainRetrieval mr = new MainRetrieval();
                mr.startProcess(txndata1);
                
                // DGS
                String dataDGS[][] = mr.getData("DGS");
                int rowsDGS = mr.getRowNums();
                
                //ROS
                String dataROS[][] = mr.getData("ROS");
                int rowsROS = mr.getRowNums();
                
                 if (rowsROS > 0) {

                    ArrayList<ROS> ros_ArrayList = new ArrayList<ROS>();
                    for (int ros_i = 0; ros_i < rowsROS; ros_i++) {

                        try {
                            
                            System.out.println("ros #"+(ros_i+1));
                            
                            ROS ros_Obj = new ROS();
                            ros_Obj.setPMI_No(PMI_no);
                            ros_Obj.setEpisode_Date(dataROS[ros_i][0]);
                            ros_Obj.setProblem_Code(dataROS[ros_i][1]);
                            ros_Obj.setProblem_Name(dataDGS[ros_i][2]);
                            ros_Obj.setProblem_Coding_Standard(dataROS[ros_i][3]);
                            ros_Obj.setInvestigation_Test_Code(dataDGS[ros_i][4]);
                            ros_Obj.setInvestigation_Test_Name(dataROS[ros_i][5]);
                            ros_Obj.setInvestigation_Test_Coding_Standard(dataROS[ros_i][6]);
                            ros_Obj.setImaging_Appointment_Date_Time(dataROS[ros_i][7]);
                            ros_Obj.setDeliver_To_Location_Code(dataROS[ros_i][8]);
                            ros_Obj.setDeliver_To_Location_Name(dataROS[ros_i][9]);
                            ros_Obj.setDeliver_To_Location_Coding_Standard(dataROS[ros_i][10]);
                            ros_Obj.setPriority_038(dataROS[ros_i][11]);
                            ros_Obj.setPriority_Detail_Reference_Code(dataROS[ros_i][12]);
                            ros_Obj.setPriority_Description(dataROS[ros_i][13]);
                            ros_Obj.setPatient_Condition_096(dataROS[ros_i][14]);
                            ros_Obj.setPatient_Condition_Detail_Reference_Code(dataROS[ros_i][15]);
                            ros_Obj.setPatient_Condition_Description(dataROS[ros_i][16]);
                            ros_Obj.setRequestor_Notes(dataROS[ros_i][17]);
                            ros_Obj.setReference_Provider_Code(dataROS[ros_i][18]);
                            ros_Obj.setReference_Provider_Name(dataROS[ros_i][19]);
                            ros_Obj.setDiscipline_Code(dataROS[ros_i][20]);
                            ros_Obj.setDiscipline_Name(dataROS[ros_i][21]);
                            ros_Obj.setSubdiscipline_Code(dataROS[ros_i][22]);
                            ros_Obj.setSubdiscipline_Name(dataROS[ros_i][23]);

                            String query_ros_lhr_fh = "insert into lhr_test (PMI_no, "
                                    //    + "hfc_cd, "
                                    + "episode_date, "
                                    //    + "encounter_date, "                                    
                                    + "test_cd, " //insert icd10 code
                                    + "test_name, " //insert icd10 code                                    
                                    + "test_date, "
                                    + "test_result, "
                                    + "order_by, "
                                    //    + "perform_by, "
                                    //    + "report_by, "                                                                                                        
                                    + "NATIONAL_ID_NO, "
                                    + "PERSON_ID_NO, "
                                    + "PERSON_STATUS, "
                                    + "centre_code )"
                                    + "values ('" + ros_Obj.getPMI_No() + "',"
                                    //    + "'" + ros_Obj.getHFC() + "',"
                                    + "'" + ros_Obj.getEpisode_Date() + "',"
                                    //    + "'" + ros_Obj.getEncounter_Date() + "',"
                                    + "'" + ros_Obj.getInvestigation_Test_Code() + "',"// diagnosis_cd
                                    + "'" + ros_Obj.getInvestigation_Test_Name() + "',"
                                    + "'" + ros_Obj.getImaging_Appointment_Date_Time() + "',"
                                    + "'" + ros_Obj.getRequestor_Notes() + "',"
                                    + "'" + ros_Obj.getReference_Provider_Name() + "',"
                                    //        + "'" + ros_Obj.getReference_Provider_Name()+ "'," 
                                    //        + "'" + ros_Obj.getReference_Provider_Name()+ "'," 
                                    + "'" + NATIONAL_ID_NO + "',"
                                    + "'" + PERSON_ID_NO + "',"
                                    + "'" + PERSON_STATUS + "',"
                                    + "'" + Centre_Code + "')";

                    //boolean status_ros_lhr_fh = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_ros_lhr_fh);
                            ////System.out.println("status ros : " + status_ros_lhr_fh);
                            ////System.out.println("query ros : " + query_ros_lhr_fh);
                            ros_ArrayList.add(ros_Obj);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }

                } //ROS end

            }catch(Exception e){
                  e.printStackTrace();
            }
        }
        return true;
    }
}
