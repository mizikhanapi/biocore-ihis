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
public class DailySkinUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getSkinTool(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public ArrayList<ArrayList<String>> getPosition(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {

            //              0       1       2               3               4                                   5                                6                  7
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity,TIME_FORMAT(TIME(datetime),'%H:%i') "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3               4                                   5                                6                  7
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity,TIME_FORMAT(TIME(datetime),'%H:%i') "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3               4                                   5                                6                  7
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity,TIME_FORMAT(TIME(datetime),'%H:%i') "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3               4                                   5                                6                  7
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity,TIME_FORMAT(TIME(datetime),'%H:%i') "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3               4                                   5                                6                  7
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity,TIME_FORMAT(TIME(datetime),'%H:%i') "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //              0       1       2               3               4                                   5                                6                  7
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity,TIME_FORMAT(TIME(datetime),'%H:%i') "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public Boolean addSkinTool(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, datetime, temperature, color, moisture, skin_tugor, integrity, assesor_name, referal_wc, discipline_cd, subdiscipline_cd, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        datetime = splittedData[4];
        temperature = splittedData[5];
        color = splittedData[6];
        moisture = splittedData[7];
        skin_tugor = splittedData[8];
        integrity = splittedData[9];
        referal_wc = splittedData[10];
        assesor_name = splittedData[11];
        discipline_cd = splittedData[12];
        subdiscipline_cd = splittedData[13];
        created_by = splittedData[14];
        created_date = splittedData[15];

        String sqlInsert = "INSERT INTO lhr_ort_niw_daily_skin_assess_tool "
                + " (pmi_no, hfc_cd, episode_date, encounter_date,datetime, temperature,color, moisture,skin_tugor ,integrity ,assesor_name,referal_wc,discipline_cd,subdiscipline_cd,created_by,created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + datetime + "','" + temperature + "','" + color + "','" + moisture + "',"
                + "'" + skin_tugor + "','" + integrity + "','" + assesor_name + "','" + referal_wc + "','" + discipline_cd + "','" + subdiscipline_cd + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean addPosition(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, datetime, activity, discipline_cd, subdiscipline_cd, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        datetime = splittedData[4];
        activity = splittedData[5];
        discipline_cd = splittedData[7];
        subdiscipline_cd = splittedData[8];
        created_by = splittedData[9];
        created_date = splittedData[10];

        String sqlInsert = "INSERT INTO lhr_ort_niw_positioning "
                + " (pmi_no, hfc_cd, episode_date, encounter_date,datetime ,activity,discipline_cd,subdiscipline_cd,created_by,created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + datetime + "',"
                + "'" + activity + "','" + discipline_cd + "','" + subdiscipline_cd + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean updateSkinTool(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, datetime, temperature, color, moisture, skin_tugor, integrity, assesor_name, referal_wc;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        datetime = splittedData[4];
        temperature = splittedData[5];
        color = splittedData[6];
        moisture = splittedData[7];
        skin_tugor = splittedData[8];
        integrity = splittedData[9];
        referal_wc = splittedData[10];
        assesor_name = splittedData[11];

        String sql = " UPDATE lhr_ort_niw_daily_skin_assess_tool SET datetime='" + datetime + "',temperature='" + temperature + "',color='" + color + "',moisture='" + moisture + "',"
                + " skin_tugor='" + skin_tugor + "',integrity='" + integrity + "',referal_wc='" + referal_wc + "',assesor_name='" + assesor_name + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean updatePosition(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, datetime, activity;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        datetime = splittedData[4];
        activity = splittedData[5];

        String sql = " UPDATE lhr_ort_niw_positioning SET datetime='" + datetime + "',activity='" + activity + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

    public Boolean delSkinTool(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ort_niw_daily_skin_assess_tool WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

    public Boolean delPosition(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ort_niw_positioning WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

}
