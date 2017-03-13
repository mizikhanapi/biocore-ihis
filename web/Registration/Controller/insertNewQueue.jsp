<%@page import ="dBConn.Conn"%>
<%@page import ="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@include  file="Printer.jsp"%>
<%
    RMIConnector rmic = new RMIConnector();
   Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
   
    String userIC, userID, pmi, userName, queueType, selectedQueue, today, now, serviceRoom , comQueue;
    
    now = request.getParameter("now");
    today = request.getParameter("today");
    userIC = request.getParameter("userIC");
    userID = request.getParameter("userID");
    pmi = request.getParameter("pmiNo");
    userName = request.getParameter("userName");
    queueType = request.getParameter("queueType");
    selectedQueue = request.getParameter("selectedQueue");
    String hfc = session.getAttribute("HFC").toString();
    
     
    
    
    String visTyCode = request.getParameter("visTyCode");
    String prioGruCode = request.getParameter("prioGruCode");
    
    String epiDate = today;
    String epiTime = now;
    String queueSql = "";
    String insertPatientQueue = "";
    String insertEpisode="";
    String status="0";
    int queue_now = 0;
    int newQueueNo = 0;
     
    
    serviceRoom = "";
    comQueue = "";
    
    if (queueType.equals("CM"))
    {
        comQueue = selectedQueue;
        out.print("          CM            ");
    }
    else if (queueType.equals("FY"))
    {
        serviceRoom = selectedQueue;
        out.print("          FY            ");
    }
    
     String isAlreadyRegister = "select pmi_no from pms_episode where pmi_no = '" + pmi + "' and (status like '%Consult%' or status = '0' or status = '2' or status like '%Second Opinion%') and episode_date like '%" + today + "%';";
    ArrayList<ArrayList<String>> alreadyRegis = conn.getData(isAlreadyRegister);

    if (alreadyRegis.size() > 0) {
        out.print("already");
        //out.print(queue_now);
    } else {
        String findQueueNo = "select last_queue_no from pms_last_queue_no where hfc_cd ='" + hfc + "' and queue_name ='" + selectedQueue + "' and episode_date like '%" + today + "%';";
        ArrayList<ArrayList<String>> numberQueue = conn.getData(findQueueNo);
        if (numberQueue.size() < 1) {
            queueSql = "insert into pms_last_queue_no(hfc_cd,queue_name,episode_date,last_queue_no)values('" + hfc + "','" + selectedQueue + "','" + epiDate + "','1');";
            newQueueNo = queue_now + 1;
            
        out.print("          insert into pms_last_queue_no            ");
        } else {
            
        out.print("          update into pms_last_queue_no            ");
            queue_now = Integer.valueOf(numberQueue.get(0).get(0));
            out.print("          "+queue_now+"            ");
            newQueueNo = queue_now + 1;
            queueSql = "update pms_last_queue_no set last_queue_no='" + newQueueNo + "' where hfc_cd='" + hfc + "' and queue_name ='" + selectedQueue + "' and episode_date like '%" + today + "%' ;";
        }
        insertPatientQueue = "insert into pms_patient_queue(hfc_cd,queue_name,episode_date,pmi_no,queue_no,queue_type)values('" + hfc + "','" + selectedQueue + "','" + epiDate+" "+epiTime + "','" + pmi + "','" + newQueueNo + "','" + queueType + "');";
        insertEpisode = "INSERT INTO pms_episode(PMI_NO,EPISODE_DATE,NAME,NEW_IC_NO,ID_NO,CONSULTATION_ROOM,COMMON_QUEUE,STATUS,HEALTH_FACILITY_CODE,queue_type,queue_name,queue_no)"
            + "VALUES ('" + pmi + "','" + epiDate+" "+epiTime + "','" + userName + "','" + userIC + "','" + userID + "','" + serviceRoom + "','" + comQueue + "','" + status + "','" + hfc + "','"+queueType+"','"+selectedQueue+"','"+newQueueNo+"');";

        rmic.setQuerySQL(conn.HOST, conn.PORT, insertEpisode);
        rmic.setQuerySQL(conn.HOST, conn.PORT, insertPatientQueue);
        rmic.setQuerySQL(conn.HOST, conn.PORT, queueSql);
        out.print("Success");
        out.print(findQueueNo);
        out.print(queueSql);
        out.print(insertEpisode);
        
        DirectPrint directPrint1 = new DirectPrint();
            directPrint1.printString("         Biocore Lab"+"\n           Your no: "+"\n    "+newQueueNo+"\n       Current no :"+queue_now+"\n   Date:"+today+" Time:"+now);
       
    }
     

%>