<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String user_id = session.getAttribute("USER_ID").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    String my_1_dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String my_1_sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    
    String right_pupil = request.getParameter("right_pupil");
    String  left_pupil = request.getParameter("left_pupil");
    String encounter_date = request.getParameter("encounter_date");
    //String datetime = date+"  "+time;
    

    
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlUpdate = "UPDATE lhr_ort_neu_observation_chart SET on_left='"+left_pupil+"', on_right='"+right_pupil+"' WHERE pmi_no = '" + pmino + "' AND hfc_cd = '"+hfc+"' AND episode_date = '"+episodeDate+"' AND encounter_date='"+encounter_date+"' AND discipline_cd='"+my_1_dis_cd+"' AND subdiscipline_cd = '"+my_1_sub_cd+"'";
    //String sqlInsert = "INSERT INTO lhr_ort_neu_observation_chart (pmi_no,hfc_cd,episode_date,encounter_date) VALUES ('"+pmino+"','"+hfc+"','"+episodeDate+"','"+datetime+"')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
%>
