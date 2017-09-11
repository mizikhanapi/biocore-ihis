<%-- 
    Document   : delCaller
    Created on : Sep 11, 2017, 12:26:44 PM
    Author     : shay
--%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String id = request.getParameter("id");
    String del = "DELETE FROM qcs_calling_system_queue where id='"+id+"'";
    Boolean suc = rmic.setQuerySQL(conn.HOST, conn.PORT, del);
    if(suc){
        out.print("success");
    }else{out.print("error");}
%>