/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OnG_helper;

import java.util.Random;
import java.util.ArrayList;
import dBConn.Conn;

/**
 *
 * @author shay
 */
public class TagGen {
    Conn con = new Conn();
    public String genrandom(){
        Random r1 = new Random();
        Random r2 = new Random();
        int Low = 0;
        int High = 9;
        int Result1 = r1.nextInt(High-Low) + Low;
        int Result2;

        do{
            Result2 = r2.nextInt(High-Low) + Low;
        }while(Result2==Result1);
        String randomNumber = String.valueOf(Result1)+ String.valueOf(Result2);
        return randomNumber;
    }
    
    public String genTag(String icmak,String bday){
        String r = genrandom();
        String tagnumber = icmak+bday+r;
        return tagnumber;
    }
    
    public Boolean checkTag(String tag){
        Boolean a = false;
        String checkTag = "SELECT infant_tag_no FROM lhr_ong_infant_birth_record WHERE infant_tag_no='"+tag+"';";
        ArrayList<ArrayList<String>> dataInf = con.getData(checkTag);
        if(dataInf.size() > 0){
            a = false;
        }else if(dataInf.size()< 1){
            a=true;
        }
        return a;
    }
    
    public String mainGen(String data){
         String splittedData[] = data.split("\\|", -1);
         String icmak = splittedData[0];
         String bday = splittedData[1];
         
         String GenTagg;
         Boolean result = false;
         
         do{
             GenTagg = genTag(icmak,bday);
             result = checkTag(GenTagg);
         }while(result == false);
         
         return GenTagg;
    }
}
