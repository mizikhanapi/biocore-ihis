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
public class TreatmentUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public Boolean addTreatment(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, treatmentDate, shift, iv_branula_rul, iv_branula_lul, iv_branula_rll, iv_branula_lll, angiocatheter, cvp, tracheostomy, urinary_catheter, drain1, drain2, vaccum_dressing, ryiestube, chesttube, assignBy,dis,subdis;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        treatmentDate = splittedData[4];
        shift = splittedData[5];
        iv_branula_rul = splittedData[6];
        iv_branula_lul = splittedData[7];
        iv_branula_rll = splittedData[8];
        iv_branula_lll = splittedData[9];
        angiocatheter = splittedData[10];
        cvp = splittedData[11];
        tracheostomy = splittedData[12];
        urinary_catheter = splittedData[13];
        drain1 = splittedData[14];
        drain2 = splittedData[15];
        vaccum_dressing = splittedData[16];
        ryiestube = splittedData[17];
        chesttube = splittedData[18];
        assignBy = splittedData[19];
        dis = splittedData[20];
        subdis = splittedData[21];

        String sqlInsert = "INSERT INTO lhr_ort_niw_ortho_treatment (pmi_no,hfc_cd,episode_date,encounter_date,treatment_date,shift,iv_branula_rul,iv_branula_lul,iv_branula_rll,iv_branula_lll,angiocatheter,cvp,tracheostomy,urinary_catheter,drain1,drain2,vaccum_dressing,ryiestube,chesttube,assign_by,discipline_cd,subdiscipline_cd,created_by,created_date) values('" + pmi + "','" + hfc + "','" + episodeDate + "','" + encounterDate + "','" + treatmentDate + "','" + shift + "','" + iv_branula_rul + "','" + iv_branula_lul + "','" + iv_branula_rll + "','" + iv_branula_lll + "','" + angiocatheter + "','" + cvp + "','" + tracheostomy + "','" + urinary_catheter + "','" + drain1 + "','" + drain2 + "','" + vaccum_dressing + "','" + ryiestube + "','" + chesttube + "','" + assignBy + "','"+dis+"','"+subdis+"','"+assignBy+"',now());";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }

    /*
    * get data from DB
     */
    public ArrayList<ArrayList<String>> getTreatment(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {
            //              0       1       2               3                        4                              5          6              7              8           9           10           11        12          13           14      15       16          17          18       19          20               21
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(treatment_date),'%d/%m/%Y'),shift,iv_branula_rul,iv_branula_lul,iv_branula_rll,iv_branula_lll,angiocatheter,cvp,tracheostomy,urinary_catheter,drain1,drain2,vaccum_dressing,ryiestube,chesttube,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_ortho_treatment where pmi_no ='" + pmino + "' and DATE(treatment_date) ='" + dateTime + "' order by treatment_date;";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(treatment_date),'%d/%m/%Y'),shift,iv_branula_rul,iv_branula_lul,iv_branula_rll,iv_branula_lll,angiocatheter,cvp,tracheostomy,urinary_catheter,drain1,drain2,vaccum_dressing,ryiestube,chesttube,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_ortho_treatment where pmi_no ='" + pmino + "' and  DATE(treatment_date) = SUBDATE('" + dateTime + "',1) order by treatment_date;";

        } else if (viewBy.equalsIgnoreCase("7day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(treatment_date),'%d/%m/%Y'),shift,iv_branula_rul,iv_branula_lul,iv_branula_rll,iv_branula_lll,angiocatheter,cvp,tracheostomy,urinary_catheter,drain1,drain2,vaccum_dressing,ryiestube,chesttube,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_ortho_treatment where pmi_no ='" + pmino + "' and DATE(treatment_date) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' order by treatment_date ;";

        } else if (viewBy.equalsIgnoreCase("30day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(treatment_date),'%d/%m/%Y'),shift,iv_branula_rul,iv_branula_lul,iv_branula_rll,iv_branula_lll,angiocatheter,cvp,tracheostomy,urinary_catheter,drain1,drain2,vaccum_dressing,ryiestube,chesttube,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_ortho_treatment where pmi_no ='" + pmino + "' and DATE(treatment_date) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "' order by treatment_date;";

        } else if (viewBy.equalsIgnoreCase("60day")) {
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(treatment_date),'%d/%m/%Y'),shift,iv_branula_rul,iv_branula_lul,iv_branula_rll,iv_branula_lll,angiocatheter,cvp,tracheostomy,urinary_catheter,drain1,drain2,vaccum_dressing,ryiestube,chesttube,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_ortho_treatment where pmi_no ='" + pmino + "' and DATE(treatment_date) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' order by treatment_date ;";

        } else if (viewBy.equalsIgnoreCase("custom")) {
            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,DATE_FORMAT(DATE(treatment_date),'%d/%m/%Y'),shift,iv_branula_rul,iv_branula_lul,iv_branula_rll,iv_branula_lll,angiocatheter,cvp,tracheostomy,urinary_catheter,drain1,drain2,vaccum_dressing,ryiestube,chesttube,assign_by,discipline_cd,subdiscipline_cd FROM lhr_ort_niw_ortho_treatment where pmi_no ='" + pmino + "' and DATE(treatment_date) between '" + startDate + "' and '" + endDate + "' order by treatment_date;";

        }

        data = conn.getData(sql);
        return data;
    }

    /*
    * delete data
     */
    public Boolean delTreatment(String datas) {
        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];
        String trDate = splitted[4];
        String shift = splitted[5];
        String dis = splitted[20];
        String subdis = splitted[21];

        String sql = "DELETE FROM lhr_ort_niw_ortho_treatment WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "' and DATE_FORMAT(DATE(treatment_date),'%d/%m/%Y')='" + trDate + "' and shift='" + shift + "' and discipline_cd='"+dis+"' and subdiscipline_cd ='"+subdis+"'";
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

    public Boolean updateTreatment(String datas) {
        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi, hfc, episodeDate, encounterDate, treatmentDate, shift, iv_branula_rul, iv_branula_lul, iv_branula_rll, iv_branula_lll, angiocatheter, cvp, tracheostomy, urinary_catheter, drain1, drain2, vaccum_dressing, ryiestube, chesttube, assignBy,dis,subdis;

        pmi = splittedData[0];
        hfc = splittedData[1];
        episodeDate = splittedData[2];
        encounterDate = splittedData[3];
        treatmentDate = splittedData[4];
        shift = splittedData[5];
        iv_branula_rul = splittedData[6];
        iv_branula_lul = splittedData[7];
        iv_branula_rll = splittedData[8];
        iv_branula_lll = splittedData[9];
        angiocatheter = splittedData[10];
        cvp = splittedData[11];
        tracheostomy = splittedData[12];
        urinary_catheter = splittedData[13];
        drain1 = splittedData[14];
        drain2 = splittedData[15];
        vaccum_dressing = splittedData[16];
        ryiestube = splittedData[17];
        chesttube = splittedData[18];
        assignBy = splittedData[19];
        dis = splittedData[20];
        subdis = splittedData[21];

        String sqlInsert = "UPDATE lhr_ort_niw_ortho_treatment SET iv_branula_rul='"+iv_branula_rul+"',iv_branula_lul='"+iv_branula_lul+"',iv_branula_rll='"+iv_branula_rll+"',iv_branula_lll='"+iv_branula_lll+"',angiocatheter='"+angiocatheter+"',cvp='"+cvp+"',tracheostomy='"+tracheostomy+"',urinary_catheter='"+urinary_catheter+"',drain1='"+drain1+"',drain2='"+drain2+"',vaccum_dressing='"+vaccum_dressing+"',ryiestube='"+ryiestube+"',chesttube='"+chesttube+"',assign_by='"+assignBy+"' where pmi_no='"+pmi+"' and hfc_cd='"+hfc+"' and episode_date ='"+episodeDate+"' and encounter_date='"+encounterDate+"' and treatment_date='"+treatmentDate+"' and shift='"+shift+"' and discipline_cd ='"+dis+"' and subdiscipline_cd='"+subdis+"';";
        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;
    }
}
