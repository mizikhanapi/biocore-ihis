<%-- 
    Document   : setSessionPatient
    Created on : Oct 11, 2017, 6:57:33 PM
    Author     : -D-
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String hfc_name = request.getParameter("hfc_name");
    String hfc_cd = request.getParameter("hfc_cd");
    String dis_cd = request.getParameter("dis_cd");
    String dis_name = request.getParameter("dis_name");
    String subdis_cd = request.getParameter("subdis_cd");
    String subdis_name = request.getParameter("subdis_name");

    session.setAttribute("HFC_NAME", hfc_name);
        session.setAttribute("HEALTH_FACILITY_CODE", hfc_cd);
        session.setAttribute("DISCIPLINE_NAME",dis_name);
                           session.setAttribute("DISCIPLINE_CODE", dis_cd);
session.setAttribute("SUB_DISCIPLINE_NAME",subdis_name);
                               session.setAttribute("SUB_DISCIPLINE_CODE", subdis_cd);
   
    out.print("|SUCCESS|");
    //response.sendRedirect("index.jsp");

%>