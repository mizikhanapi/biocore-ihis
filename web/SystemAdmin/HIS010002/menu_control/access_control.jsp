<%-- 
    Document   : access_control
    Created on : Mar 31, 2018, 11:31:28 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="ADM_helper.Menu"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String status = request.getParameter("status").trim();
    String page_cd = request.getParameter("page_cd").trim();
    String module_cd = request.getParameter("module_cd").trim();
    String menu_cd = request.getParameter("menu_cd");
    String role_cd = request.getParameter("role_cd");
    
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    
    Menu menu = new Menu(hfc_cd, role_cd);
    
    JSONObject json;
    
    if("0".equals(status)){
        //enable menu and parent
        json = menu.enableMenu(module_cd, page_cd, menu_cd);
        
    }
    else{
        //disable menu and child
        json = menu.disableMenu(module_cd, page_cd, menu_cd);
    }
    
    out.print(json.toString());
%>
