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
 * @author shay
 */
public class FitUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    /*
    * add new data
     */
    public Boolean addFits(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, fits_datetime, nature_fits, duration, remarks;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        fits_datetime = splittedData[4];
        nature_fits = splittedData[5];
        duration = splittedData[6];
        remarks = splittedData[7];
        

        String sqlInsert = "INSERT INTO lhr_ort_niw_fits_chart (pmi_no,hfc_cd,episode_date,encounter_date,fits_datetime,nature_fits,duration,remarks) values('" + pmi + "','" + hfc + "','" + episodeDate + "','" + encounterDate + "','" + fits_datetime + "','" + nature_fits + "','" + duration + "','" + remarks + "');";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }
    
    
        /*
    * get data from DB
     */
    public ArrayList<ArrayList<String>> getFits(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {
            //              0       1       2               3                        4                                 5                                   6                                    7         8        9                   
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(fits_datetime),'%d/%m/%Y'),TIME_FORMAT(DATE(fits_datetime),'%r'),TIME_FORMAT(DATE(fits_datetime),'%T'),nature_fits,duration,remarks FROM lhr_ort_niw_fits_chart where pmi_no ='" + pmino + "' and DATE(fits_datetime) ='" + dateTime + "' order by fits_datetime;";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(fits_datetime),'%d/%m/%Y'),TIME_FORMAT(DATE(fits_datetime),'%r'),TIME_FORMAT(DATE(fits_datetime),'%T'),nature_fits,duration,remarks FROM lhr_ort_niw_fits_chartwhere pmi_no ='" + pmino + "' and  DATE(fits_datetime) = SUBDATE('" + dateTime + "',1) order by fits_datetime;";

        } else if (viewBy.equalsIgnoreCase("7day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(fits_datetime),'%d/%m/%Y'),TIME_FORMAT(DATE(fits_datetime),'%r'),TIME_FORMAT(DATE(fits_datetime),'%T'),nature_fits,duration,remarks FROM lhr_ort_niw_fits_chart where pmi_no ='" + pmino + "' and DATE(fits_datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' order by fits_datetime ;";

        } else if (viewBy.equalsIgnoreCase("30day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(fits_datetime),'%d/%m/%Y'),TIME_FORMAT(DATE(fits_datetime),'%r'),TIME_FORMAT(DATE(fits_datetime),'%T'),nature_fits,duration,remarks FROM lhr_ort_niw_fits_chart where pmi_no ='" + pmino + "' and DATE(fits_datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "' order by fits_datetime;";

        } else if (viewBy.equalsIgnoreCase("60day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(fits_datetime),'%d/%m/%Y'),TIME_FORMAT(DATE(fits_datetime),'%r'),TIME_FORMAT(DATE(fits_datetime),'%T'),nature_fits,duration,remarks FROM lhr_ort_niw_fits_chart where pmi_no ='" + pmino + "' and DATE(fits_datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' order by fits_datetime ;";

        } else if (viewBy.equalsIgnoreCase("custom")) {
            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(fits_datetime),'%d/%m/%Y'),TIME_FORMAT(DATE(fits_datetime),'%r'),TIME_FORMAT(DATE(fits_datetime),'%T'),nature_fits,duration,remarks FROM lhr_ort_niw_fits_chart where pmi_no ='" + pmino + "' and DATE(fits_datetime) between '" + startDate + "' and '" + endDate + "' order by fits_datetime;";

        }

        data = conn.getData(sql);
        return data;
    }
    
    
    /*
    * add new data
     */
    public Boolean updateFits(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, fits_datetime, nature_fits, duration, remarks;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        fits_datetime = splittedData[4];
        nature_fits = splittedData[5];
        duration = splittedData[6];
        remarks = splittedData[7];
        

        String sqlInsert = "UPDATE lhr_ort_niw_fits_chart SET fits_datetime='"+fits_datetime+"',nature_fits='"+nature_fits+"',duration='"+duration+"',remarks='"+remarks+"' WHERE pmi_no='"+pmi+"' and hfc_cd='"+hfc+"' and episode_date ='"+episodeDate+"' and encounter_date='"+encounterDate+"';";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }
    
        /*
    * delete data
     */
    public Boolean delFits(String datas) {
        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ort_niw_fits_chart WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "';";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }
}