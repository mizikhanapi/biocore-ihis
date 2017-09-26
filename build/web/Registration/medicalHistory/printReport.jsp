<%@include file="../../Entrance/validateSession.jsp" %>

<%

    if (session.getAttribute("Patient_IC") == null || session.getAttribute("Patient_IC").equals("")) {
        response.sendRedirect("../login.jsp");
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiosk | Medical History</title>
        <!--header-->
        <%@include file="../assets/header.html"%>
        <link  rel="stylesheet" href="../assets/css/radiobtn.css">

        <script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
<!--        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

        <!--<script src="../../assets/js/"></script>-->
        <script src="../../assets/js/jquery-ui.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>



        <!-- keyboard widget css & script (required) -->
        <link href="../assets/css/keyboard.css" rel="stylesheet">
        <link href="../assets/css/jquery-ui.min.css" rel="stylesheet">
        <script src="../assets/js/jquery.keyboard.js"></script>

        <script>
            var lang = sessionStorage.getItem('lang');
            $(function () {
                if (lang === "en") {
                    $("div[lang=ml]").css("display", 'none');
                } else if (lang === "ml") {
                    $("div[lang=en]").css("display", 'none');
                }
                $("div[lang=" + lang + "] #inputUserIC").keyboard();
            });
        </script>
        <!--header-->
    </head>
    <body>
        <div class="container-fluid m-scene">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4" style="margin-top: 2%;"  lang="en">
                            <div class="thumbnail">
                                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                                <a href="../destroySession.jsp" title="Log Out"><i class="fa fa-power-off fa-lg pull-right" style="color: #ccc;"></i></a>
                                <div class="profile-img-card" style="text-align: center;" >
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                                </div>
                                <div class="logo" style="font-size: 32px; text-align: center;">
                                    Please enter your IC Number to <br/>View Report
                                </div>
                                <br/>
                                <input type="text" id="inputUserIC" name="useric" class="form-control margin1" placeholder="Enter Your IC Number">
                                <br/>
                                <div style="width: 100%; display: none;" id="reportResult"></div>
                                <br/>
                                <div class="text-center">
                                        <button id="viewMR" class="btn btn-lg btn-primary">View Report</button>
                                        <button id="printMR" class="btn btn-lg btn-success">Print Report</button>
                                        <button id="cancelMR" class="btn btn-lg btn-default">Cancel</button>
                                </div>
                                
                            </div>
                        </div>
                        
                        
                          <div class="col-md-4 col-md-offset-4" style="margin-top: 2%;"  lang="ml">
                            <div class="thumbnail">
                                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                                <a href="../destroySession.jsp" title="Log Out"><i class="fa fa-power-off fa-lg pull-right" style="color: #ccc;"></i></a>
                                <div class="profile-img-card" style="text-align: center;" >
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                                </div>
                                <div class="logo" style="font-size: 32px; text-align: center;">
                                    Sila masukkan Nombor IC anda kepada <br/>Lihat Laporan
                                </div>
                                <br/>
                                <input type="text" id="inputUserIC" name="useric" class="form-control margin1" placeholder="Masukkan Nombor IC anda">
                                <br/>
                                <div style="width: 100%; display: none;" id="reportResult"></div>
                                <br/>
                                <div class="text-center">
                                        <button id="viewMR" class="btn btn-lg btn-primary">Lihat Laporan</button>
                                        <button id="printMR" class="btn btn-lg btn-success">Cetak Laporan</button>
                                        <button id="cancelMR" class="btn btn-lg btn-default">Batalkan</button>
                                </div>
                                
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>

        <!--Script-->

        <div w3-include-html="../libraries/script.html"></div>

        <script src="../assets/js/bootbox.min.js"></script>
        <%//@include file="../assets/script.html"%>
   
        <script>
        
          var pmi_no = "", respond = "";
            
            $("div[lang=" + lang + "] #printMR").hide();
            
           $("div[lang=" + lang + "] #cancelMR").on("click", function(){
            window.history.back();
           });//on clcik submitSignup
           
            $("div[lang=" + lang + "] #viewMR").on("click", function(){
                search();
                //window.history.back();       
           });//on clcik submitSignup
           
           function viewReport(pmi_number)
           {
                            
                var viewData = {
                       pmiNo:pmi_number
                   };
                   
                if(pmi_number === "")
                   {
                       bootbox.alert("Oops!, There is a missing information");
                   }
                   else {
//                       console.log("before ajax");
                       $.ajax({
                           type:"POST",
                           url: "MedicalReport.jsp",
                           data: viewData,
                           timeout: 10000,
                           success: function (data){
//                               console.log("print sent " + data.trim());
////                               console.log(data.trim());
//                               respond = data;
//                               if (data.trim() === "No Records")
//                                 bootbox.alert("You got no report");

                        $("div[lang=" + lang + "] #reportResult").html(data.trim());
                        
                        if($("div[lang=" + lang + "] #checkReport").text() === "No Records")
                        {
                            bootbox.alert("You got no report");
                        } else {
                            $("div[lang=" + lang + "] #reportResult").css("display","block");
                            $("div[lang=" + lang + "] #viewMR").hide();
                            $("div[lang=" + lang + "] #printMR").show();
                        }
                        
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
                   userIC = $("div[lang=" + lang + "] #inputUserIC").val();
                   
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
                                    viewReport(pmi_no);
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