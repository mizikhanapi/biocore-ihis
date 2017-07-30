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

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
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

    public Boolean addWoundAssessment(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, date_dressing, date_next_dressing_change, wound_dimension, wound_dimension_1, wound_dimension_2, exu_datelevel, exu_datecolor,
                wound_bed, wound_edges, surrounding_skin, clinical_infection, patient_pain, patient_pain_1, wound_progress, dressing_plan, dressing_plan_1, dressing_plan_2, dressing_plan_3,
                discipline_cd, subdiscipline_cd, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        date_dressing = splittedData[4];
        date_next_dressing_change = splittedData[5];
        wound_dimension = splittedData[6];
        wound_dimension_1 = splittedData[7];
        wound_dimension_2 = splittedData[8];
        exu_datelevel = splittedData[9];
        exu_datecolor = splittedData[10];
        wound_bed = splittedData[11];
        wound_edges = splittedData[12];
        surrounding_skin = splittedData[13];
        clinical_infection = splittedData[14];
        patient_pain = splittedData[15];
        patient_pain_1 = splittedData[16];
        wound_progress = splittedData[17];
        dressing_plan = splittedData[18];
        dressing_plan_1 = splittedData[19];
        dressing_plan_2 = splittedData[20];
        dressing_plan_3 = splittedData[21];
        discipline_cd = splittedData[22];
        subdiscipline_cd = splittedData[23];
        created_by = splittedData[24];
        created_date = splittedData[25];

        String sqlInsert = "INSERT INTO lhr_ort_niw_wound_assessment "
                + " (pmi_no, hfc_cd, episode_date, encounter_date,date_dressing ,date_next_dressing_change, wound_dimension, wound_dimension_1,wound_dimension_2 ,exu_datelevel,"
                + " exu_datecolor,wound_bed,wound_edges,surrounding_skin,clinical_infection,patient_pain,patient_pain_1,wound_progress,dressing_plan,dressing_plan_1,dressing_plan_2,"
                + " dressing_plan_3,discipline_cd,subdiscipline_cd,created_by,created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + date_dressing + "','" + date_next_dressing_change + "','" + wound_dimension + "','" + wound_dimension_1 + "','" + wound_dimension_2 + "',"
                + " '" + exu_datelevel + "','" + exu_datecolor + "','" + wound_bed + "','" + wound_edges + "','" + surrounding_skin + "','" + clinical_infection + "','" + patient_pain + "',"
                + "'" + patient_pain_1 + "','" + wound_progress + "','" + dressing_plan + "','" + dressing_plan_1 + "','" + dressing_plan_2 + "','" + dressing_plan_3 + "','" + discipline_cd + "',"
                + "'" + subdiscipline_cd + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean updateWoundAssessment(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, date_dressing, date_next_dressing_change, wound_dimension, wound_dimension_1, wound_dimension_2, exu_datelevel, exu_datecolor,
                wound_bed, wound_edges, surrounding_skin, clinical_infection, patient_pain, patient_pain_1, wound_progress, dressing_plan, dressing_plan_1, dressing_plan_2, dressing_plan_3;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        date_dressing = splittedData[4];
        date_next_dressing_change = splittedData[5];
        wound_dimension = splittedData[6];
        wound_dimension_1 = splittedData[7];
        wound_dimension_2 = splittedData[8];
        exu_datelevel = splittedData[9];
        exu_datecolor = splittedData[10];
        wound_bed = splittedData[11];
        wound_edges = splittedData[12];
        surrounding_skin = splittedData[13];
        clinical_infection = splittedData[14];
        patient_pain = splittedData[15];
        patient_pain_1 = splittedData[16];
        wound_progress = splittedData[17];
        dressing_plan = splittedData[18];
        dressing_plan_1 = splittedData[19];
        dressing_plan_2 = splittedData[20];
        dressing_plan_3 = splittedData[21];

        String sql = " UPDATE lhr_ort_niw_wound_assessment SET date_dressing='" + date_dressing + "',date_next_dressing_change='" + date_next_dressing_change + "',wound_dimension='" + wound_dimension + "',wound_dimension_1='" + wound_dimension_1 + "',"
                + " wound_dimension_2='" + wound_dimension_2 + "',exu_datelevel='" + exu_datelevel + "',exu_datecolor='" + exu_datecolor + "',wound_bed='" + wound_bed + "', "
                + " wound_edges='" + wound_edges + "',surrounding_skin='" + surrounding_skin + "',clinical_infection='" + clinical_infection + "',patient_pain='" + patient_pain + "', "
                + " patient_pain_1='" + patient_pain_1 + "',wound_progress='" + wound_progress + "',dressing_plan='" + dressing_plan + "',dressing_plan_1='" + dressing_plan_1 + "', "
                + " dressing_plan_2='" + dressing_plan_2 + "',dressing_plan_3='" + dressing_plan_3 + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

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
