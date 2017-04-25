<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%
String[] verify = request.getParameterValues("verify[]");
String specimen_no1 = (String)session.getAttribute("specimen_no");
int number = Integer.parseInt(request.getParameter("Total"));

RMIConnector rmic = new RMIConnector();
Conn conn = new Conn();

for(int i=0;i<number;i++)
{
    String sqlUpdate = "UPDATE lis_specimen SET specimen_status = 'Verified' WHERE item_cd='"+verify[i]+"' and specimen_no='"+specimen_no1+"'";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
   rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    //out.println(isInsert);
    
}
%>
