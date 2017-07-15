/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package NIW_helper;

import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author Shammugam
 */
public class WoundAssessmentUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getWoundAssessment(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {

            //              0       1       2               3                   4                                   5                                          
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(date_dressing),'%r'),DATE_FORMAT(DATE(date_dressing),'%d/%m/%Y'), "
                    //                          6                                           7                                             8               9                 10                     
                    + " TIME_FORMAT(TIME(date_next_dressing_change),'%r'),DATE_FORMAT(DATE(date_next_dressing_change),'%d/%m/%Y'),wound_dimension,wound_dimension_1,wound_dimension_2, "
                    //      11              12          13        14            15                  16              17          18             19           20                  
                    + " exu_datelevel,exu_datecolor,wound_bed,wound_edges,surrounding_skin,clinical_infection,patient_pain,patient_pain_1,wound_progress,dressing_plan, "
                    //      21              22              23                      24                                              25                    
                    + " dressing_plan_1,dressing_plan_2,dressing_plan_3,TIME_FORMAT(TIME(date_dressing),'%T'),TIME_FORMAT(TIME(date_next_dressing_change),'%T') FROM lhr_ort_niw_wound_assessment "
                    + " where pmi_no ='" + pmino + "' and DATE(date_dressing) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3                   4                                   5                                          
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(date_dressing),'%r'),DATE_FORMAT(DATE(date_dressing),'%d/%m/%Y'), "
                    //                          6                                           7                                             8               9                 10                     
                    + " TIME_FORMAT(TIME(date_next_dressing_change),'%r'),DATE_FORMAT(DATE(date_next_dressing_change),'%d/%m/%Y'),wound_dimension,wound_dimension_1,wound_dimension_2, "
                    //      11              12          13        14            15                  16              17          18             19           20                  
                    + " exu_datelevel,exu_datecolor,wound_bed,wound_edges,surrounding_skin,clinical_infection,patient_pain,patient_pain_1,wound_progress,dressing_plan, "
                    //      21              22              23                      24                                              25                    
                    + " dressing_plan_1,dressing_plan_2,dressing_plan_3,TIME_FORMAT(TIME(date_dressing),'%T'),TIME_FORMAT(TIME(date_next_dressing_change),'%T') FROM lhr_ort_niw_wound_assessment "
                    + " where pmi_no ='" + pmino + "' and DATE(date_dressing) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3                   4                                   5                                          
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(date_dressing),'%r'),DATE_FORMAT(DATE(date_dressing),'%d/%m/%Y'), "
                    //                          6                                           7                                             8               9                 10                     
                    + " TIME_FORMAT(TIME(date_next_dressing_change),'%r'),DATE_FORMAT(DATE(date_next_dressing_change),'%d/%m/%Y'),wound_dimension,wound_dimension_1,wound_dimension_2, "
                    //      11              12          13        14            15                  16              17          18             19           20                  
                    + " exu_datelevel,exu_datecolor,wound_bed,wound_edges,surrounding_skin,clinical_infection,patient_pain,patient_pain_1,wound_progress,dressing_plan, "
                    //      21              22              23                      24                                              25                    
                    + " dressing_plan_1,dressing_plan_2,dressing_plan_3,TIME_FORMAT(TIME(date_dressing),'%T'),TIME_FORMAT(TIME(date_next_dressing_change),'%T') FROM lhr_ort_niw_wound_assessment "
                    + " where pmi_no ='" + pmino + "' and DATE(date_dressing) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3                   4                                   5                                          
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(date_dressing),'%r'),DATE_FORMAT(DATE(date_dressing),'%d/%m/%Y'), "
                    //                          6                                           7                                             8               9                 10                     
                    + " TIME_FORMAT(TIME(date_next_dressing_change),'%r'),DATE_FORMAT(DATE(date_next_dressing_change),'%d/%m/%Y'),wound_dimension,wound_dimension_1,wound_dimension_2, "
                    //      11              12          13        14            15                  16              17          18             19           20                  
                    + " exu_datelevel,exu_datecolor,wound_bed,wound_edges,surrounding_skin,clinical_infection,patient_pain,patient_pain_1,wound_progress,dressing_plan, "
                    //      21              22              23                      24                                              25                    
                    + " dressing_plan_1,dressing_plan_2,dressing_plan_3,TIME_FORMAT(TIME(date_dressing),'%T'),TIME_FORMAT(TIME(date_next_dressing_change),'%T') FROM lhr_ort_niw_wound_assessment "
                    + " where pmi_no ='" + pmino + "' and DATE(date_dressing) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3                   4                                   5                                          
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(date_dressing),'%r'),DATE_FORMAT(DATE(date_dressing),'%d/%m/%Y'), "
                    //                          6                                           7                                             8               9                 10                     
                    + " TIME_FORMAT(TIME(date_next_dressing_change),'%r'),DATE_FORMAT(DATE(date_next_dressing_change),'%d/%m/%Y'),wound_dimension,wound_dimension_1,wound_dimension_2, "
                    //      11              12          13        14            15                  16              17          18             19           20                  
                    + " exu_datelevel,exu_datecolor,wound_bed,wound_edges,surrounding_skin,clinical_infection,patient_pain,patient_pain_1,wound_progress,dressing_plan, "
                    //      21              22              23                      24                                              25                    
                    + " dressing_plan_1,dressing_plan_2,dressing_plan_3,TIME_FORMAT(TIME(date_dressing),'%T'),TIME_FORMAT(TIME(date_next_dressing_change),'%T') FROM lhr_ort_niw_wound_assessment "
                    + " where pmi_no ='" + pmino + "' and DATE(date_dressing) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //              0       1       2               3                   4                                   5                                          
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(date_dressing),'%r'),DATE_FORMAT(DATE(date_dressing),'%d/%m/%Y'), "
                    //                          6                                           7                                             8               9                 10                     
                    + " TIME_FORMAT(TIME(date_next_dressing_change),'%r'),DATE_FORMAT(DATE(date_next_dressing_change),'%d/%m/%Y'),wound_dimension,wound_dimension_1,wound_dimension_2, "
                    //      11              12          13        14            15                  16              17          18             19           20                  
                    + " exu_datelevel,exu_datecolor,wound_bed,wound_edges,surrounding_skin,clinical_infection,patient_pain,patient_pain_1,wound_progress,dressing_plan, "
                    //      21              22              23                      24                                              25                    
                    + " dressing_plan_1,dressing_plan_2,dressing_plan_3,TIME_FORMAT(TIME(date_dressing),'%T'),TIME_FORMAT(TIME(date_next_dressing_change),'%T') FROM lhr_ort_niw_wound_assessment "
                    + " where pmi_no ='" + pmino + "' and DATE(date_dressing) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public Boolean delWoundAssessment(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ort_niw_wound_assessment WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

}
