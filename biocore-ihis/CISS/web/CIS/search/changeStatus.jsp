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



    Conn conn = new Conn();

   boolean updatePatientQueue = conn.setData("UPDATE pms_patient_queue SET status = '"+status+"' WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';");
    boolean updatePMSEpisode = conn.setData("UPDATE pms_episode SET status = '"+status+"' WHERE pmi_no = '"+pmino+"' AND episode_date = '"+episodedate+"';");

    

            if (updatePatientQueue) {
                if (updatePMSEpisode) {
                    out.print("|1|");
                } else {
                    out.print("updatePMSEpisode not run");
                }
            } else {
                out.print("updatePatientQueue not run");
            }
      

            
%>