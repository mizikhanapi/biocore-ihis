<%-- 
    Document   : validateModuleAccess
    Created on : Mar 18, 2017, 7:36:04 AM
    Author     : user
--%>

<%
    String pages = session.getAttribute("PAGE_CODE").toString();
    
    if(!pages.contains("HIS08")){
        
        response.sendRedirect("../Entrance/dashboard.jsp");
        
        return;
    }

%>