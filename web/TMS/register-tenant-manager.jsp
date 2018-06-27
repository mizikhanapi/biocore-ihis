<%-- 
    Document   : register-tenant
    Created on : Jun 26, 2018, 6:54:17 PM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);
%>
<!DOCTYPE html>
<html>
    <head>
        <title>HIS CARE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="libraries/headLibrary.jsp" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="libraries/care.css" rel="stylesheet" type="text/css"/>
        <link href="libraries/animate.css" rel="stylesheet" type="text/css"/>
        <style>
            html, body, .login_container {
                height: 100%;
            }
            .login_container {
                display: table;
            }
            .login_row {
                display: table-cell;
                vertical-align: middle;
            }
            .login_panel {
                margin: 0 auto;
                position: relative;
                width: 320px;
            }
            .login_logo {
                margin: 50px 0 30px;
            }
            .login_logo img {
                width: 220px;
            }
            .login_colon {
                position: absolute;
                right: -20px;
                top: 20px;
            }
            .login_colon img {
                width: 40px;
            }
            .login_body {
                padding: 15px 70px 50px; 
            }
            .login_msg {
                text-align: left;
                margin-bottom: 30px;
                width: 100%;
            }
            .login_label {
                font-family: 'proxima_nova_ltthin';
            }
            .login_input {
                border: none;
                border-bottom: solid 1px #4a4a4a;
                border-radius: 0px;
                padding: 6px 0 6px;
                box-shadow: none;
                outline: none;
            }
            .login_input:focus {
                border: none;
                border-bottom: solid 2px #5fc095;
                box-shadow: none;
                outline: none;
            }
            .login_alert {
                color: #F44336;
                font-size: 12px;
                text-align: left;
                margin-top: -10px;
            }
            .login_btn_rounded {
                background-color: #05d8dd;
                border-radius: 2em;
                border: none;
                margin-top: 30px;
            }
            .login_btn_rounded:hover, .login_btn_rounded:focus {
                background-color: #03babe;
                border-radius: 2em;
                border: none;
            }
            .login_btn_check {
                background-color: #00ff99;
                margin-top: 50px;
            }
            .login_btn_check:focus, .login_btn_check:hover {
                background-color: #00c778;
                margin-top: 50px;
            }
            .login_problem {
                margin: 10px 0 -20px;
            }
            .login_problem a {
                color: #010128;
                font-family: 'proxima_nova_ltthin';
            }
            .login_banner {
                background: url(../assets/img/login-banner.jpg);
                background-repeat: no-repeat;
                background-position: center;
                background-size: cover;
            }

            .reg-sticker {
                box-shadow: -2px 0px 20px 0px rgba(0, 0, 0, 0.17); 
                height: 100%;
            }

            #tenant-form fieldset:not(:first-of-type) {
                display: none;
            }

            .steps, .keterangan {
                display: none;
            }

            .activate {
                display: block !important;
            }

        </style>
        <script>
            history.forward();
        </script>
    </head>
    <body class="">
        <div class="login_container col-md-8">
            <div class="login_row panel login_panel">

                <div class="panel-body login_body">

                    <div class="form-horizontal">
                        <form id="firstForm">
                            <fieldset class="steps step1 activate">
                                <h2>Enter your email address and phone number</h2>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Email Address*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputEmail" type="email" class="form-control input-lg" required maxlength="100">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Mobile Number*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputMobile1" type="text" class="form-control input-lg" required maxlength="30">
                                    </div>
                                </div>
                                <div class="text-right">
                                    <button id="btnSign" class="first btn btn-rounded btn-mkag btn-lg login-btn">Next Step <i style="margin-top: 3px;" class="fa fa-angle-right fa-lg pull-right"></i></button>
                                </div>
                            </fieldset>
                        </form>

                        <form id="secondForm">
                            <fieldset class="steps step2">
                                <h2>ID Password & Security Details</h2>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">ID*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputUserID" type="text" class="form-control input-lg" required maxlength="30">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Password*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputPassword1" type="password" class="form-control input-lg" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Confirm Password*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputPassowrd2" type="password" class="form-control input-lg" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Security Question*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputQuestion" type="text" class="form-control input-lg" required maxlength="255">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Answer*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputAnswer" type="text" class="form-control input-lg" maxlength="255" required>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <button id="btnSign" class="next btn btn-rounded btn-default btn-lg login-btn"><i style="margin-top: 3px;" class="fa fa-times fa-lg pull-left"></i> Quit</button>
                                    <button id="btnSign" class="second btn btn-rounded btn-mkag btn-lg login-btn">Next Step <i style="margin-top: 3px;" class="fa fa-angle-right fa-lg pull-right"></i></button>
                                </div>
                            </fieldset>
                        </form>

                        <form id="thirdForm">
                            <fieldset class="steps step3">
                                <h2>Personal Details</h2>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Name*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputName" type="text" class="form-control input-lg" maxlength="150" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">NRIC / ID*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputNRIC" type="text" class="form-control input-lg" maxlength="100" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Date of Birth*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputDOB" type="text" class="form-control input-lg" placeholder="dd/mm/yyyy" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="col-md-12"><label class="control-label" for="company_name">Salutation*:</label></div>
                                            <div class="col-md-12">
                                                <select id="inputSalutation" class="form-control input-lg"></select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="col-md-12"><label class="control-label" for="company_name">Gender*:</label></div>
                                            <div class="col-md-12">
                                                <select id="inputGender" class="form-control input-lg"></select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Mobile Number*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputMobile2" type="text" class="form-control input-lg" maxlength="30" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><label class="control-label" for="company_name">Upload NRIC / ID*:</label></div>
                                    <div class="col-md-12">
                                        <input id="inputNRIC_pic" type="file"  accept="image/*" class="form-control input-lg" required>
                                    </div>
                                    <div class="col-md-12" align="center">
                                        <img src="" id="NRIC_pic" alt="NRIC/ID picture" class="img-responsive" style="height: 100%; width: 100%">
                                    </div>
                                </div>
                                <div class="text-right">
                                    <button id="btnSign" class="next btn btn-rounded btn-default btn-lg login-btn"><i style="margin-top: 3px;" class="fa fa-times fa-lg pull-left"></i> Quit</button>
                                    <button id="btnSign" class="third btn btn-rounded btn-mkag btn-lg login-btn">Submit <i style="margin-top: 3px;" class="fa fa-angle-right fa-lg pull-right"></i></button>
                                </div>
                            </fieldset>
                        </form>                      

                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-4 login_container reg-sticker">
            <div class="login_row login_panel">
                <div class="direction_numbering">
                    <ul>
                        <li class="directory1 active">1</li>
                        <li class="directory2">2</li>
                        <li class="directory3">3</li>
                    </ul>
                </div>
                <div class="login_logo text-center">
                    <div class="keterangan keterangan1 activate ">
                        <img class="keterangan-logo" src="../assets/mail.svg">
                        <h3>Create HIS-CARE ID</h3>
                        <p>Your HIS-CARE ID is the username and password you will need to access your HIS-CARE account online and Apps</p>
                    </div>

                    <div class="keterangan keterangan2 ">
                        <img class="keterangan-logo" src="../assets/id.svg">
                        <h3>Complete your ID details</h3>
                        <p>Your HIS-CARE ID is the username and password you will need to access your HIS-CARE  account online and Apps</p>
                    </div>

                    <div class="keterangan keterangan3 ">
                        <img class="keterangan-logo" src="../assets/hospital.svg">
                        <h3>Provider Information</h3>
                        <p>Your HIS-CARE ID is the username and password you will need to access your HIS-CARE account online and Apps</p>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="libraries/footLibrary.jsp" %>
        <script src="../assets/js/rd.jquery.validator.js"></script>
        <script src="../assets/js/rd.jquery.check-file.js"></script>
        <script src="../assets/js/rd.jquery.preventKey.js"></script>

        <script>

            var RIS_gambarURI = "";
            $(function () {

                codeValidityKeyUp("#inputUserID");
                preventPipeKeyPress("input");
                preventPipeKeyUp("input");

                populateSelectList($('#inputGender'), "0041");
                populateSelectList($('#inputSalutation'), "0026");

                bindSameValue($('#inputMobile1'), $('#inputMobile2'));
                bindSameValue($('#inputMobile2'), $('#inputMobile1'));

                $('#inputNRIC_pic').checkFileType({
                    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
                    success: function () {
                        loadImageFileAsURL();
                    },
                    error: function () {
                        bootbox.alert('Incompatible file type');
                        $('#inputNRIC_pic').val("");
                        //$('#dym').html("");
                        RIS_gambarURI = "";
                    }
                });

                //init date
                $('#inputDOB').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    maxDate: 0,
                    dateFormat: 'dd/mm/yy',
                    yearRange: "-100:+nn"
                });

                var $firstButton = $(".first"),
                        $secondButton = $(".second"),
                        $thirdButton = $(".third"),
                        $input = $("input"),
                        $name = $(".name"),
                        $more = $(".more"),
                        $yourname = $(".yourname"),
                        $reset = $(".reset"),
                        $ctr1 = $(".step1"),
                        $ctr2 = $(".step2"),
                        $ctr3 = $(".step3"),
                        $desc1 = $(".keterangan1"),
                        $desc2 = $(".keterangan2"),
                        $desc3 = $(".keterangan3"),
                        $dir1 = $(".directory1"),
                        $dir2 = $(".directory2"),
                        $dir3 = $(".directory3");

                $(".next").on("click", function (e) {
                    e.preventDefault();
                    bootbox.confirm({
                        message: "Data will not be saved. Are you sure you want to quit?",
                        buttons: {
                            confirm: {
                                label: 'Yes',
                                className: 'btn-success'
                            },
                            cancel: {
                                label: 'No',
                                className: 'btn-danger'
                            }
                        },
                        callback: function (result) {

                            if (result) {
                                //delete all saved data because registration is not completed.
                                $.ajax({
                                    type: 'GET',
                                    dataType: 'json',
                                    timeout: 60000,
                                    url: "control/quitRegistration.jsp",
                                    success: function (data, textStatus, jqXHR) {
                                        console.log(data.msg);
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        console.log("Fail to quit registration.");
                                    },
                                    complete: function (jqXHR, textStatus) {
                                        location.reload();
                                    }
                                });

                            }
                        }
                    });
                });

                $firstButton.on("click", function (e) {
                    e.preventDefault();
                    var $email = $('#inputEmail');
                    var oriText = $(this).text();
                    var $form = $('#firstForm');


                    if (!$form[0].checkValidity()) {
                        $('<input type="submit">').hide().appendTo('#firstForm').click().remove();
                        return;
                    }

                    var $mobile = $('#inputMobile1');

                    if (!validatePhonenumber($mobile.val())) {
                        bootbox.alert("Invalid mobile phone number!", function () {
                            $mobile.focus();
                            $mobile.val("");
                        });
                        return;
                    }

                    $form.prop('disabled', true);
                    $(this).text("Loading...");

                    var input = {
                        email: $email.val()
                    };
                    $.ajax({
                        type: 'POST',
                        url: "control/checkEmailAvailable.jsp",
                        data: input,
                        dataType: 'json',
                        success: function (data, textStatus, jqXHR) {
                            if (data.isAvailable) {
                                $ctr2.addClass("activate");
                                $ctr1.removeClass("activate");

                                $desc2.addClass("activate");
                                $desc1.removeClass("activate");

                                $dir2.addClass("active");
                                $dir1.removeClass("active");
                            } else {
                                bootbox.alert("The email is not available.Please insert different email!", function () {
                                    $email.focus();
                                    $email.val("");
                                });
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Failed to check email!");
                        },
                        complete: function (jqXHR, textStatus) {
                            $form.prop('disabled', false);
                            $firstButton.text(oriText);
                        }
                    });


                });// end of first button

                $secondButton.on("click", function (e) {
                    e.preventDefault();
                    var oriText = $(this).text();
                    var $form = $('#secondForm');

                    if (!$form[0].checkValidity()) {
                        $('<input type="submit">').hide().appendTo('#secondForm').click().remove();
                        return;
                    }

                    var $id = $('#inputUserID'),
                            $pwd1 = $('#inputPassword1'),
                            $pwd2 = $('#inputPassowrd2'),
                            $question = $('#inputQuestion'),
                            $answer = $('#inputAnswer'),
                            $email = $('#inputEmail');

                    if ($pwd1.val().length < 6) {
                        bootbox.alert("Minimum length for password is 6 character!", function () {
                            $pwd1.focus();
                            $pwd1.val("");
                            $pwd2.val("");
                        });
                        return;
                    }

                    if ($pwd1.val() !== $pwd2.val()) {
                        bootbox.alert("Password does not match!", function () {
                            $pwd1.focus();
                            $pwd1.val("");
                            $pwd2.val("");
                        });
                        return;
                    }

                    $(this).text("Loading...");
                    $form.prop("disabled", true);

                    var input = {
                        userID: $id.val(),
                        email: $email.val(),
                        pwd: $pwd1.val(),
                        question: $question.val(),
                        answer: $answer.val()
                    };

                    $.ajax({
                        type: 'POST',
                        url: "control/addUserID.jsp",
                        data: input,
                        dataType: 'json',
                        timeout: 60000,
                        success: function (data, textStatus, jqXHR) {
                            if (!data.isIDAvailable) {
                                bootbox.alert("ID is not available. Please insert different ID.", function () {
                                    $id.focus();
                                    $id.val("");
                                });
                            } else if (data.isValid) {
                                $ctr3.addClass("activate");
                                $ctr2.removeClass("activate");
                            } else {
                                bootbox.alert(data.msg);
                                console.log(data.sql);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Fail register ID. " + errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            $secondButton.text(oriText);
                            $form.prop("disabled", false);
                        }
                    });



                });// end of second button

                $thirdButton.on("click", function (e) {
                    e.preventDefault();
                    var oriText = $(this).text();
                    var $form = $('#thirdForm');

                    if (!$form[0].checkValidity()) {
                        $('<input type="submit">').hide().appendTo('#thirdForm').click().remove();
                        return;
                    }

                    var $name = $('#inputName'),
                            $dob = $('#inputDOB'),
                            $nric = $('#inputNRIC'),
                            $salutation = $('#inputSalutation'),
                            $gender = $('#inputGender'),
                            $mobile = $('#inputMobile2');

                    if (!isValidDate($dob.val())) {
                        bootbox.alert("Invalid date of birth!", function () {
                            $dob.focus();
                            $dob.val("");
                        });
                        return;
                    }
                    
                    if(!validatePhonenumber($mobile.val())){
                        bootbox.alert("Invalid mobile phone number!", function(){
                            $mobile.focus();
                            $mobile.val("");
                        });
                        return;
                    }

                    if (RIS_gambarURI === "") {
                        bootbox.alert("Please upload your NRIC/ID image.");
                    }

                    $(this).text("Loading...");
                    $form.prop("disabled", true);
                    
                    var input ={
                        name : $name.val(),
                        dob: $dob.val(),
                        gender: $gender.val(),
                        salutation: $salutation.val(),
                        mobile: $mobile.val(),
                        nric: $nric.val(),
                        strPic: RIS_gambarURI
                    };

                    $.ajax({
                        type: 'POST',
                        data: input,
                        dataType: 'json',
                        timeout: 60000,
                        url: "control/addUserID_step2.jsp",
                        success: function (data, textStatus, jqXHR) {
                            bootbox.alert(data.msg, function(){
                                if(data.isValid){
                                    location.reload();
                                }
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Error: "+errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            $thirdButton.text(oriText);
                            $form.prop("disabled", false);
                        }
                    });

                    
                });


                // copy
                //balapaCop("Step by Step Form", "#999");

            });//end ready

            function bindSameValue($active, $passive) {
                $active.on('keyup keypress blur change', function () {
                    $passive.val($active.val());
                });
            }

            function populateSelectList($select, master_cd) {
                var input = {
                    master_cd: master_cd,
                    keyword: ""
                };
                $.ajax({
                    type: 'POST',
                    data: input,
                    dataType: 'json',
                    timeout: 60000,
                    url: "control/getDetailFlexList.jsp",
                    success: function (data, textStatus, jqXHR) {
                        for (var i in data) {
                            $select.append("<option value='" + data[i].value + "'>" + data[i].name + "</option>");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Failed to populate " + master_cd);
                    }
                });
            }

            function loadImageFileAsURL()
            {

                var iSize = 0;

                iSize = ($("#inputNRIC_pic")[0].files[0].size / 1024);

                var sizeSmall = false;

                if (iSize / 1024 > 1) {
                    if (((iSize / 1024) / 1024) > 1)

                    {
                        //iSize = (Math.round(((iSize / 1024) / 1024) * 100) / 100);
                        //$("#lblSize").html(iSize + "Gb");
                        sizeSmall = false;

                    } else

                    {

                        iSize = (Math.round((iSize / 1024) * 100) / 100);
                        sizeSmall = iSize <= 0.7;
                        //$("#lblSize").html(iSize + "Mb");

                    }

                } else {

                    iSize = (Math.round(iSize * 100) / 100);

                    sizeSmall = iSize <= 700;

                }

                if (sizeSmall) {
                    //document.getElementById("dym").innerHTML = '<div class="loader"></div>';
                    var filesSelected = document.getElementById("inputNRIC_pic").files;
                    if (filesSelected.length > 0)
                    {
                        var fileToLoad = filesSelected[0];

                        var fileReader = new FileReader();

                        fileReader.onload = function (fileLoadedEvent)
                        {

                            RIS_gambarURI = fileLoadedEvent.target.result;


                            //document.getElementById("dym").innerHTML = '<img id="myImage">';

                            //document.getElementById("myImage").src = RIS_gambarURI;
                            $('#NRIC_pic').attr('src', RIS_gambarURI);
                        };

                        fileReader.readAsDataURL(fileToLoad);
                    }

                } else {

                    bootbox.alert("File size must not exceed 650Kb");
                    $('#inputNRIC_pic').val("");
                    RIS_gambarURI = "";
                    $('#NRIC_pic').attr('src', RIS_gambarURI);
                    //$('#dym').html("");
                }


            }

        </script>
    </body>

</html>
