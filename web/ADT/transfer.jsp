<%-- 
    Document   : transfer
    Created on : 16-Apr-2017, 15:16:21
    Author     : shay
--%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    
    String NewBed = request.getParameter("BedN");
    String NewClass = request.getParameter("WardClassN");
    String NewName = request.getParameter("WardNameN");
    String OldBed = request.getParameter("BedO");
    String OldClass = request.getParameter("WardClassO");
    String OldName = request.getParameter("WardNameO");
    String OldDiscipline = request.getParameter("oldDis");
    String NewDiscipline = request.getParameter("Dis");
    String pmino = request.getParameter("pmino");
    String episode_date = request.getParameter("episode_date");
    String transfer_reason = request.getParameter("TransferReason");
    String status = request.getParameter("status");
    String deposit = request.getParameter("Deposit");
    
    
    String updateBedOld = "update wis_bed_id set bed_status ='Available' where hfc_cd='"+hfc+"' and discipline_cd ='"+OldDiscipline+"' and ward_class_code='"+OldClass+"' and ward_id='"+OldName+"' and bed_id='"+OldBed+"';";
    String updateBedNew = "update wis_bed_id set bed_status ='Occupied' where hfc_cd='"+hfc+"' and discipline_cd ='"+NewDiscipline+"' and ward_class_code='"+NewClass+"' and ward_id='"+NewName+"' and bed_id='"+NewBed+"';";
    String insertHistory = "insert into wis_inpatient_episode_history(pmi_no,episode_date,encounter_date,hfc_cd,ward_class_code,ward_id,bed_id,transfer_reason,inpatient_status,created_by,created_date) values('"+pmino+"','"+episode_date+"',NOW(),'"+hfc+"','"+OldClass+"','"+OldName+"','"+OldBed+"','"+transfer_reason+"','"+status+"','"+id+"',NOW());";
    String updateEpisode = "update wis_inpatient_episode set ward_class_code='"+NewClass+"',ward_id='"+NewName+"',bed_id='"+NewBed+"',deposit_inpatient='"+deposit+"' where hfc_cd='"+hfc+"' and pmi_no='"+pmino+"' and episode_date='"+episode_date+"';";
    
    String combine = updateBedOld + updateBedNew + insertHistory + updateEpisode;
    
    Boolean sql = rmic.setQuerySQL(conn.HOST, conn.PORT, updateBedOld);
    Boolean sql1 = rmic.setQuerySQL(conn.HOST, conn.PORT, updateBedNew);
    Boolean sql2 = rmic.setQuerySQL(conn.HOST, conn.PORT, insertHistory);
    Boolean sql3 = rmic.setQuerySQL(conn.HOST, conn.PORT, updateEpisode);
    if(sql == true && sql1 ==true && sql2 ==true && sql3 ==true){
        out.print("success");
    }else{
        out.print("fail");
        out.print(combine);
        
    }
%>
