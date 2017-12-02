<%-- 
    Document   : transfer
    Created on : 16-Apr-2017, 15:16:21
    Author     : shay
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ADT_helper.ADT_EHRMessenger"%>
<%@page import="ADT_helper.OrderMaster"%>
<%@page import="java.util.ArrayList"%>
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
    String subO = request.getParameter("subO");
    String OldBed = request.getParameter("BedO");
    String OldClass = request.getParameter("WardClassO");
    String OldName = request.getParameter("WardNameO");
    String OldDiscipline = request.getParameter("oldDis");
    String NewDiscipline = request.getParameter("Dis");
    String pmino = request.getParameter("pmino");
    String episode_date = request.getParameter("episode_date");
    String transfer_reason = request.getParameter("TransferReason");
    String status = "0"; //request.getParameter("status");
    String deposit = request.getParameter("Deposit");
    String qName = request.getParameter("qName");
    String preStartDate = request.getParameter("preStartDate");
    
    preStartDate = (preStartDate.equalsIgnoreCase("null") || preStartDate==null || preStartDate.isEmpty())? new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) : preStartDate;

    //check whether the selected bed is still Available or not.
    String sqlBedCheck = "Select bed_id FROM wis_bed_id "
            + "where hfc_cd ='" + hfc + "' and discipline_cd ='" + NewDiscipline + "' and bed_id ='" + NewBed + "' AND ward_id='" + NewName + "' AND bed_status='Available';";
    ArrayList<ArrayList<String>> arrBedCheck = conn.getData(sqlBedCheck);
    if (arrBedCheck.size() < 1) {
        //... the bed has been taken. Abort process....
        out.print("taken");
        return;
    }

    String updateBedOld = "update wis_bed_id set bed_status ='Available' where hfc_cd='" + hfc + "' and discipline_cd ='" + OldDiscipline + "' and ward_class_code='" + OldClass + "' and ward_id='" + OldName + "' and bed_id='" + OldBed + "';";

    String updateBedNew = "update wis_bed_id set bed_status ='Occupied' where hfc_cd='" + hfc + "' and discipline_cd ='" + NewDiscipline + "' and ward_class_code='" + NewClass + "' and ward_id='" + NewName + "' and bed_id='" + NewBed + "';";

    String insertHistory = "insert into wis_inpatient_episode_history(pmi_no,episode_date,encounter_date,hfc_cd,ward_class_code,ward_id,bed_id,transfer_reason,inpatient_status,created_by,created_date, subdiscipline_cd, discipline_cd, startDate, endDate) "
            + "values('" + pmino + "','" + episode_date + "',NOW(),'" + hfc + "','" + OldClass + "','" + OldName + "','" + OldBed + "','" + transfer_reason + "','" + status + "','" + id + "',NOW(),'" + subO + "', '" + OldDiscipline + "', '"+preStartDate+"', now());";

    String updateEpisode = "update wis_inpatient_episode set ward_class_code='" + NewClass + "',ward_id='" + NewName + "',bed_id='" + NewBed + "',deposit_inpatient='" + deposit + "', startDate=now() where hfc_cd='" + hfc + "' and pmi_no='" + pmino + "' and episode_date='" + episode_date + "';";

    String combine = updateBedOld + updateBedNew + insertHistory + updateEpisode;

    Boolean sql = rmic.setQuerySQL(conn.HOST, conn.PORT, updateBedOld);
    Boolean sql1 = rmic.setQuerySQL(conn.HOST, conn.PORT, updateBedNew);
    Boolean sql2 = rmic.setQuerySQL(conn.HOST, conn.PORT, insertHistory);
    Boolean sql3 = rmic.setQuerySQL(conn.HOST, conn.PORT, updateEpisode);
    if (sql == true && sql1 == true && sql2 == true && sql3 == true) {
        out.print("success");
        //update pms_patient_queue if different ward...
        if (!NewName.equals(OldName)) {
            String sqlQue ="UPDATE pms_patient_queue set queue_name='"+qName+"', discipline_cd='"+NewDiscipline+"', subdiscipline_cd='"+subO+"' "
                    + "WHERE hfc_cd='"+hfc+"' AND discipline_cd='"+OldDiscipline+"' AND subdiscipline_cd='"+subO+"' AND pmi_no='"+pmino+"' "
                    + "AND queue_type='FY' AND patient_category='003' AND status NOT IN ('1', '6');";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlQue);
        }

        //bill the deposit
        //check if the patient is transfer within same ward or not.
        //if different ward then we bill the deposit
//        if (!NewName.equals(OldName)) {
//
//            OrderMaster om = new OrderMaster();
//            String orderNo = om.getDepositOrderNo();
//            
//            String encounterDate= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
//            
//             ADT_EHRMessenger ehr = new ADT_EHRMessenger(id, hfc, NewDiscipline, sub, pmino, orderNo, episode_date, encounterDate, encounterDate);
//            //send deposit to bill as negative value...
//            ehr.sendWardDeposit(NewClass+":"+NewName, qname, "-"+Deposit);
//
//        }
    } else {
        out.print("fail");
        if (!sql) {
            out.print(updateBedOld);
        }
        if (!sql1) {
            out.print(updateBedNew);
        }
        if (!sql2) {
            out.print(insertHistory);
        }
        if (!sql3) {
            out.print(updateEpisode);
        }
        //out.print(combine);

    }
%>
