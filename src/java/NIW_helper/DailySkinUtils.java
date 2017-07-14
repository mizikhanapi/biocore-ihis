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

        ArrayList<ArrayList<String>> data = new ArrayList<>();
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
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),temperature, "
                    //    7       8         9       10          11          12                  13                          
                    + " color,moisture,skin_tugor,integrity,assesor_name,referal_wc,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_daily_skin_assess_tool "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public ArrayList<ArrayList<String>> getPosition(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),activity "
                    + " FROM lhr_ort_niw_positioning "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

}
