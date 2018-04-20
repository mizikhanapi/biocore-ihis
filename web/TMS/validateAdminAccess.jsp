<%-- 
    Document   : validateAdminAccess
    Created on : Apr 15, 2018, 9:09:27 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="ADM_helper.MySession"%>
<%
    String adm_hfc = (String) session.getAttribute(MySessionKey.HFC_99);
    String adm_user = (String) session.getAttribute(MySessionKey.USER_ID);
    
    if(adm_hfc == null || "null".equalsIgnoreCase(adm_hfc) || adm_hfc.equals(null)){
        response.sendRedirect("../Entrance/destroySession.jsp");
        return;
    }
    
    MySession adm_mys = new MySession(adm_user, adm_hfc);
    
    if(!adm_mys.isSuperUser()){
        response.sendRedirect("../Entrance/Sign-in");
        return;
    }    
    
%>

