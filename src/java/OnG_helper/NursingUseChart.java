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
 * @author Shammugam
 */
public class NursingUseChart {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getNursingUseMaster(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate, hfc, dis, subdis;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];
        hfc = splittedData[3];
        dis = splittedData[4];
        subdis = splittedData[5];

        if (viewBy.equalsIgnoreCase("today")) {

            //                  0           1               2               3                              4                                                 5                                    
            sql = "SELECT mast.pmi_no,mast.hfc_cd,mast.episode_date,mast.encounter_date,TIME_FORMAT(TIME(mast.master_datetime),'%r'),DATE_FORMAT(DATE(mast.master_datetime),'%d/%m/%Y'), "
                    //                 6                                         7                                              8                                               9                                                
                    + " TIME_FORMAT(TIME(mast.start_date),'%r'),DATE_FORMAT(DATE(mast.start_date),'%d/%m/%Y'),TIME_FORMAT(TIME(mast.end_date),'%r'),DATE_FORMAT(DATE(mast.end_date),'%d/%m/%Y'),"
                    //        10                11              12                        13                   14                    15               16                            17                                   
                    + " mast.drug_code,mast.supply_one,mast.supply_one_dispensed_by,mast.supply_two,mast.supply_two_dispensed_by,mast.approved_by,mast.status,TIME_FORMAT(TIME(mast.master_datetime),'%H:%i'), "
                    //                      18                                      19                              20                          21                          22                      23
                    + " TIME_FORMAT(TIME(mast.start_date),'%H:%i'),TIME_FORMAT(TIME(mast.end_date),'%H:%i'),IFNULL(mdc.d_trade_name,''),IFNULL(admAppr.USER_NAME,''),mast.master_datetime,IFNULL(mdc.d_strength,''), "
                    //               24                     25                              26                      27                              28                      29
                    + " IFNULL(mdc.d_route_code,''),IFNULL(mdc.d_form_code,''),IFNULL(mdc.d_frequency,''),IFNULL(admDis1.USER_NAME,''),IFNULL(admDis2.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursing_use_master mast "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (mast.drug_code = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM  CREATED BY                            
                    + " LEFT JOIN adm_users admCre ON (mast.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM  APPROVED BY                            
                    + " LEFT JOIN adm_users admAppr ON (mast.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 1                          
                    + " LEFT JOIN adm_users admDis1 ON (mast.supply_one_dispensed_by = admDis1.USER_ID) AND admDis1.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 2                            
                    + " LEFT JOIN adm_users admDis2 ON (mast.supply_two_dispensed_by = admDis2.USER_ID) AND admDis2.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    // Where Condition
                    + " where mast.pmi_no ='" + pmino + "' and DATE(mast.master_datetime) ='" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("yesterday")) {

            //                  0           1               2               3                              4                                                 5                                    
            sql = "SELECT mast.pmi_no,mast.hfc_cd,mast.episode_date,mast.encounter_date,TIME_FORMAT(TIME(mast.master_datetime),'%r'),DATE_FORMAT(DATE(mast.master_datetime),'%d/%m/%Y'), "
                    //                 6                                         7                                              8                                               9                                                
                    + " TIME_FORMAT(TIME(mast.start_date),'%r'),DATE_FORMAT(DATE(mast.start_date),'%d/%m/%Y'),TIME_FORMAT(TIME(mast.end_date),'%r'),DATE_FORMAT(DATE(mast.end_date),'%d/%m/%Y'),"
                    //        10                11              12                        13                   14                    15               16                            17                                   
                    + " mast.drug_code,mast.supply_one,mast.supply_one_dispensed_by,mast.supply_two,mast.supply_two_dispensed_by,mast.approved_by,mast.status,TIME_FORMAT(TIME(mast.master_datetime),'%H:%i'), "
                    //                      18                                      19                              20                          21                          22                      23
                    + " TIME_FORMAT(TIME(mast.start_date),'%H:%i'),TIME_FORMAT(TIME(mast.end_date),'%H:%i'),IFNULL(mdc.d_trade_name,''),IFNULL(admAppr.USER_NAME,''),mast.master_datetime,IFNULL(mdc.d_strength,''), "
                    //               24                     25                              26                      27                              28                      29
                    + " IFNULL(mdc.d_route_code,''),IFNULL(mdc.d_form_code,''),IFNULL(mdc.d_frequency,''),IFNULL(admDis1.USER_NAME,''),IFNULL(admDis2.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursing_use_master mast "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (mast.drug_code = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM  CREATED BY                            
                    + " LEFT JOIN adm_users admCre ON (mast.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM  APPROVED BY                            
                    + " LEFT JOIN adm_users admAppr ON (mast.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 1                          
                    + " LEFT JOIN adm_users admDis1 ON (mast.supply_one_dispensed_by = admDis1.USER_ID) AND admDis1.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 2                            
                    + " LEFT JOIN adm_users admDis2 ON (mast.supply_two_dispensed_by = admDis2.USER_ID) AND admDis2.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    // Where Condition
                    + " where mast.pmi_no ='" + pmino + "' and DATE(mast.master_datetime) = SUBDATE('" + dateTime + "',1); ";

        } else if (viewBy.equalsIgnoreCase("7day")) {

            //                  0           1               2               3                              4                                                 5                                    
            sql = "SELECT mast.pmi_no,mast.hfc_cd,mast.episode_date,mast.encounter_date,TIME_FORMAT(TIME(mast.master_datetime),'%r'),DATE_FORMAT(DATE(mast.master_datetime),'%d/%m/%Y'), "
                    //                 6                                         7                                              8                                               9                                                
                    + " TIME_FORMAT(TIME(mast.start_date),'%r'),DATE_FORMAT(DATE(mast.start_date),'%d/%m/%Y'),TIME_FORMAT(TIME(mast.end_date),'%r'),DATE_FORMAT(DATE(mast.end_date),'%d/%m/%Y'),"
                    //        10                11              12                        13                   14                    15               16                            17                                   
                    + " TIME_FORMAT(TIME(mast.start_date),'%H:%i'),TIME_FORMAT(TIME(mast.end_date),'%H:%i'),IFNULL(mdc.d_trade_name,''),IFNULL(admAppr.USER_NAME,''),mast.master_datetime,IFNULL(mdc.d_strength,''), "
                    //               24                     25                              26                      27                              28                      29
                    + " IFNULL(mdc.d_route_code,''),IFNULL(mdc.d_form_code,''),IFNULL(mdc.d_frequency,''),IFNULL(admDis1.USER_NAME,''),IFNULL(admDis2.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursing_use_master mast "
                    //               24                     25                              26                      27                              28              
                    + " IFNULL(mdc.d_route_code,''),IFNULL(mdc.d_form_code,''),IFNULL(mdc.d_frequency,''),IFNULL(admDis1.USER_NAME,''),IFNULL(admDis2.USER_NAME,'') FROM lhr_ong_nursing_use_master mast "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (mast.drug_code = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM  CREATED BY                            
                    + " LEFT JOIN adm_users admCre ON (mast.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM  APPROVED BY                            
                    + " LEFT JOIN adm_users admAppr ON (mast.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 1                          
                    + " LEFT JOIN adm_users admDis1 ON (mast.supply_one_dispensed_by = admDis1.USER_ID) AND admDis1.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 2                            
                    + " LEFT JOIN adm_users admDis2 ON (mast.supply_two_dispensed_by = admDis2.USER_ID) AND admDis2.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    // Where Condition
                    + " where mast.pmi_no ='" + pmino + "' and DATE(mast.master_datetime) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("30day")) {

            //                  0           1               2               3                              4                                                 5                                    
            sql = "SELECT mast.pmi_no,mast.hfc_cd,mast.episode_date,mast.encounter_date,TIME_FORMAT(TIME(mast.master_datetime),'%r'),DATE_FORMAT(DATE(mast.master_datetime),'%d/%m/%Y'), "
                    //                 6                                         7                                              8                                               9                                                
                    + " TIME_FORMAT(TIME(mast.start_date),'%r'),DATE_FORMAT(DATE(mast.start_date),'%d/%m/%Y'),TIME_FORMAT(TIME(mast.end_date),'%r'),DATE_FORMAT(DATE(mast.end_date),'%d/%m/%Y'),"
                    //        10                11              12                        13                   14                    15               16                            17                                   
                    + " mast.drug_code,mast.supply_one,mast.supply_one_dispensed_by,mast.supply_two,mast.supply_two_dispensed_by,mast.approved_by,mast.status,TIME_FORMAT(TIME(mast.master_datetime),'%H:%i'), "
                    //                      18                                      19                              20                          21                          22                      23
                    + " TIME_FORMAT(TIME(mast.start_date),'%H:%i'),TIME_FORMAT(TIME(mast.end_date),'%H:%i'),IFNULL(mdc.d_trade_name,''),IFNULL(admAppr.USER_NAME,''),mast.master_datetime,IFNULL(mdc.d_strength,''), "
                    //               24                     25                              26                      27                              28                      29
                    + " IFNULL(mdc.d_route_code,''),IFNULL(mdc.d_form_code,''),IFNULL(mdc.d_frequency,''),IFNULL(admDis1.USER_NAME,''),IFNULL(admDis2.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursing_use_master mast "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (mast.drug_code = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM  CREATED BY                            
                    + " LEFT JOIN adm_users admCre ON (mast.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM  APPROVED BY                            
                    + " LEFT JOIN adm_users admAppr ON (mast.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 1                          
                    + " LEFT JOIN adm_users admDis1 ON (mast.supply_one_dispensed_by = admDis1.USER_ID) AND admDis1.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 2                            
                    + " LEFT JOIN adm_users admDis2 ON (mast.supply_two_dispensed_by = admDis2.USER_ID) AND admDis2.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    // Where Condition
                    + " where mast.pmi_no ='" + pmino + "' and DATE(mast.master_datetime) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "'; ";

        } else if (viewBy.equalsIgnoreCase("60day")) {

            //                  0           1               2               3                              4                                                 5                                    
            sql = "SELECT mast.pmi_no,mast.hfc_cd,mast.episode_date,mast.encounter_date,TIME_FORMAT(TIME(mast.master_datetime),'%r'),DATE_FORMAT(DATE(mast.master_datetime),'%d/%m/%Y'), "
                    //                 6                                         7                                              8                                               9                                                
                    + " TIME_FORMAT(TIME(mast.start_date),'%r'),DATE_FORMAT(DATE(mast.start_date),'%d/%m/%Y'),TIME_FORMAT(TIME(mast.end_date),'%r'),DATE_FORMAT(DATE(mast.end_date),'%d/%m/%Y'),"
                    //        10                11              12                        13                   14                    15               16                            17                                   
                    + " mast.drug_code,mast.supply_one,mast.supply_one_dispensed_by,mast.supply_two,mast.supply_two_dispensed_by,mast.approved_by,mast.status,TIME_FORMAT(TIME(mast.master_datetime),'%H:%i'), "
                    //                      18                                      19                              20                          21                          22                      23
                    + " TIME_FORMAT(TIME(mast.start_date),'%H:%i'),TIME_FORMAT(TIME(mast.end_date),'%H:%i'),IFNULL(mdc.d_trade_name,''),IFNULL(admAppr.USER_NAME,''),mast.master_datetime,IFNULL(mdc.d_strength,''), "
                    //               24                     25                              26                      27                              28                      29
                    + " IFNULL(mdc.d_route_code,''),IFNULL(mdc.d_form_code,''),IFNULL(mdc.d_frequency,''),IFNULL(admDis1.USER_NAME,''),IFNULL(admDis2.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursing_use_master mast "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (mast.drug_code = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM  CREATED BY                            
                    + " LEFT JOIN adm_users admCre ON (mast.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM  APPROVED BY                            
                    + " LEFT JOIN adm_users admAppr ON (mast.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 1                          
                    + " LEFT JOIN adm_users admDis1 ON (mast.supply_one_dispensed_by = admDis1.USER_ID) AND admDis1.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 2                            
                    + " LEFT JOIN adm_users admDis2 ON (mast.supply_two_dispensed_by = admDis2.USER_ID) AND admDis2.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    // Where Condition
                    + " where mast.pmi_no ='" + pmino + "' and DATE(mast.master_datetime) between SUBDATE('" + dateTime + "',60) and '" + dateTime + "' ; ";

        } else if (viewBy.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];

            //                  0           1               2               3                              4                                                 5                                    
            sql = "SELECT mast.pmi_no,mast.hfc_cd,mast.episode_date,mast.encounter_date,TIME_FORMAT(TIME(mast.master_datetime),'%r'),DATE_FORMAT(DATE(mast.master_datetime),'%d/%m/%Y'), "
                    //                 6                                         7                                              8                                               9                                                
                    + " TIME_FORMAT(TIME(mast.start_date),'%r'),DATE_FORMAT(DATE(mast.start_date),'%d/%m/%Y'),TIME_FORMAT(TIME(mast.end_date),'%r'),DATE_FORMAT(DATE(mast.end_date),'%d/%m/%Y'),"
                    //        10                11              12                        13                   14                    15               16                            17                                   
                    + " mast.drug_code,mast.supply_one,mast.supply_one_dispensed_by,mast.supply_two,mast.supply_two_dispensed_by,mast.approved_by,mast.status,TIME_FORMAT(TIME(mast.master_datetime),'%H:%i'), "
                    //                      18                                      19                              20                          21                          22                      23
                    + " TIME_FORMAT(TIME(mast.start_date),'%H:%i'),TIME_FORMAT(TIME(mast.end_date),'%H:%i'),IFNULL(mdc.d_trade_name,''),IFNULL(admAppr.USER_NAME,''),mast.master_datetime,IFNULL(mdc.d_strength,''), "
                    //               24                     25                              26                      27                              28                      29
                    + " IFNULL(mdc.d_route_code,''),IFNULL(mdc.d_form_code,''),IFNULL(mdc.d_frequency,''),IFNULL(admDis1.USER_NAME,''),IFNULL(admDis2.USER_NAME,''),IFNULL(admCre.USER_NAME,'') FROM lhr_ong_nursing_use_master mast "
                    //     JOIN MDC                               
                    + " LEFT JOIN pis_mdc2 mdc ON (mast.drug_code = mdc.UD_MDC_CODE) AND mdc.hfc_cd = '" + hfc + "' AND mdc.discipline_cd = '" + dis + "' "
                    //     JOIN ADM  CREATED BY                            
                    + " LEFT JOIN adm_users admCre ON (mast.created_by = admCre.USER_ID) AND admCre.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM  APPROVED BY                            
                    + " LEFT JOIN adm_users admAppr ON (mast.approved_by = admAppr.USER_ID) AND admAppr.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 1                          
                    + " LEFT JOIN adm_users admDis1 ON (mast.supply_one_dispensed_by = admDis1.USER_ID) AND admDis1.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    //     JOIN ADM DIS 2                            
                    + " LEFT JOIN adm_users admDis2 ON (mast.supply_two_dispensed_by = admDis2.USER_ID) AND admDis2.HEALTH_FACILITY_CODE = '" + hfc + "' "
                    // Where Condition
                    + " where mast.pmi_no ='" + pmino + "' and DATE(mast.master_datetime) between '" + startDate + "' and '" + endDate + "'; ";

        }

        data = conn.getData(sql);
        return data;

    }

    public Boolean addNursingUseMaster(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, master_datetime, start_date, end_date, drug_code, supply_one, supply_one_dispensed_by, supply_two, supply_two_dispensed_by, approved_by, status, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        master_datetime = splittedData[4];
        start_date = splittedData[5];
        end_date = splittedData[6];
        drug_code = splittedData[7];
        supply_one = splittedData[8];
        supply_one_dispensed_by = splittedData[9];
        supply_two = splittedData[10];
        supply_two_dispensed_by = splittedData[11];
        approved_by = splittedData[12];
        status = splittedData[13];
        created_by = splittedData[17];
        created_date = splittedData[18];

        String sqlInsert = "INSERT INTO lhr_ong_nursing_use_master "
                + " (pmi_no, hfc_cd, episode_date, encounter_date, master_datetime, start_date, end_date, drug_code, supply_one, supply_one_dispensed_by, supply_two,"
                + " supply_two_dispensed_by, approved_by, status, created_by, created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + master_datetime + "','" + start_date + "','" + end_date + "','" + drug_code + "',"
                + " '" + supply_one + "','" + supply_one_dispensed_by + "','" + supply_two + "','" + supply_two_dispensed_by + "','" + approved_by + "','" + status + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean updateNursingUseMaster(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, master_datetime, start_date, end_date, drug_code, supply_one,
                supply_one_dispensed_by, supply_two, supply_two_dispensed_by;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        master_datetime = splittedData[4];
        start_date = splittedData[5];
        end_date = splittedData[6];
        drug_code = splittedData[7];
        supply_one = splittedData[8];
        supply_one_dispensed_by = splittedData[9];
        supply_two = splittedData[10];
        supply_two_dispensed_by = splittedData[11];

        String sql = " UPDATE lhr_ong_nursing_use_master SET start_date='" + start_date + "',end_date='" + end_date + "',drug_code='" + drug_code + "',"
                + " supply_one='" + supply_one + "',supply_one_dispensed_by='" + supply_one_dispensed_by + "',supply_two='" + supply_two + "',supply_two_dispensed_by='" + supply_two_dispensed_by + "' "
                + " WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "' and master_datetime='" + master_datetime + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

    public Boolean approveNursingUseMasterDetail(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, masDate, userid;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        masDate = splittedData[22];
        userid = splittedData[33];

        String sql = "UPDATE lhr_ong_nursing_use_master SET status = 'Approved' , approved_by = '" + userid + "' WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and episode_date ='" + episode_date + "' and encounter_date='" + encounter_date + "'  and master_datetime='" + masDate + "'";
        String sql2 = "UPDATE lhr_ong_nursing_use_detail SET status = 'Approved' WHERE pmi_no='" + pmi_no + "' and hfc_cd='" + hfc_cd + "' and master_datetime='" + masDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql2);

        return data;

    }

    public Boolean delNursingUseMasterDetail(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];
        String masDate = splitted[22];

        String sql = "DELETE FROM lhr_ong_nursing_use_master WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "' and master_datetime='" + masDate + "'";
        String sql2 = "DELETE FROM lhr_ong_nursing_use_detail WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and master_datetime='" + masDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql2);

        return data;
    }

    public ArrayList<ArrayList<String>> getNursingUseDetail(String datas) {

        ArrayList<ArrayList<String>> data = new ArrayList<ArrayList<String>>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, hfc, masterDate;
        String sql = "";
        pmino = splittedData[0];
        hfc = splittedData[1];
        masterDate = splittedData[2];

        //              0       1       2               3                             4                                    5                        
        sql = "SELECT pmi_no,hfc_cd,episode_date,encounter_date,TIME_FORMAT(TIME(master_datetime),'%r'),DATE_FORMAT(DATE(master_datetime),'%d/%m/%Y'),"
                //              6                                               7                               8                               9                      
                + "TIME_FORMAT(TIME(record_datetime),'%r'),DATE_FORMAT(DATE(record_datetime),'%d/%m/%Y'),record_description,TIME_FORMAT(TIME(master_datetime),'%H:%i'),"
                //              10                                  11              12          13      
                + "TIME_FORMAT(TIME(record_datetime),'%H:%i'),master_datetime,record_datetime,status FROM lhr_ong_nursing_use_detail "
                // Where Condition
                + " where pmi_no ='" + pmino + "' AND hfc_cd ='" + hfc + "' AND master_datetime ='" + masterDate + "'; ";

        data = conn.getData(sql);
        return data;

    }

    public Boolean addNursingUseDetail(String datas) {

        Boolean sql = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, master_datetime, record_datetime, record_description, status, created_by, created_date;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        master_datetime = splittedData[4];
        record_datetime = splittedData[5];
        record_description = splittedData[6];
        status = splittedData[7];
        created_by = splittedData[11];
        created_date = splittedData[12];

        String sqlInsert = "INSERT INTO lhr_ong_nursing_use_detail "
                + " (pmi_no, hfc_cd, episode_date, encounter_date, master_datetime, record_datetime , record_description,status, created_by, created_date)  "
                + " VALUES('" + pmi_no + "','" + hfc_cd + "','" + episode_date + "','" + encounter_date + "','" + master_datetime + "','" + record_datetime + "',"
                + " '" + record_description + "','" + status + "','" + created_by + "','" + created_date + "') ";

        sql = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        return sql;

    }

    public Boolean delNursingUseDetail(String datas) {

        Boolean data = false;
        String splitted[] = datas.split("\\|", -1);
        String pmi = splitted[0];
        String hfc = splitted[1];
        String epDate = splitted[2];
        String enDate = splitted[3];
        String masDate = splitted[11];
        String detDate = splitted[12];

        String sql = "DELETE FROM lhr_ong_nursing_use_detail WHERE pmi_no='" + pmi + "' and hfc_cd='" + hfc + "' and episode_date ='" + epDate + "' and encounter_date='" + enDate + "' and master_datetime='" + masDate + "' and record_datetime='" + detDate + "'";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;
    }

    public Boolean updateNursingUseDetail(String datas) {

        Boolean data = false;
        String splittedData[] = datas.split("\\|", -1);
        String pmi_no, hfc_cd, episode_date, encounter_date, master_datetime, record_datetime, record_description;

        pmi_no = splittedData[0];
        hfc_cd = splittedData[1];
        episode_date = splittedData[2];
        encounter_date = splittedData[3];
        master_datetime = splittedData[4];
        record_datetime = splittedData[5];
        record_description = splittedData[6];

        String sql = " UPDATE lhr_ong_nursing_use_detail SET record_description='" + record_description + "' "
                + " WHERE pmi_no='" + pmi_no + "' AND hfc_cd='" + hfc_cd + "' AND episode_date ='" + episode_date + "' "
                + " AND encounter_date='" + encounter_date + "' AND master_datetime='" + master_datetime + "' "
                + " AND record_datetime='" + record_datetime + "' ";

        data = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        return data;

    }

}
