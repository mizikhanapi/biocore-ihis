



<%-- 
    Document   : addHoliday
    Created on : Apr 6, 2016, 10:41:42 PM
    Author     : asyraf
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
        
        
        
//        out.print(state_code);
//        out.print(holiday_date);
        
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "select start_time from pms_appointment_time where hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline+"' AND subdiscipline_cd = '"+subdiscipline+"'";

        ArrayList<ArrayList<String>> duration_data = Conn.getData(sqlInsert);
        
        if(duration_data.size()>0){
            out.print("[HAVE-DATA]");
        }else{
            out.print("[NA]");
           
        }

%>
