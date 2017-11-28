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

        sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,gravida,parity,DATE_FORMAT(DATE(pregnancy_lmp),'%d/%m/%Y'),DATE_FORMAT(DATE(pregnancy_edd),'%d/%m/%Y'),DATE_FORMAT(DATE(pregnancy_scan_edd),'%d/%m/%Y'),period_cycle,past_gynaecological_history,past_medical_history,past_surgical_history,week,date_created FROM lhr_ong_personal_info where pmi_no = '" + pmino + "' and hfc_cd ='"+hfc+"' order by status limit 1";

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
                    //  0          1        2              3               4                  5          6                  7                8   9               10        11      
        sql = "select p.pmi_no,p.hfc_cd,p.episode_date,p.encounter_date,p.pregnancy_year,p.gestation,p.place_of_delivery,p.labour_delivery,p.wt,g.description,p.comment,p.gender FROM lhr_ong_pregnancy p join adm_lookup_detail g on g.master_reference_code = '0041' AND g.hfc_cd = '" + hfc + "' and g.status ='0' and g.detail_reference_code = p.gender where p.pmi_no='"+pmino+"' and p.hfc_cd ='"+hfc+"'";
        data = conn.getData(sql);
        return data;
    }
    
    public Boolean insertPersonalDetail(String datas){
        
        Boolean ins = false;
        String sql = "";
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc,episode,encounter,gravida,parity,pregnancy_lmp,pregnancy_edd,pregnancy_scan_edd,period_cycle,past_gynaecological_history,past_medical_history,past_surgical_history,week,createddate;
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
        week = splittedData[13];
        createddate = splittedData[14];
        
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String selSql = "Select pmi_no from lhr_ong_personal_info where pmi_no='"+pmino+"' and hfc_cd='"+hfc+"' and status='0'";
        data = conn.getData(selSql);
        
        if(data.size() < 1){
           sql = "INSERT into lhr_ong_personal_info(pmi_no,hfc_cd,episode_date,encounter_date,gravida,parity,pregnancy_lmp,pregnancy_edd,pregnancy_scan_edd,period_cycle,past_gynaecological_history,past_medical_history,past_surgical_history,week,date_created)values('"+pmino+"','"+hfc+"','"+episode+"','"+encounter+"','"+gravida+"','"+parity+"','"+pregnancy_lmp+"','"+pregnancy_edd+"','"+pregnancy_scan_edd+"','"+period_cycle+"','"+past_gynaecological_history+"','"+past_medical_history+"','"+past_surgical_history+"','"+week+"','"+createddate+"')";

        }else if(data.size() > 0){
            sql = "UPDATE lhr_ong_personal_info set gravida='"+gravida+"',parity='"+parity+"',pregnancy_lmp='"+pregnancy_lmp+"',pregnancy_edd='"+pregnancy_edd+"',pregnancy_scan_edd='"+pregnancy_scan_edd+"',period_cycle='"+period_cycle+"',past_gynaecological_history='"+past_gynaecological_history+"',past_medical_history='"+past_medical_history+"',past_surgical_history='"+past_surgical_history+"' where pmi_no = '"+pmino+"' and hfc_cd='"+hfc+"' and status='0'";
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
    
    public Boolean deletePregnancy(String datas){
        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc,epi,encounter;
        String sql = "";
        pmino = splittedData[0];
        hfc = splittedData[1];
        epi = splittedData[2];
        encounter = splittedData[3];
        
        sql = "DELETE from lhr_ong_pregnancy where pmi_no='"+pmino+"' and hfc_cd ='"+hfc+"' and episode_date='"+epi+"' and encounter_date='"+encounter+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return data;
    }
    
    public Boolean updatePregnancy(String datas){
        Boolean data = false;
        String splittedData[] = datas.split("\\|",-1);
        String pmino,hfc,epi,encounter,year,gestation,pod,labourdelivery,wt,gender,comment;
        String sql = "";
        pmino = splittedData[0];
        hfc= splittedData[1];
        epi = splittedData[2];
        encounter = splittedData[3];
        year = splittedData[4];
        gestation = splittedData[5];
        pod = splittedData[6];
        labourdelivery = splittedData[7];
        wt = splittedData[8];
        gender = splittedData[9];
        comment = splittedData[10];
        
        sql = "UPDATE lhr_ong_pregnancy set pregnancy_year = '"+year+"',gestation ='"+gestation+"',place_of_delivery ='"+pod+"',labour_delivery='"+labourdelivery+"',wt='"+wt+"',gender='"+gender+"',comment='"+comment+"' where pmi_no='"+pmino+"' and hfc_cd ='"+hfc+"' and episode_date='"+epi+"' and encounter_date='"+encounter+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return data;
    }
}
