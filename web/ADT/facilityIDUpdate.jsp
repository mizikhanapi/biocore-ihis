
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    
    
    String wclass, wid, wdiscipline, wwardname, wcitizenrates, wcitizendeposit, wcitizendiscount, wnoncitizenrates, wnoncitizendeposit,
            wnoncitizendiscount, wpensionerdeposit, wpensionerrates, wpensionerdiscount, wnobed, wbathroom, wtoilet, wtelevision, wtelephone, wstatus;
    String hfc = request.getParameter("hfc");
     String dis = request.getParameter("dis");
      String sub = request.getParameter("sub");

    String createdBy = request.getParameter("createdBy");
    
    wclass = request.getParameter("WardClassCode");
    wid = request.getParameter("WardID");
    wdiscipline = request.getParameter("dis");
    wwardname = request.getParameter("WardName");
    wcitizenrates = request.getParameter("CitizenRates");
    wcitizendeposit = request.getParameter("CitizenDeposit");
    wcitizendiscount = request.getParameter("CitizenDiscount");
    wnoncitizenrates = request.getParameter("NonCitizenRates");
    wnoncitizendeposit = request.getParameter("NonCitizenDeposit");
    wnoncitizendiscount = request.getParameter("NonCitizenDiscount");
    wpensionerdeposit = request.getParameter("PensionerDeposit");
    wpensionerdiscount = request.getParameter("PensionerDiscount");
    wpensionerrates = request.getParameter("PensionerRates");
    wnobed = request.getParameter("NoOfBed");
    wbathroom = request.getParameter("bathroom");
    wtoilet = request.getParameter("toilet");
    wtelevision = request.getParameter("televison");
    wtelephone = request.getParameter("telephone");
    wstatus = request.getParameter("status");
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    //check the new ward name, ward name must be unique in a discipline;
    String sqlCheckName = "SELECT ward_id from wis_ward_name WHERE ward_name = '" + wwardname + "' AND hfc_cd='"+hfc+"' AND discipline_cd='"+wdiscipline+"'  LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicateName = conn.getData(sqlCheckName);
    
    //get the original ward name before updating
    String oriWardName ="";
    String getOriWardName = "Select ward_name from wis_ward_name WHERE ward_class_code = '" + wclass + "' AND hfc_cd = '" + hfc + "' AND ward_id = '" + wid + "';";
    
    ArrayList<ArrayList<String>> arrOriName = conn.getData(getOriWardName);
    oriWardName = arrOriName.get(0).get(0);

    
    if(duplicateName.size()>0 && !oriWardName.equals(wwardname)){
        out.print("name");
        return; //abort process...
    }
      
   
    String sqlUpdate = "UPDATE wis_ward_name SET ward_name = '" + wwardname + "',citizen_room_cost = '" + wcitizenrates + "',"
            + " citizen_deposit = '" + wcitizendeposit + "',citizen_discount = '" + wcitizendiscount + "', non_citizen_room_cost = '" + wnoncitizenrates + "',"
            + " non_citizen_deposit = '" + wnoncitizendeposit + "', non_citizen_discount = '" + wnoncitizendiscount + "',"
            + " pensioner_deposit = '" + wpensionerdeposit + "',pensioner_discount = '" + wpensionerdiscount + "', pensioner_room_cost = '" + wpensionerrates + "',"
            + "no_of_bed = '" + wnobed + "', attach_bathroom_tiolet = '" + wbathroom + "',attach_toilet = '" + wtoilet + "',include_television = '" + wtelevision + "',"
            + "include_telephone = '" + wtelephone + "', ward_status = '" + wstatus + "',discipline_cd = '" + wdiscipline + "',"
            + "hfc_cd = '" + hfc + "',subdiscipline_cd = '" + sub + "', created_by = '" + createdBy + "' WHERE ward_class_code = '" + wclass + "' AND hfc_cd = '" + hfc + "' AND ward_id = '" + wid + "';";

         
            
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    if (isUpdate == true) {
        out.print("Success");
        boolean qProceed = false;
        String qStatus = wstatus.equalsIgnoreCase("1")? "Active":"Inactive";
        
        // update pms_queue_name
        String sqlUpdateQ = "update pms_queue_name set queue_name='"+wwardname+"', quota ='"+wnobed+"',status = '"+qStatus+"',created_by ='"+createdBy+"',created_date = NOW(),subdiscipline_code='"+sub+"' "
                + "where queue_type = 'FY' and queue_name='"+oriWardName+"' and hfc_cd='"+hfc+"' and discipline_code='"+dis+"'";
        qProceed=rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateQ);
        
        //update pms_queue_list
        if(qProceed){
            String sqlUpdateQL="update pms_queue_list set queue_name='"+wwardname+"' ,sub_discipline_cd ='" + sub + "',status = '" + qStatus + "',created_by ='" + createdBy + "',created_date=NOW() "
                    + "where queue_type = 'FY' and queue_name='" + oriWardName + "' and hfc_cd='" + hfc + "' and discipline_cd='" + dis + "'";
            qProceed=rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateQL);
        }
        
        //update pms_patient_queue for the queue_name where status not discharge...
        if(qProceed){
            String sqlUpdatePQ="UPDATE pms_patient_queue set queue_name='"+wwardname+"' WHERE hfc_cd='"+hfc+"' AND queue_name='"+oriWardName+"' AND discipline_cd='"+dis+"' AND queue_type='FY' AND patient_category='003' AND status NOT IN('1', '6');";
            qProceed=rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdatePQ);
        }
        
        
    } else {
        out.print("Failed");
//        out.print(sqlUpdate);
    }

%>