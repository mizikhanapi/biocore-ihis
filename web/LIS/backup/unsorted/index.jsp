<%@page import="Config.Config"%>
<%
    
    
    Config.getBase_url(request);
    Config.getFile_url(session);
    
    response.sendRedirect("Order_list"); 




%>

