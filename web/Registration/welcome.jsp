<%-- 
    Document   : welcome_2
    Created on : Apr 10, 2017, 11:42:02 AM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>

<%
    if (!(session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals(""))) {
        response.sendRedirect("mainMenu.jsp");
        out.print(session.getAttribute("USER_IC"));
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Medical Kiosk </title>
        <!--header-->
        <%@include file="../assets/header.html"%>

        <!--header-->

    </head>
    <body>
        <div class="container-fluid m-scene">
            <div class="kiosk thumbnail" style="text-align: center; max-height: 322px; ">
                <a href="../Entrance/dashboard.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                <div class="profile-img-card" >
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px;">
                    Welcome to <span>iHIS</span>
                </div>
                <p id="profile-name" class="profile-name-card" >PLEASE SELECT LANGUAGE</p>
                <div class="text-center">
                    <a id = "englishLan" href="mainMenu.jsp" class="btn btn-default btn-lg" >English</a>
                    <a id = "malayLan" href="mainMenu.jsp" class="btn btn-default btn-lg" >Bahasa Malaysia</a> 
                </div>
            </div>
        </div>

        <!--Script-->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <%@include file="../assets/script.html"%>
        <script>
            $("#englishLan").click(function () {
                sessionStorage.setItem('lang', 'en');
            } );
            $("#malayLan").click(function () {
                sessionStorage.setItem('lang', 'ml');
            } );
        </script>
    </body>
</html>
