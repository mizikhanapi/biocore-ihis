<%-- 
    Document   : registerqueue
    Created on : Jan 13, 2017, 10:53:48 AM
    Author     : shay
--%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String now = request.getParameter("now");
    String pmi = request.getParameter("pmi");
    String epiDate = request.getParameter("epiDate");
    String name = request.getParameter("name");
    String newic = request.getParameter("newic");
    String oldic = request.getParameter("oldic");
    String typeId = request.getParameter("typeId");
    String idNo = request.getParameter("idNo");
    String rnNo = request.getParameter("rnNo");
    String patCatCode = request.getParameter("patCatCode");
    String visTyCode = request.getParameter("visTyCode");
    String emTy = request.getParameter("emTy");
    String eliCatCode = request.getParameter("eliCatCode");
    String eliTyCode = request.getParameter("eliTyCode");
    String disCode = request.getParameter("disCode");
    String subDiscode = request.getParameter("subDiscode");
    String consultRoom = request.getParameter("consultRoom");
    String comQueue = request.getParameter("comQueue");
    String doctor = request.getParameter("doctor");
    String prioGruCode = request.getParameter("prioGruCode");
    String commDis = request.getParameter("commDis");
    String polCase = request.getParameter("polCase");
    String natuDisasCode = request.getParameter("natuDisasCode");
    String docTy = request.getParameter("docTy");
    String guardInd = request.getParameter("guardInd");
    String referNo = request.getParameter("referNo");
    String gruGuard = request.getParameter("gruGuard");
    String glExpDate = request.getParameter("glExpDate");
    String epiTime = request.getParameter("epiTime");
    String stat = request.getParameter("stat");
    String hfc = request.getParameter("hfc");
    String comTy = request.getParameter("comTy");
    String createdBy = request.getParameter("createdBy");
    String queueSql = "";
    String insertPatientQueue = "";
    String queue_name1 = request.getParameter("queue");
    String docID = request.getParameter("docID");
    int queue_now = 0;
    int newQueueNo = 0;
    String roomNo="";

    String insertEpisode="";

    //String testInsert = "insert into pms_episode(pmi_no)values('"+pmi+"')";
    String isAlreadyRegister = "select pmi_no from pms_episode where pmi_no = '" + pmi + "' and (status = '5' or status = '0' or status = '2') and episode_date like '%" + now + "%';";
    ArrayList<ArrayList<String>> alreadyRegis = conn.getData(isAlreadyRegister);
    
    String sqlRoom = "select room_no from adm_users where user_id='"+docID+"'";
    ArrayList<ArrayList<String>> dataRoom = conn.getData(sqlRoom);
    if(dataRoom.size()>0){
        roomNo = dataRoom.get(0).get(0);
    }else{
        roomNo = "";
    }
    
    
    if (alreadyRegis.size() > 0) {
        out.print("already");
//out.print(queue_now);
    } else {
        String findQueueNo = "select last_queue_no from pms_last_queue_no where hfc_cd ='" + hfc + "' and queue_name ='" + queue_name1 + "' and episode_date like '%" + now + "%';";
        ArrayList<ArrayList<String>> numberQueue = conn.getData(findQueueNo);
        if (numberQueue.size() < 1) {
            queueSql = "insert into pms_last_queue_no(hfc_cd,queue_name,episode_date,last_queue_no,created_by,created_date)values('" + hfc + "','" + queue_name1 + "','" + epiDate + "','1','"+createdBy+"',NOW());";
            newQueueNo = queue_now + 1;
        } else {
            queue_now = Integer.valueOf(numberQueue.get(0).get(0));
            newQueueNo = queue_now + 1;
            queueSql = "update pms_last_queue_no set last_queue_no='" + newQueueNo + "' where hfc_cd='" + hfc + "' and queue_name ='" + queue_name1 + "' and episode_date like '%" + now + "%' ;";
        }
        insertPatientQueue = "insert into pms_patient_queue(hfc_cd,queue_name,episode_date,user_id,pmi_no,queue_no,queue_type,status,patient_category,created_by,created_date)values('" + hfc + "','" + queue_name1 + "','" + epiDate + "','" + docID + "','" + pmi + "','" + newQueueNo + "','" + comTy + "','0','001','"+createdBy+"',NOW());";
        insertEpisode = "INSERT INTO pms_episode(PMI_NO,EPISODE_DATE,NAME,NEW_IC_NO,OLD_IC_NO,ID_TYPE,ID_NO,RN_NO,PATIENT_CATEGORY_CODE,VISIT_TYPE_CODE,EMERGENCY_TYPE_CODE," + "ELIGIBILITY_CATEGORY_CODE,ELIGIBILITY_TYPE_CODE,DISCIPLINE_CODE,SUBDISCIPLINE_CODE,CONSULTATION_ROOM,COMMON_QUEUE,DOCTOR,PRIORITY_GROUP_CODE,POLICE_CASE,COMMUNICABLE_DISEASE_CODE,NATURAL_DISASTER_CODE,DOC_TYPE,GUARDIAN_IND,REFERENCE_NO,GROUP_GUARDIAN,GL_EXPIRY_DATE,EPISODE_TIME,STATUS,HEALTH_FACILITY_CODE,queue_type,queue_name,queue_no)"
            + "VALUES ('" + pmi + "','" + epiDate + "','" + name + "','" + newic + "','" + oldic + "','" + typeId + "','" + idNo + "','" + rnNo + "','" + patCatCode + "','" + visTyCode + "','" + emTy + "','" + eliCatCode + "','" + eliTyCode + "','" + disCode + "','" + subDiscode + "','" + roomNo + "','" + queue_name1 + "','" + docID + "','" + prioGruCode + "','" + polCase + "','" + commDis + "','" + natuDisasCode + "','" + docTy + "','" + guardInd + "','" + referNo + "','" + gruGuard + "','" + glExpDate + "','" + epiTime + "','" + stat + "','" + hfc + "','"+comTy+"','"+comQueue+"','"+newQueueNo+"');";

        rmic.setQuerySQL(conn.HOST, conn.PORT, insertEpisode);
        rmic.setQuerySQL(conn.HOST, conn.PORT, insertPatientQueue);
        rmic.setQuerySQL(conn.HOST, conn.PORT, queueSql);
        out.print("Success");
        //out.print(queueSql);
//out.print(insertEpisode);
//out.print(insertEpisode);
    }

%>
