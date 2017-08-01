<%-- 
    Document   : searchNextPatient
    Created on : Mar 11, 2017, 2:09:52 PM
    Author     : -D-
--%>


<%@page import="main.RMIConnector"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    
    Conn conn = new Conn();
    String now = request.getParameter("date");
  String hfc_cd= request.getParameter("hfc");
  String my_1_user_id = (String) session.getAttribute("USER_ID");
//    String now = "2017-03-12";
//    String hfc_cd = "04010102";
    
//    String sqlPatient = "select pmi_no,patient_name,new_ic_no,blood_type,sex_code,id_type,birth_date,race_code,allergy_ind from emedica.pms_patient_biodata where pmi_no = '"+pmiNo+"'";
//ArrayList<ArrayList<String>> dataQueue = conn.getData(sqlPatient);

String sqlNextPatient = "select a.pmi_no, a.episode_date from pms_patient_queue a,  pms_patient_biodata b where status = '0'  AND a.episode_date LIKE '%"+now+"%' and a.pmi_no = b.`PMI_NO` and a.hfc_cd = '"+hfc_cd+"' order by queue_no LIMIT 1 ";
ArrayList<ArrayList<String>> dataNextPatient = conn.getData(sqlNextPatient);
if(dataNextPatient.size() < 1){
    out.print("|O|");
}else{
    out.print(dataNextPatient.get(0).get(0)+"|"+dataNextPatient.get(0).get(1));
}

////Insert PMS data to table calling System

     String sqlPMS = "SELECT pe.`HEALTH_FACILITY_CODE`,pe.`DISCIPLINE_CODE`,pe.`SUBDISCIPLINE_CODE`,pe.`PMI_NO`,pe.`NAME`,ppq.queue_no,ppq.queue_name,pe.`EPISODE_DATE` FROM pms_episode pe,pms_patient_queue ppq WHERE pe.`EPISODE_DATE`=ppq.episode_date AND ppq.status = '0' AND ppq.episode_date LIKE '%"+now+"%' AND ppq.hfc_cd = '"+hfc_cd+"' GROUP BY ppq.episode_date ORDER BY ppq.queue_no LIMIT 1";
    ArrayList<ArrayList<String>> dataPMS = conn.getData(sqlPMS);
    RMIConnector rmic = new RMIConnector();
    
    String room = "SELECT ROOM_NO FROM adm_users WHERE USER_ID = '"+my_1_user_id+"'";
    ArrayList<ArrayList<String>> room1 = conn.getData(room);
try
    {
     String sqlInsert = "INSERT INTO qcs_calling_system_queue(cs_hfc_cd,cs_discipline,cs_sub_discipline,cs_pmi_no,cs_patient_name,cs_queue_no,cs_queue_name,cs_datetime,cs_callingtime,cs_room_no) VALUES ('"+dataPMS.get(0).get(0)+"','"+dataPMS.get(0).get(1)+"','"+dataPMS.get(0).get(2)+"','"+dataPMS.get(0).get(3)+"','"+dataPMS.get(0).get(4)+"','"+dataPMS.get(0).get(5)+"','"+dataPMS.get(0).get(6)+"','"+dataPMS.get(0).get(7)+"','2','"+room1.get(0).get(0)+"')";
     rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    }
    catch(Exception e)
    {
     //error handling code
    }

%>