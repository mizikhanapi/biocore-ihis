<%-- 
    Document   : destroySession
    Created on : Aug 13, 2016, 10:26:29 AM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String user_id = (String) session.getAttribute("USER_ID");
    String user_group = (String) session.getAttribute(MySessionKey.USER_GROUP);
    
    String query = "Update adm_users set login_status = '0', REMOTE_LOGOUT_DATE = now() where user_id = '"+user_id+"'";
    
    rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    
    session.invalidate();
    HttpSession newSession = request.getSession(false);
    
    String url = "../index.jsp";
    if("JOMLOKA".equals(user_group)){
        url = "../JOMLOKA/";
    }
    response.sendRedirect(url);
  

%>
