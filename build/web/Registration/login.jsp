<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>  

<%@include file="../Entrance/validateSession.jsp" %>

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

        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <!--        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->


        <script src="../assets/js/jquery-ui.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>        

        <!-- keyboard widget css & script (required) -->
        <link href="assets/css/keyboard.css" rel="stylesheet">
        <link href="assets/css/jquery-ui.min.css" rel="stylesheet">
        <script src="assets/js/jquery.keyboard.js"></script>

        <script>
    
                var lang = sessionStorage.getItem('lang');        
    $(function () {
                if (lang === "en") {
                    $("div[lang=ml]").css("display", 'none');
                } else if (lang === "ml") {
                    $("div[lang=en]").css("display", 'none');
                }                
                $(" div[lang=" + lang + "] #inputUserIC").keyboard();
                $("div[lang=" + lang + "] #inputPassword").keyboard();
            });
        </script>

    </head>
    <body>


        <div class="container-fluid m-scene" lang="en">
            <div class="kiosk thumbnail" style="text-align: center;">
                <a href="mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>              
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <div class="profile-img-card">
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px;">Login Page <span>Kiosk</span></div>
                <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Integrated Health Information System</p>
                <form class="form-signin" id="leForm" >
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="text" id="inputUserIC" class="form-control" placeholder="User User IC" name="useric"  >
                    <input type="password" id="inputPassword" class="form-control" placeholder="Enter User Password" name="password" >
                </form><!-- /form -->
                <button  class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Sign in</button>
                <a href="forgot-pwd.html" class="forgot-password pull-left" style="margin-top: 10px;">
                    Forgot the password?
                </a>
            </div>
        </div>



        <div class="container-fluid m-scene" lang="ml">
            <div class="kiosk thumbnail" style="text-align: center;">
                <a href="mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>              
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <div class="profile-img-card">
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px;">Log Masuk <span>Kiosk</span></div>
                <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Sistem Maklumat Kesihatan Bersepadu</p>
                <form class="form-signin" id="leForm" >
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="text" id="inputUserIC" class="form-control" placeholder="Masukkan IC Pengguna" name="useric"  >
                    <input type="password" id="inputPassword" class="form-control" placeholder="Masukkan Kata Laluan Pengguna" name="password" >
                </form><!-- /form -->
                <button  class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Log masuk</button>
                <a href="forgot-pwd.html" class="forgot-password pull-left" style="margin-top: 10px;">
                    Lupa kata laluan?
                </a>
            </div>
        </div>








        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->

        <div w3-include-html="libraries/script.html"></div>
        <!--
                <script src="http://www.w3schools.com/lib/w3data.js"></script>
                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        -->
        <script src="assets/js/bootbox.min.js"></script>
        <script>
//            w3IncludeHTML();
//            $(document).ready(function () {
//
//                $(document).bind('keypress', pressed);
//            });
//
//            function pressed(e)
//            {
//                if (e.keyCode === 13)
//                {
//                    //bootbox.alert('enter pressed');
//                    login();
//                    //put button.click() here
//                }
//            }

            $("div[lang=" + lang + "] #btnSign").on('click', function () {

                login();

            });
            function login() {

                var userIC = $("div[lang=" + lang + "] #inputUserIC").val();
                var password = $("div[lang=" + lang + "] #inputPassword").val();

                if (userIC === "") {
                    bootbox.alert("Fill in the User IC");
                    $("div[lang=" + lang + "] #inputUserIC").focus();
                } else if (password === "") {
                    bootbox.alert("Fill in the password");
                    $("div[lang=" + lang + "] #inputPassword").focus();
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
