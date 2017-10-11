/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
    Author: Ardhi Surya; rdsurya147@gmail.com; @rdcfc
 */
package OnG_helper;

import Formatter.DateFormatter;
import dBConn.Conn;
import main.RMIConnector;


/**
 *
 * @author user
 */
public class MaternityUnit {
    
    private String theMessage;
    private String epDate;
    private String pmiNo;
    private String hfc_cd;
    private String creator_id;
    private Conn con;
    private RMIConnector rmi;
    
    
    public MaternityUnit(String epDate, String pmiNo, String hfc_cd, String creator_id) {
        this.epDate = epDate;
        this.pmiNo = pmiNo;
        this.hfc_cd = hfc_cd;
        this.creator_id = creator_id;
        this.theMessage="";
        this.con =  new Conn();
        this.rmi = new RMIConnector();
    }
    
    
    
    public String getMessage(){
              
        return theMessage.trim();
    }
    
    public boolean addTherapy(String orderDate, String orderTime, String therapy, String offDate, String offTime, String status){
        
        boolean isSuccess=false;
        
        String realOrderDate ="";
        
        try{
            realOrderDate = DateFormatter.formatDate(orderDate+" "+orderTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms"); 
        }catch(Exception e){
            realOrderDate ="0000-00-00 00:00:00";
        }
                      
                
        if(offDate.equals("")){
                        
            String query="Insert into lhr_ong_maternity_unit(hfc_cd, pmi_no, episode_date, encounter_date, intravenous_therapy, order_date, status, created_by, created_date) "
                + "values('"+hfc_cd+"', '"+pmiNo+"', '"+epDate+"', now(), '"+therapy+"', '"+realOrderDate+"', '"+status+"', '"+creator_id+"', now());";
            
            isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
            
        }
        else{
            String realOffDate = "";
            try{
                realOffDate = DateFormatter.formatDate(offDate+" "+offTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
            }catch(Exception e){
                realOffDate="0000-00-00 00:00:00";
            }
            
            String query="Insert into lhr_ong_maternity_unit(hfc_cd, pmi_no, episode_date, encounter_date, intravenous_therapy, order_date, status, created_by, created_date, completed_date) "
                + "values('"+hfc_cd+"', '"+pmiNo+"', '"+epDate+"', now(), '"+therapy+"', '"+realOrderDate+"', '"+status+"', '"+creator_id+"', now(), '"+realOffDate+"');";
            isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
        }
        
        if(isSuccess)
            theMessage = "success";
        else
            theMessage = "fail";
        
        return isSuccess;
    }
    
    public boolean updateTherapy(String item_id, String orderDate, String orderTime, String therapy, String offDate, String offTime, String status){
        boolean isSuccess=false;
        String realOrderDate="", realOffDate="";
        
        try{
            realOrderDate= DateFormatter.formatDate(orderDate+" "+orderTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
        }catch(Exception e){
            realOrderDate="0000-00-00 00:00:00";
        }
        
        if(offDate.equals("")){
            String query="UPDATE lhr_ong_maternity_unit set intravenous_therapy='"+therapy+"', order_date='"+realOrderDate+"', status='"+status+"' "
                    + "WHERE pmi_no='"+pmiNo+"' and created_date='"+item_id+"';";
            isSuccess= rmi.setQuerySQL(con.HOST, con.PORT, query);
        }
        else{
            
            try{
                realOffDate = DateFormatter.formatDate(offDate+" "+offTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
            }catch(Exception e){
                realOffDate="0000-00-00 00:00:00";
            }
            
            String query="UPDATE lhr_ong_maternity_unit set intravenous_therapy='"+therapy+"', order_date='"+realOrderDate+"', completed_date='"+realOffDate+"', status='"+status+"' "
                    + "WHERE pmi_no='"+pmiNo+"' and created_date='"+item_id+"';";
            
            isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        }
        
        if(isSuccess){
            theMessage="success";
        }
        else{
            theMessage="fail";
        }
        
        return isSuccess;
    }
    
    public boolean deleteTherapy(String item_id){
        boolean isSuccess=false;
        
        String query="DELETE FROM lhr_ong_maternity_unit where pmi_no='"+pmiNo+"' and created_date='"+item_id+"';";
        isSuccess=rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        if(isSuccess){
            theMessage="success";
        }
        else{
            theMessage="fail";
        }
        
        return isSuccess;
    }
    
    public boolean addInvestigation(String orderDate, String orderTime, String investigation, String offDate, String offTime, String status){
        boolean isSuccess=false;
        String realOrderDate ="";
        
        try{
            realOrderDate = DateFormatter.formatDate(orderDate+" "+orderTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms"); 
        }catch(Exception e){
            realOrderDate ="0000-00-00 00:00:00";
        }
                      
                
        if(offDate.equals("")){
                        
            String query="Insert into lhr_ong_maternity_unit(hfc_cd, pmi_no, episode_date, encounter_date, investigation, order_date, status, created_by, created_date) "
                + "values('"+hfc_cd+"', '"+pmiNo+"', '"+epDate+"', now(), '"+investigation+"', '"+realOrderDate+"', '"+status+"', '"+creator_id+"', now());";
            
            isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
            
        }
        else{
            String realOffDate = "";
            try{
                realOffDate = DateFormatter.formatDate(offDate+" "+offTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
            }catch(Exception e){
                realOffDate="0000-00-00 00:00:00";
            }
            
            String query="Insert into lhr_ong_maternity_unit(hfc_cd, pmi_no, episode_date, encounter_date, investigation, order_date, status, created_by, created_date, completed_date) "
                + "values('"+hfc_cd+"', '"+pmiNo+"', '"+epDate+"', now(), '"+investigation+"', '"+realOrderDate+"', '"+status+"', '"+creator_id+"', now(), '"+realOffDate+"');";
            isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
        }
        
        if(isSuccess)
            theMessage = "success";
        else
            theMessage = "fail";
        return isSuccess;
    }
    
    public boolean deleteInvestigation(String item_id){
        boolean isSuccess=false;
        
        String query="DELETE FROM lhr_ong_maternity_unit where pmi_no='"+pmiNo+"' and created_date='"+item_id+"';";
        isSuccess=rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        if(isSuccess){
            theMessage="success";
        }
        else{
            theMessage="fail";
        }
        
        return isSuccess;
    }
    
    public boolean updateInvestigation(String item_id, String orderDate, String orderTime, String investigation, String offDate, String offTime, String status){
        boolean isSuccess=false;
        String realOrderDate="", realOffDate="";
        
        try{
            realOrderDate= DateFormatter.formatDate(orderDate+" "+orderTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
        }catch(Exception e){
            realOrderDate="0000-00-00 00:00:00";
        }
        
        if(offDate.equals("")){
            String query="UPDATE lhr_ong_maternity_unit set investigation='"+investigation+"', order_date='"+realOrderDate+"', status='"+status+"' "
                    + "WHERE pmi_no='"+pmiNo+"' and created_date='"+item_id+"';";
            isSuccess= rmi.setQuerySQL(con.HOST, con.PORT, query);
        }
        else{
            
            try{
                realOffDate = DateFormatter.formatDate(offDate+" "+offTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss.ms");
            }catch(Exception e){
                realOffDate="0000-00-00 00:00:00";
            }
            
            String query="UPDATE lhr_ong_maternity_unit set investigation='"+investigation+"', order_date='"+realOrderDate+"', completed_date='"+realOffDate+"', status='"+status+"' "
                    + "WHERE pmi_no='"+pmiNo+"' and created_date='"+item_id+"';";
            
            isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        }
        
        if(isSuccess){
            theMessage="success";
        }
        else{
            theMessage="fail";
        }
        
        return isSuccess;
    }
    
}
