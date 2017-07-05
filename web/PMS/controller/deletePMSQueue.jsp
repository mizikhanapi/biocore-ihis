<%-- 
    Document   : deletePMSQueue
    Created on : Jan 16, 2017, 11:45:49 AM
    Author     : shay
--%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%--<%@page import="Config.connect"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String pmino = request.getParameter("pmino");
    String now = request.getParameter("today");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String delSql ="DELETE FROM PMS_EPISODE WHERE PMI_NO ='"+pmino+"' AND EPISODE_DATE = '"+now+"'";
    String delPMSqueue = "DELETE FROM pms_patient_queue WHERE PMI_NO ='"+pmino+"' AND EPISODE_DATE = '"+now+"' AND HFC_CD='"+hfc+"';";
    Boolean delSuccess = rmic.setQuerySQL(conn.HOST, conn.PORT, delSql);
    Boolean delSuccessDua = rmic.setQuerySQL(conn.HOST, conn.PORT, delPMSqueue);
    if(delSuccess == true && delSuccessDua == true){
out.print("success");
//out.print(delSql); 
    }else{
out.print("fail");        
    }
%>
