<%-- 
    Document   : SelectDoctorAvailability
    Created on : Aug 16, 2017, 5:41:32 PM
    Author     : -D-
--%>
<%@ page import ="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    Conn Conn = new Conn();
//    String hfc_cd = "04010101";
//    String discipline_cd = "001";
//    String subdiscipline_cd = "001";
    
    String hfc_cd = request.getParameter("hfc_cd");
    String discipline_cd = request.getParameter("discipline_cd");
    String subdiscipline_cd = request.getParameter("subdiscipline_cd");

    String sql_start_time = "SELECT start_time,consultation_period FROM pms_appointment_time WHERE hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline_cd+"' AND subdiscipline_cd = '"+subdiscipline_cd+"' ORDER BY start_time ASC LIMIT 1;";
    String sql_end_time = "SELECT ADDTIME(start_time,consultation_period) FROM pms_appointment_time WHERE hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline_cd+"' AND subdiscipline_cd = '"+subdiscipline_cd+"' ORDER BY start_time DESC LIMIT 1;";
    
    ArrayList<ArrayList<String>> data_start_time = Conn.getData(sql_start_time);
    ArrayList<ArrayList<String>> data_end_time = Conn.getData(sql_end_time);
    
    if(data_start_time.size() > 0){
        String start_time = data_start_time.get(0).get(0);
        String duration = data_start_time.get(0).get(1);
        String end_time = data_end_time.get(0).get(0);

        out.print(start_time + "|" +end_time+ "|" + duration );
    }else{
        out.print("NO-DATA");
    }
    
    

    


%>
