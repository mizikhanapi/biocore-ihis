
<%

    if (session.getAttribute("Patient_IC") == null || session.getAttribute("Patient_IC").equals(""))
        {
            response.sendRedirect("../login.jsp");
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
             <p id="profile-name" class="profile-name-card">Please Enter your IC Number to View Report</p>
             
             <input type="text" id="inputUserIC" name="useric" class="form-control margin1" placeholder="Enter Your IC Number">
              
        <!-- <form class="form-signin" action="dashboard.jsp">
                 <span id="reauth-email" class="reauth-email"></span>
                 
             </form> /form 
             -->
             <div class="form-signin tac">
                    <div class="tac margin1 centerBtnDisplay">
                        <button id="printSignup" class="btn btn-lg bttn btn_block">View Report</button>
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
        
          var pmi_no = "", respond = "";
            
           $("#cancelSignup").on("click", function(){
               
                   window.history.back();
                              
           });//on clcik submitSignup
           
            $("#printSignup").on("click", function(){
                search();
                if (!(pmi_no === "") && respond.trim() !== "NOT FOUND" )
               window.open("../Controller/PrintMedicalReport.jsp?pmiNo= "+ pmi_no+" ") ;
                //window.history.back();
                              
           });//on clcik submitSignup
           
            function search()
            {
                 var userIC;
                   userIC = $("#inputUserIC").val();
                   
                   var data = {
                       userIC:userIC
                   };
                   if(userIC === "")
                   {
                       bootbox.alert("please Fill in the user IC");
                   }
                   else
                   {
//                       console.log("before ajax");
                       $.ajax({
                           type:"POST",
                           url: "../Controller/searchUser.jsp",
                           data: data,
                           timeout: 10000,
                           success: function (data){
                               console.log("sucess");
//                               console.log(data.trim());
                               respond = data;

                               if(data.trim() === "NOT FOUND")
                               {
                                   bootbox.alert("User NOT Found");
                               }
                               else
                               {
//                                   console.log(data.trim());
                                   var splitData = String(data.trim()).split("|");
//                                    console.log(splitData);
                                    
                                    pmi_no = splitData[0];                                    
//                                    console.log(pmi_no +" " +user_name+" "+user_id);
                               }
                           },
                           error: function (err){
                               console.log(err);
                           }
                       });
                   }
                
            };
            
       
      </script>
   
    
</body>
</html>
