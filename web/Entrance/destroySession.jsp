<%-- 
    Document   : destroySession
    Created on : Aug 13, 2016, 10:26:29 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String user_id = (String) session.getAttribute("USER_ID");
    
    String query = "Update adm_users set login_status = '0' where user_id = '"+user_id+"'";
    
    rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    
    session.invalidate();
    HttpSession newSession = request.getSession(false);

    response.sendRedirect("../index.jsp");
  

%>
