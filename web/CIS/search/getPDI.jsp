<%-- 
    Document   : searchPatient
    Created on : Feb 10, 2017, 5:48:50 PM
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
    String pmiNo = request.getParameter("pmiNo");
    String episodeDate = request.getParameter("episodeDate");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    String PDI = "";

    String sqlPatient = "select * FROM pms_patient_biodata where pmi_no = '" + pmiNo + "'";
    ArrayList<ArrayList<String>> dataPDI = conn.getData(sqlPatient);

    PDI = "PDI|" + dataPDI.get(0).get(0) + "|" + dataPDI.get(0).get(2);

    for (int i = 3; i < dataPDI.get(0).size(); i++) {
        PDI += "^" + dataPDI.get(0).get(i);
    }
    
    out.print(PDI);
    
////Insert PMS data to table calling System
    
    String sqlPMS = "SELECT ppq.hfc_cd,pql.discipline_cd,pql.sub_discipline_cd,ppq.pmi_no,pe.`NAME`,ppq.queue_no,ppq.queue_name,ppq.episode_date FROM pms_queue_list pql, pms_patient_queue ppq, pms_episode pe WHERE pql.hfc_cd = ppq.hfc_cd AND ppq.pmi_no = pe.`PMI_NO` AND ppq.pmi_no = '"+pmiNo+"' AND ppq.episode_date = '"+episodeDate+"' GROUP BY ppq.episode_date";
    ArrayList<ArrayList<String>> dataPMS = conn.getData(sqlPMS);
    RMIConnector rmic = new RMIConnector();
    
    try
    {
     String sqlInsert = "INSERT INTO qcs_calling_system_queue(cs_hfc_cd,cs_discipline,cs_sub_discipline,cs_pmi_no,cs_patient_name,cs_queue_no,cs_queue_name,cs_datetime,cs_callingtime) VALUES ('"+dataPMS.get(0).get(0)+"','"+dataPMS.get(0).get(1)+"','"+dataPMS.get(0).get(2)+"','"+dataPMS.get(0).get(3)+"','"+dataPMS.get(0).get(4)+"','"+dataPMS.get(0).get(5)+"','"+dataPMS.get(0).get(6)+"','"+dataPMS.get(0).get(7)+"','2')";
     rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    }
    catch(Exception e)
    {
     //error handling code
    }
    
%>