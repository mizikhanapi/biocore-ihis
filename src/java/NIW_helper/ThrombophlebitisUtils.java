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
        String pmi, hfc, episodeDate, encounterDate, thrombophelibitis_date, time4h, site_iv_canulation, pain_score, slight_redness, redness, swelling, palpable_venous_cord, unconscious_pl, thrombophlebitis, vip_score, medication, blood_tx, plain_iv_drip, assign_by,dis,subdis;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        thrombophelibitis_date = splittedData[4];
        time4h = splittedData[5];
        site_iv_canulation = splittedData[6];
        pain_score = splittedData[7];
        slight_redness = splittedData[8];
        redness = splittedData[9];
        swelling = splittedData[10];
        palpable_venous_cord = splittedData[11];
        unconscious_pl = splittedData[12];
        thrombophlebitis = splittedData[13];
        vip_score = splittedData[14];
        medication = splittedData[15];
        blood_tx = splittedData[16];
        plain_iv_drip = splittedData[17];
        assign_by = splittedData[18];
        dis = splittedData[19];
        subdis = splittedData[20];

        String sqlInsert = "INSERT INTO lhr_ort_niw_chart_observation_thrombophlebitis (pmi_no,hfc_cd,episode_date,encounter_date,thrombophlebitis_date,time4h,site_iv_canulation,pain_score,slight_redness,redness,swelling,palpable_venous_cord,unconscious_pl,thrombophlebitis,vlp_score,medication,blood_tx,plain_iv_drip,assign_by,discipline_cd,subdiscipline_cd,created_by,created_date) values('" + pmi + "','" + hfc + "','" + episodeDate + "','" + encounterDate + "','" + thrombophelibitis_date + "','" + time4h + "','" + site_iv_canulation + "','" + pain_score + "','" + slight_redness + "','" + redness + "','" + swelling + "','" + palpable_venous_cord + "','" + unconscious_pl + "','" + thrombophlebitis + "','" + vip_score + "','" + medication + "','" + blood_tx + "','" + plain_iv_drip + "','" + assign_by + "','"+dis+"','"+subdis+"','"+assign_by+"',now());";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }

    /*
    * get data from DB
     */
    public ArrayList<ArrayList<String>> get4hly(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];


        if (viewBy.equalsIgnoreCase("today")) {
            //              0       1       2               3                        4                                                   5                                    6              7              8           9      10              11               12           13           14            15       16         17          18                            19                            20            21
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,redness,swelling,palpable_venous_cord,unconscious_pl,thrombophlebitis,vlp_score,medication,blood_tx,plain_iv_drip,assign_by,TIME_FORMAT(TIME(thrombophlebitis_date),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) ='" + dateTime + "';";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,redness,swelling,palpable_venous_cord,unconscious_pl,thrombophlebitis,vlp_score,medication,blood_tx,plain_iv_drip,assign_by,TIME_FORMAT(TIME(thrombophlebitis_date),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and  DATE(thrombophlebitis_date) = SUBDATE('" + dateTime + "',1);";

        } else if (viewBy.equalsIgnoreCase("7day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,redness,swelling,palpable_venous_cord,unconscious_pl,thrombophlebitis,vlp_score,medication,blood_tx,plain_iv_drip,assign_by,TIME_FORMAT(TIME(thrombophlebitis_date),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "'  ;";

        } else if (viewBy.equalsIgnoreCase("30day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,redness,swelling,palpable_venous_cord,unconscious_pl,thrombophlebitis,vlp_score,medication,blood_tx,plain_iv_drip,assign_by,TIME_FORMAT(TIME(thrombophlebitis_date),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "' ;";

        } else if (viewBy.equalsIgnoreCase("60day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,redness,swelling,palpable_venous_cord,unconscious_pl,thrombophlebitis,vlp_score,medication,blood_tx,plain_iv_drip,assign_by,TIME_FORMAT(TIME(thrombophlebitis_date),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ;";

        } else if (viewBy.equalsIgnoreCase("custom")) {
            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(thrombophlebitis_date),'%d/%m/%Y'),TIME_FORMAT(TIME(thrombophlebitis_date),'%r'),site_iv_canulation,pain_score,slight_redness,redness,swelling,palpable_venous_cord,unconscious_pl,thrombophlebitis,vlp_score,medication,blood_tx,plain_iv_drip,assign_by,TIME_FORMAT(TIME(thrombophlebitis_date),'%T'),discipline_cd,subdiscipline_cd FROM lhr_ort_niw_chart_observation_thrombophlebitis where pmi_no ='" + pmino + "' and DATE(thrombophlebitis_date) between '" + startDate + "' and '" + endDate + "';";
        }

        data = conn.getData(sql);
        return data;
    }

    /*
    * delete data
     */
    public Boolean del4hly(String datas) {
        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];
        String dis = splitted[20];
        String subdis = splitted[21];

        String sql = "DELETE FROM lhr_ort_niw_chart_observation_thrombophlebitis WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'  and discipline_cd = '"+dis+"' and subdiscipline_cd ='"+subdis+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }
    
        /*
    * add new entry
     */
    public Boolean update4hly(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, thrombophelibitis_date, time4h, site_iv_canulation, pain_score, slight_redness, redness, swelling, palpable_venous_cord, unconscious_pl, thrombophlebitis, vip_score, medication, blood_tx, plain_iv_drip, assign_by,dis,subdis;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        thrombophelibitis_date = splittedData[4];
        time4h = splittedData[5];
        site_iv_canulation = splittedData[6];
        pain_score = splittedData[7];
        slight_redness = splittedData[8];
        redness = splittedData[9];
        swelling = splittedData[10];
        palpable_venous_cord = splittedData[11];
        unconscious_pl = splittedData[12];
        thrombophlebitis = splittedData[13];
        vip_score = splittedData[14];
        medication = splittedData[15];
        blood_tx = splittedData[16];
        plain_iv_drip = splittedData[17];
        assign_by = splittedData[18];
        dis = splittedData[19];
        subdis = splittedData[20];

        String sqlUpdate = "UPDATE lhr_ort_niw_chart_observation_thrombophlebitis set thrombophlebitis_date='"+thrombophelibitis_date+"',time4h='"+time4h+"',site_iv_canulation='"+site_iv_canulation+"',pain_score='"+pain_score+"',slight_redness='"+slight_redness+"',redness='"+redness+"',swelling='"+swelling+"',palpable_venous_cord='"+palpable_venous_cord+"',unconscious_pl='"+unconscious_pl+"',thrombophlebitis='"+thrombophlebitis+"',vlp_score='"+vip_score+"',medication='"+medication+"',blood_tx='"+blood_tx+"',plain_iv_drip='"+plain_iv_drip+"',assign_by='"+assign_by+"' WHERE pmi_no='"+pmi+"' AND hfc_cd='"+hfc+"' AND episode_date='"+episodeDate+"' AND encounter_date='"+encounterDate+"' and discipline_cd ='"+dis+"' and subdiscipline_cd ='"+subdis+"';";
        
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

        return sql;
    }
}
