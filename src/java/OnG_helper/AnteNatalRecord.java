/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnG_helper;

/**
 *
 * @author shay
 */
import dBConn.Conn;
import java.util.ArrayList;
import main.RMIConnector;

public class AnteNatalRecord {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getBloodProfile(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, hfc;
        String sql = "";
        pmino = splittedData[0];
        hfc = splittedData[1];
//                        0        1        2           3           4               5           6           7             8         9               10                  11          12      13
        sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,blood_group,att_injection,rhesus_factor,rubella_status,vdrl,hepatitis_b_antibody,hepatitis_b_antigen,1st_dose,2nd_dose,booster from lhr_ong_blood_profile where pmi_no = '" + pmino + "' and hfc_cd ='" + hfc + "'";

        data = conn.getData(sql);
        return data;

    }
    
    public ArrayList<ArrayList<String>> getAnteNatal(String datas){
        
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc;
        String sql = "";
        pmino = splittedData[0];
        hfc = splittedData[1];
                    //  0      1        2              3               4             5          6    7  8  9   10      11      12
        sql = "select pmi_no,hfc_cd,episode_date,encounter_date,gestation_weeks,prest_lie,ultrasound,bp,hb,wt,urine_a,urine_s,followup FROM lhr_ong_antenatal_record where pmi_no='"+pmino+"' and hfc_cd ='"+hfc+"'";
        data = conn.getData(sql);
        return data;
    }
    
    public Boolean insertBloodProfile(String datas){
        
        Boolean ins = false;
        String sql = "";
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc,episode,encounter,blood_group,att_injection,rhesus_factor,rubella_status,vdrl,hepatitis_b_antibody,hepatitis_b_antigen,first_dose,second_dose,booster;
        pmino = splittedData[0];
        hfc = splittedData[1];
        episode = splittedData[2];
        encounter = splittedData[3];
        blood_group = splittedData[4];
        att_injection = splittedData[5];
        rhesus_factor = splittedData[6];
        rubella_status = splittedData[7];
        vdrl = splittedData[8];
        hepatitis_b_antibody = splittedData[9];
        hepatitis_b_antigen = splittedData[10];
        first_dose = splittedData[11];
        second_dose = splittedData[12];
        booster = splittedData[13];

        sql = "INSERT into lhr_ong_blood_profile (pmi_no,hfc_cd,episode_date,encounter_date,blood_group,att_injection,rhesus_factor,rubella_status,vdrl,hepatitis_b_antibody,hepatitis_b_antigen,1st_dose,2nd_dose,booster) values('"+pmino+"','"+hfc+"','"+episode+"','"+encounter+"','"+blood_group+"','"+att_injection+"','"+rhesus_factor+"','"+rubella_status+"','"+vdrl+"','"+hepatitis_b_antibody+"','"+hepatitis_b_antigen+"','"+first_dose+"','"+second_dose+"','"+booster+"')";
        ins = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return ins;
    }
    
    public String insertAntenatal(String datas){
        
        Boolean ins = false;
        String sql = "";
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc,episode,encounter,gestation_week,prest_lie,ultrasound,bp,hb,wt,urine_a,urine_s,followup;
        pmino = splittedData[0];
        hfc = splittedData[1];
        episode = splittedData[2];
        encounter = splittedData[3];
        gestation_week = splittedData[4];
        prest_lie = splittedData[5];
        ultrasound = splittedData[6];
        bp = splittedData[7];
        hb = splittedData[8];
        wt = splittedData[9];
        urine_a = splittedData[10];
        urine_s = splittedData[11];
        followup = splittedData[12];

        sql = "INSERT into lhr_ong_antenatal_record(pmi_no,hfc_cd,episode_date,encounter_date,gestation_weeks,prest_lie,ultrasound,bp,hb,wt,urine_a,urine_s,followup) values('"+pmino+"','"+hfc+"','"+episode+"','"+encounter+"','"+gestation_week+"','"+prest_lie+"','"+ultrasound+"','"+bp+"','"+hb+"','"+wt+"','"+urine_a+"','"+urine_s+"','"+followup+"')";
        ins = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return sql;
    }
    
        public Boolean deleteAntenatal(String datas){
        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmino,hfc,epi,encounter;
        String sql = "";
        pmino = splittedData[0];
        hfc = splittedData[1];
        epi = splittedData[2];
        encounter = splittedData[3];
        
        sql = "DELETE from lhr_ong_antenatal_record where pmi_no='"+pmino+"' and hfc_cd ='"+hfc+"' and episode_date='"+epi+"' and encounter_date='"+encounter+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        return data;
    }
}
