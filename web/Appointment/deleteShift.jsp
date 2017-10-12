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

   
    
    String sql = "DELETE FROM emedica.pms_shift WHERE hfc_cd = '"+hfc+"' AND discipline_cd = '"+discipline+"' AND subdiscipline_cd = '"+subdiscipline+"' AND shift_cd = '"+shift_code+"';";
    

    boolean isInsert = rmi.setQuerySQL(Conn.HOST, Conn.PORT, sql);
    
if(isInsert){
    out.print("|SUCCESS|");
}else{
    out.print(sql);
}


    
%>