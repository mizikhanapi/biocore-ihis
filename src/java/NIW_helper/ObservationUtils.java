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

        String sqlInsert = "INSERT INTO lhr_ort_niw_observation_chart(pmi_no,hfc_cd,episode_date,encounter_date,ward,date_entry,datetime,standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment,status) VALUES('" + pmi + "','" + hfc + "','" + episodeDate + "','" + encounterDate + "','" + ward + "','" + dateEntry + "','" + dateTime + "','" + standingPulse + "','" + systolic + "','" + diastolic + "','" + respiratoryRate + "','" + spo2 + "','" + pain_scale + "','" + comment + "','Pending')";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }
    
    /*
    * get data from DB
    */
    public ArrayList<ArrayList<String>> getObservationToday(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,ward_date_entry,datetime,standing_pulse,systolic_supine,diastolic_supine,respiratory_rate,spo2,pain_scale,comment FROM lhr_ort_niw_observation_chart where pmi_no ='" + pmino + "' and datetime ='" + dateTime + "';";
        }
        
        
        data = conn.getData(sql);
        return data;
    }

}
