<%-- 
    Document   : changeStatus
    Created on : Mar 6, 2017, 2:47:35 PM
    Author     : -D-
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String pmino = request.getParameter("pmiNo");
    String episodedate = request.getParameter("episodeDate");
    String status = request.getParameter("status");
    String user_id = (String)session.getAttribute("USER_ID");



    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
   String sqlPQ = "UPDATE pms_patient_queue SET status = '"+status+"', user_id = '"+user_id+"' WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';";
   String sqlPE ="UPDATE pms_episode SET status = '"+status+"', user_id = '"+user_id+"', `CONSULTATION_ROOM` = (select `ROOM_NO` from adm_users where user_id = '"+user_id+"')  WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';";
   
  rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPQ);
  rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPE);
   out.print("|1|");

//   boolean updatePatientQueue = conn.setData("UPDATE pms_patient_queue SET status = '"+status+"' WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';");
//    boolean updatePMSEpisode = conn.setData("UPDATE pms_episode SET status = '"+status+"' WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';");
//
//    
//
//            if (updatePatientQueue) {
//                if (updatePMSEpisode) {
//                    out.print("|1|");
//                } else {
//                    out.print("updatePMSEpisode not run");
//                }
//            } else {
//                out.print("updatePatientQueue not run");
//            }
      

            
%>