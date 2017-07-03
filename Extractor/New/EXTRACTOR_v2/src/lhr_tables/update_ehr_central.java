package lhr_tables;

import Process.MainRetrieval;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;
import main.RMIConnector;
import Config_Pack.Config;

public class update_ehr_central {

    Date datenow = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
    boolean update_ehr_central_boolean = false;
    String Centre_Code = "";
    String Central_Code = "";
    RMIConnector rc = new RMIConnector();

    public void update_status(String centralCD) {
        

        String sql_update_ehr_central = "UPDATE `ehr_central` SET `STATUS` = '3' WHERE `ehr_central`.`central_code` = '" + centralCD + "'"; // Update patient status to 3 by using CENTRAL_CODE unique column data.
        update_ehr_central_boolean = rc.setQuerySQL(Config.ipAddressServer, Config.portServer, sql_update_ehr_central);

        if (update_ehr_central_boolean == true) {
            System.out.println("Done.");
        } else {
            System.out.println("False.");
        }

    }

}
