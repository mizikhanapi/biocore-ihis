<%-- 
    Document   : destroySession
    Created on : Aug 13, 2016, 10:26:29 AM
    Author     : user
--%>

<%
    
    session.setAttribute("Patient_IC",null);

    response.sendRedirect("welcome.jsp");
  

%>
