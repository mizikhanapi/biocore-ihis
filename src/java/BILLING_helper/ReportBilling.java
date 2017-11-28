/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BILLING_helper;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author Shammugam
 */
public class ReportBilling {

    public static ArrayList<Integer> getRange() {

        // Creating Format Date And Year
        DateTimeFormatter formatYear = DateTimeFormatter.ofPattern("yyyy");
        LocalDateTime now = LocalDateTime.now();

        // Creating Cur Year And Converting to End Year
        String currentYear = formatYear.format(now);
        int endYear = Integer.parseInt(currentYear);

        // Creating Start Year
        int startYear = endYear - 10;

        // Assin Variable To Do For Loop
        int cur = endYear;
        int stop = startYear;

        // Array And For Loop
        ArrayList<Integer> rangeOfYear = new ArrayList<Integer>();

        while (cur >= stop) {
            rangeOfYear.add(cur--);
        }
        
        return rangeOfYear;
    }

}
