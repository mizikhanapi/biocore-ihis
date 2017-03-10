  <%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<%
    
    if (!(session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals("")))
        {
     %>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#signupBtn').hide();
                 });
                
                </script>
<%
        }else if ((session.getAttribute("Admin_IC") == null || session.getAttribute("Admin_IC").equals("")))
        {
            response.sendRedirect("Adminlogin.jsp");
            
        }
        else
        {

%>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#logoutBtn').hide();
                 });
                
                </script>
<%

        }
   
%>
<!DOCTYPE html>
<html>
<head>
    <title>Kiosk | Main Menu Page</title>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <script src="Dashboard_files\jquery.min.js.download"></script>
        
    <div w3-include-html="libraries/header.html"></div>
        <%@include file="Header.jsp"%>
        
  
    <link href="assets/css/login.css" rel="stylesheet">
     <link  rel="stylesheet" href="css/style.css">

  
</head>
<body>
    
    
    
      <div class="container">
        <div class="card card-container">
            <div class="profile-img-card">
                <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
            </div>
            <h2 style="text-align: center; margin-bottom: 10%">iHIS</h2>
            
            <p id="profile-name" class="profile-name-card " style="font: 17px; margin: 10%;">PLEASE SELECT Service</p>
            <div class="tac">
                <div id="signupBtn" class="tac margin1 centerBtnDisplay">
                     <a  href="signUp/readinfo.jsp" class="btn btn-lg  bttn " >Sign up</a>
                </div>
                <div class="tac margin1 centerBtnDisplay">
                     <a href="registration/SelectQueue.jsp" class="btn btn-lg  bttn " >Registration</a> 
                </div>
                
                <div class="tac margin1 centerBtnDisplay">
                     <a href="medicalHistory/printReport.jsp" class="btn btn-lg  bttn " >View Medical History</a> 
                </div>
            </div>
            <a id="logoutBtn" href="destroySession.jsp" class="pull-right" style ="font-size:14px" type="submit">Log Out</a>
            
        </div><!-- /card-container -->
    </div><!-- /container -->
      
  
       <div w3-include-html="libraries/script.html"></div>

    <script src="http://www.w3schools.com/lib/w3data.js"></script>

      <script>
        w3IncludeHTML();
      </script>
      
</body>
</html>
