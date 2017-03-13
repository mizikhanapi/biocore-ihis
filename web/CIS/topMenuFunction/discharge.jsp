<%-- 
    Document   : discharge
    Created on : Mar 3, 2017, 4:58:40 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String notes = request.getParameter("notes");
    String pmino = request.getParameter("pmino");
    String episodedate = request.getParameter("episodedate");
    String status = request.getParameter("status");

//    String pmino = "9504050251851";
//    String episodedate ="2017-03-14 00:07:36.0";

    Conn conn = new Conn();
    String sqlCheckEHR = "SELECT * FROM ehr_central where pmi_no = '"+pmino+"' AND c_txndate = '"+episodedate+"'";

    ArrayList<ArrayList<String>> dataEHR = conn.getData(sqlCheckEHR);
   
   
    if(dataEHR.size() < 1){
          boolean stats = conn.setData("INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status) "
                      + "VALUES('" + pmino + "','" + episodedate + "','" + notes + "','" + status + "') ");

              boolean updatePatientQueue = conn.setData("UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
              boolean updatePMSEpisode = conn.setData("UPDATE pms_episode SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");

              if (stats) {
                  if (updatePatientQueue) {
                      if (updatePMSEpisode) {
                          out.print("|1|");
                      } else {
                          out.print("updatePMSEpisode not run");
                      }
                  } else {
                      out.print("updatePatientQueue not run");
                  }
              } else {
                  out.print("|2|");
              }
       
    }else{
                     boolean updateEHR = conn.setData("UPDATE ehr_central SET status = '"+status+"', c_txndata = '"+notes+"' WHERE pmi_no = '"+pmino+"' AND c_txndate = '"+episodedate+"' ; ");
                     if(updateEHR){
                         out.print("|3|");
                     } else{
                         out.print("|NA|");
                     }
    }


    

            
%>