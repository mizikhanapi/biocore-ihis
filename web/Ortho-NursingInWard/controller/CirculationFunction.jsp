<%-- 
    Document   : CirculationFunction
    Created on : Jul 8, 2017, 10:35:57 PM
    Author     : Shammugam
--%>

<%
    String patientPMI = request.getParameter("dataString");
    String filterBy = request.getParameter("methodName");

    out.print(patientPMI+filterBy);

%>