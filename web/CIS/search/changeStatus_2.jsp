<%-- 
    Document   : changeStatus_2
    Created on : Nov 6, 2017, 5:30:28 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com
--%>

<%@page import="java.sql.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String pmino = request.getParameter("pmiNo");
    String episodedate = request.getParameter("episodeDate");
    String status = request.getParameter("status");
    String preStatus = request.getParameter("preStatus");
    String user_id = (String)session.getAttribute("USER_ID");



    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
   String sqlPQ = "UPDATE pms_patient_queue SET status = '"+status+"', user_id = '"+user_id+"' "
           + "WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"' AND status='"+preStatus+"';";
   
   rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPQ);
   
   String sqlCheck="Select user_id from pms_patient_queue where user_id='"+user_id+"' AND pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"' AND status='"+status+"' order by created_date asc limit 1;";
   ArrayList<ArrayList<String>> dataCheck = conn.getData(sqlCheck);
   
   if(dataCheck.size()>0){
       String sqlPE ="UPDATE pms_episode SET status = '"+status+"', user_id = '"+user_id+"', `CONSULTATION_ROOM` = (select `ROOM_NO` from adm_users where user_id = '"+user_id+"')  WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';";
   
 
        rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPE);
        out.print("|1|");
   }
   else{
       out.print("|2|");
   }
   
   


            
%>
