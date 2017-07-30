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
public class redivacUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    /*
    * add new data
     */
    public Boolean addRedivac(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, radivac_drain_date, shift, total_in_bottle, amount_increase_shift, total_in_bottle_es, remarks, assignBy,dis,subdis;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        radivac_drain_date = splittedData[4];
        shift = splittedData[5];
        total_in_bottle = splittedData[6];
        amount_increase_shift = splittedData[7];
        total_in_bottle_es = splittedData[8];
        remarks = splittedData[9];
        assignBy = splittedData[10];
        dis  = splittedData[11];
        subdis = splittedData[12];

        String sqlInsert = "INSERT INTO lhr_ort_niw_redivac_drain_chart (pmi_no,hfc_cd,episode_date,encounter_date,radivac_drain_date,shift,total_in_bottle,amount_increase_shift,total_in_bottle_es,remarks,assign_by,discipline_cd,subdiscipline_cd,created_by,created_date) values('" + pmi + "','" + hfc + "','" + episodeDate + "','" + encounterDate + "','" + radivac_drain_date + "','" + shift + "','" + total_in_bottle + "','" + amount_increase_shift + "','" + total_in_bottle_es + "','" + remarks + "','" + assignBy + "','"+dis+"','"+subdis+"','"+assignBy+"',now());";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }

    /*
    * get data from DB
     */
    public ArrayList<ArrayList<String>> getRedivac(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {
            //              0       1       2               3                        4                                 5          6              7                       8           9           10       11             12         
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(radivac_drain_date),'%d/%m/%Y'),shift,total_in_bottle,amount_increase_shift,total_in_bottle_es,remarks,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_redivac_drain_chart where pmi_no ='" + pmino + "' and DATE(radivac_drain_date) ='" + dateTime + "' order by radivac_drain_date;";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(radivac_drain_date),'%d/%m/%Y'),shift,total_in_bottle,amount_increase_shift,total_in_bottle_es,remarks,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_redivac_drain_chart where pmi_no ='" + pmino + "' and  DATE(radivac_drain_date) = SUBDATE('" + dateTime + "',1) order by radivac_drain_date;";

        } else if (viewBy.equalsIgnoreCase("7day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(radivac_drain_date),'%d/%m/%Y'),shift,total_in_bottle,amount_increase_shift,total_in_bottle_es,remarks,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_redivac_drain_chart where pmi_no ='" + pmino + "' and DATE(radivac_drain_date) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' order by radivac_drain_date ;";

        } else if (viewBy.equalsIgnoreCase("30day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(radivac_drain_date),'%d/%m/%Y'),shift,total_in_bottle,amount_increase_shift,total_in_bottle_es,remarks,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_redivac_drain_chart where pmi_no ='" + pmino + "' and DATE(radivac_drain_date) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "' order by radivac_drain_date;";

        } else if (viewBy.equalsIgnoreCase("60day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(radivac_drain_date),'%d/%m/%Y'),shift,total_in_bottle,amount_increase_shift,total_in_bottle_es,remarks,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_redivac_drain_chart where pmi_no ='" + pmino + "' and DATE(radivac_drain_date) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' order by radivac_drain_date ;";

        } else if (viewBy.equalsIgnoreCase("custom")) {
            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(radivac_drain_date),'%d/%m/%Y'),shift,total_in_bottle,amount_increase_shift,total_in_bottle_es,remarks,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_redivac_drain_chart where pmi_no ='" + pmino + "' and DATE(radivac_drain_date) between '" + startDate + "' and '" + endDate + "' order by radivac_drain_date;";

        }

        data = conn.getData(sql);
        return data;
    }
    
    
    /*
    * add new data
     */
    public Boolean updateRedivac(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, radivac_drain_date, shift, total_in_bottle, amount_increase_shift, total_in_bottle_es, remarks, assignBy,dis,subdis;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        radivac_drain_date = splittedData[4];
        shift = splittedData[5];
        total_in_bottle = splittedData[6];
        amount_increase_shift = splittedData[7];
        total_in_bottle_es = splittedData[8];
        remarks = splittedData[9]; 
        assignBy = splittedData[10];
        dis = splittedData[11];
        subdis=splittedData[12];

        String sqlInsert = "UPDATE lhr_ort_niw_redivac_drain_chart set radivac_drain_date='"+radivac_drain_date+"',shift='"+shift+"',total_in_bottle='"+total_in_bottle+"',amount_increase_shift='"+amount_increase_shift+"',total_in_bottle_es='"+total_in_bottle_es+"',remarks='"+remarks+"',assign_by='"+assignBy+"' where pmi_no='"+pmi+"' and hfc_cd='"+hfc+"' and episode_date ='"+episodeDate+"' and encounter_date='"+encounterDate+"';";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }
    
    
    /*
    * delete data
     */
    public Boolean delRedivac(String datas) {
        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];
        String trDate = splitted[4];
        String shift = splitted[5];
        String dis = splitted[11];
        String subdis = splitted[12];
        String sql = "DELETE FROM lhr_ort_niw_redivac_drain_chart WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "' and DATE_FORMAT(DATE(radivac_drain_date),'%d/%m/%Y')='" + trDate + "' and shift='" + shift + "'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }
}
