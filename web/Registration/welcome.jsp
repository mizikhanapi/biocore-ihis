<%-- 
    Document   : welcome_2
    Created on : Apr 10, 2017, 11:42:02 AM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
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
        <title>JSP Page</title>
        <!--header-->
        <%@include file="../assets/header.html"%>
        <!--header-->

    </head>
    <body>
        <div class="container-fluid m-scene">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4" style="margin-top: 2%;">
                            <div class="thumbnail" style="text-align: center;">
                                <a href="../Entrance/dashboard.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                                <div class="profile-img-card" >
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                                </div>
                                <div class="logo" style="font-size: 32px;">
                                    Welcome to <span>iHIS</span>
                                </div>
                                <p id="profile-name" class="profile-name-card" >PLEASE SELECT LANGUAGE</p>
                                <div class="text-center">
                                    <a href="mainMenu.jsp" class="btn btn-default btn-lg" >English</a>
                                    <a href="#" class="btn btn-default btn-lg" >Bahasa Malaysia</a> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Script-->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <%@include file="../assets/script.html"%>

    </body>
</html>
