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
                      boolean updatePatientQueueElse = conn.setData("UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
                          boolean updatePMSEpisodeElse = conn.setData("UPDATE pms_episode SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
                     boolean updateEHR = conn.setData("UPDATE ehr_central SET status = '"+status+"', c_txndata = '"+notes+"' WHERE pmi_no = '"+pmino+"' AND c_txndate = '"+episodedate+"' ; ");

                                       if (updatePatientQueueElse) {
                                               if (updatePMSEpisodeElse) {
                                                                        if (updateEHR) {
                                                                                out.print("|3|");
                                                                            } else {
                                                                                out.print("|NA|");
                                                                            }
                                               } else {
                                                   out.print("updatePMSEpisode not run");
                                               }
                                           } else {
                                               out.print("updatePatientQueue not run");
                                           }
    }

////Insert PMS data to table calling System

    String sqlPMS = "SELECT ppq.hfc_cd,pql.discipline_cd,pql.sub_discipline_cd,ppq.pmi_no,pe.`NAME`,ppq.queue_no,ppq.queue_name,ppq.episode_date FROM pms_queue_list pql, pms_patient_queue ppq, pms_episode pe WHERE pql.hfc_cd = ppq.hfc_cd AND ppq.pmi_no = pe.`PMI_NO` AND ppq.pmi_no = '"+pmino+"' AND ppq.episode_date = '"+episodedate+"' GROUP BY ppq.episode_date";
    ArrayList<ArrayList<String>> dataPMS = conn.getData(sqlPMS);
    RMIConnector rmic = new RMIConnector();
    
    try
    {
     //String sqlInsert = "INSERT INTO qcs_calling_system_queue(cs_hfc_cd,cs_discipline,cs_sub_discipline,cs_pmi_no,cs_patient_name,cs_queue_no,cs_queue_name,cs_datetime,cs_callingtime) VALUES ('"+dataPMS.get(0).get(0)+"','"+dataPMS.get(0).get(1)+"','"+dataPMS.get(0).get(2)+"','"+dataPMS.get(0).get(3)+"','"+dataPMS.get(0).get(4)+"','"+dataPMS.get(0).get(5)+"','"+dataPMS.get(0).get(6)+"','"+dataPMS.get(0).get(7)+"','4')";
       String sqlDelete = "DELETE FROM qcs_calling_system_queue WHERE cs_pmi_no = '"+pmino+"' AND cs_datetime = '"+episodedate+"'";
       rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDelete);
    }
    catch(Exception e)
    {
     //error handling code
    }

          
%>