
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
String fcomment = request.getParameter("fcomment");
String pmi = request.getParameter("pmi");
String specimen_no = request.getParameter("specimen_no");

RMIConnector rmic = new RMIConnector();
Conn conn = new Conn();
String sqlInsert = "UPDATE lis_specimen SET commen_specimen = '"+fcomment+"', Status_specimen = 'Reject' WHERE specimen_no = '"+specimen_no+"' AND pmi_no = '"+pmi+"'";
rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

 
%>
