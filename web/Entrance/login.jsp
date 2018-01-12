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

    try {

        MySession.setPathToSuper(application.getRealPath("/superConfig"));

    } catch (Exception e) {
        e.printStackTrace();
        out.print("Oopps! Try again later");
    }

    //out.print(MySession.getSuperString());
%>
<!DOCTYPE html>
<html>
    <head>
        <title>HIS CARE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="../assets/js/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="../assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/care.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/png" href="../assets/favicon.png"/>
        <style>
            body {
                background: #f6f8f8;
            }
            .login-box{
                margin-bottom: 5em;
                margin-top: 5em;
                max-width: 50em;
            }

            .login-logo {
                height: auto;
                max-width: 100%;
            }

            .login-btn {
                min-width: 18.75em;
            }
        </style>
        <script>
            history.forward();
        </script>
    </head>
    <body class="hold-transition login-page">
        <div class="container login-box">
            <div class="row">
                <div class="col-md-4 text-center">
                    <img class="login-logo" src="../assets/img/hiscare-icon.svg"/>
                </div>
                <div class="col-md-8">
                    <div class="g-b g-b--m--4of6">
                        <h1 class="m-b-0"><b>Sign In</b></h1>
                        <p class="">
                            Don't have HIS-Care account?
                            <a class="link link--underline" href="">Create a free account</a>
                        </p>
                        <div class="row">
                            <div class="col-md-12">
                                <form id="leForm" class="form-horizontal ">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">User ID</label></div>
                                        <div class="col-md-12">
                                            <input id="inputUserID" type="text" class="form-control input-lg" name="inputUserID" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Password</label></div>
                                        <div class="col-md-12">
                                            <input id="inputPassword" type="password" class="form-control input-lg" name="inputPassword" >
                                            <a href="Forgot_Password"> Forgot your password?</a>
                                        </div>
                                    </div>
                                </form>
                                <div class="m-t-10">
                                    <div class="text-center">
                                        <button id="btnSign" class="btn btn-rounded btn-mkag btn-lg login-btn">Sign In</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <div class="text-center login-footer">
                <p>Version 3.1.0</p>
                <p>Powered by MKAG Technologies PLT</p>
            </div>
        </div>


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
