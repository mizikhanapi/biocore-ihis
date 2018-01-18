
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
String healthcare_c = request.getParameter("healthCentre");
String pmi = request.getParameter("pmi");
String specimen_no = request.getParameter("specimen_no");
String order_no = request.getParameter("order_no");
String itemCode = request.getParameter("itemCode");
String erease_comment = "No Comment";
RMIConnector rmic = new RMIConnector();

Conn conn = new Conn();
String sqlInsert1 = "UPDATE lis_order_detail SET Verification='Waiting For Approval' WHERE order_no = '"+order_no+"'";
String sqlInsert2 = "UPDATE lis_order_master SET order_status = '2' WHERE order_no = '"+order_no+"'";
String sqlInsert = "UPDATE lis_specimen SET commen_specimen = '"+erease_comment+"', receive_specimen_status = 'Approve', Approval = 'Waiting For Test', healthcare_centre = '"+healthcare_c+"' WHERE specimen_no = '"+specimen_no+"' AND pmi_no = '"+pmi+"'";
rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert1);
rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert2);

%>
