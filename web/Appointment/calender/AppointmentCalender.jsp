<%-- 
    Document   : AppointmentCalender
    Created on : Aug 14, 2017, 11:27:23 AM
    Author     : -D-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
        <title>Appointment Calendar</title>
    </head>
    <body>
        
 

        <div id="AppointmentCalender">
        </div>
        <jsp:include page="AppointmentAdd.jsp"/>
        <jsp:include page="AppointmentView.jsp"/>
    </body>
    
     <jsp:include page="footerCalender.jsp"/>
</html>
