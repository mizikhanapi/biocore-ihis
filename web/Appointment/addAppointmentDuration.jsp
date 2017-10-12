



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
        String hfc_cd = request.getParameter("hfc_cd");
        String discipline_cd = request.getParameter("discipline_cd");
        String sub_discipline_cd = request.getParameter("sub_discipline_cd");
        String start_time = request.getParameter("start_time");
        String duration = request.getParameter("duration");
        String username = (String)session.getAttribute("USER_ID");
        
        
        
//        out.print(state_code);
//        out.print(holiday_date);
        
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "insert into pms_appointment_time (hfc_cd,discipline_cd,subdiscipline_cd,start_time,consultation_period,created_by,created_date) "
                + "VALUES ('"+hfc_cd+"','"+discipline_cd+"','"+sub_discipline_cd+"','"+start_time+"','"+duration+"','"+username+"',NOW())";

        
        boolean isInsert = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlInsert);
        if (isInsert) 
        {
            out.print("success");
        } else 
        {
           out.print("error");
           out.print(sqlInsert);
        }

%>
