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
public class NurseryFeedingChart {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getNurseryFeeding(String datas) {

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
            sql = "SELECT nurfe.pmi_no,nurfe.hfc_cd,nurfe.episode_date,nurfe.encounter_date,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%r'),DATE_FORMAT(DATE(nurfe.feeding_datetime),'%d/%m/%Y'), "
                    //          6                   7                   8                       9                   10           11      12         13                             
                    + " nurfe.strength_milk,nurfe.method_feeding,nurfe.aspirate_vomit,nurfe.body_temperature,nurfe.resp_n_hr,nurfe.pu,nurfe.bo,nurfe.remark, "
                    //             14           15                  16                                              17                  18              
                    + " nurfe.approved_by,nurfe.status,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%H:%i'),IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursery_feeding_chart nurfe "
                    //     JOIN ADM   CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (nurfe.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM   APPROVED BY                           
                    + " LEFT JOIN adm_users admAppr ON (nurfe.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     Where Condition                                 
                    + " WHERE nurfe.pmi_no ='" + pmino + "' AND DATE(nurfe.feeding_datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT nurfe.pmi_no,nurfe.hfc_cd,nurfe.episode_date,nurfe.encounter_date,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%r'),DATE_FORMAT(DATE(nurfe.feeding_datetime),'%d/%m/%Y'), "
                    //          6                   7                   8                       9                   10           11      12         13                             
                    + " nurfe.strength_milk,nurfe.method_feeding,nurfe.aspirate_vomit,nurfe.body_temperature,nurfe.resp_n_hr,nurfe.pu,nurfe.bo,nurfe.remark, "
                    //             14           15                  16                                              17                  18              
                    + " nurfe.approved_by,nurfe.status,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%H:%i'),IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursery_feeding_chart nurfe "
                    //     JOIN ADM   CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (nurfe.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM   APPROVED BY                           
                    + " LEFT JOIN adm_users admAppr ON (nurfe.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     Where Condition                                 
                    + " where nurfe.pmi_no ='" + pmino + "' AND DATE(nurfe.feeding_datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT nurfe.pmi_no,nurfe.hfc_cd,nurfe.episode_date,nurfe.encounter_date,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%r'),DATE_FORMAT(DATE(nurfe.feeding_datetime),'%d/%m/%Y'), "
                    //          6                   7                   8                       9                   10           11      12         13                             
                    + " nurfe.strength_milk,nurfe.method_feeding,nurfe.aspirate_vomit,nurfe.body_temperature,nurfe.resp_n_hr,nurfe.pu,nurfe.bo,nurfe.remark, "
                    //             14           15                  16                                              17                  18              
                    + " nurfe.approved_by,nurfe.status,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%H:%i'),IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursery_feeding_chart nurfe "
                    //     JOIN ADM   CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (nurfe.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM   APPROVED BY                           
                    + " LEFT JOIN adm_users admAppr ON (nurfe.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     Where Condition                                                  
                    + " where nurfe.pmi_no ='" + pmino + "' AND DATE(nurfe.feeding_datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT nurfe.pmi_no,nurfe.hfc_cd,nurfe.episode_date,nurfe.encounter_date,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%r'),DATE_FORMAT(DATE(nurfe.feeding_datetime),'%d/%m/%Y'), "
                    //          6                   7                   8                       9                   10           11      12         13                             
                    + " nurfe.strength_milk,nurfe.method_feeding,nurfe.aspirate_vomit,nurfe.body_temperature,nurfe.resp_n_hr,nurfe.pu,nurfe.bo,nurfe.remark, "
                    //             14           15                  16                                              17                  18              
                    + " nurfe.approved_by,nurfe.status,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%H:%i'),IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursery_feeding_chart nurfe "
                    //     JOIN ADM   CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (nurfe.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM   APPROVED BY                           
                    + " LEFT JOIN adm_users admAppr ON (nurfe.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     Where Condition                                                            
                    + " where nurfe.pmi_no ='" + pmino + "' AND DATE(nurfe.feeding_datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT nurfe.pmi_no,nurfe.hfc_cd,nurfe.episode_date,nurfe.encounter_date,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%r'),DATE_FORMAT(DATE(nurfe.feeding_datetime),'%d/%m/%Y'), "
                    //          6                   7                   8                       9                   10           11      12         13                             
                    + " nurfe.strength_milk,nurfe.method_feeding,nurfe.aspirate_vomit,nurfe.body_temperature,nurfe.resp_n_hr,nurfe.pu,nurfe.bo,nurfe.remark, "
                    //             14           15                  16                                              17                  18              
                    + " nurfe.approved_by,nurfe.status,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%H:%i'),IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursery_feeding_chart nurfe "
                    //     JOIN ADM   CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (nurfe.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM   APPROVED BY                           
                    + " LEFT JOIN adm_users admAppr ON (nurfe.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     Where Condition                                                            
                    + " where nurfe.pmi_no ='" + pmino + "' AND DATE(nurfe.feeding_datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            //                  0           1                2             3                                    4                                               5                                          
            sql = "SELECT nurfe.pmi_no,nurfe.hfc_cd,nurfe.episode_date,nurfe.encounter_date,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%r'),DATE_FORMAT(DATE(nurfe.feeding_datetime),'%d/%m/%Y'), "
                    //          6                   7                   8                       9                   10           11      12         13                             
                    + " nurfe.strength_milk,nurfe.method_feeding,nurfe.aspirate_vomit,nurfe.body_temperature,nurfe.resp_n_hr,nurfe.pu,nurfe.bo,nurfe.remark, "
                    //             14           15                  16                                              17                  18              
                    + " nurfe.approved_by,nurfe.status,TIME_FORMAT(TIME(nurfe.feeding_datetime),'%H:%i'),IFNULL(admAppr.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursery_feeding_chart nurfe "
                    //     JOIN ADM   CREATED BY                           
                    + " LEFT JOIN adm_users admCre ON (nurfe.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM   APPROVED BY                           
                    + " LEFT JOIN adm_users admAppr ON (nurfe.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     Where Condition                                                         
                    + " where nurfe.pmi_no ='" + pmino + "' AND DATE(nurfe.feeding_datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public Boolean addNurseryFeeding(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, feeding_datetime, strength_milk, method_feeding, aspirate_vomit, body_temperature, resp_n_hr, pu,
                bo, remark, approved_by, status, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        feeding_datetime = splittedData[4];
        strength_milk = splittedData[5];
        method_feeding = splittedData[6];
        aspirate_vomit = splittedData[7];
        body_temperature = splittedData[8];
        resp_n_hr = splittedData[9];
        pu = splittedData[10];
        bo = splittedData[11];
        remark = splittedData[12];
        approved_by = splittedData[13];
        status = splittedData[14];
        created_by = splittedData[18];
        created_date = splittedData[19];

        String sqlInsert = "INSERT INTO lhr_ong_nursery_feeding_chart "
                + " (pmi_no,hfc_cd,episode_date,encounter_date,feeding_datetime,strength_milk,method_feeding,aspirate_vomit,body_temperature,resp_n_hr,pu,bo,"
                + " remark,approved_by,status,created_by,created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + feeding_datetime + "','" + strength_milk + "','" + method_feeding + "','" + aspirate_vomit + "'"
                + ",'" + body_temperature + "','" + resp_n_hr + "','" + pu + "','" + bo + "','" + remark + "', "
                + "'" + approved_by + "','" + status + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean updateNurseryFeeding(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, feeding_datetime, strength_milk, method_feeding, aspirate_vomit, body_temperature, resp_n_hr, pu,
                bo, remark, approved_by, status, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        feeding_datetime = splittedData[4];
        strength_milk = splittedData[5];
        method_feeding = splittedData[6];
        aspirate_vomit = splittedData[7];
        body_temperature = splittedData[8];
        resp_n_hr = splittedData[9];
        pu = splittedData[10];
        bo = splittedData[11];
        remark = splittedData[12];
        approved_by = splittedData[13];
        status = splittedData[14];

        String sql = " UPDATE lhr_ong_nursery_feeding_chart SET feeding_datetime='" + feeding_datetime + "',strength_milk='" + strength_milk + "',method_feeding='" + method_feeding + "',"
                + " aspirate_vomit='" + aspirate_vomit + "',body_temperature='" + body_temperature + "',resp_n_hr='" + resp_n_hr + "',pu='" + pu + "', "
                + " bo='" + bo + "',remark='" + remark + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean approveNurseryFeeding(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, userid;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        userid = splittedData[22];

        String sql = "UPDATE lhr_ong_nursery_feeding_chart SET status = 'Approved' , approved_by = '" + userid + "' WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean delNurseryFeeding(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ong_nursery_feeding_chart WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

}
