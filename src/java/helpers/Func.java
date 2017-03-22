/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author End User
 */
public class Func {
    /**
     * Get today's date format yyyy-MM-dd HH:mm:ss
     * @return 
     */
    public static String getTodayDate() {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(today.getTime());
    }
    
    /**
     * Get today's date format dd/MM/yyyy
     * @return 
     */
    public static String getTodayDate2() {
        Calendar today = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        return dateFormat.format(today.getTime());
    }
    
    /**
     * Get date format 00/00/0000
     * @return 
     */
    public static String getDate(String date) {
        try {
            String str[] = date.split(" ");
            String str2[] = str[0].split("-");
            return str2[2]+"/"+str2[1]+"/"+str2[0];
        } catch (Exception e) {
            return "00/00/0000";
        }
    }
    
    /**
     * Get date format 00/00/0000 00:00:00
     * @return 
     */
    public static String getDateTime(String date) {
        String str[] = date.split(" ");
        String str2[] = str[0].split("-");
        String str3[] = str[1].split(":");
        return str2[2]+"/"+str2[1]+"/"+str2[0]+" "+str3[0]+":"+str3[1]+":"+str3[2];
    }
    
    /**
     * Get date format 00/00/0000
     * @return 
     */
    public static String sqlToDate(String date) {
        String str[] = date.split("-");
        return str[2]+"/"+str[1]+"/"+str[0];
    }
    
    public static boolean isWelderValid(String tarikh, String welddate) {
        boolean stat = false;
        System.out.println("tarikh: "+tarikh);
        System.out.println("welddate: "+welddate);
//        try {
//            int weld_day = Integer.parseInt(date.split("\\/")[0]);
//            int weld_month = Integer.parseInt(date.split("\\/")[1]);
//            int weld_year = Integer.parseInt(date.split("\\/")[2]);
//            String str[] = arini.split(" ");
//            int arini_day = Integer.parseInt(str[0].split("-")[2]);
//            int arini_month = Integer.parseInt(str[0].split("-")[1]);
//            int arini_year = Integer.parseInt(str[0].split("-")[0]);
//            if(arini_year < weld_year) {
//                stat = true;
//            } else if(arini_year == weld_year) {
//                if(arini_month < weld_month) {
//                    stat = true;
//                } else if(arini_month == weld_month) {
//                    if(arini_day <= weld_day) {
//                        stat = true;
//                    } else {
//                        stat = false;
//                    }
//                } else {
//                    stat = false;
//                }
//            } else {
//                stat = false;
//            }
//        } catch (Exception e) {
//            stat = false;
//            e.printStackTrace();
//        }
        try {
            String t2, st = tarikh;
            String t22, st2 = welddate;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = sdf.parse(st);
            Date date2 = sdf2.parse(st2);
            Timestamp timestamp = new Timestamp(date.getTime());
            Timestamp timestamp2 = new Timestamp(date2.getTime());
            t2 = timestamp.toString();
            t22 = timestamp2.toString();
            System.out.println(t2);
            System.out.println(t22);
            System.out.println(timestamp2.getTime() / 1000 - timestamp.getTime() / 1000);
            long saat = timestamp.getTime() / 1000 - timestamp2.getTime() / 1000;
            System.out.println("saat: "+saat);
            if (saat > 0) {
                stat = true;
            } else {
                stat = false;
            }
        } catch (Exception e) {
            stat = false;
            e.printStackTrace();
        }
        return stat;
    }
    
    public static String colorValid(String tarikh, String arini) {
        String stat = "color:#000;";
        try {
            String t2, st = tarikh;
            String t22, st2 = arini;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = sdf.parse(st);
            Date date2 = sdf2.parse(st2);
            Timestamp timestamp = new Timestamp(date.getTime());
            Timestamp timestamp2 = new Timestamp(date2.getTime());
            t2 = timestamp.toString();
            t22 = timestamp2.toString();
            System.out.println(t2);
            System.out.println(t22);
            System.out.println(timestamp2.getTime() / 1000 - timestamp.getTime() / 1000);
            long saat = timestamp.getTime() / 1000 - timestamp2.getTime() / 1000;
            System.out.println("saat: "+saat);
            if (saat > 0) {
                if (saat <= 7776000) {
                    stat = "color:orange;";
                } else {
                    stat = "color:#000;";
                }
            } else {
                stat = "color:#f00;";
            }
        } catch (Exception e) {
            stat = "color:#f00;";
            e.printStackTrace();
        }
        return stat;
    }
}
