<%-- 
    Document   : mainMenu_2
    Created on : Apr 10, 2017, 12:10:43 PM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiosk | Main Menu</title>
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
                                <a href="." title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
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

                                <div class="text-center" style="margin-top: 5px;">
                                    <a href="medicalHistory/printReport.jsp" class="btn btn-info btn-lg" >View Medical History</a>
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
        <%

            if (!(session.getAttribute("Patient_IC") == null || session.getAttribute("Patient_IC").equals(""))) {
        %>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#signupBtn').hide();
            });

        </script>
        <%
        } else {

        %>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#logoutBtn').hide();
            });

        </script>
        <%    }

        %>

    </body>
</html>