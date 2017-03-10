  <%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%
       
    if (!(session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals("")))
        {
            response.sendRedirect("mainMenu.jsp");
            out.print(session.getAttribute("USER_IC"));
        } else if ((session.getAttribute("Admin_IC") == null || session.getAttribute("Admin_IC").equals("")))
        {
            response.sendRedirect("Adminlogin.jsp");
            
        }

%>
<!DOCTYPE html>
<html lang="en">
<!-- header -->
  <head>
      
         <title>Kiosk | Welcome Page</title>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <script src="Dashboard_files\jquery.min.js.download"></script>
        
    <div w3-include-html="libraries/header.html"></div>
      <%@include file="Header.jsp"%>
      
    <link href="assets/css/login.css" rel="stylesheet">
      <link  rel="stylesheet" href="css/style.css">
  </head>

  <!-- body -->
  <body>
      
      
      <div class="container">
        <div class="card card-container">
            <div class="profile-img-card">
                <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
            </div>
            <h2 style="text-align: center; margin-bottom: 10%;">iHIS</h2>
            
            <p id="profile-name" class="profile-name-card " style="font: 17px; margin: 10%;">PLEASE SELECT LANGUAGE</p>
            <div class="tac">
                <div class="tac margin1 centerBtnDisplay">
                     <a href="mainMenu.jsp" class="btn btn-lg  bttn " >English</a>
                </div>
                <div class="tac margin1 centerBtnDisplay">
                     <a href="#" class="btn btn-lg  bttn " >Bahasa Malaysia</a> 
                </div>
            </div>
            
            
        </div><!-- /card-container -->
    </div><!-- /container -->
      
      
    
    <div w3-include-html="libraries/script.html"></div>

    <script src="http://www.w3schools.com/lib/w3data.js"></script>

      <script>
        w3IncludeHTML();
      </script>
  </body>
</html>
