<%-- 
    Document   : validateModuleAccess
    Created on : Aug 4, 2017, 6:05:31 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="ADM_helper.MySession"%>
<%
    String adm_id= (String) session.getAttribute("USER_ID");
    String adm_hfc= (String) session.getAttribute("HFC_99");
    
    MySession mys = new MySession(adm_id, adm_hfc);
    if(!mys.haveModuleAccess("18")){
        response.sendRedirect("../Entrance/dashboard.jsp");
        return;
    }
%>
