<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();

    String datetime = request.getParameter("dateTime");

    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "DELETE FROM lhr_ort_neu_press_injury_risk WHERE pmi_no='"+pmino+"' AND hfc_cd = '"+hfc+"' AND episode_date='"+episodeDate+"' AND encounter_date='"+datetime+"'";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>
