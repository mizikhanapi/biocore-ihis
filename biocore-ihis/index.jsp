<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>
<%@page import="Config.Config"%>
<%
    
    
    Config.getBase_url(request);
    Config.getFile_url(session);
    
    response.sendRedirect("Entrance/login.jsp"); 




%>