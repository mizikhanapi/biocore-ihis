/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnG_helper;

import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author Shammugam
 */
public class FrequentObservationChart {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getFrequentObservation(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate, hfc, dis, subdis;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];
        hfc = splittedData[3];
        dis = splittedData[4];
        subdis = splittedData[5];

        if (viewBy.equalsIgnoreCase("today")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT freq.pmi_no,freq.hfc_cd,freq.episode_date,freq.encounter_date,TIME_FORMAT(TIME(freq.observation_datetime),'%r'),DATE_FORMAT(DATE(freq.observation_datetime),'%d/%m/%Y'), "
                    //          6                7                  8                 9                       10                           11                  12                     13                             
                    + " freq.temperature,freq.pulse_rate,freq.respiratory_rate,freq.blood_pressure_sys,freq.blood_pressure_dia,freq.pupil_right_size,freq.pupil_right_react,freq.pupil_left_size, "
                    //               14                     15                  16                  17            18                                 19                                 20
                    + " freq.pupil_left_react,freq.conscious_state_remarks,freq.drug_given,freq.approved_by,freq.status,TIME_FORMAT(TIME(freq.observation_datetime),'%H:%i'),IFNULL(mdc.d_trade_name,''),  "
                    //          21                              22                           
                    + " IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_frequent_observation_chart freq "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (freq.drug_given = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (freq.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM APPROVED BY                                                      
                    + " LEFT JOIN adm_users admAppr ON (freq.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     Where Condition                                 
                    + " WHERE freq.pmi_no ='" + pmino + "' AND DATE(freq.observation_datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT freq.pmi_no,freq.hfc_cd,freq.episode_date,freq.encounter_date,TIME_FORMAT(TIME(freq.observation_datetime),'%r'),DATE_FORMAT(DATE(freq.observation_datetime),'%d/%m/%Y'), "
                    //          6                7                  8                 9                       10                           11                  12                     13                             
                    + " freq.temperature,freq.pulse_rate,freq.respiratory_rate,freq.blood_pressure_sys,freq.blood_pressure_dia,freq.pupil_right_size,freq.pupil_right_react,freq.pupil_left_size, "
                    //               14                     15                  16                  17            18                                 19                                 20
                    + " freq.pupil_left_react,freq.conscious_state_remarks,freq.drug_given,freq.approved_by,freq.status,TIME_FORMAT(TIME(freq.observation_datetime),'%H:%i'),IFNULL(mdc.d_trade_name,''),  "
                    //          21                              22                           
                    + " IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_frequent_observation_chart freq "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (freq.drug_given = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (freq.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM APPROVED BY                                                      
                    + " LEFT JOIN adm_users admAppr ON (freq.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //      Where Condition                                 
                    + " where freq.pmi_no ='" + pmino + "' and DATE(freq.observation_datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT freq.pmi_no,freq.hfc_cd,freq.episode_date,freq.encounter_date,TIME_FORMAT(TIME(freq.observation_datetime),'%r'),DATE_FORMAT(DATE(freq.observation_datetime),'%d/%m/%Y'), "
                    //          6                7                  8                 9                       10                           11                  12                     13                             
                    + " freq.temperature,freq.pulse_rate,freq.respiratory_rate,freq.blood_pressure_sys,freq.blood_pressure_dia,freq.pupil_right_size,freq.pupil_right_react,freq.pupil_left_size, "
                    //               14                     15                  16                  17            18                                 19                                 20
                    + " freq.pupil_left_react,freq.conscious_state_remarks,freq.drug_given,freq.approved_by,freq.status,TIME_FORMAT(TIME(freq.observation_datetime),'%H:%i'),IFNULL(mdc.d_trade_name,''),  "
                    //          21                              22                           
                    + " IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_frequent_observation_chart freq "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (freq.drug_given = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (freq.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM APPROVED BY                                                      
                    + " LEFT JOIN adm_users admAppr ON (freq.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //      Where Condition                                 
                    + " where freq.pmi_no ='" + pmino + "' and DATE(freq.observation_datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT freq.pmi_no,freq.hfc_cd,freq.episode_date,freq.encounter_date,TIME_FORMAT(TIME(freq.observation_datetime),'%r'),DATE_FORMAT(DATE(freq.observation_datetime),'%d/%m/%Y'), "
                    //          6                7                  8                 9                       10                           11                  12                     13                             
                    + " freq.temperature,freq.pulse_rate,freq.respiratory_rate,freq.blood_pressure_sys,freq.blood_pressure_dia,freq.pupil_right_size,freq.pupil_right_react,freq.pupil_left_size, "
                    //               14                     15                  16                  17            18                                 19                                 20
                    + " freq.pupil_left_react,freq.conscious_state_remarks,freq.drug_given,freq.approved_by,freq.status,TIME_FORMAT(TIME(freq.observation_datetime),'%H:%i'),IFNULL(mdc.d_trade_name,''),  "
                    //          21                              22                           
                    + " IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_frequent_observation_chart freq "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (freq.drug_given = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (freq.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM APPROVED BY                                                      
                    + " LEFT JOIN adm_users admAppr ON (freq.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //      Where Condition                                 
                    + " where freq.pmi_no ='" + pmino + "' and DATE(freq.observation_datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT freq.pmi_no,freq.hfc_cd,freq.episode_date,freq.encounter_date,TIME_FORMAT(TIME(freq.observation_datetime),'%r'),DATE_FORMAT(DATE(freq.observation_datetime),'%d/%m/%Y'), "
                    //          6                7                  8                 9                       10                           11                  12                     13                             
                    + " freq.temperature,freq.pulse_rate,freq.respiratory_rate,freq.blood_pressure_sys,freq.blood_pressure_dia,freq.pupil_right_size,freq.pupil_right_react,freq.pupil_left_size, "
                    //               14                     15                  16                  17            18                                 19                                 20
                    + " freq.pupil_left_react,freq.conscious_state_remarks,freq.drug_given,freq.approved_by,freq.status,TIME_FORMAT(TIME(freq.observation_datetime),'%H:%i'),IFNULL(mdc.d_trade_name,''),  "
                    //          21                              22                           
                    + " IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_frequent_observation_chart freq "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (freq.drug_given = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (freq.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM APPROVED BY                                                      
                    + " LEFT JOIN adm_users admAppr ON (freq.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //      Where Condition                                 
                    + " where freq.pmi_no ='" + pmino + "' and DATE(freq.observation_datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT freq.pmi_no,freq.hfc_cd,freq.episode_date,freq.encounter_date,TIME_FORMAT(TIME(freq.observation_datetime),'%r'),DATE_FORMAT(DATE(freq.observation_datetime),'%d/%m/%Y'), "
                    //          6                7                  8                 9                       10                           11                  12                     13                             
                    + " freq.temperature,freq.pulse_rate,freq.respiratory_rate,freq.blood_pressure_sys,freq.blood_pressure_dia,freq.pupil_right_size,freq.pupil_right_react,freq.pupil_left_size, "
                    //               14                     15                  16                  17            18                                 19                                 20
                    + " freq.pupil_left_react,freq.conscious_state_remarks,freq.drug_given,freq.approved_by,freq.status,TIME_FORMAT(TIME(freq.observation_datetime),'%H:%i'),IFNULL(mdc.d_trade_name,''),  "
                    //          21                              22                           
                    + " IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_frequent_observation_chart freq "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (freq.drug_given = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (freq.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM APPROVED BY                                                      
                    + " LEFT JOIN adm_users admAppr ON (freq.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     Where Condition                                 
                    + " where freq.pmi_no ='" + pmino + "' and DATE(freq.observation_datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public Boolean addFrequentObservation(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, observation_datetime, temperature, pulse_rate, respiratory_rate, blood_pressure_sys, blood_pressure_dia,
                pupil_left_react, pupil_left_size, pupil_right_react, pupil_right_size, conscious_state_remarks, drug_given, approved_by, status, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        observation_datetime = splittedData[4];
        temperature = splittedData[5];
        pulse_rate = splittedData[6];
        respiratory_rate = splittedData[7];
        blood_pressure_sys = splittedData[8];
        blood_pressure_dia = splittedData[9];
        pupil_left_react = splittedData[10];
        pupil_left_size = splittedData[11];
        pupil_right_react = splittedData[12];
        pupil_right_size = splittedData[13];
        conscious_state_remarks = splittedData[14];
        drug_given = splittedData[15];
        approved_by = splittedData[16];
        status = splittedData[17];
        created_by = splittedData[21];
        created_date = splittedData[22];

        String sqlInsert = "INSERT INTO lhr_ong_frequent_observation_chart "
                + " (pmi_no,hfc_cd,episode_date,encounter_date,observation_datetime,temperature,pulse_rate,respiratory_rate,blood_pressure_sys,blood_pressure_dia,pupil_left_react,"
                + " pupil_left_size,pupil_right_react,pupil_right_size,conscious_state_remarks,drug_given,approved_by,status,created_by,created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + observation_datetime + "','" + temperature + "','" + pulse_rate + "','" + respiratory_rate + "'"
                + ",'" + blood_pressure_sys + "','" + blood_pressure_dia + "','" + pupil_left_react + "','" + pupil_left_size + "','" + pupil_right_react + "','" + pupil_right_size + "','" + conscious_state_remarks + "','" + drug_given + "', "
                + "'" + approved_by + "','" + status + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean updateFrequentObservation(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, observation_datetime, temperature, pulse_rate, respiratory_rate, blood_pressure_sys, blood_pressure_dia,
                pupil_left_react, pupil_left_size, pupil_right_react, pupil_right_size, conscious_state_remarks, drug_given, approved_by, status;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        observation_datetime = splittedData[4];
        temperature = splittedData[5];
        pulse_rate = splittedData[6];
        respiratory_rate = splittedData[7];
        blood_pressure_sys = splittedData[8];
        blood_pressure_dia = splittedData[9];
        pupil_left_react = splittedData[10];
        pupil_left_size = splittedData[11];
        pupil_right_react = splittedData[12];
        pupil_right_size = splittedData[13];
        conscious_state_remarks = splittedData[14];
        drug_given = splittedData[15];
        approved_by = splittedData[16];
        status = splittedData[17];

        String sql = " UPDATE lhr_ong_frequent_observation_chart SET observation_datetime='" + observation_datetime + "',temperature='" + temperature + "',pulse_rate='" + pulse_rate + "',"
                + " respiratory_rate='" + respiratory_rate + "',blood_pressure_sys='" + blood_pressure_sys + "',blood_pressure_dia='" + blood_pressure_dia + "',pupil_left_react='" + pupil_left_react + "',pupil_left_size='" + pupil_left_size + "', "
                + " pupil_right_react='" + pupil_right_react + "',pupil_right_size='" + pupil_right_size + "',conscious_state_remarks='" + conscious_state_remarks + "',drug_given='" + drug_given + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean approveFrequentObservation(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, userid;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        userid = splittedData[26];

        String sql = "UPDATE lhr_ong_frequent_observation_chart SET status = 'Approved' , approved_by = '" + userid + "' WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean delFrequentObservation(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ong_frequent_observation_chart WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

}
