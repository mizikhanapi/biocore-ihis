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
public class UrineUtils {
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    /*
    * add new data to the DB
     */
    public Boolean addUrine(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, time_map, result_timebowelsurinetemp, result_pulse, result_date,dis,subdis,assignby;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        time_map = splittedData[4];
        result_timebowelsurinetemp = splittedData[5];
        result_pulse = splittedData[6];
        result_date = splittedData[7];
        dis = splittedData[8];
        subdis = splittedData[9];
        assignby = splittedData[10];
      

        String sqlInsert = "INSERT INTO lhr_ort_niw_urine_chart(pmi_no,hfc_cd,episode_date,encounter_date,time_map,result_timebowelsurinetemp,result_pulse,result_date,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES('" + pmi + "','" + hfc + "','" + episodeDate + "','" + encounterDate + "','" + time_map + "','" + result_timebowelsurinetemp + "','" + result_pulse + "','" + result_date+"','"+dis+"','"+subdis+"','"+assignby+"',now())";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }
    
    
    /*
    * get data from DB
     */
    public ArrayList<ArrayList<String>> getUrine(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy,startDate,endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {
            //              0       1       2           3              4                     5                 6                         7                                   8                           9                                 10           11
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,time_map,result_timebowelsurinetemp,result_pulse,DATE_FORMAT(DATE(result_date),'%d/%m/%Y'),TIME_FORMAT(TIME(result_date),'%T'),TIME_FORMAT(TIME(result_date),'%r'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_urine_chart where pmi_no ='" + pmino + "' and DATE(result_date) ='" + dateTime + "' order by result_date asc;";
            
        } else if (viewBy.equalsIgnoreCase("yesterday")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,time_map,result_timebowelsurinetemp,result_pulse,DATE_FORMAT(DATE(result_date),'%d/%m/%Y'),TIME_FORMAT(TIME(result_date),'%T'),TIME_FORMAT(TIME(result_date),'%r'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_urine_chart where pmi_no ='" + pmino + "' and  DATE(result_date) = SUBDATE('" + dateTime + "',1) order by result_date asc;";

        } else if (viewBy.equalsIgnoreCase("7day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,time_map,result_timebowelsurinetemp,result_pulse,DATE_FORMAT(DATE(result_date),'%d/%m/%Y'),TIME_FORMAT(TIME(result_date),'%T'),TIME_FORMAT(TIME(result_date),'%r'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_urine_chart where pmi_no ='" + pmino + "' and DATE(result_date) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' order by result_date asc;";

        } else if (viewBy.equalsIgnoreCase("30day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,time_map,result_timebowelsurinetemp,result_pulse,DATE_FORMAT(DATE(result_date),'%d/%m/%Y'),TIME_FORMAT(TIME(result_date),'%T'),TIME_FORMAT(TIME(result_date),'%r'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_urine_chart where pmi_no ='" + pmino + "' and DATE(result_date) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "' order by result_date asc;";

        } else if (viewBy.equalsIgnoreCase("60day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,time_map,result_timebowelsurinetemp,result_pulse,DATE_FORMAT(DATE(result_date),'%d/%m/%Y'),TIME_FORMAT(TIME(result_date),'%T'),TIME_FORMAT(TIME(result_date),'%r'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_urine_chart where pmi_no ='" + pmino + "' and DATE(result_date) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' order by result_date asc;";

        } else if (viewBy.equalsIgnoreCase("custom")) {
            String dateSplit[] = dateTime.split("\\^",-1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,time_map,result_timebowelsurinetemp,result_pulse,DATE_FORMAT(DATE(result_date),'%d/%m/%Y'),TIME_FORMAT(TIME(result_date),'%T'),TIME_FORMAT(TIME(result_date),'%r'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_urine_chart where pmi_no ='" + pmino + "' and DATE(result_date) between '"+startDate+"' and '"+endDate+"' order by result_date asc;";

        }

        data = conn.getData(sql);
        return data;
    }
    
        /*
    * delete data
    */
    public Boolean delUrine(String datas){
        Boolean data = false;
        String splitted[] = datas.split("\\|",-1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];
        String dis = splitted[10];
        String subdis = splitted[11];
        
        String sql = "DELETE FROM lhr_ort_niw_urine_chart WHERE pmi_no='"+pmi+"' and hfc_cd='"+hfc+"' and episode_date ='"+epDate+"' and encounter_date='"+enDate+"' and discipline_cd='"+dis+"' and subdiscipline_cd='"+subdis+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        return data;
    }
    
    /*
    * update the data
    */
    
        public Boolean updateUrine(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, time_map, result_timebowelsurinetemp, result_pulse, result_date,dis,subdis;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        time_map = splittedData[4];
        result_timebowelsurinetemp = splittedData[5];
        result_pulse = splittedData[6];
        result_date = splittedData[7];
        dis = splittedData[8];
        subdis = splittedData[9];
      

        String sqlInsert = "UPDATE lhr_ort_niw_urine_chart SET time_map='"+time_map+"',result_timebowelsurinetemp='"+result_timebowelsurinetemp+"',result_pulse='"+result_pulse+"',result_date='"+result_date+"',discipline_cd = '"+dis+"',subdiscipline_cd='"+subdis+"' WHERE pmi_no='"+pmi+"' and hfc_cd='"+hfc+"' and episode_date ='"+episodeDate+"' and encounter_date='"+encounterDate+"'";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }
}
