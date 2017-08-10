<%-- 
    Document   : validateModuleAccess
    Created on : Mar 18, 2017, 7:36:04 AM
    Author     : user
--%>

<%@page import="ADM_helper.MySession"%>
<%
    String adm_id= (String) session.getAttribute("USER_ID");
    String adm_hfc= (String) session.getAttribute("HFC_99");
    
    MySession mys = new MySession(adm_id, adm_hfc);
    
    if(!mys.haveModuleAccess("01")){
        response.sendRedirect("../Entrance/dashboard.jsp");
        return;
    }
    
//    if(!mys.isSuperUser()){
//        mys.initModulePageAccess();
//        String pages = mys.getLongStringPage(); //session.getAttribute("PAGE_CODE").toString();
//
//        if(!pages.contains("HIS01")){
//
//            response.sendRedirect("../Entrance/dashboard.jsp");
//
//            return;
//        }
//        
//    }
    

%>