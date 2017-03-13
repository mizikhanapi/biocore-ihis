
<%

    if (session.getAttribute("USER_IC") == null || session.getAttribute("USER_IC").equals(""))
        {
            response.sendRedirect("../login.jsp");
            out.print(session.getAttribute("USER_IC"));
        }
    
    
%>

<!DOCTYPE html>
<html>
<head>
 
    <title>Kiosk | Medical History Page</title>

  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <script src="../Dashboard_files/jquery.min.js.download"></script>
        
    <div w3-include-html="../libraries/header.html"></div>
        <%@include file="../Header.jsp"%>
        
  
    <link href="../assets/css/login.css" rel="stylesheet">
     <link  rel="stylesheet" href="../css/style.css">
     
    
</head>
<body>
    

    
    
    <div class="container">
     <div class="" >
         <div class="card card-container" >
             <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
             <div class="profile-img-card">
                 <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
             </div>
             <h2 style="text-align: center;">iHIS</h2>
             <p id="profile-name" class="profile-name-card">Please Enter your Information To Sign Up</p>
             
             
             
<!--             <form class="form-signin" action="dashboard.jsp">
                 <span id="reauth-email" class="reauth-email"></span>
                 
             </form> /form 
             -->
             <div class="form-signin tac">
                    <div class="tac margin1 centerBtnDisplay">
                        <button class="btn btn-lg bttn btn_block" type="submit">Print</button>
                    </div>
                    <div class="tac margin1 centerBtnDisplay">
                        <button id="cancelSignup" class="btn btn-lg bttn btn_block ">Cancel</button>
                    </div>
                </div>
             
             <a href="../destroySession.jsp" class="pull-right" style ="font-size:14px" type="submit">Log Out</a>
         </div>

        </div><!-- /card-container -->
    </div><!-- /container -->
	
       <div w3-include-html="../libraries/script.html"></div>

    <script src="http://www.w3schools.com/lib/w3data.js"></script>

      <script>
        w3IncludeHTML();
        
          $(document).ready( function () {
            
            
           $("#cancelSignup").on("click", function(){
               
               window.location = "../mainMenu.jsp";
                              
           });//on clcik submitSignup
           
            
        });
        
      </script>
   
    
</body>
</html>
