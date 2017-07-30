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
 * @author Shammugam
 */
public class FluidBalanceUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getFluidIntake(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),oral_type, "
                    //      7                8              9               10         11                       12                                         
                    + " oral_amount,intravenous_type,intravenous_amount,other_type,other_amount,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_intake_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),oral_type, "
                    //      7                8              9               10         11                       12                                         
                    + " oral_amount,intravenous_type,intravenous_amount,other_type,other_amount,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_intake_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),oral_type, "
                    //      7                8              9               10         11                       12                                         
                    + " oral_amount,intravenous_type,intravenous_amount,other_type,other_amount,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_intake_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),oral_type, "
                    //      7                8              9               10         11                       12                                         
                    + " oral_amount,intravenous_type,intravenous_amount,other_type,other_amount,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_intake_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),oral_type, "
                    //      7                8              9               10         11                       12                                         
                    + " oral_amount,intravenous_type,intravenous_amount,other_type,other_amount,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_intake_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //              0       1       2               3               4                                   5                                6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),oral_type, "
                    //      7                8              9               10         11                       12                                         
                    + " oral_amount,intravenous_type,intravenous_amount,other_type,other_amount,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_intake_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public ArrayList<ArrayList<String>> getFluidOutput(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {

            //              0       1       2               3               4                                   5                             6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),urine "
                    //      7          8           9                10
                    + " ,vomitus,gastric_suction,other,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_output_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //              0       1       2               3               4                                   5                             6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),urine "
                    //      7          8           9                10
                    + " ,vomitus,gastric_suction,other,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_output_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //              0       1       2               3               4                                   5                             6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),urine "
                    //      7          8           9                10
                    + " ,vomitus,gastric_suction,other,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_output_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //              0       1       2               3               4                                   5                             6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),urine "
                    //      7          8           9                10
                    + " ,vomitus,gastric_suction,other,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_output_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //              0       1       2               3               4                                   5                             6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),urine "
                    //      7          8           9                10
                    + " ,vomitus,gastric_suction,other,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_output_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //              0       1       2               3               4                                   5                             6
            sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(datetime),'%r'),DATE_FORMAT(DATE(datetime),'%d/%m/%Y'),urine "
                    //      7          8           9                10
                    + " ,vomitus,gastric_suction,other,TIME_FORMAT(TIME(datetime),'%H:%i') FROM lhr_ort_niw_output_fluid_balance "
                    + " where pmi_no ='" + pmino + "' and DATE(datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public Boolean addFluidIntake(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, datetime, oral_type, oral_amount, intravenous_type, intravenous_amount, other_type, other_amount, discipline_cd, subdiscipline_cd, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        datetime = splittedData[4];
        oral_type = splittedData[5];
        oral_amount = splittedData[6];
        intravenous_type = splittedData[7];
        intravenous_amount = splittedData[8];
        other_type = splittedData[9];
        other_amount = splittedData[10];
        discipline_cd = splittedData[11];
        subdiscipline_cd = splittedData[12];
        created_by = splittedData[13];
        created_date = splittedData[14];

        String sqlInsert = "INSERT INTO lhr_ort_niw_intake_fluid_balance "
                + " (pmi_no, hfc_cd, episode_date, encounter_date,datetime, oral_type,oral_amount,intravenous_type ,intravenous_amount ,other_type,other_amount,discipline_cd,subdiscipline_cd,created_by,created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + datetime + "','" + oral_type + "','" + oral_amount + "','" + intravenous_type + "',"
                + "'" + intravenous_amount + "','" + other_type + "','" + other_amount + "','" + discipline_cd + "','" + subdiscipline_cd + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean addFluidOutput(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, datetime, urine, vomitus, gastric_suction, other, discipline_cd, subdiscipline_cd, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        datetime = splittedData[4];
        urine = splittedData[5];
        vomitus = splittedData[6];
        gastric_suction = splittedData[7];
        other = splittedData[8];
        discipline_cd = splittedData[9];
        subdiscipline_cd = splittedData[10];
        created_by = splittedData[11];
        created_date = splittedData[12];

        String sqlInsert = "INSERT INTO lhr_ort_niw_output_fluid_balance "
                + " (pmi_no, hfc_cd, episode_date, encounter_date,datetime, urine,vomitus,gastric_suction,other,discipline_cd,subdiscipline_cd,created_by,created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + datetime + "','" + urine + "','" + vomitus + "',"
                + "'" + gastric_suction + "','" + other + "','" + discipline_cd + "','" + subdiscipline_cd + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean updateFluidIntake(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, datetime, oral_type, oral_amount, intravenous_type, intravenous_amount, other_type, other_amount;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        datetime = splittedData[4];
        oral_type = splittedData[5];
        oral_amount = splittedData[6];
        intravenous_type = splittedData[7];
        intravenous_amount = splittedData[8];
        other_type = splittedData[9];
        other_amount = splittedData[10];

        String sql = " UPDATE lhr_ort_niw_intake_fluid_balance SET datetime='" + datetime + "',oral_type='" + oral_type + "',oral_amount='" + oral_amount + "',"
                + " intravenous_type='" + intravenous_type + "',intravenous_amount='" + intravenous_amount + "',other_type='" + other_type + "',other_amount='" + other_amount + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean updateFluidOutput(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, datetime, urine, vomitus, gastric_suction, other;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        datetime = splittedData[4];
        urine = splittedData[5];
        vomitus = splittedData[6];
        gastric_suction = splittedData[7];
        other = splittedData[8];

        String sql = " UPDATE lhr_ort_niw_output_fluid_balance SET datetime='" + datetime + "',urine='" + urine + "',vomitus='" + vomitus + "',"
                + " gastric_suction='" + gastric_suction + "',other='" + other + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean delFluidIntake(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ort_niw_intake_fluid_balance WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

    public Boolean delFluidOutput(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];

        String sql = "DELETE FROM lhr_ort_niw_output_fluid_balance WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

}
