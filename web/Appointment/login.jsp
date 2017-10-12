<%-- 
    Document   : login
    Created on : Mar 28, 2016, 8:05:22 PM
    Author     : user
--%>


<%@page import="sun.security.krb5.Confounder"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>


<%
//
//    String validateSession = request.getParameter("newSession");
//    out.print(validateSession);
//if(validateSession.equals(null))
//{
//    response.sendRedirect("login.jsp");
//}
//else
//{
//    response.sendRedirect("login.jsp");
//} 

//    Config.getFile_url(session);
//    Properties prop = Conn.getIpCall();
//    String host_server = Conn.getIpCall().getProperty(Conn.STR_HOST);
//    int host_port = 1099;
//    try {
//        host_port = Integer.parseInt(Conn.getIpCall().getProperty(Conn.STR_PORT));
//    } catch (Exception e) {
//    }
//    String error = Conn.getIpCall().getProperty(Conn.STR_ERROR);
//    out.print("|" + host_server + "|" + host_port + "|" + error + "|");
//    
//    if (true) { return; }
 Config.getBase_url(request);
    Config.getFile_url(session);
    Conn Conn = new Conn();

    String path = Conn.HOST;
    //out.print(path);
%>

<!DOCTYPE html>
<html>
    <title>Login page</title>
    <%//@include file="header.jsp"%>

    <title>iHIS | Biocore</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" type="image/png" href="../assets/favicon.png"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet"> <!-- Font Icons -->
    <link href="assets/css/dashboard.css" rel="stylesheet"> <!-- Main CSS -->
    <link href="assets/css/Line-tabs.css" rel="stylesheet"> <!-- Page Tab -->
    <link href="assets/css/checkgif.css" rel="stylesheet"> <!-- Check Gif -->
    <link href="assets/css/jquery.flexdatalist.min.css" rel="stylesheet" type="text/css"/>
    <!--<link rel="stylesheet" href="/assets/css/demo-relevant.css">  Page Transition -->
    <link href="assets/css/jquery.flexdatalist.min.css" rel="stylesheet"> <!-- Auto Complete Search -->
    <link href="assets/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/wickedpicker.css" rel="stylesheet" type="text/css"/> <!--Time Picker-->
    <link href="js/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <style>
        .no-js #loader { display: none;  }
        .js #loader { display: block; position: absolute; left: 100px; top: 0; }
        /* Absolute Center Spinner */
        .loading {
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background: url(../assets/ring.svg) center no-repeat;
            background-color: rgba(255, 255, 255, 1) !important;
        }
        .fc-sun { background-color: #FFCDD2; }
        .fc-sat {  background-color:#FFCDD2;  }

        .fc-day:hover{
            background-color: #51adf6 
        }

    </style>
    <link href="assets/css/login.css" rel="stylesheet">
  

    <body class="bodyAuthenticate">
  
        <div class="container m-scene">
            <div class="card card-container">
                <!--                 <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                <div class="profile-img-card">
                    <img src="assets/i-his.logo.svg" class="logo-login">
                </div>
                <div class="logo" style="font-size: 32px;">
                    <span>e-Appointment</span>
                </div>
                <p id="profile-name" class="profile-name-card" style="font-weight: 400;">Integrated Health Information System</p>
<!--                <form class="form-signin" role="form" method="post" action="login_process.jsp" >-->
                <form class="form-signin" role="form" >
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="text" class="form-control"  name="username" placeholder="Username" id="username" required>
                    <input type="password" class="form-control" name="password" placeholder="Password" id="password" required>
                    <button class="btn btn-lg btn-primary btn-block btn-signin" id="btn_APP_LOGIN">Login</button>
                </form> <!--/form -->


                <!--                                <button class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Sign in</button>-->
                <a href="Forgot_Password" class="forgot-password">Forgot the password?</a>
                <br/>
                <a href="register.jsp" class="forgot-password">You have no account?</a>
            </div> <!--/card-container -->
        </div> <!--/container -->
        
        <script type="text/javascript">
            $(document).ready(function(){
                $("#btn_APP_LOGIN").click(function(e){
                    e.preventDefault();
                    
                    var username = $("#username").val();
                    var password = $("#password").val();
                    var data = {
                        username:username,
                        password:password
                    }
                    $.ajax({
                        method:"POST",
                        //timeout:"3000",
                        url:"login_processv2.jsp",
                        data:data,
                        success:function(r){
                           var res = r.trim();
                           if(res === "|SUCCESS-PUBLIC-LOGIN|"){
                               //location.href = "index.jsp";
                               location.href = "patientSelectHFC.jsp"
                           }else if(res === "4"){
                               alert("You have logged in to another PC or you did not log out properly");
                               location.href = "../Entrance/ReSign-in";
                           } else if(res === "2"){
                               window.location = "index.jsp";
                           } else if(res === "1") {
                               alert("Wrong password");
                           } else if(res === "0") {
                               alert("User ID does not exist");
                           }
                        }
                    })
                })
            })
        </script>
    </body>
</html>


