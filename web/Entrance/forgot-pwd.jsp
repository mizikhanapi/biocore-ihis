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
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
    <script src="libraries/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--<script src="http://www.w3schools.com/lib/w3data.js"></script>-->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
    
    <!-- header -->
</head> 
<body>
    <div class="container" style="width: 800px; background-color: whitesmoke; ">
        <div  style="width: 60%; align-self: center; margin: auto; padding: 5px" >
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <div class="profile-img-card">
                <i class="fa fa-question-circle" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
            </div>
            <h2 style="text-align: center;"><span style="color: #0ae">iHIS</span></h2>
            <p id="profile-name" class="profile-name-card" style="padding: 5px">Reset Password</p>
            <form class="form-horizontal" id="leForm" >

                <!--                <input type="text" id="inputUserID" class="form-control" placeholder="User ID" name="username" required autofocus>
                                <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>-->
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">User ID *</label>
                    <div class="col-md-8">
                        <input id="F_userID"  type="text" placeholder="Insert your User ID" class="form-control input-md" maxlength="30">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">User IC/ID No *</label>
                    <div class="col-md-8">
                        <input id="F_IC"  type="text" placeholder="Insert your User IC/ID No" class="form-control input-md" maxlength="30">
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Mother's Name *</label>
                    <div class="col-md-8">
                        <input id="F_mother"  type="text" placeholder="Insert your mother's name" class="form-control input-md" maxlength="30">
                    </div>
                </div>


            </form><!-- /form -->
            <button class="btn btn-lg btn-primary btn-block btn-signin" id="F_btnResetPassword" style="margin: auto; width: 40%">Reset Password</button>
            <a href="login.jsp" class="forgot-password">
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
      
       
       $('#F_btnResetPassword').on('click', function(){
            
            var userID, IC, mother;
            
            userID = $('#F_userID').val();
            IC = $('#F_IC').val();
            mother = $('#F_mother').val();
            
            if(userID === "" || IC === "" || mother === ""){
                bootbox.alert("Please complete all fields");
            }else{
                
                var data = {userID : userID,
                            IC : IC,
                            mother : mother
                        };
                        
                $.ajax({
                    type: 'POST',
                    url: "reset_password_process.jsp",
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        
                        if(data.trim() === 'success'){
                            bootbox.alert("Your password has been reset to abc123", function(){
                                window.location = "login.jsp";
                            } );
                        
                        }else if(data.trim() === 'fail'){
                            
                            bootbox.alert("Something went wrong. Try again later");
                        
                        }else{
                            
                            bootbox.alert(data.trim().toString());
                            $('#F_userID').val("");
                            $('#F_IC').val("");
                            $('#F_mother').val("");
                            
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        
                        alert("Error: "+ errorThrown.toString());
                        
                    }
                });
                
            }
           
       });
       

    </script>
</body>
</html>