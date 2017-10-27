<%-- 
    Document   : setSession
    Created on : Oct 27, 2017, 11:24:06 AM
    Author     : user
--%>

<%
    String process = request.getParameter("process");
    
    if(process.equalsIgnoreCase("set")){
        String letter = request.getParameter("letter");
        session.setAttribute("DISCHARGE_LETTER", letter);
    }
    else if(process.equalsIgnoreCase("unset")){
        session.setAttribute("DISCHARGE_LETTER", null);
    }
    else{
        response.sendError(response.SC_FORBIDDEN);
    }
%>