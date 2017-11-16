/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order_tables;

import Bean.PDI;
import bean.MSH2;
import bean.PDI2;
import java.util.ArrayList;
import java.util.Vector;
import separatorv2.SeparatorV2;

/**
 *
 * @author shay
 */
public class PDI_ord {
    
    public PDI lhr_PDI(Vector<PDI2> pdi2, get_ehr_central_data t){
        PDI pdi = new PDI();
        try{
        
        
        int rowsPDI = pdi2.size();
         
        if(rowsPDI > 0){
            
                
                
                String idTy[] = new String[3];
                String race[] = new String[3];
                String sex[] = new String[3];
                String marital[] = new String[3];
                String religion[]= new String[3];
                String nationality[]= new String[3];
                String town[] = new String[3];
                String district[] = new String[3];
                String state[]= new String[3];
                String country[] = new String[3];
                String postcode[]= new String[3];
                
                ArrayList<ArrayList<String>> alPdi = pdi2.get(0).getValue();
                
                pdi.setPmiNo(alPdi.get(1).get(0));
                pdi.setPatientName(alPdi.get(2).get(0));
                pdi.setNewIc(alPdi.get(3).get(0));
                pdi.setOldIC(alPdi.get(4).get(0));
                
                idTy[0] = alPdi.get(5).get(0);
                idTy[1] = alPdi.get(5).get(1);
                idTy[2] = alPdi.get(5).get(2);
                pdi.setIdType(idTy);
                pdi.setIdNo(alPdi.get(6).get(0));
                
                sex[0] = alPdi.get(7).get(0);
                sex[1] = alPdi.get(7).get(1);
                sex[2] = alPdi.get(7).get(2);
                pdi.setIdType(sex);
                pdi.setDob(alPdi.get(8).get(0));
                
                race[0] = alPdi.get(9).get(0);
                race[1] = alPdi.get(9).get(1);
                race[2] = alPdi.get(9).get(2);
                pdi.setRace(race);
                
                marital[0] = alPdi.get(10).get(0);
                marital[1] = alPdi.get(10).get(1);
                marital[2] = alPdi.get(10).get(2);
                pdi.setMaritalStatus(marital);
                
                religion[0] = alPdi.get(11).get(0);
                religion[1] = alPdi.get(11).get(1);
                religion[2] = alPdi.get(11).get(2);
                pdi.setReligion(religion);
                
                nationality[0] = alPdi.get(12).get(0);
                nationality[1] = alPdi.get(12).get(1);
                nationality[2] = alPdi.get(12).get(2);
                pdi.setNationality(nationality);
                
                pdi.setAddress1(alPdi.get(13).get(0));
                pdi.setAddress2(alPdi.get(14).get(0));
                pdi.setAddress3(alPdi.get(15).get(0));
                
                town[0] = alPdi.get(16).get(0);
                town[1] = alPdi.get(16).get(1);
                town[2] = alPdi.get(16).get(2);
                pdi.setTown(town);
                
                district[0] = alPdi.get(17).get(0);
                district[1] = alPdi.get(17).get(1);
                district[2] = alPdi.get(17).get(2);
                pdi.setDistrict(district);
                
                state[0] = alPdi.get(18).get(0);
                state[1] = alPdi.get(18).get(1);
                state[2] = alPdi.get(18).get(2);
                pdi.setState(state);
                
                country[0] = alPdi.get(19).get(0);
                country[1] = alPdi.get(19).get(1);
                country[2] = alPdi.get(19).get(2);
                pdi.setCountry(country);
                
                postcode[0] = alPdi.get(20).get(0);
                postcode[1] = alPdi.get(20).get(1);
                postcode[2] = alPdi.get(20).get(2);
                pdi.setPostcode(postcode);
                
                pdi.setHomePhone(alPdi.get(21).get(0));
                pdi.setOfficePhone(alPdi.get(22).get(0));
                pdi.setMobilePhone(alPdi.get(23).get(0));
                pdi.setEmail(alPdi.get(24).get(0));        
        
        }
        
        
        
        }catch(Exception e){
              e.getStackTrace();
         }
        return pdi;
    }
}
