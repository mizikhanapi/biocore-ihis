<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String user_id = session.getAttribute("USER_ID").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    
    String date = request.getParameter("dateEntry");
    String  time = request.getParameter("timeEntry");
    String datetime = date+"  "+time;
    
    session.setAttribute("datetime", datetime);
    
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "INSERT INTO lhr_ort_neu_observation_chart (pmi_no,hfc_cd,episode_date,encounter_date) VALUES ('"+pmino+"','"+hfc+"','"+episodeDate+"','"+datetime+"')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>