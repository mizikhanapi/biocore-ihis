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
public class ThrombophlebitisUtils {
    
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    /*
    * add new entry
    */
    
    public Boolean add4hly(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, thrombophelibitis_date, time4h, site_iv_canulation, pain_score, slight_redness, swelling, palpable_venous_cord, unconscious_pl, addictive, thrombophlebitis, vip_score;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        thrombophelibitis_date = splittedData[4];
        time4h = splittedData[5];
        site_iv_canulation = splittedData[6];
        pain_score = splittedData[7];
        slight_redness = splittedData[8];
        swelling = splittedData[9];
        palpable_venous_cord = splittedData[10];
        unconscious_pl = splittedData[11];
        addictive = splittedData[12];
        thrombophlebitis = splittedData[13];
        vip_score = splittedData[14];
        
        String sqlInsert = "INSERT INTO lhr_ort_niw_chart_observation_thrombophlebitis (pmi_no,hfc_cd,episode_date,encounter_date,thrombophlebitis_date,time4h,site_iv_canulation,pain_score,slight_redness,swelling,palpable_venous_cord,unconscious_pl,addictive,thrombophlebitis,vlp_score) values('"+pmi+"','"+hfc+"','"+episodeDate+"','"+encounterDate+"','"+thrombophelibitis_date+"','"+time4h+"','"+site_iv_canulation+"','"+pain_score+"','"+slight_redness+"','"+swelling+"','"+palpable_venous_cord+"','"+unconscious_pl+"','"+addictive+"','"+thrombophlebitis+"','"+vip_score+"')";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }
    
    /*
    * get data from DB
     */
    public ArrayList<ArrayList<String>> get4hly(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy,startDate,endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {
            //              0       1       2               3                        4                                                   5                                    6              7              8           9           10              11               12           13           14   
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,swelling,palpable_venous_cord,unconscious_pl,addictive,thrombophlebitis,vlp_score FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) ='" + dateTime + "';";
            
        } else if (viewBy.equalsIgnoreCase("yesterday")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,swelling,palpable_venous_cord,unconscious_pl,addictive,thrombophlebitis,vlp_score FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and  DATE(thrombophlebitis_date) = SUBDATE('" + dateTime + "',1);";

        } else if (viewBy.equalsIgnoreCase("7day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,swelling,palpable_venous_cord,unconscious_pl,addictive,thrombophlebitis,vlp_score FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ;";

        } else if (viewBy.equalsIgnoreCase("30day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,swelling,palpable_venous_cord,unconscious_pl,addictive,thrombophlebitis,vlp_score FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "';";

        } else if (viewBy.equalsIgnoreCase("60day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,swelling,palpable_venous_cord,unconscious_pl,addictive,thrombophlebitis,vlp_score FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ;";

        } else if (viewBy.equalsIgnoreCase("custom")) {
            String dateSplit[] = dateTime.split("\\^",-1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,swelling,palpable_venous_cord,unconscious_pl,addictive,thrombophlebitis,vlp_score FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) between '"+startDate+"' and '"+endDate+"';";

        }

        data = conn.getData(sql);
        return data;
    }
}
