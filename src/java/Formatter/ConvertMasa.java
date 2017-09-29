/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Formatter;

/**
 *
 * @author user
 */
public class ConvertMasa {
    
    public int[] convertMinuteToHourMinute(String min){
        int hour=0;
        
        int minute=0;
        
        try{
            minute = Integer.parseInt(min);
        }catch(Exception e){
            e.printStackTrace();
            minute=0;
        }
        
        hour = minute / 60;
        
        minute = minute % 60;
        
        int[] hourMinute = {hour, minute};
        
        return hourMinute; 
    }
    
    public int convertHourMinuteToMinute(String h, String m){
        int minutes = 0;
        
        int intHour = 0, intMin =0;
        
        try{
            intHour = Integer.parseInt(h);
        }catch(Exception e){
            e.printStackTrace();
            intHour =0;
        }
        
        try{
            intMin=Integer.parseInt(m);
        }catch(Exception e){
            e.printStackTrace();
            intMin=0;
        }
        
        minutes = (intHour*60) + intMin;
        
        return minutes;
    }
    
    public int convertHourToMinute(String h){
        int minutes =0;
        
        int intHour = 0;
        
        try{
            intHour = Integer.parseInt(h);
        }catch(Exception e){
            e.printStackTrace();
            intHour=0;
        }
        
        minutes = intHour*60;
        
        return minutes;
    }
}
