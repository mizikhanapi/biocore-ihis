/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.ArrayList;

/**
 *
 * @author shay
 */
public class PDI2 {
    private String row;
    private ArrayList<ArrayList<String>> value;
    static int count;
    
    public PDI2(){
        count++;
    }
    
    public int getCount(){
        return count;
    }
    
    public void setRow(String row){
        this.row = row;
    }
    
    public String getRow(){
        return row;
    }
    
    public void setValue(ArrayList<ArrayList<String>> value){
        this.value = value;
    }
    
    public ArrayList<ArrayList<String>> getValue(){
        return value;
    }
}
