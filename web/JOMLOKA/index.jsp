<%-- 
    Document   : register-tenant
    Created on : Jun 26, 2018, 6:54:17 PM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>MyJOMLOKA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="libraries/headLibrary.jsp" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="libraries/care.css" rel="stylesheet" type="text/css"/>
        <link href="libraries/animate.css" rel="stylesheet" type="text/css"/>
        <style>
            html, body, .login_container {
                height: 100%;
            }
            .login_container {
                display: table;
            }
            .login_row {
                display: table-cell;
                vertical-align: middle;
            }
            .login_panel {
                margin: 0 auto;
                position: relative;
                width: 320px;
            }
            .login_logo {
                margin: 50px 0 30px;
            }
            .login_logo img {
                width: 220px;
            }
            .login_colon {
                position: absolute;
                right: -20px;
                top: 20px;
            }
            .login_colon img {
                width: 40px;
            }
            .login_body {
                padding: 15px 70px 50px; 
            }
            .login_msg {
                text-align: left;
                margin-bottom: 30px;
                width: 100%;
            }
            .login_label {
                font-family: 'proxima_nova_ltthin';
            }
            .login_input {
                border: none;
                border-bottom: solid 1px #4a4a4a;
                border-radius: 0px;
                padding: 6px 0 6px;
                box-shadow: none;
                outline: none;
            }
            .login_input:focus {
                border: none;
                border-bottom: solid 2px #5fc095;
                box-shadow: none;
                outline: none;
            }
            .login_alert {
                color: #F44336;
                font-size: 12px;
                text-align: left;
                margin-top: -10px;
            }
            .login_btn_rounded {
                background-color: #05d8dd;
                border-radius: 2em;
                border: none;
                margin-top: 30px;
            }
            .login_btn_rounded:hover, .login_btn_rounded:focus {
                background-color: #03babe;
                border-radius: 2em;
                border: none;
            }
            .login_btn_check {
                background-color: #00ff99;
                margin-top: 50px;
            }
            .login_btn_check:focus, .login_btn_check:hover {
                background-color: #00c778;
                margin-top: 50px;
            }
            .login_problem {
                margin: 10px 0 -20px;
            }
            .login_problem a {
                color: #010128;
                font-family: 'proxima_nova_ltthin';
            }
            .login_banner {
                background: url(../assets/img/login-banner.jpg);
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }

            .reg-sticker {
                box-shadow: -2px 0px 20px 0px rgba(0, 0, 0, 0.17); 
                height: 100%;
            }

            #tenant-form fieldset:not(:first-of-type) {
                display: none;
            }

            .steps, .keterangan {
                display: none;
            }

            .activate {
                display: block !important;
            }

        </style>
        <script>
            history.forward();
        </script>
    </head>
    <body class="">
        <div class="login_container col-md-8">
            <div class="login_row panel login_panel">

                <div class="panel-body login_body">

                    <div class="form-horizontal">

                        <form id="zeroForm">
                            <fieldset class="steps step0 activate">
                                <h2>MyJOMLOKA</h2>
                                <div class="form-group">
                                    <div class="form-group grp-login-id">
                                        <div class="col-md-12"><label class="control-label" for="company_name">User ID*:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputUserID" name="inputUserID" type="text" class="form-control input-lg" required maxlength="150">
                                        </div>
                                    </div>
                                    <div class="form-group grp-login-ic">
                                        <div class="col-md-12"><label class="control-label" for="company_name">NRIC*:</label></div>
                                        <div class="col-md-12">
                                            <p><span style="color: red; margin-bottom: 10px;">Please log in using your IC number / Passport number and your password</span></p>
                                            <input id="inputUserIC" name="inputUserIC" type="text" class="form-control input-lg" required maxlength="150">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Password*:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputPassword1" name="inputPassword1" type="password" class="form-control input-lg" required maxlength="50">
                                        </div>
                                    </div>

                                </div>
                                <div class="text-right">
                                    <button id="btnBack" class="btn btn-rounded btn-default btn-lg login-btn grp-login-ic"><i style="margin-top: 3px;" class="fa fa-times fa-lg pull-left"></i> Back</button>
                                    <button id="btnLogin" class="btn btn-rounded btn-mkag btn-lg login-btn grp-login-id">Login <i style="margin-top: 3px;" class="fa fa-angle-right fa-lg pull-right"></i></button>
                                    <button id="btnLoginIC" class="btn btn-rounded btn-mkag btn-lg login-btn grp-login-ic">Login  <i style="margin-top: 3px;" class="fa fa-angle-right fa-lg pull-right"></i></button>
                                </div>
                            </fieldset>
                        </form>                      

                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-4 login_container reg-sticker">
            <div class="login_row login_panel">

                <div class="login_logo text-center">
                    <div class="keterangan keterangan0 activate">
                        <img class="keterangan-logo" src="../assets/id.svg">
                        <h3>MyJOMLOKA</h3>
                        <p>Sign in using your JOMLOKA ID to access your JOMLOKA account online and the My JOMLOKA App. Don't have id?</p>
                        <p><a href="../TMS/register-tenant-manager.jsp"><b>Register Now.</b></a></p>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="libraries/footLibrary.jsp" %>
        <script src="../assets/js/rd.jquery.validator.js"></script>
        <script src="../assets/js/rd.jquery.check-file.js"></script>
        <script src="../assets/js/rd.jquery.preventKey.js"></script>

        <script>


            $(function () {

                $(".grp-login-ic").hide();
                $(".grp-login-id").show();

                var $btnLogin = $("#btnLogin"),
                        $btnLoginIC = $("#btnLoginIC"),
                        $btnBack = $("#btnBack"),
                        $formLogin = $("#zeroForm");


                codeEmailValidityKeyUp("#inputUserID");
                preventPipeKeyPress("input");
                preventPipeKeyUp("input");
                
//                $("#zeroForm").on("keyup", function(event){
//                    event.preventDefault();
//                    var $nric = $("#inputUserIC");
//                    if(event.keyCode === 13){
//                        if($nric.val()===""){
//                            $btnLogin.click();
//                            console.log("Login ID");
//                        }
//                        else if($nric.val()!==""){
//                            $btnLoginIC.click();
//                            console.log("Login IC");
//                        }
//                        else{
//                            return false;
//                        }
//                        
//                        return event.keyCode;
//                    }                   
//                    
//                });

                $btnLogin.on("click", function (event) {
                    event.preventDefault();

                    var $userID = $("#inputUserID"),
                            $password = $("#inputPassword1");

                    if ($userID.val() === "") {
                        bootbox.alert("Please enter your user ID", function () {
                            $userID.focus();
                        });
                        return;
                    }

                    if ($password.val() === "") {
                        bootbox.alert("Please enter your password", function () {
                            $password.focus();
                        });
                        return;
                    }

                    var oriText = $(this).text();

                    var input = {
                        userID: $userID.val(),
                        password: $password.val(),
                        user_group: "HIS-CARE"
                    };

                    $formLogin.prop("disabled", true);
                    $(this).text("Loading...");

                    $.ajax({
                        type: 'POST',
                        timeout: 60000,
                        url: "../Entrance/login_process.jsp",
                        dataType: 'json',
                        data: input,
                        success: function (data, textStatus, jqXHR) {

                            if (!data.isRedirect) {
                                bootbox.alert(data.msg);
                                
                            }

                            else if (data.url === "ReSign-in") {
                                bootbox.alert(data.msg);
                                $(".grp-login-id").hide();
                                $(".grp-login-ic").show();
                                $password.val("");
                                
                            }
                            else{
                                window.location = data.url;
                            }

                            

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Err: " + errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            $formLogin.prop("disabled", false);
                            $btnLogin.text(oriText);
                        }
                    });

                });// end button login ID

                $btnLoginIC.on("click", function (event) {
                    event.preventDefault();
                    var $nric = $("#inputUserIC"),
                            $password = $("#inputPassword1");

                    if ($nric.val() === "") {
                        bootbox.alert("Please enter your NRIC/Passport number!");
                        return;
                    } else if ($password.val() === "") {
                        bootbox.alert("Please enter your password!");
                        return;
                    }

                    var oriText = $(this).text();

                    var input = {
                        userIC: $nric.val(),
                        password: $password.val(),
                        user_group: "HIS-CARE"
                    };

                    $formLogin.prop("disabled", true);
                    $(this).text("Loading...");

                    $.ajax({
                        type: 'POST',
                        timeout: 60000,
                        url: "../Entrance/login_process.jsp",
                        dataType: 'json',
                        data: input,
                        success: function (data, textStatus, jqXHR) {

                            if (!data.isRedirect) {
                                bootbox.alert(data.msg);
                                
                            }
                            else{
                               window.location = data.url;  
                            }

                           

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Err: " + errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            $formLogin.prop("disabled", false);
                            $btnLoginIC.text(oriText);
                        }
                    });

                });//end button login IC


                $btnBack.on("click", function () {
                    $(".grp-login-ic").hide();
                    $(".grp-login-id").show();
                    $formLogin[0].reset();

                });// end btn back


                // copy
                //balapaCop("Step by Step Form", "#999");

            });//end ready


        </script>
    </body>

</html>
