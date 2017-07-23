<%-- 
    Document   : GetQueueDetail
    Created on : Jul 20, 2017, 7:04:51 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String PMI_NO = "9504050251851";
    String EPISODE_DATE = "2017-07-23 14:06:36.0";

    String searchProblem = "SELECT hf.hfc_name, d.discipline_name, sub.subdiscipline_name  FROM pms_patient_queue ppq INNER JOIN pms_episode pe  ON ppq.pmi_no = pe.`PMI_NO`  AND ppq.episode_date = pe.`EPISODE_DATE` INNER JOIN adm_health_facility hf ON pe.`HEALTH_FACILITY_CODE` = hf.hfc_cd  INNER JOIN adm_discipline d  ON pe.`DISCIPLINE_CODE` = d.discipline_cd  INNER JOIN adm_subdiscipline sub ON pe.`SUBDISCIPLINE_CODE` = sub.subdiscipline_cd WHERE pe.`PMI_NO` = '" + PMI_NO + "' AND pe.`EPISODE_DATE` = '" + EPISODE_DATE + "' GROUP BY pe.`EPISODE_DATE`; ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));

        }
    }
%>                           

