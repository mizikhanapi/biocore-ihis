<%-- 
    Document   : mainMenu_2
    Created on : Apr 10, 2017, 12:10:43 PM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../Entrance/validateSession.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiosk | Main Menu</title>
        <!--header-->
        <%@include file="../assets/header.html"%>
        <!--header-->

    </head>
    <body>
        <div class="container-fluid m-scene" lang="en">
            <div class="kiosk thumbnail" style="text-align: center; max-height: 345px; max-width: 420px; ">
                <a href="welcome.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                <a id = "logoutBtn" href="destroySession.jsp" title="Log Out"><i class="fa fa-power-off fa-lg pull-right" style="color: #ccc;"></i></a>
                <div class="profile-img-card" >
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px;">
                    Please Select Services
                </div>
                <div class="text-center">
                    <a id="signupBtn" href="signUp/readinfo.jsp" class="btn btn-success btn-lg" >Sign Up</a>
                    <a href="registration/SelectQueue.jsp" class="btn btn-default btn-lg" >Registration</a> 
                </div>

                <div class="text-center" style="margin-top: 15px;">
                    <a href="medicalHistory/printReport.jsp" class="btn btn-link btn-lg" >View Medical History</a>
                </div>
            </div>
        </div>

        <div class="container-fluid m-scene" lang="ml">
            <div class="kiosk thumbnail" style="text-align: center; max-height: 345px; max-width: 420px; ">
                <a href="welcome.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                <a id = "logoutBtn" href="destroySession.jsp" title="Log Out"><i class="fa fa-power-off fa-lg pull-right" style="color: #ccc;"></i></a>
                <div class="profile-img-card" >
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px;">
                    Sila Pilih Perkhidmatan
                </div>
                <div class="text-center">
                    <a id="signupBtn" href="signUp/readinfo.jsp" class="btn btn-success btn-lg" >Daftar</a>
                    <a href="registration/SelectQueue.jsp" class="btn btn-default btn-lg" >Pendaftaran</a> 
                </div>

                <div class="text-center" style="margin-top: 15px;">
                    <a href="medicalHistory/printReport.jsp" class="btn btn-link btn-lg" >Lihat Sejarah Perubatan</a>
                </div>
            </div>
        </div>

        <!--Script-->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <%@include file="../assets/script.html"%>
        <script type="text/javascript">
            var lang = sessionStorage.getItem('lang');
            $(function () {
                if (lang === "en") {
                    $("div[lang=ml]").css("display", 'none');
                } else if (lang === "ml") {
                    $("div[lang=en]").css("display", 'none');
                }
            });
        </script>

        <%

            if (!(session.getAttribute("Patient_IC") == null || session.getAttribute("Patient_IC").equals(""))) {
        %>
        <script type="text/javascript">
            $(document).ready(function () {
                $('div[lang=' + lang + '] #signupBtn').hide();
            });

        </script>
        <%
        } else {

        %>
        <script type="text/javascript">
            $(document).ready(function () {
                $('div[lang=' + lang + '] #logoutBtn').hide();
            });

        </script>
        <%    }

        %>

    </body>
</html>