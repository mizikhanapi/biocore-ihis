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
public class PeriksaString {
    
    public boolean adaPipe(String[] katas){
        for(String kata:katas){
            try{
                if(kata.contains("|")){
                    return true;
                }
            }catch(Exception e){
                
            }
        }
        
        return false;
    }
    
    public static void main(String args[]){
        String[] katas = {"ayam", "alababu"};
        PeriksaString ps = new PeriksaString();
        String msg="Clean";
        if(ps.adaPipe(katas)){
            msg="Ada pipe woi";
        }
        
        System.out.println(msg);
    }
    
}
