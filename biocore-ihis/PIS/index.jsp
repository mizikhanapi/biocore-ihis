<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>
<%

    session.setAttribute("USER_ID", "DR001");
    session.setAttribute("HEALTH_FACILITY_CODE", "-");
    session.setAttribute("DISCIPLINE_CODE", "-");
    session.setAttribute("SUB_DISCIPLINE_CODE", "-");
    
    session.setMaxInactiveInterval(-1);
    response.sendRedirect("manageInventory.jsp");


%>