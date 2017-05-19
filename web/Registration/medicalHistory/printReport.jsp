<%-- 
    Document   : printReport_2
    Created on : Apr 10, 2017, 5:13:02 PM
    Author     : user
--%>
<%

    if (session.getAttribute("Patient_IC") == null || session.getAttribute("Patient_IC").equals("")) {
        response.sendRedirect("../login.jsp");
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiosk | Medical History Page</title>
        <!--header-->
        <%@include file="../assets/header.html"%>
        <link  rel="stylesheet" href="../assets/css/radiobtn.css">

        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- keyboard widget css & script (required) -->
        <link href="../assets/css/keyboard.css" rel="stylesheet">
        <link href="../assets/css/jquery-ui.min.css" rel="stylesheet">
        <script src="../assets/js/jquery.keyboard.js"></script>

        <script>
            $(function () {
                $('#inputUserIC').keyboard();
            });
        </script>
        <!--header-->
    </head>
    <body>
        <div class="container-fluid m-scene">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4" style="margin-top: 2%;">
                            <div class="thumbnail">
                                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                                <a href="../destroySession.jsp" title="Log Out"><i class="fa fa-power-off fa-lg pull-right" style="color: #ccc;"></i></a>
                                <div class="profile-img-card" style="text-align: center;" >
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                                </div>
                                <div class="logo" style="font-size: 32px; text-align: center;">
                                    Please enter your IC Number to <br/>Print Report
                                </div>
                                <br/>
                                <input type="text" id="inputUserIC" name="useric" class="form-control margin1" placeholder="Enter Your IC Number">
                                <br/>
                                <div class="text-center">
                                        <button id="printSignup" class="btn btn-lg btn-primary">Print Report</button>
                                        <button id="cancelSignup" class="btn btn-lg btn-default">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Script-->

        <div w3-include-html="../libraries/script.html"></div>

        <script src="http://www.w3schools.com/lib/w3data.js"></script>
        <script src="../assets/js/bootbox.min.js"></script>
        <%//@include file="../assets/script.html"%>
   
        <script>
        w3IncludeHTML();
        
          var pmi_no = "", respond = "";
            
           $("#cancelSignup").on("click", function(){
               
                   window.history.back();
                              
           });//on clcik submitSignup
           
            $("#printSignup").on("click", function(){
                search();
                //window.history.back();
                              
           });//on clcik submitSignup
           
           function PrintReport(pmi_number)
           {
                            
                var printData = {
                       pmiNo:pmi_number
                   };
                   
                if(pmi_number === "")
                   {
                       bootbox.alert("PMINO null");
                   }
                   else {
//                       console.log("before ajax");
                       $.ajax({
                           type:"POST",
                           url: "../Controller/PrintMedicalReport.jsp",
                           data: printData,
                           timeout: 10000,
                           success: function (data){
                               console.log("print sent " + data.trim());
//                               console.log(data.trim());
                               respond = data;
                               if (data.trim() === "No Records")
                                 bootbox.alert("You got no report");
                           },
                           error: function (err){
                               console.log(err);
                           }
                       });
                   }
               
//                if (!(pmi_no === "") && respond.trim() !== "NOT FOUND" )
//                {
//                     console.log("HELLO");
////                 window.open("../Controller/PrintMedicalReport.jsp?pmiNo= "+ pmi_no+" ") ;
//                }
           };
           
            function search() {
                 var userIC;
                   userIC = $("#inputUserIC").val();
                   
                   var data = {
                       userIC:userIC
                   };
                   if(userIC === "")
                   {
                       bootbox.alert("please Fill in the user IC");
                   }
                   else {
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
                                    PrintReport(pmi_no);
                               }
                           },
                           error: function (err){
                               console.log(err);
                           }
                       });
                   }
             }
            
       
      </script>

    </body>
</html>