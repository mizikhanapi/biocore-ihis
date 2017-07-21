<%-- 
    Document   : patientOrderListDetailsPrescribePDF
    Created on : Mar 14, 2017, 12:50:21 AM
    Author     : Shammugam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>


<%

    String orderNo = request.getParameter("orderNo");
    String patientPMI = request.getParameter("patientPMI");
    String patientName = request.getParameter("patientName");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String hfcName = session.getAttribute("HFC_NAME").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_discipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    Date date = Calendar.getInstance().getTime();
    DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    String dateToday = formatter.format(date);

    String fullString = orderNo + "|" + patientPMI + "|" + patientName + "|" + hfc_cd + "|" + hfcName + "|" + discipline + "|" + sub_discipline + "|" + dateToday;

    out.print(fullString);

%>
