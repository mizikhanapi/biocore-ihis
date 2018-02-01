
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
String specimen_no = request.getParameter("specimen_no");
String itemCode = request.getParameter("itemCode");

RMIConnector rmic = new RMIConnector();
Conn conn = new Conn();
//String sqlInsert1 = "UPDATE lis_specimen SET Verification='Reject Verification' WHERE order_no = '"+order_no+"' AND item_cd = '"+itemCode+"'";
String sqlInsert = "DELETE FROM lis_specimen WHERE specimen_no = '" + specimen_no + "'";
rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
//rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert1);
 
%>