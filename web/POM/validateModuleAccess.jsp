<%-- 
    Document   : validateModuleAccess
    Created on : Aug 4, 2017, 6:05:31 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySession"%>
<%
    String adm_id= (String) session.getAttribute("USER_ID");
    String adm_hfc= (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    MySession mys = new MySession(adm_id, adm_hfc);
    mys.initModulePageAccess();
    
    String pages = mys.getLongStringPage();//session.getAttribute("PAGE_CODE").toString();
    
    if(!pages.contains("HIS18")){
        
        response.sendRedirect("../Entrance/dashboard.jsp");
        
        return;
    }

%>
