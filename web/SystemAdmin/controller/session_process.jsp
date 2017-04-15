<%-- 
    Document   : session_process
    Created on : Apr 16, 2017, 3:42:46 AM
    Author     : user
--%>


<%
    String hfc_cd = request.getParameter("hfc_cd");
    String hfc_name = request.getParameter("hfc_name");
    String discipline_cd = request.getParameter("discipline_cd");
    String subdiscipline_cd = request.getParameter("subdiscipline_cd");
    
     session.setAttribute("HEALTH_FACILITY_CODE", hfc_cd);
     session.setAttribute("HFC_NAME", hfc_name);
     session.setAttribute("DISCIPLINE_CODE", discipline_cd);
     session.setAttribute("SUB_DISCIPLINE_CODE", subdiscipline_cd);
     
     
     out.print("success");

%>