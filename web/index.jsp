<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>
<%@page import="ADM_helper.MySession"%>
<%@page import="Config.Config"%>
<%
    
    try{
                
        MySession.setPathToSuper(application.getRealPath("/superConfig")); //important
    
    }
    catch(Exception e){
        e.printStackTrace();
        out.print("Oopps! Try again later");
    }
    
    Config.getBase_url(request);
    Config.getFile_url(session);
    
    response.sendRedirect("./Entrance/Sign-in"); 



%>