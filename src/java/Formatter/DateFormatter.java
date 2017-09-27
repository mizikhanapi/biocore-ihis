/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Formatter;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class DateFormatter {

    public static String formatDate(String date, String initDateFormat, String endDateFormat) {

        Date initDate;
        String parsedDate="0000-00-00 00:00:00";
        try {
            initDate = new SimpleDateFormat(initDateFormat).parse(date);
            SimpleDateFormat formatter = new SimpleDateFormat(endDateFormat);
            parsedDate = formatter.format(initDate);
        } catch (Exception ex) {
            ex.printStackTrace();
            return "0000-00-00 00:00:00";
        }
       

        return parsedDate;
    }
   
    
//    public static void main(String []args){
//    
//        String oridate = "02/02/2017"; //03/02/2017
//        
//        String resultDate = null;
//        
//        try {
//            resultDate = DateFormatter.formatDate(oridate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
//        } catch (ParseException ex) {
//            Logger.getLogger(DateFormatter.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//        System.out.println("hasilnya: "+resultDate);
//
//    
//    }

}
