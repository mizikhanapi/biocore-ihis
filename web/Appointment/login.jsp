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

    <%@include file="assets/header.html"%>
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
                <form class="form-signin" role="form" method="post" action="login_process.jsp" >
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="text" class="form-control"  name="username" placeholder="Username" required>
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                    <button type="submit" class="btn btn-lg btn-primary btn-block btn-signin">Login</button>
                </form> <!--/form -->


                <!--                                <button class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Sign in</button>-->
                <a href="Forgot_Password" class="forgot-password">Forgot the password?</a>
                <br/>
                <a href="register.jsp" class="forgot-password">You have no account?</a>
            </div> <!--/card-container -->
        </div> <!--/container -->


        <!--                <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-4 col-md-offset-4 col-sm-12  col-xs-12 login_area"> 
                                    <img src="image/oldutemlogo.png" class="img-responsive center-block" alt="Responsive image" ><hr><hr>
                                    <h3>Login</h3>
                                    <hr>
                                    <form role="form" method="post" action="login_process.jsp">
                                        <div class="form-group">
                                            <label for="ic_no">Login Id</label>
                                            <input type="text" class="form-control"  name="username" placeholder="Username" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="username">Password</label> 
                                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                                        </div>
                                        <p style="padding-bottom: 2%"><a href="register.jsp">You have no account?</a></p>
                                        <button type="submit" class="btn btn-success">Login</button>
                                        <button type="reset" class="btn btn-success ">Reset</button>
                                        <button type="reset" class="btn btn-primary buttonMainPage" onclick="window.location.href = 'index.jsp'" >Back</button>
                                    </form>
                                </div>
                            </div>
                        </div>-->
    </body>
</html>
