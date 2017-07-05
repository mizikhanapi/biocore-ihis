/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.util.ArrayList;
import java.util.Properties;
import main.RMIConnector;
import Config_Pack.Config;

/**
 *
 * @author ASUS
 */
public class Graf {
    
    public ArrayList<Properties> getGrafAll(int type) {
        RMIConnector rc = new RMIConnector();
        String sql1 = "SELECT distinct(cbc.pmi_no), ppb.PATIENT_NAME, count(*) "
                + "FROM lhr_signs cbc "
                + "LEFT JOIN pms_patient_biodata ppb ON cbc.PMI_no = ppb.PMI_NO "
                + "GROUP BY cbc.pmi_no";
        switch (type) {
            case 1:
                sql1 = "SELECT distinct(cbc.pmi_no), ppb.PATIENT_NAME, count(*) "
                + "FROM lhr_signs cbc "
                + "LEFT JOIN pms_patient_biodata ppb ON cbc.PMI_no = ppb.PMI_NO "
                + "GROUP BY cbc.pmi_no";
                break;
            case 2:
                sql1 = "SELECT distinct(cbd.pmi_no), ppb.PATIENT_NAME, count(*) "
                + "FROM lhr_diagnosis cbd "
                + "LEFT JOIN pms_patient_biodata ppb ON cbd.PMI_no = ppb.PMI_NO "
                + "GROUP BY cbd.pmi_no";
                break;
            case 3:
                sql1 = "SELECT distinct(cbd.pmi_no), ppb.PATIENT_NAME, count(*) "
                + "FROM lhr_medication cbd "
                + "LEFT JOIN pms_patient_biodata ppb ON cbd.PMI_no = ppb.PMI_NO "
                + "GROUP BY cbd.pmi_no";
                break;
        }
        ArrayList<ArrayList<String>> data1 = rc.getQuerySQL(Config.ipAddressServer, Config.portServer, sql1);
        ArrayList<Properties> props = new ArrayList<Properties>();
        for (int i = 0; i < data1.size(); i++) {
            Properties prop = new Properties();
            prop.setProperty("x_axis", data1.get(i).get(1));
            prop.setProperty("y_axis", data1.get(i).get(2));
            props.add(prop);
        }
        return props;
    } 
}
