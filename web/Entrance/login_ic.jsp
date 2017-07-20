<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    if (session.getAttribute("TEMP_ID") == null) {

        response.sendRedirect("login.jsp");

        return;

    }

//    Config.getBase_url(request);
//    Config.getFile_url(session);
    Conn conn = new Conn();
    //out.print(conn.getIpCall());
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Login</title>

        <!-- header -->
        <%@include file = "../assets/header.html" %>
        <link href="../assets/css/login.css" rel="stylesheet">
        <!-- header -->
    </head> 
    <body>
        <div class="container">
            <div class="card card-container" style="max-height: 470px;">
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <div class="profile-img-card">
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px;">
                    Welcome to <span>iHIS</span>
                </div>
                <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Integrated Health Information System</p>
                <form class="form-signin" id="leForm" >
                    <span style="color: red; margin-bottom: 10px;">Please log in using your IC number / Passport number and your password</span>
                    <input type="text" id="inputUserID" class="form-control" placeholder="Enter IC/Passport" name="username" required autofocus>
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
                <br>
                <a href="Sign-in" class="forgot-password">
                    Sign-in with different account.
                </a>
            </div><!-- /card-container -->
        </div><!-- /container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="libraries/script.html" %>
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

                    $.ajax({
                        url: "login_process2.jsp",
                        type: "post",
                        data: {userIC: userID,
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
                                alert("Wrong IC/Passport number");

                            } else
                                alert("Error");
                        },
                        error: function (err) {
                            alert("error :" + err.toString());
                        }

                    });
                }
            }
        </script>
    </body>
</html>
