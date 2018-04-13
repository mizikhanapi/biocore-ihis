/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Formatter;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author user
 */
public class FormatTarikh {
    public static String formatDate(String date, String initDateFormat, String endDateFormat) {

        Date initDate;
        String parsedDate="0000-00-00 00:00:00";
        try {
            initDate = new SimpleDateFormat(initDateFormat).parse(date);
            SimpleDateFormat formatter = new SimpleDateFormat(endDateFormat);
            parsedDate = formatter.format(initDate);
        } catch (Exception ex) {
            ex.printStackTrace();
            return "2000-01-01 00:00:00";
        }
       

        return parsedDate;
    }
}
