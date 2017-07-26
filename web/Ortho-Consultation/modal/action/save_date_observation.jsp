<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    String my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String my_1_sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    
    String date = request.getParameter("dateEntry");
    String  time = request.getParameter("timeEntry");
    String datetime = date+"  "+time;
    
    session.setAttribute("datetime", datetime);
    
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "INSERT INTO lhr_ort_neu_observation_chart (pmi_no,hfc_cd,episode_date,encounter_date,discipline_cd,subdiscipline_cd) VALUES ('"+pmino+"','"+hfc+"','"+episodeDate+"','"+datetime+"','"+my_1_dis_cd+"','"+my_1_sub_cd+"')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>