/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnG_helper;

import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;

/**
 *
 * @author shay
 */
public class PersonalDetail {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getPersonalDetail(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc;
        String sql = "";
        pmino = splittedData[0];
        hfc = splittedData[1];

        sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,gravida,parity,pregnancy_lmp,pregnancy_edd,pregnancy_scan_edd,period_cycle,past_gynaecological_history,past_medical_history,past_surgical_history FROM lhr_ong_personal_info where pmi_no = '" + pmino + "' and hfc_cd ='"+hfc+"'";

        data = conn.getData(sql);
        return data;

    }
    
    public ArrayList<ArrayList<String>> getPregnancy(String datas){
        
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc;
        String sql = "";
        pmino = splittedData[0];
        hfc = splittedData[1];
        
        sql = "pmi_no,hfc_cd,episode_date,encounter_date,pregnancy_year,gestation,place_of_delivery,labour_delivery,wt,gender,comment FROM lhr_ong_pregnancy where pmi_no='"+pmino+"' and hfc_cd ='"+hfc+"'";
        data = conn.getData(sql);
        return data;
    }
    
    public Boolean insertPersonalDetail(String datas){
        
        Boolean ins = false;
        String sql = "";
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc,episode,encounter,gravida,parity,pregnancy_lmp,pregnancy_edd,pregnancy_scan_edd,period_cycle,past_gynaecological_history,past_medical_history,past_surgical_history;
        pmino = splittedData[0];
        hfc = splittedData[1];
        episode = splittedData[2];
        encounter = splittedData[3];
        gravida = splittedData[4];
        parity = splittedData[5];
        pregnancy_lmp = splittedData[6];
        pregnancy_edd = splittedData[7];
        pregnancy_scan_edd = splittedData[8];
        period_cycle = splittedData[9];
        past_gynaecological_history = splittedData[10];
        past_medical_history = splittedData[11];
        past_surgical_history = splittedData[12];
        
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String selSql = "Select pmi_no from lhr_ong_personal_info where pmi_no='"+pmino+"' and hfc_cd='"+hfc+"'";
        data = conn.getData(selSql);
        
        if(data.size() < 1){
           sql = "INSERT into lhr_ong_personal_info(pmi_no,hfc_cd,episode_date,encounter_date,gravida,parity,pregnancy_lmp,pregnancy_edd,pregnancy_scan_edd,period_cycle,past_gynaecological_history,past_medical_history,past_surgical_history)values('"+pmino+"','"+hfc+"','"+episode+"','"+encounter+"','"+gravida+"','"+parity+"','"+pregnancy_lmp+"','"+pregnancy_edd+"','"+pregnancy_scan_edd+"','"+period_cycle+"','"+past_gynaecological_history+"','"+past_medical_history+"','"+past_surgical_history+"')";

        }else if(data.size() > 0){
            sql = "UPDATE lhr_ong_personal_info set gravida='"+gravida+"',parity='"+parity+"',pregnancy_lmp='"+pregnancy_lmp+"',pregnancy_edd='"+pregnancy_edd+"',pregnancy_scan_edd='"+pregnancy_scan_edd+"',period_cycle='"+period_cycle+"',past_gynaecological_history='"+past_gynaecological_history+"',past_medical_history='"+past_medical_history+"',past_surgical_history='"+past_surgical_history+"' where pmi_no = '"+pmino+"' and hfc_cd='"+hfc+"'";
        }
        ins = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return ins;
    }
    
    public Boolean insertPregnancy(String datas){
        
        Boolean ins = false;
        String sql = "";
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc,episode,encounter,pregnancy_year,gestation,place_of_delivery,labour_deliver,wt,gender,comment;
        pmino = splittedData[0];
        hfc = splittedData[1];
        episode = splittedData[2];
        encounter = splittedData[3];
        pregnancy_year = splittedData[4];
        gestation = splittedData[5];
        place_of_delivery = splittedData[6];
        labour_deliver = splittedData[7];
        wt = splittedData[8];
        gender = splittedData[9];
        comment = splittedData[10];

        sql = "INSERT into lhr_ong_pregnancy(pmi_no,hfc_cd,episode_date,encounter_date,pregnancy_year,gestation,place_of_delivery,labour_delivery,wt,gender,comment) values('"+pmino+"','"+hfc+"','"+episode+"','"+encounter+"','"+pregnancy_year+"','"+gestation+"','"+place_of_delivery+"','"+labour_deliver+"','"+wt+"','"+gender+"','"+comment+"')";
        ins = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return ins;
    }
}
