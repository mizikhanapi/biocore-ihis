  <%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>  
  <% 

    if (!(session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals("")))
        {
            response.sendRedirect("mainMenu.jsp");
            out.print(session.getAttribute("USER_IC"));
        }else if ((session.getAttribute("Admin_IC") == null || session.getAttribute("Admin_IC").equals("")))
        {
            response.sendRedirect("Adminlogin.jsp");
            
        }
     
     
    Conn conn = new Conn();
//    out.print(conn.getIpCall());
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Kiosk | Login Page</title>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <script src="Dashboard_files\jquery.min.js.download"></script>
        
    <div w3-include-html="libraries/header.html"></div>
    <link href="assets/css/login.css" rel="stylesheet">

      <%--<%@include file="Header.jsp"%>--%>
   </head>
  <body>
    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <div class="profile-img-card">
                <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
            </div>
            <h2 style="text-align: center;">iHIS</h2>
            <p id="profile-name" class="profile-name-card">Clinical Support System</p>
            <form class="form-signin" id="leForm" >
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" id="inputUserIC" class="form-control" placeholder="User ID" name="username" required autofocus>
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
            </form><!-- /form -->
            <button  class="btn btn-lg btn-primary btn-block btn-signin" id="btnSign">Sign in</button>
            <a href="forgot-pwd.html" class="forgot-password">
                Forgot the password?
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <div w3-include-html="libraries/script.html"></div>

    <script src="http://www.w3schools.com/lib/w3data.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <script>
        w3IncludeHTML();
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

                var userIC = $("#inputUserIC").val();
                var password = $("#inputPassword").val();

                if (userIC === "") {
                    alert("Fill in the User IC");
                    $("#inputUserIC").focus();
                } else if (password === "") {
                    alert("Fill in the password");
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
                                alert("Wrong password");
                            else if (num === 0)
                                alert("User IC does not exist");
                            else
                                alert("Error");
                        },
                        error: function (err) {
                            console.log(err);
                            alert("error :" + err.toString());
                        }

                    });
                }
            }     
      
  </script>
  </body>
  
</haml>
