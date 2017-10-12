<%-- 
    Document   : register
    Created on : Mar 28, 2016, 8:56:09 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<!DOCTYPE html>
<html>
    <title>Register Form</title>
    <%@include file="header.jsp"%>
    <%@include file="assets/header.html"%>
    <link href="assets/css/login.css" rel="stylesheet">



    <body class="bodyAuthenticate">

        <div class="container m-scene">
            <div class="card card-container" style="max-height: 571px; max-width: 365px;">
                <!--                 <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <div class="profile-img-card">
                    <img src="assets/i-his.logo.svg" class="logo-login">
                </div>
                <div class="logo" style="font-size: 32px;">
                    Create your Account
                </div>
                <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Integrated Health Information System</p>
                <form role="myForm" id="register_form" name="frm"  method="post" class="form-signin">
                    <div class="form-group">
                        <input id="IC" type="text" class="form-control" name="ic_no" onkeypress="return isNumberKey(event)" maxlength="12" placeholder="Identity No (IC No.)" required>
                    </div>
                    <div class="form-group">
                        <input id="USERNAME" type="text" class="form-control" name="username"  maxlength="10" placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <input id="PASSWORD" type="password" class="form-control" name="password"  maxlength="20" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" name="mobile_no"   id="mobile_no" placeholder="Mobile No" required>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block btn-signin" id="register">Register</button>
                </form>
                <a onclick="window.location.href = 'login.jsp'" class="forgot-password"><i class="fa fa-caret-left"></i>&nbsp;&nbsp;&nbsp;Back to Login Page</a>
            </div> <!--/card-container -->
        </div> <!--/container -->




        <!--        <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 register_header">
                            <h3 style="color: white"><i>Welcome To Join Our Member!</i></h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 register_area">
                            <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" ><hr><hr>
                            <h3>Register Form</h3>
                            <hr>
                            <form role="myForm" name="frm"  method="post" >
                                <div class="form-group">
                                    <label for="ic_no">IC No / Passport No</label>
                                    <input id="IC" type="text" class="form-control" name="ic_no" onkeypress="return isNumberKey(event)" maxlength="12" placeholder="Identity No" required>
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label> 
                                    <input id="USERNAME" type="text" class="form-control" name="username"  maxlength="10" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input id="PASSWORD" type="password" class="form-control" name="password"  maxlength="20" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <label for="submit">Mobile No</label>
                                    <input type="number" class="form-control" name="mobile_no"   id="mobile_no" placeholder="Mobile No" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                                </div>
                                <button  class="btn btn-success" id="register">Register</button>
                                <button type="reset" class="btn btn-success ">Reset</button>
                                <button type="reset" class="btn btn-primary" onclick="window.location.href = 'index.jsp'">Back</button>
                            </form>
                        </div>
                    </div>
                </div>-->

        <script type="text/javascript">

            $(document).ready(function () {
                $('#register').click(function (e) {
                    var password = $('#PASSWORD').val();
                    var username = $('#USERNAME').val();
                    e.preventDefault();
                    //var pValid = passwordValidation(password);


//                    var uValid = AllowAlphabet(username);
//                    if (uValid === "alphabetonly") {
//                        alert("Please Enter only alphabets in text with 10 character");
//                    } else {
//
//                        if (pValid === "short") {
//                            alert("Error: Password must contain at least six characters and at most ten character!");
//                        } else if (pValid === "nonumber") {
//                            alert("Error: password must contain at least one number (0-9)!");
//                        } else if (pValid === "nolower") {
//                            alert("Error: password must contain at least one lowercase letter (a-z)!");
//                        } else if (pValid === "noupper") {
//                            alert("Error: password must contain at least one uppercase letter (A-Z)!");
//                        } else if (pValid === "nospecial") {
//                            alert("Error: password must contain at least one special character!");
//                        } else {

                            var dataRegister = {
                                ic_no: $('#IC').val(),
                                username: username,
                                password: password,
                                mobile_no: $('#mobile_no').val(),
                                email: $('#email').val()
                            };
                            $.ajax({
                                url: 'register_process.jsp',
                                method: 'post',
                                timeout: 10000,
                                data: dataRegister,
                                success: function (result) {
                                    console.log(result);
                                    var message = result.trim();
                                    if (message === "alreadyRegister") {
                                        alert("You already a registered user and just login into the system");
                                    } else if (message === "success") {
                                        alert("You have successfully register!!!");
                                        $("#register_form")[0].reset();
                                    } else if (message === "fail") {
                                        alert("Register fail! Username has been used..");
                                    } else if (message === "mobile") {
                                        alert("The mobile no has been registered. You have to used other mobile no");
                                    } else if (message === "email") {
                                        alert("The email has been registered. You have to used other email account");
                                    } else if (message === "register") {
                                        alert("You have to register yourself at the UTeM Clinic as First Registration!");
                                    }
                                }
                            });
                        
                    //}

                });
            });
        </script>
    </body>
</html>
