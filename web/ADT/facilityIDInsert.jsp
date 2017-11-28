<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String wclass, wid, wdiscipline, wwardname, wcitizenrates, wcitizendeposit, wcitizendiscount, wnoncitizenrates, wnoncitizendeposit,
            wnoncitizendiscount, wpensionerdeposit, wpensionerdiscount, wpensionerrates, wnobed, wbathroom, wtoilet, wtelevision, wtelephone, wstatus;
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String sub = request.getParameter("sub");

    String createdBy = request.getParameter("createdBy");

    wclass = request.getParameter("WardClass");
    wid = request.getParameter("WardID");
    wdiscipline = request.getParameter("Dis");
    wwardname = request.getParameter("WardName");
    wcitizenrates = request.getParameter("CitizenRates");
    wcitizendeposit = request.getParameter("CitizenDeposit");
    wcitizendiscount = request.getParameter("CitizenDiscount");
    wnoncitizenrates = request.getParameter("NonCitizenRates");
    wnoncitizendeposit = request.getParameter("NonCitizenDeposit");
    wnoncitizendiscount = request.getParameter("NonCitizenDiscount");
    wpensionerrates = request.getParameter("PensionerRates");
    wpensionerdiscount = request.getParameter("PensionerDiscount");
    wpensionerdeposit = request.getParameter("PensionerDeposit");
    wnobed = request.getParameter("NoOfBed");
    wbathroom = request.getParameter("bathroom");
    wtoilet = request.getParameter("toilet");
    wtelevision = request.getParameter("television");
    wtelephone = request.getParameter("telephone");
    wstatus = request.getParameter("status");
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);
    
    // ward name and id must be unique because pms_queue_name is using ward name as it key.
    //ward id unique in one hfc
    //ward_name unique in one hfc

    String sqlCheck = "SELECT ward_id from wis_ward_name WHERE ward_id = '" + wid + "' AND hfc_cd='"+hfc+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    String sqlCheckName = "SELECT ward_id from wis_ward_name WHERE ward_name = '" + wwardname + "' AND hfc_cd='"+hfc+"' AND discipline_cd='"+wdiscipline+"'  LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicateName = conn.getData(sqlCheckName);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    }
    else if(duplicateName.size()>0){
        out.print("name");
    }
    else {

        String sqlInsert = "INSERT INTO wis_ward_name (ward_class_code, hfc_cd, ward_id, discipline_cd, ward_name, subdiscipline_cd,"
                + "citizen_room_cost, citizen_deposit, citizen_discount,non_citizen_room_cost,non_citizen_deposit, non_citizen_discount, pensioner_deposit, pensioner_room_cost, pensioner_discount, "
                + "no_of_bed, attach_bathroom_tiolet,attach_toilet, include_television, include_telephone, ward_status, created_by, created_date) "
                + "VALUES ('" + wclass + "','" + hfc + "','" + wid + "','" + wdiscipline + "','" + wwardname + "','" + sub + "',"
                + "'" + wcitizenrates + "','" + wcitizendeposit + "','" + wcitizendiscount + "','" + wnoncitizenrates + "','" + wnoncitizendeposit + "','" + wnoncitizendiscount + "','" + wpensionerdeposit + "','" + wpensionerrates + "','" + wpensionerdiscount + "',"
                + "'" + wnobed + "','" + wbathroom + "','" + wtoilet + "','" + wtelevision + "','" + wtelephone + "','" + wstatus + "','" + createdBy + "', now())";
        //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
            String checkData = "select queue_type from pms_queue_name where queue_type='FY' and queue_name='"+wwardname+"' and hfc_cd='"+hfc+"' and discipline_code='"+wdiscipline+"'";
            ArrayList<ArrayList<String>> arrCheck = conn.getData(checkData);
            
            //create queue if queue does not exist;
            if(arrCheck.size()<1){
                String sqlCreateQueue = "insert into pms_queue_name( queue_type,queue_name,queue_description,user_id,quota,status,created_by,created_date,hfc_cd,discipline_code,subdiscipline_code,initial_queue_no) "
                        + "values('FY','"+wwardname+"','-','"+createdBy+"','"+wnobed+"','Active','"+createdBy+"',NOW(),'"+hfc+"','"+wdiscipline+"','"+sub+"','99000');";
                
                rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCreateQueue);
            }
            
//            create base hospital charge, deposit, discount...
               String sqlCharge="", sqlDeposit="", sqlDiscount="", sqlHead="";
               
               sqlHead="INSERT INTO wis_hospital_charges(hfc_cd, discipline_cd, subdiscipline_cd, ward_class_code, ward_id, eligibility_sources_cd, eligibility_type_cd, charges_type, charges_fees, created_date, created_by) ";
               
                //create charge, deposit, discount for sosco-sosco
               sqlCharge= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '004', '004-001', '002', '"+wcitizenrates+"', now(), '"+createdBy+"' );";
               sqlDeposit= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '004', '004-001', '001', '"+wcitizendeposit+"', now(), '"+createdBy+"' );";
               sqlDiscount= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '004', '004-001', '004', '"+wcitizendiscount+"', now(), '"+createdBy+"' );";
               
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCharge);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDeposit);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDiscount);
               
               
               //create charge, deposit, discount for sosco-pensioner
               sqlCharge= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '004', '004-002', '002', '"+wpensionerrates+"', now(), '"+createdBy+"' );";
               sqlDeposit= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '004', '004-002', '001', '"+wpensionerdeposit+"', now(), '"+createdBy+"' );";
               sqlDiscount= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '004', '004-002', '004', '"+wpensionerdiscount+"', now(), '"+createdBy+"' );";
               
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCharge);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDeposit);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDiscount);
               
               
               //create charge, deposit, discount for private-citizen
               sqlCharge= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '002', '002-002', '002', '"+wcitizenrates+"', now(), '"+createdBy+"' );";
               sqlDeposit= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '002', '002-002', '001', '"+wcitizendeposit+"', now(), '"+createdBy+"' );";
               sqlDiscount= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '002', '002-002', '004', '"+wcitizendiscount+"', now(), '"+createdBy+"' );";
               
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCharge);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDeposit);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDiscount);
               
               
               //create charge, deposit, discount for private-nonCitizen
               sqlCharge= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '002', '002-001', '002', '"+wnoncitizenrates+"', now(), '"+createdBy+"' );";
               sqlDeposit= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '002', '002-001', '001', '"+wnoncitizendeposit+"', now(), '"+createdBy+"' );";
               sqlDiscount= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '002', '002-001', '004', '"+wnoncitizendiscount+"', now(), '"+createdBy+"' );";
               
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCharge);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDeposit);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDiscount);
               
               
               //create charge, deposit, discount for government-staff
               sqlCharge= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-002', '002', '"+wcitizenrates+"', now(), '"+createdBy+"' );";
               sqlDeposit= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-002', '001', '"+wcitizendeposit+"', now(), '"+createdBy+"' );";
               sqlDiscount= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-002', '004', '"+wcitizendiscount+"', now(), '"+createdBy+"' );";
               
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCharge);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDeposit);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDiscount);
               
               
               //create charge, deposit, discount for government-student
               sqlCharge= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-001', '002', '"+wcitizenrates+"', now(), '"+createdBy+"' );";
               sqlDeposit= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-001', '001', '"+wcitizendeposit+"', now(), '"+createdBy+"' );";
               sqlDiscount= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-001', '004', '"+wcitizendiscount+"', now(), '"+createdBy+"' );";
               
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCharge);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDeposit);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDiscount);
               
               
               //create charge, deposit, discount for government-pensioner
               sqlCharge= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-003', '002', '"+wpensionerrates+"', now(), '"+createdBy+"' );";
               sqlDeposit= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-003', '001', '"+wpensionerdeposit+"', now(), '"+createdBy+"' );";
               sqlDiscount= sqlHead+"VALUES('"+hfc+"', '"+wdiscipline+"', '"+sub+"', '"+wclass+"', '"+wid+"', '003', '003-003', '004', '"+wpensionerdiscount+"', now(), '"+createdBy+"' );";
               
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlCharge);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDeposit);
               rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDiscount);
               
            
        } else {
            out.print("Failed");
        }
    }


%>