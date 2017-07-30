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
public class ObservationUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    /*
    * add new data to the DB
     */
    public Boolean addObservation(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, ward, dateEntry, dateTime, pain_scale, standingPulse, systolic, diastolic, pulseRate, respiratoryRate, spo2, comment,dis,subdis,assignby;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        ward = splittedData[4];
        dateEntry = splittedData[5];
        dateTime = splittedData[6];
        standingPulse = splittedData[7];
        systolic = splittedData[8];
        diastolic = splittedData[9];
        respiratoryRate = splittedData[10];
        spo2 = splittedData[11];
        pain_scale = splittedData[12];
        comment = splittedData[13];
        dis = splittedData[14];
        subdis = splittedData[15];
        assignby = splittedData[16];

        String sqlInsert = "INSERT INTO lhr_ort_niw_observation_chart(pmi_no,hfc_cd,episode_date,encounter_date,ward,date_entry,datetime,standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment,status,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES('" + pmi + "','" + hfc + "','" + episodeDate + "','" + encounterDate + "','" + ward + "','" + dateEntry + "','" + dateTime + "','" + standingPulse + "','" + systolic + "','" + diastolic + "','" + respiratoryRate + "','" + spo2 + "','" + pain_scale + "','" + comment + "','Pending','"+dis+"','"+subdis+"','"+assignby+"',now())";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }

    /*
    * get data from DB
     */
    public ArrayList<ArrayList<String>> getObservation(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy,startDate,endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {
            //              0       1       2           3              4    5           6                                   7                                   8               9              10              11               12      13    14        15          16                          17              18
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,date_entry,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment,status,TIME_FORMAT(TIME(datetime),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_observation_chart where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "';";
            
        } else if (viewBy.equalsIgnoreCase("yesterday")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,date_entry,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment,status,TIME_FORMAT(TIME(datetime),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_observation_chart where pmi_no ='" + pmino + "' and  DATE(datetime) = SUBDATE('" + dateTime + "',1);";

        } else if (viewBy.equalsIgnoreCase("7day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,date_entry,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment,status,TIME_FORMAT(TIME(datetime),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_observation_chart where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ;";

        } else if (viewBy.equalsIgnoreCase("30day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,date_entry,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment,status,TIME_FORMAT(TIME(datetime),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_observation_chart where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "';";

        } else if (viewBy.equalsIgnoreCase("60day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,date_entry,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment,status,TIME_FORMAT(TIME(datetime),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_observation_chart where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ;";

        } else if (viewBy.equalsIgnoreCase("custom")) {
            String dateSplit[] = dateTime.split("\\^",-1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward,date_entry,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment,status,TIME_FORMAT(TIME(datetime),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_observation_chart where pmi_no ='" + pmino + "' and DATE(datetime) between '"+startDate+"' and '"+endDate+"';";

        }

        data = conn.getData(sql);
        return data;
    }
    
    /*
    * update status to approved
    */
    public Boolean approving(String datas){
        Boolean data = false;
        String splittedData[] = datas.split("\\|",-1);
        String pmi, hfc, episodeDate, encounterDate, ward, dateEntry, dateTime, pain_scale, standingPulse, systolic, diastolic, pulseRate, respiratoryRate, spo2, comment;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        ward = splittedData[4];
        dateEntry = splittedData[5];
        dateTime = splittedData[6];
        standingPulse = splittedData[7];
        systolic = splittedData[8];
        diastolic = splittedData[9];
        respiratoryRate = splittedData[10];
        spo2 = splittedData[11];
        pain_scale = splittedData[12];
        comment = splittedData[13];
        
        String sql = "UPDATE lhr_ort_niw_observation_chart SET status = 'Approved' WHERE pmi_no='"+pmi+"' and hfc_cd='"+hfc+"' and episode_date ='"+episodeDate+"' and encounter_date='"+encounterDate+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return data;
    }
    
    /*
    * delete data
    */
    public Boolean delObservation(String datas){
        Boolean data = false;
        String splitted[] = datas.split("\\|",-1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];
        
        String sql = "DELETE FROM lhr_ort_niw_observation_chart WHERE pmi_no='"+pmi+"' and hfc_cd='"+hfc+"' and episode_date ='"+epDate+"' and encounter_date='"+enDate+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        
        return data;
    }
    
    
    /*
    * update the data..
    */
    public Boolean update(String datas){
        Boolean data = false;
        String splittedData[] = datas.split("\\|",-1);
        String pmi, hfc, episodeDate, encounterDate, ward, dateEntry, dateTime, pain_scale, standingPulse, systolic, diastolic, respiratoryRate, spo2, comment,dis,subdis;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        ward = splittedData[4];
        dateEntry = splittedData[5];
        dateTime = splittedData[6];
        standingPulse = splittedData[7];
        systolic = splittedData[8];
        diastolic = splittedData[9];
        respiratoryRate = splittedData[10];
        spo2 = splittedData[11];
        pain_scale = splittedData[12];
        comment = splittedData[13];
        dis = splittedData[14];
        subdis = splittedData[15];
        
        String sql = "UPDATE lhr_ort_niw_observation_chart SET datetime='"+dateTime+"',standing_pulse='"+standingPulse+"',systolic_supine='"+systolic+"',diastolic_supine='"+diastolic+"',respiratory_rate='"+respiratoryRate+"',spo2='"+spo2+"',pain_scale='"+pain_scale+"',comment='"+comment+"' WHERE pmi_no='"+pmi+"' and hfc_cd='"+hfc+"' and episode_date ='"+episodeDate+"' and encounter_date='"+encounterDate+"' and discipline_cd='"+dis+"' and subdiscipline_cd='"+subdis+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return data;
    }
}
