<%-- 
    Document   : index
    Created on : Jan 13, 2017, 9:26:29 AM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    //out.print(conn.getIpCall());
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>iHIS | Forgot Password</title>

        <!-- header -->

        <script src="../assets/js/jquery.min.js"></script>
        <%@include file="../assets/header.html"%>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="../assets/css/login.css" rel="stylesheet">
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->        
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--<script src="http://www.w3schools.com/lib/w3data.js"></script>-->

        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>-->
        <script src="js/bootbox.min.js"></script>

        <!-- header -->
    </head> 
    <body>
        <div class="container" style="width: 800px; ">
            <div class="card card-container"  style="width: 60%; max-width: inherit; max-height: 525px;" >
                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <div class="profile-img-card">
                    <i class="fa fa-question-circle" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <h2 style="text-align: center;"><span style="color: #0ae">iHIS</span></h2>
                <p id="profile-name" class="profile-name-card" style="padding: 5px">Forget Password</p>
                <form class="form-horizontal" id="leForm" >

                    <!--                <input type="text" id="inputUserID" class="form-control" placeholder="User ID" name="username" required autofocus>
                                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>-->
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">User ID *</label>
                        <div class="col-md-7">
                            <input id="F_userID"  type="text" placeholder="Insert your User ID" class="form-control input-md" maxlength="30">
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">User IC/ID No *</label>
                        <div class="col-md-7">
                            <input id="F_IC"  type="text" placeholder="Insert your User IC/ID No" class="form-control input-md" maxlength="30">
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">Mother's Name *</label>
                        <div class="col-md-7">
                            <input id="F_mother"  type="text" placeholder="Insert your mother's name" class="form-control input-md" maxlength="30">
                        </div>
                    </div>


                </form><!-- /form -->
                <button class="btn btn-lg btn-primary btn-block btn-signin" id="F_btnResetPassword" style="margin: auto; width: 40%; margin-bottom: 10px;">OK</button>
                <a href="Sign-in" class="forgot-password">
                    <i class="fa fa-arrow-left" aria-hidden="true" style="color: #666; font-size: 15px; padding: 5px"></i> Back to login
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


            $('#F_btnResetPassword').on('click', function () {

                var userID, IC, mother;

                userID = $('#F_userID').val();
                IC = $('#F_IC').val();
                mother = $('#F_mother').val();

                if (userID === "" || IC === "" || mother === "") {
                    bootbox.alert("Please complete all fields");
                } else {

                    var data = {userID: userID,
                        IC: IC,
                        mother: mother,
                        process: 'check'
                    };

                    $.ajax({
                        type: 'POST',
                        url: "reset_password_process.jsp",
                        timeout: 60000,
                        data: data,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() === 'success') {
                                bootbox.prompt({
                                    title: "Please select what to do with your password.",
                                    inputType: 'select',
                                    inputOptions: [
                                        {
                                            text: 'Reset my password to abc123',
                                            value: '',
                                        },
                                        {
                                            text: 'Send my password to my email',
                                            value: '2',
                                        }
                                    ],
                                    callback: function (result) {
                                        if (result === '') {
                                            resetabc123(userID, IC, mother);
                                        } else if (result === '2') {
                                            sendToMyEmail(userID);
                                        }
                                    }
                                });

                            } else if (data.trim() === 'fail') {

                                bootbox.alert("Something went wrong. Try again later");

                            } else {

                                bootbox.alert(data.trim().toString());
                                $('#F_userID').val("");
                                $('#F_IC').val("");
                                $('#F_mother').val("");

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            alert("Error: " + errorThrown.toString());

                        }
                    });

                }

            });

            function buildMessage(nama, siapa, lalu) {

                var strMessage = 'Dear ' + nama.trim() + ', '
                        + '\n\nPlease do not disclose the following information to others. \n'
                        + '\n\t Your user ID: ' + siapa + ' '
                        + '\n\t Your password: ' + lalu + ' '
                        + '\n\n Please remember your password next time.';


                return strMessage;
            }

            function resetabc123(userID, IC, mother) {

                var data = {userID: userID,
                    IC: IC,
                    mother: mother,
                    process: 'reset'
                };

                $.ajax({
                    type: 'POST',
                    url: "reset_password_process.jsp",
                    timeout: 60000,
                    data: data,
                    success: function (data, textStatus, jqXHR) {

                        if (data.trim() === 'success') {
                            bootbox.alert("Your password has been reset to abc123", function () {
                                window.location = "Sign-in";
                            });

                        } else if (data.trim() === 'fail') {

                            bootbox.alert("Something went wrong. Try again later");

                        } else {

                            bootbox.alert(data.trim().toString());
                            $('#F_userID').val("");
                            $('#F_IC').val("");
                            $('#F_mother').val("");

                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                        alert("Error: " + errorThrown.toString());

                    }
                });


            }

            function sendToMyEmail(userID) {

                var data = {
                    userID: userID,
                    process: 'email'
                };

                $.ajax({
                    type: 'POST',
                    url: "reset_password_process.jsp",
                    timeout: 60000,
                    data: data,
                    success: function (data, textStatus, jqXHR) {

                        var arrData = data.split("|");

                        if (arrData.length === 4) {

                            var nama = arrData[0], email = arrData[1], siapa = arrData[2], lalu = arrData[3];
                            var strMsg = buildMessage(nama, siapa, lalu);
                            postTheMail(email, strMsg);

                        } else {

                            bootbox.alert('Opps! Something went wrong. Please try again.');
                            console.log(arrData);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                        alert("Error: " + errorThrown.toString());

                    }
                });


            }

            function postTheMail(to, message) {

                var data = {
                    password: "B10core",
                    to: to,
                    subject: "iHIS forgot password - NO REPLY",
                    message: message
                };

                $.ajax({
                    type: 'GET',
                    url: "http://tuffah.info/biocore/",
                    timeout: 60000,
                    data: data,
                    success: function (data, textStatus, jqXHR) {

                        var arrData = data.split("|");
                        if(arrData[0].trim() === '0'){
                            bootbox.alert('An email is sent to '+to, function(){
                                window.location = "Sign-in";
                            });
                            
                        }else{
                            bootbox.alert("Failed to send email. Please try again later");
                        }
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                        alert("Error: " + errorThrown.toString());

                    }
                });


            }


        </script>
    </body>
</html>