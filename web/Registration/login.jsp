<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>  
<%

    if (!(session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals(""))) {
        response.sendRedirect("mainMenu.jsp");
        out.print(session.getAttribute("USER_IC"));
    }

    Conn conn = new Conn();
//    out.print(conn.getIpCall());
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Kiosk | Login Page</title>
        <%@include file="../assets/header.html"%>
    </head>
    <body>


        <div class="container-fluid m-scene">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4" style="margin-top: 2%;">
                            <div class="thumbnail" style="text-align: center;">
                                <a href="mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>              
                                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                                <div class="profile-img-card">
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                                </div>
                                <div class="logo" style="font-size: 32px;">Login Page <span>i-HIS</span></div>
                                <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Integrated Health Information System</p>
                                <form class="form-signin" id="leForm" >
                                    <span id="reauth-email" class="reauth-email"></span>
                                    <input type="text" id="inputUserIC" class="form-control" placeholder="User ID" name="username" required autofocus>
                                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                                </form><!-- /form -->
                                <button  class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Sign in</button>
                                <a href="forgot-pwd.html" class="forgot-password pull-left" style="margin-top: 10px;">
                                    Forgot the password?
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>










        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <div w3-include-html="libraries/script.html"></div>

        <script src="http://www.w3schools.com/lib/w3data.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="assets/js/bootbox.min.js"></script>
        <script>
            w3IncludeHTML();
            $(document).ready(function () {

                $(document).bind('keypress', pressed);
            });

            function pressed(e)
            {
                if (e.keyCode === 13)
                {
                    //bootbox.alert('enter pressed');
                    login();
                    //put button.click() here
                }
            }

            $('#btnSign').on('click', function () {

                login();

            });
            function login() {

                var userIC = $("#inputUserIC").val();
                var password = $("#inputPassword").val();

                if (userIC === "") {
                    bootbox.alert("Fill in the User IC");
                    $("#inputUserIC").focus();
                } else if (password === "") {
                    bootbox.alert("Fill in the password");
                    $("#inputPassword").focus();
                } else {

                    $.ajax({
                        url: "Controller/slogin.jsp",
                        type: "post",
                        data: {userIC: userIC,
                            password: password
                        },
                        timeout: 10000,
                        success: function (data) {
                            var num = parseInt(data);

                            console.log(data);

                            if (num === 2)
                                window.location = "mainMenu.jsp";
                            else if (num === 1)
                                bootbox.alert("Wrong password");
                            else if (num === 0)
                                bootbox.alert("User IC does not exist");
                            else
                                bootbox.alert("Error");
                        },
                        error: function (err) {
                            console.log(err);
                            bootbox.alert("error :" + err.toString());
                        }

                    });
                }
            }

        </script>
    </body>

</haml>
