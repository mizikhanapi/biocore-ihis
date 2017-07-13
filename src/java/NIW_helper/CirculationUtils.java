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
public class CirculationUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getCirculation(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),color, "
                    //      9       10       11       12                13                          
                    + " sensation,hot_cold,movement,others,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_chart_circulation "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),color, "
                    //      9       10       11       12                13                          
                    + " sensation,hot_cold,movement,others,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_chart_circulation "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),color, "
                    //      9       10       11       12                13                          
                    + " sensation,hot_cold,movement,others,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_chart_circulation "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),color, "
                    //      9       10       11       12                13                          
                    + " sensation,hot_cold,movement,others,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_chart_circulation "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),color, "
                    //      9       10       11       12                13                          
                    + " sensation,hot_cold,movement,others,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_chart_circulation "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),color, "
                    //      9       10       11       12                13                          
                    + " sensation,hot_cold,movement,others,TIME_FORMAT(TIME(datetime),'%T') FROM lhr_ort_niw_chart_circulation "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public Boolean addCirculation(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, ward, bed_no, datetime, color, sensation, hot_cold, movement, others;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        ward = splittedData[4];
        bed_no = splittedData[5];
        datetime = splittedData[6];
        color = splittedData[7];
        sensation = splittedData[8];
        hot_cold = splittedData[9];
        movement = splittedData[10];
        others = splittedData[11];

        String sqlInsert = "INSERT INTO lhr_ort_niw_chart_circulation "
                + " (pmi_no, hfc_cd, episode_date, encounter_date, ward, bed_no, datetime, color, sensation, hot_cold, movement, others)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + ward + "','" + bed_no + "','" + datetime + "','" + color + "','" + sensation + "','" + hot_cold + "','" + movement + "','" + others + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

}
