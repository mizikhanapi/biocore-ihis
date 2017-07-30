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
public class DiabeticChartUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getDiabetic(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),dextrostix, "
                    //      9     10                11                              
                    + " dr_name,status,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_diabetic_chart "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),dextrostix, "
                    //      9     10                11                              
                    + " dr_name,status,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_diabetic_chart "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),dextrostix, "
                    //      9     10                11                              
                    + " dr_name,status,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_diabetic_chart "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),dextrostix, "
                    //      9     10                11                              
                    + " dr_name,status,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_diabetic_chart "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),dextrostix, "
                    //      9     10                11                              
                    + " dr_name,status,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_diabetic_chart "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            //              0       1       2               3        4      5               6                               7                             8
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,bed_no,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),dextrostix, "
                    //      9     10                11                              
                    + " dr_name,status,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_diabetic_chart "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public Boolean approveDiabetis(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, ward, bed_no, datetime, dextrostix, dr_name, status;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        ward = splittedData[4];
        bed_no = splittedData[5];
        datetime = splittedData[6];
        dextrostix = splittedData[7];
        dr_name = splittedData[8];
        status = splittedData[9];

        String sql = "UPDATE lhr_ort_niw_diabetic_chart SET status = 'Approved' WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean addDiabetic(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, ward, bed_no, datetime, dextrostix, dr_name, status, discipline_cd, subdiscipline_cd, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        ward = splittedData[4];
        bed_no = splittedData[5];
        datetime = splittedData[6];
        dextrostix = splittedData[7];
        status = splittedData[8];
        dr_name = splittedData[9];
        discipline_cd = splittedData[10];
        subdiscipline_cd = splittedData[11];
        created_by = splittedData[12];
        created_date = splittedData[13];

        String sqlInsert = "INSERT INTO lhr_ort_niw_diabetic_chart "
                + " (pmi_no, hfc_cd, episode_date, encounter_date,ward,bed_no,datetime,dextrostix,dr_name,status,discipline_cd,subdiscipline_cd,created_by,created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + ward + "','" + bed_no + "','" + datetime + "','" + dextrostix + "',"
                + "'" + dr_name + "','" + status + "','" + discipline_cd + "','" + subdiscipline_cd + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean updateDiabetic(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, ward, bed_no, datetime, dextrostix, dr_name, status;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        ward = splittedData[4];
        bed_no = splittedData[5];
        datetime = splittedData[6];
        dextrostix = splittedData[7];
        status = splittedData[8];
        dr_name = splittedData[9];

        String sql = " UPDATE lhr_ort_niw_diabetic_chart SET ward='" + ward + "',bed_no='" + bed_no + "',datetime='" + datetime + "',dextrostix='" + dextrostix + "',"
                + " dr_name='" + dr_name + "',status='" + status + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean delDiabetic(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ort_niw_diabetic_chart WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

}
