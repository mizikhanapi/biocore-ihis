package lhr_tables;

import Bean.ERRCOUNT;
import Bean.IMU;
import Bean.MSH;
import Config_Pack.Config;
import bean.IMU2;
import java.util.ArrayList;
import java.util.Vector;
import main.RMIConnector;

public class lhr_IMU {

    public boolean M_IMU(Vector<IMU2> imu2, get_ehr_central_data t,MSH msh) {

        RMIConnector rc = new RMIConnector();
        int total_fail_insert = 0; //total of failed insert
        //set default value to true. When insertion failed var will switch to false and patient will noy update to 3
        boolean status_imu_lhr_immunisation = true;

        try {

            int rowsIMU = imu2.size();

            //declare outside so can display data outside bracket
            if (rowsIMU > 0) {

                ArrayList<IMU> imuBr = new ArrayList<IMU>();
                for (int n = 0; n < rowsIMU; n++) {
                    IMU imuB = new IMU();
                    ArrayList<ArrayList<String>> alImu = imu2.get(n).getValue();
                    try {

                        imuB.setPMI_no(t.getPmi_no());
                        imuB.setEpisode_date(alImu.get(1).get(0));
                        imuB.setimmunization_cd(alImu.get(2).get(0));

                        String DateRaw = alImu.get(2).get(2);
                        String[] splitedDate = DateRaw.split("-");
                        String newDate = splitedDate[2] + "-" + splitedDate[1] + "-" + splitedDate[0];

                        imuB.setOnset_date(newDate);
                        imuB.setComment(alImu.get(2).get(3));
                        imuB.setStatus(alImu.get(2).get(7));
                        imuB.setEncounter_Date(alImu.get(2).get(8));
                        imuB.setHfc_cd(alImu.get(2).get(9));
                        imuB.setDoctor_ID(alImu.get(2).get(10));
                        imuB.setDoctor_Name(alImu.get(2).get(11));
                        imuB.setTerm_type(alImu.get(2).get(12));

                        
                        if (alImu.get(2).get(13).equals("-")) {
                            imuB.setIcd10_cd(alImu.get(2).get(0));
                        } else {
                            imuB.setIcd10_cd(alImu.get(2).get(13));
                        }

                        if (alImu.get(2).get(14).equals("-")) {
                            imuB.setIcd10_description(alImu.get(2).get(1));

                        } else {
                            imuB.setIcd10_description(alImu.get(2).get(14));

                        }
                        
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

                        // encounter date must get from ecss client.
                        String query_imu_lhr_imu = "insert into lhr_immunisation (PMI_no, "
                                + "hfc_cd, "
                                + "episode_date, "
                                + "encounter_date, "
                                + "immunisation_cd, " //insert icd10 code
                                + "onset_date, "
                                + "term_type, "
                                + "icd10_cd, "
                                + "icd10_description, "
                                + "term_cd, "
                                + "term_description, "
                                + "comment, "
                                + "status, "
                                + "doctor_id, "
                                + "doctor_name, "
                                + "NATIONAL_ID_NO, "
                                + "PERSON_ID_NO, "
                                + "PERSON_STATUS, "
                                + "centre_code,"
                                + "discipline_cd,"
                                + "subdiscipline_cd,"
                                + "created_by,"
                                + "created_date)"
                                + "values ('" + imuB.getPMI_no() + "',"
                                + "'" + imuB.getHfc_cd() + "',"
                                + "'" + imuB.getEpisode_date() + "',"
                                + "'" + imuB.getEncounter_Date() + "',"
                                + "'" + imuB.getimmunization_cd() + "',"
                                + "'"+msh.getDateTime()+"',"
                                + "'CTV3',"
                                + "'" + imuB.getIcd10_cd() + "',"
                                + "'" + imuB.getIcd10_description() + "',"
                                + "'CTV3',"
                                + "'CTV3',"
                                + "'" + imuB.getComment() + "',"
                                + "'0',"
                                + "'" + imuB.getDoctor_ID() + "',"
                                + "'" + imuB.getDoctor_Name() + "'," //temp
                                + "'" + a + "',"
                                + "'" + c + "',"
                                + "'" + b + "',"
                                + "'" + d + "',"
                                + "'"+msh.getSendingFacilityDis()+"',"
                                + "'"+msh.getSendingFacilitySubDis()+"',"
                                + "'"+imuB.getDoctor_ID()+"',"
                                + "'"+msh.getDateTime()+"')";

                        status_imu_lhr_immunisation = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, query_imu_lhr_imu);
                        if (status_imu_lhr_immunisation == false) {
                            System.out.println("false extract IMU");
                            System.out.println(query_imu_lhr_imu);
                            ERRCOUNT.plusOne();
                            ERRCOUNT.msgErr("IMU|");
                        } else {
                            System.out.println("done extract IMU");
                        }

                        imuBr.add(imuB);

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
