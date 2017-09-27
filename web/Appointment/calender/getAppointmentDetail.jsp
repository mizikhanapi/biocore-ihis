<%-- 
    Document   : getAppointmentDetail
    Created on : Aug 22, 2017, 5:55:51 PM
    Author     : -D-
--%>

<%@page import="org.joda.time.*"%>
<%@page import="org.joda.time.format.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    
 Conn Conn = new Conn(); 
 String pmi_no = request.getParameter("p");
 String appointment_date = request.getParameter("d");
 String sql = "select * from pms_appointment where pmi_no = '"+pmi_no+"' and appointment_date = '"+appointment_date+"'";
 



%>