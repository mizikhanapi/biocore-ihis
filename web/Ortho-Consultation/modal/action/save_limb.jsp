<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String user_id = session.getAttribute("USER_ID").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    
    String arm = request.getParameter("arm");
    String  legs = request.getParameter("legs");
    String encounter_date = request.getParameter("encounter_date");
    

    
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlUpdate = "UPDATE lhr_ort_neu_observation_chart SET arm='"+arm+"', legs='"+legs+"' WHERE pmi_no = '" + pmino + "' AND hfc_cd = '"+hfc+"' AND episode_date = '"+episodeDate+"' AND encounter_date = '"+encounter_date+"'";
    //String sqlInsert = "INSERT INTO lhr_ort_neu_observation_chart (pmi_no,hfc_cd,episode_date,encounter_date) VALUES ('"+pmino+"','"+hfc+"','"+episodeDate+"','"+datetime+"')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
%>
