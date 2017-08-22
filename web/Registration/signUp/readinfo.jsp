<%-- 
    Document   : readinfo_2
    Created on : Apr 10, 2017, 3:06:29 PM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../../Entrance/validateSession.jsp" %>

<%    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();

    String nationality = "SELECT * FROM adm_lookup_detail where master_reference_code = '0011' and hfc_cd = '" + session.getAttribute("HEALTH_FACILITY_CODE") + "' ";
    String gender = "SELECT * FROM adm_lookup_detail where master_reference_code = '0041' and hfc_cd = '" + session.getAttribute("HEALTH_FACILITY_CODE") + "' ";

    ArrayList<ArrayList<String>> dataNationality, dataGender;

    dataNationality = conn.getData(nationality);
    dataGender = conn.getData(gender);


%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kiosk | Signup</title>
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

            var lang = sessionStorage.getItem('lang');

            $(function () {
                if (lang === "en") {
                    $("div[lang=ml]").css("display", 'none');
                } else if (lang === "ml") {
                    $("div[lang=en]").css("display", 'none');
                }

                $("div[lang=" + lang + "] #inputUserIC").keyboard();
                $("div[lang=" + lang + "] #inputUserName").keyboard();
                $("div[lang=" + lang + "] #txt_day").keyboard({
                    layout: 'num',
                    restrictInput: true, // Prevent keys not in the displayed keyboard from being typed in
                    preventPaste: true, // prevent ctrl-v and right click
                    autoAccept: true
                });
                $("div[lang=" + lang + "] #txt_month").keyboard({
                    layout: 'num',
                    restrictInput: true, // Prevent keys not in the displayed keyboard from being typed in
                    preventPaste: true, // prevent ctrl-v and right click
                    autoAccept: true
                });
                $("div[lang=" + lang + "] #txt_year").keyboard({
                    layout: 'num',
                    restrictInput: true, // Prevent keys not in the displayed keyboard from being typed in
                    preventPaste: true, // prevent ctrl-v and right click
                    autoAccept: true
                });
                $("div[lang=" + lang + "] #inpuOccupation").keyboard();
                $("div[lang=" + lang + "] #inputUserEmail").keyboard();
                $("div[lang=" + lang + "] #inputUserPhoneNo").keyboard();
                $("div[lang=" + lang + "] #inputUserLIC").keyboard();
                $("div[lang=" + lang + "] #inputUserPassword").keyboard();
            });
        </script>
        <!--header-->
    </head>
    <body>
        <div class="container-fluid m-scene" lang="en">
            <div class="kiosk thumbnail" style="max-width: 590px; max-height: 860px; text-align: center;">
                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                <div class="profile-img-card" style="text-align: center;" >
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px; text-align: center;">
                    Please Fill in your Information Below
                </div>
                <br/>
                <form class="form-signin" >
                    <span id="reauth-email" class="reauth-email"></span>

                    <input type="text" id="inputUserIC" class="form-control" placeholder="Enter Your IC Number" name="useric" required>
                    <input type="text" id="inputUserName" class="form-control" placeholder="Enter Your Name" name="username" required>

                    <div class="form-group  ">
                        <label class="control-label " for="selectbasic">Please Select Gender</label>
                        <!--<div class="col-md-8">-->

                        <div class="btn-group genders" data-toggle="buttons">

                            <%                             for (int i = 0; i < dataGender.size(); i++) {%>
                            <label class="btn ">
                                <input type="radio" name='gender' value="<%=dataGender.get(i).get(1)%>"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span name="genders"><%=dataGender.get(i).get(2)%></span>
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
                        <label class="col-xs-3 col-sm-3 col-md-4 col-lg-4 control-label">Date of Birth:</label>
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-4">
                                    <input type="text"  id="txt_day" name="txt_day" class="form-control input-sm"  placeholder="DD" required maxlength="2" data-validation-required-message="Day is required" >
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-4">
                                    <input type="text" id="txt_month" name="txt_month" class="form-control input-sm"  placeholder="MM" required maxlength="2" data-validation-required-message="Month is required" >
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-4">
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
                                    i++) {

                        %>
                        <option value="<%=dataNationality.get(i).get(1)%>"><%=dataNationality.get(i).get(2)%></option>
                        <%  }
                        %>
                    </select>

                    <input type="text" id="inpuOccupation" class="form-control" placeholder="Enter Your Occupation" name="occupation" required>   
                    <input type="text" id="inputUserEmail" class="form-control" placeholder="Enter Your Email" name="useremail" required>  
                    <input type="text" id="inputUserPhoneNo" class="form-control" placeholder="Enter Your Phone Number" name="username" required>     

                    <label class="control-label margin1 " for="textinput">Account Information</label>
                    <input type="text" id="inputUserLIC" class="form-control" placeholder="Enter Your IC Number" name="userid" required >
                    <input type="password" id="inputUserPassword" class="form-control" placeholder="Enter Your Password" name="password" required>     

                </form>
                <div class="text-center">
                    <button id="submitSignup" class="btn btn-lg btn-success" >Sign up</button>
                    <button id="cancelSignup" class="btn btn-lg btn-default">Cancel</button>
                </div>
            </div>
        </div>




        <div class="container-fluid m-scene" lang="ml">
            <div class="kiosk thumbnail" style="max-width: 590px; max-height: 860px; text-align: center;">
                <a href="../mainMenu.jsp" title="Back to Dashboard"><i class="fa fa-arrow-left fa-lg pull-left" style="color: #ccc;"></i></a>
                <div class="profile-img-card" style="text-align: center;" >
                    <i class="fa fa-user-md" aria-hidden="true" style="color: #666; font-size: 100px;"></i>
                </div>
                <div class="logo" style="font-size: 32px; text-align: center;">
                    Sila Isi Maklumat Anda Di Bawah
                </div>
                <br/>
                <form class="form-signin" >
                    <span id="reauth-email" class="reauth-email"></span>

                    <input type="text" id="inputUserIC" class="form-control" placeholder="Masukkan Nombor IC anda" name="useric" required>
                    <input type="text" id="inputUserName" class="form-control" placeholder="Masukkan nama anda" name="username" required>

                    <div class="form-group  ">
                        <label class="control-label " for="selectbasic">Sila Pilih Jantina</label>
                        <!--<div class="col-md-8">-->

                        <div class="btn-group " data-toggle="buttons">

                            <%                             for (int i = 0; i < dataGender.size(); i++) {

                                    String genderName = dataGender.get(i).get(2).toString().trim();
                                    if (genderName != null) {
                                        if (genderName.equalsIgnoreCase("male")) {
                                            genderName = "Lelaki";
                                        } else if (genderName.equalsIgnoreCase("female")) {
                                            genderName = "Perempuan";
                                        } else if (genderName.equalsIgnoreCase("other")) {
                                            genderName = "Lian";
                                        }
                                    }

                            %>
                            <label class="btn ">
                                <input type="radio" name='gender' value="<%=dataGender.get(i).get(1)%>"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-dot-circle-o fa-2x"></i><span><%=genderName%></span>
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
                        <label class="col-xs-3 col-sm-3 col-md-4 col-lg-4 control-label">Tarikh lahir:</label>
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-4">
                                    <input type="text"  id="txt_day" name="txt_day" class="form-control input-sm"  placeholder="DD" required maxlength="2" data-validation-required-message="Day is required"  >
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-4">
                                    <input type="text" id="txt_month" name="txt_month" class="form-control input-sm"  placeholder="MM" required maxlength="2" data-validation-required-message="Month is required" >
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-4 col-lg-4">
                                    <input type="text" id="txt_year" name="txt_year" class="form-control input-sm"  placeholder="YYYY" required maxlength="4" data-validation-required-message="Year is required" >
                                </div>
                            </div>
                        </div>
                    </div>





                    <select id="Usernational" name="selectNaationality" class="form-control select-full">
                        <option value="null" selected="" disabled="">Pilih Warganegara</option>
                        <option value="-">-</option>
                        <%
                            for (int i = 0;
                                    i < dataNationality.size();
                                    i++) {%>
                        <option value="<%=dataNationality.get(i).get(1)%>"><%=dataNationality.get(i).get(2)%></option>
                        <%  }
                        %>
                    </select>

                    <input type="text" id="inpuOccupation" class="form-control" placeholder="Masukkan Pekerjaan Anda" name="occupation" required>   
                    <input type="text" id="inputUserEmail" class="form-control" placeholder="Masukkan emel anda" name="useremail" required>  
                    <input type="text" id="inputUserPhoneNo" class="form-control" placeholder="Masukkan nombor telefon anda" name="username" required>     

                    <label class="control-label margin1 " for="textinput">Maklumat Akaun</label>
                    <input type="text" id="inputUserLIC" class="form-control" placeholder="Enter Your IC Number" name="userid" required >
                    <input type="password" id="inputUserPassword" class="form-control" placeholder="Masukkan kata laluan anda" name="password" required>     

                </form>
                <div class="text-center">
                    <button id="submitSignup" class="btn btn-lg btn-success" >Pendaftaran</button>
                    <button id="cancelSignup" class="btn btn-lg btn-default">Batalkan</button>
                </div>
            </div>
        </div>


        <!--Script-->

        <!--<div w3-include-html="../libraries/script.html"></div>-->

        <script src="../assets/js/bootbox.min.js"></script>
        <%//@include file="../assets/script.html"%>


        <script type="text/javascript">
            var guseric, gusername, gusergender, gusernationality, guseremail, guserphoneno,
                    guseroccupation, guserbirthday, userExist = false;
            $("div[lang=" + lang + "] #submitSignup").on("click", function () {

                signup();

            });//on clcik submit

            $("div[lang=" + lang + "] #cancelSignup").on("click", function () {

                window.history.back();

            });//on clcik cancel

            $("div[lang=" + lang + "] #txt_day").change(function () {
                bdDayCahnged();
            });

            $("div[lang=" + lang + "] #txt_month").change(function () {
                bdMonthCahnged();
            });

            $("div[lang=" + lang + "] #txt_year").change(function () {
                bdYearCahnged();
            });

            function bdDayCahnged()
            {
                var day = $("div[lang=" + lang + "] #txt_day").val();

                if ($.isNumeric(day))
                {
                    if (day < 0 || day > 31) {
                        bootbox.alert("Wrong Day !!");
                        $("div[lang=" + lang + "] #txt_day").focus();
                    }
                } else {
                    bootbox.alert("Enter Numric Day !!");
                }
            }
            ;

            function bdMonthCahnged()
            {

                var month = $("div[lang=" + lang + "] #txt_month").val();

                if ($.isNumeric(month))
                {
                    if (month < 0 || month > 12) {
                        bootbox.alert("Wrong Month !!");
                        $("div[lang=" + lang + "] #txt_month").focus();
                    }
                } else {
                    bootbox.alert("Enter Numric Month !!");
                }
            }
            ;



            $("div[lang=" + lang + "] #inputUserIC").change(function () {
                icFiledchanges();
            });
            function icFiledchanges() {
                var userIC;
                userIC = $("div[lang=" + lang + "] #inputUserIC").val();
                var data = {
                    userIC: userIC
                };
                if (userIC === "")
                {
                    bootbox.alert("please Fill in the your IC");
                } else {
                    //                       console.log("before ajax");
                    $.ajax({
                        type: "POST",
                        url: "../Controller/searchUser.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (data) {
                            //                               console.log("in sucess");
                            if (data.trim() === "NOT FOUND")
                            {
                                userExist = false;
                                bootbox.alert("User Not Found");
                            } else
                            {
                                userExist = true;
                                //                                   console.log(data.trim());
                                var splitData = String(data.trim()).split("|");
                                console.log(splitData);

                                gusername = splitData[2];
                                gusergender = splitData[11];
                                gusernationality = splitData[14];
                                guseremail = splitData[35];
                                guserphoneno = splitData[34];
                                guserbirthday = splitData[10];
                                guseric = splitData[4];
                                //                                guseroccupation=splitData[7];
                                $("div[lang=" + lang + "] #inputUserName").val(gusername);
                                $("div[lang=" + lang + "] input[name=gender][value=" + gusergender + "]").prop('checked', true);
                                $("div[lang=" + lang + "] #Usernational").val(gusernationality);
                                $("div[lang=" + lang + "] #inputUserEmail").val(guseremail);
                                $("div[lang=" + lang + "] #inputUserPhoneNo").val(guserphoneno);
                                $("div[lang=" + lang + "] #inputUserLIC").val(guseric);
                                var bdDate = new Date(guserbirthday);
                                console.log(bdDate);
                                $("div[lang=" + lang + "] #txt_year").val(bdDate.getFullYear());
                                $("div[lang=" + lang + "] #txt_month").val(bdDate.getMonth() + 1);
                                $("div[lang=" + lang + "] #txt_day").val(bdDate.getDate());
                                //                            $("#inpuOccupation").val("");

                                //                                   console.log(pmi_no +" " +user_name+" "+user_id);
                            }
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });
                }
            }
            ;




            function bdYearCahnged()
            {

                var year = $("div[lang=" + lang + "] #txt_year").val();

                if ($.isNumeric(year))
                {
                    if (year < 1850) {
                        bootbox.alert("Wrong Year !!");
                        $("div[lang=" + lang + "] #txt_year").focus();
                    }
                } else {
                    bootbox.alert("Enter Numric Year !!");
                }
            }
            ;


            function signup() {
                var useric, userlic, username, usergender, usernationality, useremail, userphoneno,
                        useroccupation, userpassword, userbirthday;

                useric = $("div[lang=" + lang + "] #inputUserIC").val();
                userlic = $("div[lang=" + lang + "] #inputUserLIC").val();
                username = $("div[lang=" + lang + "] #inputUserName").val();
                usergender = $("div[lang=" + lang + "] input[name='gender']:checked").val();
                usernationality = $("div[lang=" + lang + "] #Usernational").val();
                useremail = $("div[lang=" + lang + "] #inputUserEmail").val();
                userphoneno = $("div[lang=" + lang + "] #inputUserPhoneNo").val();
                userpassword = $("div[lang=" + lang + "] #inputUserPassword").val();
                userbirthday = $("div[lang=" + lang + "] #txt_day").val() + "/" + $("div[lang=" + lang + "] #txt_month").val() + "/" + $("#div[lang=" + lang + "] txt_year").val();
                useroccupation = $("div[lang=" + lang + "] #inpuOccupation").val();

                if (useric === "") {
                    bootbox.alert("Fill in the User IC !");
                    $("div[lang=" + lang + "] #inputUserIC").focus();
                } else if (username === "") {
                    bootbox.alert("Fill in the User Name !");
                    $("div[lang=" + lang + "] #inputUserName").focus();
                } else if (containsNumber(username)) {
                    bootbox.alert("Unvalid Name, Contain Numbers !");
                    $("div[lang=" + lang + "] #inputUserName").focus();
                } else if (!$("div[lang=" + lang + "] input[name='gender']:checked").val()) {
                    bootbox.alert("Select Gender !");
                    $("div[lang=" + lang + "] input[name='gender']").focus();
                } else if (!isValidDate(userbirthday)) {
                    bootbox.alert("Wrong Birthday Date !");
                    $("div[lang=" + lang + "] #txt_day").focus();
                } else if (usernationality === null) {
                    bootbox.alert("Select Nationality !");
                    $("div[lang=" + lang + "] #Usernational").focus();
                }
//                                                                else if (useroccupation === "") {
//                                                                    bootbox.alert("Fill in user Occupation!");
//                                                                    $("#inpuOccupation").focus();
//                                                                } else if (useremail === "") {
//                                                                    bootbox.alert("Fill in user Email !");
//                                                                    $("#inputUserEmail").focus();
//                                                                    $("#inputUserEmail").css("color", "red");
//                                                                } else if (!validateEmail(useremail)) {
//                                                                    bootbox.alert("Uncorrect Email input !");
//                                                                    $("#inputUserEmail").focus();
//                                                                } else if (userphoneno.length < 10) {
//                                                                    bootbox.alert("Phone Number Is Not Complete at least 10 numbers !");
//                                                                } else if (!$.isNumeric(userphoneno)) {
//                                                                    bootbox.alert("Not A Phone Number!");
//                                                                    $("#inputUserPhoneNo").focus();
//                                                                }
                else if (userlic === "") {
                    bootbox.alert("Fill in the User IC !");
                    $("#div[lang=" + lang + "] inputUserLIC").focus();
                } else if (userpassword === "") {
                    bootbox.alert("Fill in the User Password !");
                    $("div[lang=" + lang + "] #inputUserPassword").focus();
                } else if (validPassword(userpassword))
                {


                    var bioData = {
                        'userIC': useric,
                        'userName': username,
                        'userNationality': usernationality,
                        'userGender': usergender,
                        'userOccupation': useroccupation,
                        'userEmail': useremail,
                        'userPhoneNo': userphoneno,
                        'userbirthday': userbirthday};

                    var loginData = {
                        'userIC': userlic,
                        'userName': username,
                        'userPassword': userpassword,
                        'userEmail': useremail,
                        'userPhoneNo': userphoneno
                    };
                    //                        console.log(bioData);
                    //                        console.log(loginData);
                    $.ajax({
                        type: "POST",
                        url: "../Controller/insertPatient.jsp",
                        data: bioData,
                        timeout: 3000,
                        success: function (data) {
                            //console.log(data.trim());
                            $("div[lang=" + lang + "] #inputUserIC").val("");
                            $("div[lang=" + lang + "] #inputUserLIC").val("");
                            $("div[lang=" + lang + "] #inputUserName").val("");
                            $("div[lang=" + lang + "] #UserGender").val("null");
                            $("div[lang=" + lang + "] #Usernational").val("null");
                            $("div[lang=" + lang + "] #inpuOccupation").val("");
                            $("div[lang=" + lang + "] #inputUserEmail").val("");
                            $("div[lang=" + lang + "] #inputUserPhoneNo").val("");
                            $("div[lang=" + lang + "] #inputUserPassword").val("");
                            $("div[lang=" + lang + "] #PMIbday").val("");
                            $("div[lang=" + lang + "] #txt_year").val("");
                            $("div[lang=" + lang + "] #txt_month").val("");
                            $("div[lang=" + lang + "] #txt_day").val("");

                            //                                var num = parseInt(data);
                            if (data.search("Existed") >= 0)
                            {
                                loginInser(loginData);
                            } else {
                                bootbox.alert("User not found, Please re-enter the your IC OR go to neareast Clinic or Hospital to register your information");
                            }

                        },
                        error: function (err) {
                            console.log(err);
                            bootbox.alert("Seems like system have problem in the system!");
                        }
                    });
                }

            }// sign up funtion
            ;

            function loginInser(loginData)
            {
                $.ajax({
                    type: "POST",
                    url: "../Controller/insertPatientLoginInfo.jsp",
                    data: loginData,
                    timeout: 3000,
                    success: function (data) {
                        if (data.search("Existed") >= 0)
                        {
                            bootbox.alert("You are already registered, you can login to the system.");
                        } else {
                        }
                    },
                    error: function (err) {
                        console.log(err);
                        bootbox.alert("Seems like system have problem in the system!");
                    }
                });
            }
            ;
            function containsNumber(any) {
                var alpha = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/; //for sentence allow space
                //var re = /^[A-Za-z]+$/; for one word only don't allow space
                if (alpha.test(any))//contain no number
                    return false;
                else               //comtain number
                    return true;
            }
            ;

            function validateEmail(email)
            {
                //                     returns true if email is not correct
                var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;

                return re.test(email);
            }
            ;

            // Validates that the input string is a valid date formatted as "yyyy/mm/dd"
            function isValidDate(dateString)
            {
                // First check for the pattern \
                // not correct always return false need edit for the number like 4/2/2
                //            if(!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString)) 
                //            //                return false;

                // Parse the date parts to integers
                var parts = dateString.split("/");
                var day = parseInt(parts[0], 10);
                var month = parseInt(parts[1], 10);
                var year = parseInt(parts[2], 10);


                // Check the ranges of month and year
                if (year < 1000 || year > 3000 || month == 0 || month > 12)
                    return false;
                var monthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

                // Adjust for leap years
                if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
                    monthLength[1] = 29;

                // Check the range of the day
                return day > 0 && day <= monthLength[month - 1];
            }
            ;


            function validPassword(password)
            {
                var re = /[0-9]/; //contain no number
                if (!re.test(password)) {
                    bootbox.alert("Error: password must contain at least one number (0-9)!");
                    $("div[lang=" + lang + "] #inputUserPassword").focus();
                    return false;
                }
                re = /[a-z]/;   //contain no small alphbet 
                if (!re.test(password)) {
                    bootbox.alert("Error: password must contain at least one lowercase letter (a-z)!");
                    $("div[lang=" + lang + "] #inputUserPassword").focus();
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
            }
            ;

            //       });

        </script>

    </body>
</html>
