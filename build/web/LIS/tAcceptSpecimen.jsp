
<%@page import="dbConn1.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
String healthcare_c = request.getParameter("healthCentre");
String pmi = request.getParameter("pmi");
String specimen_no = request.getParameter("specimen_no");
String erease_comment = "No Comment";
RMIConnector rmic = new RMIConnector();

Conn conn = new Conn();
String sqlInsert = "UPDATE lis_specimen SET commen_specimen = '"+erease_comment+"', Status_specimen = 'Accept', healthcare_centre = '"+healthcare_c+"' WHERE specimen_no = '"+specimen_no+"' AND pmi_no = '"+pmi+"'";
boolean isUpdate1 = rmic.setQuerySQL(conn.HOST, connect.PORT, sqlInsert);


%>
