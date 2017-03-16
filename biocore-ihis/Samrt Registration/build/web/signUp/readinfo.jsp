<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   Config.getBase_url(request);
   Config.getFile_url(session);
   
        Conn conn = new Conn();
    
     String nationality = "SELECT * FROM adm_lookup_detail where master_reference_code = '0011'";
     String gender = "SELECT * FROM adm_lookup_detail where master_reference_code = '0041'";
     
     
     ArrayList<ArrayList<String>> dataNationality,dataGender;
     
     
     dataNationality = conn.getData(nationality);
     dataGender = conn.getData(gender);
     
//     if(dataGender.size() > 0)
//     {
//        out.print(dataGender.get(0).get(1) +"<br>");
//        out.print(dataGender.get(0).get(2));
//     }
//     else
//    {
//        out.print("Select NUll");
//    }
%>


<!DOCTYPE html>
<html>
<head>

    <title>Kiosk | Sign Up Page</title>
    
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <script src="../Dashboard_files/jquery.min.js.download"></script>
        
    <div w3-include-html="../libraries/header.html"></div>
        <%@include file="../Header.jsp"%>
        
  
    <link href="../assets/css/login.css" rel="stylesheet">
     <link  rel="stylesheet" href="../css/style.css">
     
     <link rel="stylesheet" href="../css/datePicker lib/themes/default.css">
    <link rel="stylesheet" href="../css/datePicker lib/themes/default.date.css">
    
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
             <p id="profile-name" class="profile-name-card">Please Fill in your Information Below</p>
             <form class="form-signin" >
                 <span id="reauth-email" class="reauth-email"></span>
                 
                 <input type="text" id="inputUserIC" class="form-control" placeholder="Enter Your IC" name="useric" required autofocus>
                  <input type="text" id="inputUserName" class="form-control" placeholder="Enter Your Name" name="username" required>
                 
                <div class="form-group  ">
                    <label class="control-label " for="selectbasic">Please Select Gender</label>
                    <!--<div class="col-md-8">-->
                         
                    <div class="btn-group " data-toggle="buttons">
                        
                         <%
                                for (int i = 0; i < dataGender.size(); i++) {%>
                        <label class="btn ">
                            <input type="radio" name='gender' value="<%=dataGender.get(i).get(1)%>"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span><%=dataGender.get(i).get(2)%></span>
                        </label>
                        <%  }
                             %>
                    </div>
                    <!--</div>-->
                </div>
                       
                     <!-- Text input-->
<!--                        <div class="form-group ">
                            <label class="col-md-4 " for="textinput">Date of Birth</label>
                            <div class="col-md-8">
                                <input id="PMIbday" class="form-control"  name="date" type="text" autofocuss>
                            </div>
                        </div>
                    -->
                    
                    <div class="form-group margin1">
                        <label class="col-lg-4 control-label">Date of Birth:</label>
                        <div class="col-lg-8">
                           <div class="row">
                              <div class="col-lg-4">
                                <input type="text" id="txt_day" name="txt_day" class="form-control input-sm"  placeholder="DD" required maxlength="2" data-validation-required-message="Day is required" >
                              </div>
                              <div class="col-lg-4">
                               <input type="text" id="txt_month" name="txt_month" class="form-control input-sm"  placeholder="MM" required maxlength="2" data-validation-required-message="Month is required" >
                              </div>
                              <div class="col-lg-4">
                                <input type="text" id="txt_year" name="txt_year" class="form-control input-sm"  placeholder="YYYY" required maxlength="4" data-validation-required-message="Year is required" >
                              </div>
                           </div>
                        </div>
                    </div>
                    
        
                    
                    
                    
                 <select id="Usernational" name="selectNaationality" class="form-control select-full">
                     <option value="null" selected="" disabled="">Select Nationality</option>
                                    <option value="-">-</option>
                                    <%
                                        for (int i = 0;
                                                i < dataNationality.size();
                                                i++) {%>
                                    <option value="<%=dataNationality.get(i).get(1)%>"><%=dataNationality.get(i).get(2)%></option>
                                    <%  }
                                    %>
                 </select>
                 
                 <input type="text" id="inpuOccupation" class="form-control" placeholder="Enter Your Occupation" name="occupation" required>   
                 <input type="text" id="inputUserEmail" class="form-control" placeholder="Enter Your Email" name="useremail" required>  
                 <input type="text" id="inputUserPhoneNo" class="form-control" placeholder="Enter Your Phone Number" name="username" required>     
                 
                 <label class="control-label margin1 " for="textinput">Account Information</label>
                 <input type="text" id="inputUserID" class="form-control" placeholder="Enter Your Login Username" name="userid" required >
                 <input type="password" id="inputUserPassword" class="form-control" placeholder="Enter Your Password" name="password" required>     
                
             </form><!-- /form -->
             <div class="form-signin tac">
                    <div class="tac margin1 centerBtnDisplay">
                        <button id="submitSignup" class="btn btn-lg bttn btn_block" >Sign up</button>
                    </div>
                    <div class="tac margin1 centerBtnDisplay">
                        <button id="cancelSignup" class="btn btn-lg bttn btn_block ">Cancel</button>
                    </div>
             </div>
         </div>

        </div><!-- /card-container -->
    </div><!-- /container -->
	
       <div w3-include-html="../libraries/script.html"></div>

        <script src="http://www.w3schools.com/lib/w3data.js"></script>
  
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../assets/js/bootbox.min.js"></script>
        
<!--        <script src="../css/datePicker lib/picker.js"></script>
    <script src="../css/datePicker lib/picker.date.js"></script>
    <script src="../css/datePicker lib/legacy.js"></script>-->

    <script type="text/javascript">
        w3IncludeHTML();
//       $(document).ready( function(){
           
//           $('#PMIbday').pickadate({
//             format: 'yyyy-mm-dd',
//            labelMonthNext: 'Go to the next month',
//            labelMonthPrev: 'Go to the previous month',
//            labelMonthSelect: 'Pick a month from the dropdown',
//            labelYearSelect: 'Pick a year from the dropdown',
//            selectMonths: true,
//            selectYears: true
//            });
           
           
//         $('#PMIbday').datepicker({dateFormat: 'dd-mm-yy', changeMonth: true, changeYear: true}); 
           
    
            $("#submitSignup").on("click", function(){
            
               signup();
               
           });//on clcik submitSignup
           
           $("#cancelSignup").on("click", function(){
               
               window.location = "../mainMenu.jsp";
                              
           });//on clcik submitSignup
           
           
            function signup() {
                var useric,userid,username,usergender,usernationality,useremail,userphoneno,
                        useroccupation, userpassword,userbirthday;
                        
                useric = $("#inputUserIC").val();
                userid = $("#inputUserID").val();
                username = $("#inputUserName").val();
                usergender = $("input[name='gender']:checked").val();
                usernationality = $("#Usernational").val();
                useremail = $("#inputUserEmail").val();
                userphoneno = $("#inputUserPhoneNo").val();
                userpassword = $("#inputUserPassword").val();
                userbirthday = $("#txt_year").val() + "/" + $("#txt_month").val() + "/" + $("#txt_day").val();
                useroccupation = $("#inpuOccupation").val();
//                    var reN = /[0-9]/, reSA = /[a-z]/,reCA = /[A-Z]/;
        
                    if (useric === "") {
                        bootbox.alert("Fill in the User IC");
                        $("#inputUserIC").focus();
                    }else if (userid === "") {
                        bootbox.alert("Fill in the User ID");
                        $("#inputUserID").focus();
                    }else if (username === "") {
                        bootbox.alert("Fill in the User Name");
                        $("#inputUserName").focus();
                    }else if (containsNumber(username)) {
                        bootbox.alert("UnValic Name, Contain Numbers");
                        $("#inputUserName").focus();
                    }else if (!$("input[name='gender']:checked").val()) {
                        bootbox.alert("Select Gender");
                        $("input[name='gender']").focus();
                    }else if (usernationality === null) {
                        bootbox.alert("Select Nationality");
                        $("#Usernational").focus();
                    }else if (useroccupation === "") {
                        bootbox.alert("Fill in user Occupation");
                        $("#inpuOccupation").focus();
                    }else if (useremail === "") {
                        bootbox.alert("Fill in user Email");
                        $("#inputUserEmail").focus();
                        $("#inputUserEmail").css("color", "red");
                    }else if (!validateEmail(useremail)) {
                        bootbox.alert("Uncorrect Email input");
                        $("#inputUserEmail").focus();
                    }else if (userphoneno.length < 10 ) {
                        bootbox.alert("Phone Number Is Not Complete at least 10 numbers");
                    }else if (!$.isNumeric(userphoneno)) {
                        bootbox.alert("Not A Phone Number");
                        $("#inputUserPhoneNo").focus();
                    }else if (userpassword === "") {
                        bootbox.alert("Fill in the User Password");
                        $("#inputUserPassword").focus();
                    }else if (validPassword(userpassword)) {
                      
//                        var splitBday = String(userbirthday).split("-");
//                        console.log(splitBday);
//                        var convertedBday = splitBday[2] + "/" + splitBday[1] + "/" + splitBday[0];
//                        console.log(convertedBday);
                        var bioData = {
                        'userIC': useric,
                        'userID': userid,
                        'userName': username,
                        'userNationality': usernationality,
                        'userGender': usergender,
                        'userOccupation': useroccupation,
                        'userEmail': useremail,
                        'userPhoneNo': userphoneno,
                        'userbirthday': convertedBday };
                    
                        var loginData = {
                        'userID': userid,
                        'userPassword': userpassword
                        };
//                        console.log(bioData);
//                        console.log(loginData);
                        $.ajax({
                            type: "POST",
                            url: "../Controller/insertPatient.jsp",
                            data: bioData,
                            timeout: 3000,
                            success: function (data){
//                                console.log(data.trim());
                                $("#inputUserIC").val("");
                                $("#inputUserID").val("");
                                $("#inputUserName").val("");
                                $("#UserGender").val("null");
                                $("#Usernational").val("null");
                                $("#inpuOccupation").val("");
                                $("#inputUserEmail").val("");
                                $("#inputUserPhoneNo").val("");
                                $("#inputUserPassword").val("");
                                $("#PMIbday").val("");
                                //var num = parseInt(data);
                                if (data.search("Existed") >= 0)
                                {
                                    bootbox.alert("Record Already Existed");
                                } else {
                                    loginInser(loginData);
                                }
                            },
                            error: function (err) {
                                    console.log(err);
                            }
                        });
                }

               };
               
               function loginInser(loginData)
               {
                    $.ajax({
                                    type: "POST",
                                    url: "../Controller/insertPatientLoginInfo.jsp",
                                    data: loginData,
                                    timeout: 3000,
                                    success: function (data){
//                                       console.log(data.trim()); 
                                    },
                                    error: function (err) {
                                    console.log(err);
                                    }  
                                });
               };
                function containsNumber(any){    
                    var alpha = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/; //for sentence allow space
                    //var re = /^[A-Za-z]+$/; for one word only don't allow space
                    if(alpha.test(any))//contain no number
                       return false;
                    else               //comtain number
                      return true;      
                 };
                 
                 function validateEmail(email)
                 {
//                     returns true if email is not correct
                     var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                     
                      return re.test(email);
                 };
                 
                 
                 function validPassword(password)
                 {
                    var re = /[0-9]/; //contain no number
                    if(!re.test(password)) {
                      bootbox.alert("Error: password must contain at least one number (0-9)!");
                      $("#inputUserPassword").focus();
                      return false;
                    }
                    re = /[a-z]/;   //contain no small alphbet 
                    if(!re.test(password)) {
                      bootbox.alert("Error: password must contain at least one lowercase letter (a-z)!");
                      $("#inputUserPassword").focus();
                      return false;
                    }
//                    re = /[A-Z]/;   //contain no capital alphbet 
//                    if(!re.test(password)) {
//                      bootbox.alert("Error: password must contain at least one uppercase letter (A-Z)!");
//                      $("#inputUserPassword").focus();
//                      return false;
//                    } 
//                    
//                    if(password.length <8) {
//                      bootbox.alert("Error: password must contain at least 8 Charachters!");
//                      $("#inputUserPassword").focus();
//                      return false;
//                    } 
                     return true;
                 };
           
//       });
        
    </script>
      

</body>
</html>
