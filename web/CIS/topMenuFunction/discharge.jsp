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

    String patientCategory = session.getAttribute("patientCategory").toString();
    String doctor_id = session.getAttribute("USER_ID").toString();

//    String pmino = "9504050251851";
//    String episodedate ="2017-03-14 00:07:36.0";
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String sqlCheckEHR = "SELECT * FROM ehr_central where pmi_no = '" + pmino + "' AND c_txndate = '" + episodedate + "' and (status = 2 or status = 4)";

    ArrayList<ArrayList<String>> dataEHR = conn.getData(sqlCheckEHR);

    if (patientCategory.equals("001") || patientCategory.equals("002")) {
        if (dataEHR.size() < 1) {
            String sqlEhr = "INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status,status_1,status_2,status_3,status_4,status_5) "
                    + "VALUES('" + pmino + "','" + episodedate + "','" + notes + "','" + status + "','0','0','0','0','0') ";
            String sqlPQ = "UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';";
            String sqlPE = "UPDATE pms_episode SET status = '" + status + "', doctor = '" + doctor_id + "'  WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlEhr);
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPQ);
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPE);
            out.print("|1|");

//            boolean stats = conn.setData("INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status,status_1,status_2,status_3,status_4,status_5) "
//                    + "VALUES('" + pmino + "','" + episodedate + "','" + notes + "','" + status + "','0','0','0','0','0') ");
//
//            boolean updatePatientQueue = conn.setData("UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
//            boolean updatePMSEpisode = conn.setData("UPDATE pms_episode SET status = '" + status + "', doctor = '"+doctor_id+"'  WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
//
//            if (stats) {
//                if (updatePatientQueue) {
//                    if (updatePMSEpisode) {
//                        out.print("|1|");
//                    } else {
//                        out.print("updatePMSEpisode not run");
//                    }
//                } else {
//                    out.print("updatePatientQueue not run");
//                }
//            } else {
//                out.print("|2|");
//            }
        } else {
            if (dataEHR.get(0).get(4).toString().equals("2") || dataEHR.get(0).get(4).toString().equals("4")) {
                String sqlEhr = "UPDATE ehr_central SET status = '" + status + "', c_txndata = '" + notes + "' WHERE pmi_no = '" + pmino + "' AND c_txndate = '" + episodedate + "' AND (status =  2 OR status = 4); ";
                String sqlPQ = "UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';";
                String sqlPE = "UPDATE pms_episode SET status = '" + status + "', doctor = '" + doctor_id + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';";
                rmic.setQuerySQL(conn.HOST, conn.PORT, sqlEhr);
                rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPQ);
                rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPE);
                out.print("|3|");

//                            boolean updatePatientQueueElse = conn.setData("UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
//                                boolean updatePMSEpisodeElse = conn.setData("UPDATE pms_episode SET status = '" + status + "', doctor = '"+doctor_id+"' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
//                                boolean updateEHR = conn.setData("UPDATE ehr_central SET status = '" + status + "', c_txndata = '" + notes + "' WHERE pmi_no = '" + pmino + "' AND c_txndate = '" + episodedate + "' AND (status =  2 OR status = 4); ");
//
//                                if (updatePatientQueueElse) {
//                                    if (updatePMSEpisodeElse) {
//                                        if (updateEHR) {
//                                            out.print("|3|");
//                                        } else {
//                                            out.print("|NA|");
//                                        }
//                                    } else {
//                                        out.print("updatePMSEpisode not run");
//                                    }
//                                } else {
//                                    out.print("updatePatientQueue not run");
//                                }
            }

        }

////Insert PMS data to table calling System
        String sqlPMS = "SELECT ppq.hfc_cd,pql.discipline_cd,pql.sub_discipline_cd,ppq.pmi_no,pe.`NAME`,ppq.queue_no,ppq.queue_name,ppq.episode_date FROM pms_queue_list pql, pms_patient_queue ppq, pms_episode pe WHERE pql.hfc_cd = ppq.hfc_cd AND ppq.pmi_no = pe.`PMI_NO` AND ppq.pmi_no = '" + pmino + "' AND ppq.episode_date = '" + episodedate + "' GROUP BY ppq.episode_date";
        ArrayList<ArrayList<String>> dataPMS = conn.getData(sqlPMS);

        try {
            String sqlDelete = "DELETE FROM qcs_calling_system_queue WHERE cs_pmi_no = '" + pmino + "' AND cs_datetime = '" + episodedate + "'";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDelete);
        } catch (Exception e) {
            //error handling code
        }

    } else if (patientCategory.equals("003")) {

        if (dataEHR.size() < 1) {

            String sqlEhr = "INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status,status_1,status_2,status_3,status_4,status_5) "
                    + "VALUES('" + pmino + "','" + episodedate + "','" + notes + "','" + status + "','0','0','0','0','0') ";
            String sqlPQ = "UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';";
            String sqlPE = "UPDATE wis_inpatient_episode SET inpatient_status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlEhr);
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPQ);
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPE);
            out.print("|1|");

//            boolean stats = conn.setData("INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status,status_1,status_2,status_3,status_4,status_5) "
//                    + "VALUES('" + pmino + "','" + episodedate + "','" + notes + "','" + status + "','0','0','0','0','0') ");
//
//            boolean updatePatientQueue = conn.setData("UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
//            boolean updatePMSEpisode = conn.setData("UPDATE wis_inpatient_episode SET inpatient_status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
//
//            if (stats) {
//                if (updatePatientQueue) {
//                    if (updatePMSEpisode) {
//                        out.print("|1|");
//                    } else {
//                        out.print("updatePMSEpisode not run");
//                    }
//                } else {
//                    out.print("updatePatientQueue not run");
//                }
//            } else {
//                out.print("|2|");
//            }

        } else {
            if (dataEHR.get(0).get(4).toString().equals("2") || dataEHR.get(0).get(4).toString().equals("4")) {
                
                String sqlEhr = "UPDATE ehr_central SET status = '" + status + "', c_txndata = '" + notes + "' WHERE pmi_no = '" + pmino + "' AND c_txndate = '" + episodedate + "' AND (status =  2 OR status = 4); ";
                String sqlPQ = "UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';";
                String sqlPE = "UPDATE wis_inpatient_episode SET inpatient_status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';";
                rmic.setQuerySQL(conn.HOST, conn.PORT, sqlEhr);
                rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPQ);
                rmic.setQuerySQL(conn.HOST, conn.PORT, sqlPE);
                out.print("|3|");
                
//                boolean updatePatientQueueElse = conn.setData("UPDATE pms_patient_queue SET status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
//                boolean updatePMSEpisodeElse = conn.setData("UPDATE wis_inpatient_episode SET inpatient_status = '" + status + "' WHERE pmi_no = '" + pmino + "' AND episode_date = '" + episodedate + "';");
//                boolean updateEHR = conn.setData("UPDATE ehr_central SET status = '" + status + "', c_txndata = '" + notes + "' WHERE pmi_no = '" + pmino + "' AND c_txndate = '" + episodedate + "' AND (status =  2 OR status = 4); ");
//
//                if (updatePatientQueueElse) {
//                    if (updatePMSEpisodeElse) {
//                        if (updateEHR) {
//                            out.print("|3|");
//                        } else {
//                            out.print("|NA|");
//                        }
//                    } else {
//                        out.print("updatePMSEpisode not run");
//                    }
//                } else {
//                    out.print("updatePatientQueue not run");
//                }
            }

        }

////Insert PMS data to table calling System
        String sqlPMS = "SELECT ppq.hfc_cd,pql.discipline_cd,pql.sub_discipline_cd,ppq.pmi_no,pe.`NAME`,ppq.queue_no,ppq.queue_name,ppq.episode_date FROM pms_queue_list pql, pms_patient_queue ppq, pms_episode pe WHERE pql.hfc_cd = ppq.hfc_cd AND ppq.pmi_no = pe.`PMI_NO` AND ppq.pmi_no = '" + pmino + "' AND ppq.episode_date = '" + episodedate + "' GROUP BY ppq.episode_date";
        ArrayList<ArrayList<String>> dataPMS = conn.getData(sqlPMS);

        try {
            String sqlDelete = "DELETE FROM qcs_calling_system_queue WHERE cs_pmi_no = '" + pmino + "' AND cs_datetime = '" + episodedate + "'";
            rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDelete);
        } catch (Exception e) {
            //error handling code
        }

    }


%>