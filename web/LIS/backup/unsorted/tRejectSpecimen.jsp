
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
String fcomment = request.getParameter("fcomment");
String pmi = request.getParameter("pmi");
String specimen_no = request.getParameter("specimen_no");
String order_no = request.getParameter("order_no");
String itemCode = request.getParameter("itemCode");

RMIConnector rmic = new RMIConnector();
Conn conn = new Conn();
String sqlInsert1 = "UPDATE lis_order_detail SET Verification='Reject Verification' WHERE order_no = '"+order_no+"'";
String sqlInsert = "UPDATE lis_specimen SET commen_specimen = '"+fcomment+"', receive_specimen_status = 'Rejected', Approval = 'Reject Approval' WHERE specimen_no = '"+specimen_no+"' AND pmi_no = '"+pmi+"'";
rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert1);
 
%>
