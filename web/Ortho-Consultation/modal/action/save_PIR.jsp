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
    
    String typeAssessment = request.getParameter("typeAssessment");
    String  pressure_ulcer = request.getParameter("pressure_ulcer");
    String  source = request.getParameter("source");
    String  surface = request.getParameter("surface");
    String  mobility = request.getParameter("mobility");
    String  nutrition = request.getParameter("nutrition");
    String  Barrier = request.getParameter("Barrier");
    String  moisture = request.getParameter("moisture");
    String  management = request.getParameter("management");
    String mobility_assessment = request.getParameter("mobility_assessment");
                          
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "INSERT INTO lhr_ort_neu_press_injury_risk (pmi_no,hfc_cd,episode_date,encounter_date,assessment_type,si_pressure_ulcer,si_source,mobility_assessment,int_surface,int_mobility,int_nutrition,int_sc_barrier_product,int_sc_maintain_moisture,int_sc_incontinence_management,assessmen_by) VALUES ('"+pmino+"','"+hfc+"','"+episodeDate+"','"+now+"','"+typeAssessment+"','"+pressure_ulcer+"','"+source+"','"+mobility_assessment+"','"+surface+"','"+mobility+"','"+nutrition+"','"+Barrier+"','"+moisture+"','"+management+"','"+user_name+"')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>