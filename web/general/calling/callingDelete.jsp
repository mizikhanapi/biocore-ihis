<%-- 
    Document   : callingDelete
    Created on : May 11, 2018, 10:57:06 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    // Requesting Parameter
    String callDeclineNo = request.getParameter("callDeclineNo");

    // Delete From Calling System
    String sql = "DELETE FROM qcs_calling_system_queue WHERE Id = '" + callDeclineNo + "'  ";
    boolean isDeleteCalling = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    JSONObject json = new JSONObject();
    json.put("isValid", isDeleteCalling);
    
    out.print(json.toString());
%>
