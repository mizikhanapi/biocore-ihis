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
public class CirculationUtils {

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    public ArrayList<ArrayList<String>> getCirculation(String datas) {
        ArrayList<ArrayList<String>> data = new ArrayList<>();
        String splittedData[] = datas.split("\\|", -1);
        String pmino, dateTime, viewBy, startDate, endDate;
        String sql = "";
        pmino = splittedData[0];
        dateTime = splittedData[1];
        viewBy = splittedData[2];

        if (viewBy.equalsIgnoreCase("today")) {
           
        } else if (viewBy.equalsIgnoreCase("yesterday")) {
          
        } else if (viewBy.equalsIgnoreCase("7day")) {
           
        } else if (viewBy.equalsIgnoreCase("30day")) {
           
        } else if (viewBy.equalsIgnoreCase("60day")) {
           
        } else if (viewBy.equalsIgnoreCase("custom")) {
           
        }

        data = conn.getData(sql);
        return data;
    }

}
