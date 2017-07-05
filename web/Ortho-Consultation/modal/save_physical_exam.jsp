<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();

    DateFormat date_now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date current_date = new Date(); 
    String now = date_now.format(current_date);//2016/11/16 12:08:43
    //String datetime = date+"  "+time;

    String pe0 = request.getParameter("pe0");
    String NotesPE = request.getParameter("NotesPE");
    String PEComment = request.getParameter("PEComment");

    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "INSERT INTO lhr_ort_neu_physical_examination (pmi_no,hfc_cd,episode_date,encounter_date,physical_exam,search_content,comment) VALUES ('" + pmino + "','" + hfc + "','" + episodeDate + "','" + now + "','" + pe0 + "','" + NotesPE + "','" + PEComment + "')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

%>
