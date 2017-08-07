<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>
<%@page import="ADM_helper.MySession"%>
<%@page import="Config.Config"%>
<%
    
    try{
        Config.getBase_url(request);
        Config.getFile_url(session);
        
        MySession.setPathToSuper(application.getRealPath("/"));
    
        response.sendRedirect("./Entrance/Sign-in"); 
    }
    catch(Exception e){
        e.printStackTrace();
        out.print("Oopps! Try again later");
    }




%>