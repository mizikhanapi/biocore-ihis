<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>

<%@page import="ADM_helper.MySession"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("USER_ID") != null && session.getAttribute("HEALTH_FACILITY_CODE") != null && session.getAttribute("ROLE_CODE") != null) {

        response.sendRedirect("Home");

        return;
    }
    
    Config.getBase_url(request);
    Config.getFile_url(session);
     
    try{
        
        MySession.setPathToSuper(application.getRealPath("/superConfig"));
    
    }
    catch(Exception e){
        e.printStackTrace();
        out.print("Oopps! Try again later");
    }


    //out.print(MySession.getSuperString());
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Login</title>

        <!-- header -->
        <script src="../assets/js/jquery.min.js"></script>
        <%@include file = "../assets/header.html" %>
        <link href="../assets/css/login.css" rel="stylesheet">
        <link href="libraries/loading_sham.css" rel="stylesheet">
        <!-- header -->
        <script>
            history.forward();
        </script>
    </head> 
    <body>
        <div class="container m-scene">
            <div class="card card-container">
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <div class="profile-img-card">
                    <img src="../assets/i-his.logo.svg" class="logo-login">
                </div>
                <div class="logo" style="font-size: 32px;">
                    Welcome to <span>i-HIS</span>
                </div>
                <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Integrated Health Information System</p>
                <form class="form-signin" id="leForm" >
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="text" id="inputUserID" class="form-control" placeholder="Enter User ID" name="username" required autofocus>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Enter Password" name="password" required>
                    <!--                
                    <div id="remember" class="checkbox">
                                        <label>
                                            <input type="checkbox" value="remember-me"> Remember me
                                        </label>
                                    </div>
                    -->

                </form><!-- /form -->
                <button class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Sign in</button>
                <a href="Forgot_Password" class="forgot-password">
                    Forgot the password?
                </a>
                
                <p class="text-center" style="margin-top: 25px;">Version 3.1</p>
            </div><!-- /card-container -->
            
        </div><!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="libraries/script.html" %>
        <%@include file="../assets/script.html" %>
        <!--<script src="Dashboard_files\jquery.min.js.download"></script>
        <script src="http://www.w3schools.com/lib/w3data.js"></script>-->



        <script>

            $(document).ready(function () {

                $(document).bind('keypress', pressed);
            });

            function pressed(e)
            {
                if (e.keyCode === 13)
                {
                    //alert('enter pressed');
                    login();
                    //put button.click() here
                }
            }

            $('#btnSign').on('click', function () {

                login();

            });

            function login() {

                var userID = $("#inputUserID").val();
                var password = $("#inputPassword").val();

                if (userID === "") {
                    alert("Fill in the User ID");
                    $("#inputUserID").focus();
                } else if (password === "") {
                    alert("Fill in the password");
                    $("#inputPassword").focus();
                } else {
                    $('<div class="loading">Loading</div>').appendTo('#leForm');

                    $.ajax({
                        url: "login_process2.jsp",
                        type: "post",
                        data: {userID: userID,
                            password: password
                        },
                        timeout: 60000,
                        success: function (data) {
                            var num = parseInt(data);

                            if (num === 2)
                                window.location = "Home";
                            else if (num === 1)
                                alert("Wrong password");
                            else if (num === 0)
                                alert("User ID does not exist");
                            else if (num === 3)
                                alert("You don't have proper user access. Contact your admin to configure your user access");
                            else if (num === 4) {
                                alert("You have logged in to another PC or you did not log out properly");
                                window.location = "ReSign-in";
                            } else
                                alert("Error");
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("Opps! " + errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            $('.loading').hide();
                        }

                    });
                }
            }
        </script>
    </body>
</html>
