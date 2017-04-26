/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;

/**
 *
 * @author shay
 */
public class SeperateMethod {
    ArrayList<ArrayList<String>> aal = new ArrayList();
       
    public ArrayList<ArrayList<String>> getAal(){
        return aal;
    };
    public void separatePipe(String row){
        String columns[] = row.split("\\|");
        //System.out.println(row);
        for(int i =0;i < columns.length;i++){
            if(columns[i].equalsIgnoreCase(" ")){
                columns[i]="-";
            }
            //System.out.println(columns[i]);
            //System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
            if(columns[i].contains("^")){
                //System.out.println(columns[i]);
                ArrayList<String> al2 = new ArrayList();
               String subColumns[] = columns[i].split("\\^");
                for (String subColumn : subColumns) {
                    //System.out.println(subColumns[j]);
                    al2.add(subColumn);
                    
                }
                aal.add(al2);
               
            }else{
                ArrayList<String> al1 = new ArrayList();
                al1.add(columns[i]);
                aal.add(al1);
            }
            
        }
        //System.out.println(aal.toString());
    }
    
    public void showAAL(){
        System.out.println(aal.size());
        for(int i = 0 ;i<aal.size();i++){
//             System.out.println(aal.get(i));
//             System.out.println(aal.get(i).size());
            for(int j = 0;j<aal.get(i).size();j++){
                System.out.println(aal.get(i).get(j));
                //System.out.println(aal.get(i).size());
            }
            System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        }
    }
}
