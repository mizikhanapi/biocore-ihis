<%-- 
    Document   : morseAss_insert
    Created on : Jul 5, 2017, 8:07:00 PM
    Author     : user
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String pmiNo = request.getParameter("pmiNo");
    String epDate = request.getParameter("epDate");
    String enDate = request.getParameter("enDate");
    String time = request.getParameter("morseTime");
    String mental = request.getParameter("mental");
    String badan = request.getParameter("badan");
    String venofix = request.getParameter("venofix");
    String movement = request.getParameter("movement");
    String diagnosis = request.getParameter("diagnosis");
    String fall = request.getParameter("fall");
    
    //epDate = DateFormatter.formatDate(epDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    enDate = DateFormatter.formatDate(enDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    
    
    int score = 0;
    
    score = Integer.parseInt(mental) + Integer.parseInt(badan) + Integer.parseInt(venofix) + Integer.parseInt(movement) + Integer.parseInt(diagnosis) + Integer.parseInt(fall);
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String query ="Insert into lhr_ort_nur_morse_fall_scale(pmi_no, hfc_cd, episode_date, encounter_date, datetime, falling_status, diagnosis_status, type_movement, venofix_syringe_pump, body_structure, mental_status, total_score) "
            + "values('"+pmiNo+"', '"+hfc_cd+"', '"+epDate+"', '"+enDate+"', '"+time+"', '"+fall+"', '"+diagnosis+"', '"+movement+"', '"+venofix+"', '"+badan+"', '"+mental+"', "+score+" )";
    
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess){
        out.print("success");
    }
    else{
        out.print("fail");
    }
    
%>
