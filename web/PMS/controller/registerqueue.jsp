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
<%--<%@page import="Config.connect"%>--%>
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
    String subDis = request.getParameter("subDisCD");
    int queue_now = 0;
    int newQueueNo = 0;
    String roomNo = "";

    String insertEpisode = "";

    String quota = "SELECT count(pmi_no) from pms_episode where date(episode_date) = '" + now + "' and (status = '5' or status = '0' or status = '2');";
    ArrayList<ArrayList<String>> quotaNum = conn.getData(quota);

    String quotaFromQueue = "SELECT quota,initial_queue_no from pms_queue_name where queue_name = '" + queue_name1 + "' and hfc_cd='"+hfc+"' and discipline_code = '"+disCode+"'";
    ArrayList<ArrayList<String>> quotaNumFromQueue = conn.getData(quotaFromQueue);

    //String testInsert = "insert into pms_episode(pmi_no)values('"+pmi+"')";
    String isAlreadyRegister = "select pmi_no from pms_episode where pmi_no = '" + pmi + "' and (status = '5' or status = '0' or status = '2') and date(episode_date) = '" + now + "' and health_facility_code ='"+hfc+"';";
    ArrayList<ArrayList<String>> alreadyRegis = conn.getData(isAlreadyRegister);

    String sqlRoom = "select room_no from adm_users where user_id='" + docID + "' and health_facility_code ='"+hfc+"'";
    ArrayList<ArrayList<String>> dataRoom = conn.getData(sqlRoom);
    if (dataRoom.size() > 0) {
        roomNo = dataRoom.get(0).get(0);
    } else {
        roomNo = "";
    }

    if (alreadyRegis.size() > 0) {
        out.print("already");
//out.print(queue_now);
    } else {
        int totalQuota = Integer.parseInt(quotaNum.get(0).get(0));
        int totalFromQuota = Integer.parseInt(quotaNumFromQueue.get(0).get(0));
        int initialQueueNumber = Integer.parseInt(quotaNumFromQueue.get(0).get(1));
        if (totalQuota <= totalFromQuota) {
            String findQueueNo = "select last_queue_no from pms_last_queue_no where hfc_cd ='" + hfc + "' and queue_name ='" + queue_name1 + "' and episode_date like '%" + now + "%' and discipline_cd = '"+disCode+"';";
            ArrayList<ArrayList<String>> numberQueue = conn.getData(findQueueNo);
            if (numberQueue.size() < 1) {
                newQueueNo = initialQueueNumber + 1;
                queueSql = "insert into pms_last_queue_no(hfc_cd,queue_name,episode_date,last_queue_no,created_by,created_date,discipline_cd,subdiscipline_cd)values('" + hfc + "','" + queue_name1 + "','" + epiDate + "','"+newQueueNo+"','" + createdBy + "',NOW(),'"+disCode+"','"+subDis+"');";
            } else {
                queue_now = Integer.valueOf(numberQueue.get(0).get(0));
                newQueueNo = queue_now + 1;
                queueSql = "update pms_last_queue_no set last_queue_no='" + newQueueNo + "' where hfc_cd='" + hfc + "' and queue_name ='" + queue_name1 + "' and episode_date like '%" + now + "%' and discipline_cd = '"+disCode+"';";
            }
            
            // changes made here to include discipline and subdiscipline into pms_patient_queue
            insertPatientQueue = "insert into pms_patient_queue(hfc_cd,queue_name,episode_date,pmi_no,queue_no,queue_type,status,patient_category,created_by,created_date, discipline_cd, subdiscipline_cd) "
                    + "values('" + hfc + "','" + queue_name1 + "','" + epiDate + "','" + pmi + "','" + newQueueNo + "','" + comTy + "','0','001','" + createdBy + "',NOW(), '"+disCode+"', '"+subDis+"');";
            
            insertEpisode = "INSERT INTO pms_episode(PMI_NO,EPISODE_DATE,NAME,NEW_IC_NO,OLD_IC_NO,ID_TYPE,ID_NO,RN_NO,PATIENT_CATEGORY_CODE,VISIT_TYPE_CODE,EMERGENCY_TYPE_CODE," + "ELIGIBILITY_CATEGORY_CODE,ELIGIBILITY_TYPE_CODE,DISCIPLINE_CODE,SUBDISCIPLINE_CODE,COMMON_QUEUE,PRIORITY_GROUP_CODE,POLICE_CASE,COMMUNICABLE_DISEASE_CODE,NATURAL_DISASTER_CODE,DOC_TYPE,GUARDIAN_IND,REFERENCE_NO,GROUP_GUARDIAN,GL_EXPIRY_DATE,EPISODE_TIME,STATUS,HEALTH_FACILITY_CODE,queue_type,queue_name,queue_no)"
                    + "VALUES ('" + pmi + "','" + epiDate + "','" + name + "','" + newic + "','" + oldic + "','" + typeId + "','" + idNo + "','" + rnNo + "','" + patCatCode + "','" + visTyCode + "','" + emTy + "','" + eliCatCode + "','" + eliTyCode + "','" + disCode + "','" + subDis + "','" + queue_name1 + "','" + prioGruCode + "','" + polCase + "','" + commDis + "','" + natuDisasCode + "','" + docTy + "','" + guardInd + "','" + referNo + "','" + gruGuard + "','" + glExpDate + "','" + epiTime + "','" + stat + "','" + hfc + "','" + comTy + "','" + comQueue + "','" + newQueueNo + "');";

            rmic.setQuerySQL(conn.HOST, conn.PORT, insertEpisode);
            rmic.setQuerySQL(conn.HOST, conn.PORT, insertPatientQueue);
            rmic.setQuerySQL(conn.HOST, conn.PORT, queueSql);
            out.print("Success|"+newQueueNo+"|"+queue_now+"|"+epiDate);
        }else if(totalQuota > totalFromQuota){
            out.print("outQuota");
        }

        //out.print(queueSql);
//out.print(insertEpisode);
//out.print(insertEpisode);
    }

%>
