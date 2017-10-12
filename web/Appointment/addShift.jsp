<%-- 
    Document   : addShift
    Created on : Oct 11, 2017, 10:10:13 PM
    Author     : -D-
--%>


<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Formatter.FormatTarikh"%>

<%
    Conn Conn = new Conn();
    RMIConnector rmi = new RMIConnector();
     String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
     String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
     String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
     String username = (String) session.getAttribute("USER_ID");
     
    String  shift_code = request.getParameter("shift_code");
    String shift_name = request.getParameter("shift_name");
    String start_time = request.getParameter("start_time");
    String shift_duration = request.getParameter("shift_duration");
    String end_time = request.getParameter("end_time");
    String start_date = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");
    String status = request.getParameter("status");
    
     String dateFrom = FormatTarikh.formatDate(start_date, "dd-MM-yyyy", "yyyy-MM-dd");
     String dateTo = FormatTarikh.formatDate(end_date, "dd-MM-yyyy", "yyyy-MM-dd");
    
    String sql = "INSERT INTO pms_shift (hfc_cd, discipline_cd, subdiscipline_cd, shift_cd, shift_name, start_time, end_time, shift_duration, start_date, end_date, status, created_by, created_date)"
            + "VALUES ('"+hfc+"', '"+discipline+"', '"+subdiscipline+"', '"+shift_code+"', '"+shift_name+"', '"+start_time+"', '"+end_time+"', "+shift_duration+", '"+dateFrom+"', '"+dateTo+"', '"+status+"', '"+username+"', NOW())";
    

    boolean isInsert = rmi.setQuerySQL(Conn.HOST, Conn.PORT, sql);
    
if(isInsert){
    out.print("|SUCCESS|");
}else{
    out.print(sql);
}


    
%>