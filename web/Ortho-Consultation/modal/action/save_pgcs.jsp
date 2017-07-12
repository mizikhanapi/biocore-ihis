<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String user_name = session.getAttribute("USER_NAME").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    
    DateFormat date_now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date current_date = new Date(); 
    String now = date_now.format(current_date);//2016/11/16 12:08:43
    
    String pgcsResult = request.getParameter("pgcsResult");
    String pgcsPoint = request.getParameter("pgcsPoint");
                              
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "UPDATE lhr_ort_neu_observation_chart SET result = '"+pgcsResult+"',points = '"+pgcsPoint+"' WHERE pmi_no = '" + pmino + "' AND hfc_cd = '"+hfc+"' AND episode_date = '"+episodeDate+"'";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>
