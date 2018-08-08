<%-- 
    Document   : register-tenant
    Created on : Jul 13, 2018, 11:23:43 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="../assets/css/dropzone.min.css" rel="stylesheet" type="text/css"/>
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

            .directory{
                cursor: pointer;
            }

        </style>
        <script>
            history.forward();
        </script>
    </head>
    <body>
        <div class="login_container col-md-9">
            <div class="login_row panel login_panel">

                <div id="mainBody" class="panel-body login_body" style="max-height: 100vh; overflow: auto;">

                    <form id="tenant-form" class="form-horizontal" autocomplete="off">
                        <fieldset class="steps step1 activate" data-number='1'>
                            <h2>Provider Info</h2>
                            <div class="form-group">
                                <div class="col-md-12"><label class="control-label" for="company_name">Provider Name:</label></div>
                                <div class="col-md-12">
                                    <input id="inputProviderName" type="text" class="form-control input-lg" name="provider" maxlength="200" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Building Number:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputBuildingNo" type="text" class="form-control input-lg" name="building" maxlength="40" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Street Name:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputStreet" type="text" class="form-control input-lg" name="street" maxlength="40" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Postcode:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputPostcode" type="text" class="form-control input-lg" name="inputUserID" required autocomplete="off">
                                            <div id="inputPostcodeMatch"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Town:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputTown" type="text" class="form-control input-lg" name="inputUserID" required autocomplete="off">
                                            <div id="inputTownMatch"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">District:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputDistrict" type="text" class="form-control input-lg" name="inputUserID" required autocomplete="off">
                                            <div id="inputDistrictMatch"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">State:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputState" type="text" class="form-control input-lg" name="inputUserID" required autocomplete="off">
                                            <div id="inputStateMatch"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-12"><label class="control-label" for="company_name">Country:</label></div>
                                <div class="col-md-12">
                                    <input id="inputCountry" type="text" class="form-control input-lg" required autocomplete="off">
                                    <div id="inputCountryMatch"></div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Mobile:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputMobile" type="text" class="form-control input-lg" name="mobile" maxlength="20" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">E-mail:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputEmail" type="text" class="form-control input-lg" name="inputUserID" maxlength="100" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Bank:</label></div>
                                        <div class="col-md-12">
                                            <select id="inputBank" class="form-control input-lg"></select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="col-md-12"><label class="control-label" for="company_name">Bank Account No:</label></div>
                                        <div class="col-md-12">
                                            <input id="inputAccount" type="text" class="form-control input-lg" name="bank" maxlength="10" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </fieldset>
                    </form>

                    <fieldset class="steps step2 activate" data-number='2'>
                        <h2>Package</h2>
                        <input type="hidden" id="inputPackage" />
                        <div class="row">
                            <div class="col-md-12">
                                <h3>Select a package</h3>
                                <div id="serviceList" class="row">

                                </div>
                            </div>
                        </div>

                    </fieldset>

                    <fieldset class="steps step3 activate" data-number='3'>
                        <h2>Upload Documents</h2>
                        <div class="row">
                            <div class="col-md-12">
                                <form id="file-upload-form" class="uploader">
                                    <input id="file-upload1" class="file-upload" type="file" name="fileUpload" style="display: none;" accept="image/*" />

                                    <label for="file-upload" id="file-drag1" class="upload-box">
                                        <div id="start">
                                            <i class="fa fa-download" aria-hidden="true"></i>
                                            <h4>Upload Annual Practicing Certificate</h4>
                                            <div>Select a file or drag here</div>
                                            <div id="notimage" class="hidden">Please select an image</div>
                                            <span id="file-upload-btn1" class="btn btn-primary">Select a file</span>
                                        </div>
                                    </label>
                                </form>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <form id="file-upload-form2" class="uploader">
                                    <input id="file-upload2" class="file-upload" type="file" name="fileUpload" style="display: none;" accept="image/*" />

                                    <label for="file-upload" id="file-drag2" class="upload-box">
                                        <div id="start">
                                            <i class="fa fa-download" aria-hidden="true"></i>
                                            <h4>Upload Business Licence Certificate </h4>
                                            <div>Select a file or drag here</div>
                                            <div id="notimage" class="hidden">Please select an image</div>
                                            <span id="file-upload-btn2" class="btn btn-primary">Select a file</span>
                                        </div>
                                    </label>
                                </form>
                            </div>
                        </div>

                        <div class="text-right">
                            <button id="btnLogout1" class="next btn btn-rounded btn-default btn-lg login-btn"><i style="margin-top: 3px;" class="fa fa-power-off fa-lg pull-left"></i> Log Out</button>
                            <button id="btnSubmit" class="sixth btn btn-rounded btn-mkag btn-lg login-btn">Submit <i style="margin-top: 3px;" class="fa fa-angle-right fa-lg pull-right"></i></button>
                        </div>
                    </fieldset>

                </div>
            </div>
        </div>
        <div class="col-md-3 login_container reg-sticker">
            <div class="login_row login_panel">
                <div class="direction_numbering">
                    <ul>
                        <li id="btnLogout2" class="directory"><i class="fa fa-power-off"></i></li>
                    </ul>
                </div>
                <div class="login_logo text-center">
                    <div id="keterangan1" class="keterangan activate ">
                        <img class="keterangan-logo" src="../assets/hospital.svg">
                        <h3>Create Tenant Account</h3>
                        <p>You are just a few steps away.</p>
                        <p>Complete the form by filling in your provider details.</p>
                        <p>Select a package that suits your business.</p>
                        <p>Upload some valid supporting documents.</p>
                    </div>                   
                </div>

            </div>
        </div>

        <%@include file="libraries/footLibrary.jsp" %>
        <script src="../assets/js/rd.jquery.validator.js"></script>
        <script src="../assets/js/rd.jquery.check-file.js"></script>
        <script src="../assets/js/rd.jquery.preventKey.js"></script>
        <script src="../assets/js/dropzone.js"></script>
        <script>

            $("html").on("dragover", function (e) {
                e.preventDefault();
                e.stopPropagation();
                //$("h1").text("Drag here");
            });

            $("html").on("drop", function (e) {
                e.preventDefault();
                e.stopPropagation();
            });


            $(function () {

                getEmailPhone();

                initDropzone("file-drag1", "file-upload-btn1");
                initDropzone("file-drag2", "file-upload-btn2");

                populateSelectList($("#inputBank"), "0097");

                initFlexData("inputPostcode", "inputPostcodeMatch", "control/getDetailFlexList.jsp", "0079");
                initFlexData("inputTown", "inputTownMatch", "control/getDetailFlexList.jsp", "0003");
                initFlexData("inputDistrict", "inputDistrictMatch", "control/getDetailFlexList.jsp", "0078");
                initFlexData("inputState", "inputStateMatch", "control/getDetailFlexList.jsp", "0002");
                initFlexData("inputCountry", "inputCountryMatch", "control/getDetailFlexList.jsp", "0001");

                getPackageOption();

                $("#serviceList").on("click", ".service-box", function () {
                    $(".service-box").removeClass("alert-success");
                    $(".service-box").removeClass("alert-warning");
                    $(this).addClass("alert-success");
                    var input = $(this).find("#pack_cd").val();
                    $("#inputPackage").val(input);
                    console.log(input);

                });

                $("#btnLogout1").on("click", function () {
                    logOut()
                });
                $("#btnLogout2").on("click", function () {
                    logOut()
                });

                $("#btnSubmit").on("click", function () {
                    if (validateInput()) {

                        var $provider = $("#inputProviderName"),
                                $buildingNo = $("#inputBuildingNo"),
                                $street = $("#inputStreet"),
                                $postcode = $("#inputPostcode"),
                                $town = $("#inputTown"),
                                $district = $("#inputDistrict"),
                                $state = $("#inputState"),
                                $country = $("#inputCountry"),
                                $bankName = $("#inputBank"),
                                $bankAcc = $("#inputAccount"),
                                $phone = $("#inputMobile"),
                                $email = $("#inputEmail"),
                                $package = $("#inputPackage"),
                                $file1 = $("#file-drag1"),
                                $file2 = $("#file-drag2");

                        var input = {
                            provider: $provider.val(),
                            buildingNo: $buildingNo.val(),
                            street: $street.val(),
                            postcode: $postcode.val(),
                            town: $town.val(),
                            district: $district.val(),
                            state: $state.val(),
                            country: $country.val(),
                            bankName: $bankName.val(),
                            bankAcc: $bankAcc.val(),
                            phone: $phone.val(),
                            email: $email.val(),
                            package: $package.val(),
                            file1: $file1.find("img").attr("src"),
                            file2: $file2.find("img").attr("src")
                        };
                        
                        console.log(input.file1);
                        var dialog = bootbox.dialog({
                            title: 'Processing your data',
                            message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>'
                        });
                        $.ajax({
                            type: 'POST',
                            url: "control/insertTenant.jsp",
                            timeout: 60000,
                            data: input,
                            dataType: 'json',
                            success: function (data, textStatus, jqXHR) {
                                bootbox.alert(data.msg, function(){
                                    if(!data.isValid){
                                        console.log(data.sql);
                                    }
                                    else{
                                        window.location = data.url;
                                    }
                                });
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("Error :"+errorThrown);
                            },
                            complete: function (jqXHR, textStatus) {
                                dialog.modal('hide');
                            }
                        });
                    }
                });


            });//end ready...

            function validateInput() {
                var $provider = $("#inputProviderName"),
                        $buildingNo = $("#inputBuildingNo"),
                        $street = $("#inputStreet"),
                        $postcode = $("#inputPostcode"),
                        $town = $("#inputTown"),
                        $district = $("#inputDistrict"),
                        $state = $("#inputState"),
                        $country = $("#inputCountry"),
                        $bankName = $("#inputBank"),
                        $bankAcc = $("#inputAccount"),
                        $phone = $("#inputMobile"),
                        $email = $("#inputEmail"),
                        $package = $("#inputPackage"),
                        $file1 = $("#file-drag1"),
                        $file2 = $("#file-drag2");

                if ($provider.val() === "") {
                    bootbox.alert("Please enter provider name!");
                    return false;
                }

                if ($buildingNo.val() === "") {
                    bootbox.alert("Please enter building number!");
                    return false;
                }

                if ($street.val() === "") {
                    bootbox.alert("Please enter street name!");
                    return false;
                }

                if ($postcode.val() === "" || $postcode.val() == null) {
                    bootbox.alert("Please search and choose existing postcode!");
                    $("#inputPostcode-flexdatalist").val("");
                    return false;
                }

                if ($town.val() === "" || $town.val() == null) {
                    bootbox.alert("Please search and choose existing town!");
                    $("#inputTown-flexdatalist").val("");
                    return false;
                }

                if ($district.val() === "" || $district.val() == null) {
                    bootbox.alert("Please search and choose existing district!");
                    $("#inputDistrict-flexdatalist").val("");
                    return false;
                }

                if ($state.val() === "" || $state.val() == null) {
                    bootbox.alert("Please search and choose existing state!");
                    $("#inputState-flexdatalist").val("");
                    return false;
                }

                if ($country.val() === "" || $country.val() == null) {
                    bootbox.alert("Please search and choose existing country!");
                    $("#inputCountry-flexdatalist").val("");
                    return false;
                }

                if ($bankAcc.val() === "") {
                    bootbox.alert("Please enter the bank account number!");
                    return false;
                }

                if ($phone.val() === "" || !validatePhonenumber($phone.val())) {
                    bootbox.alert("Please enter the phone number with valid phone number!");
                    return false;
                }

                if ($email.val() === "" || !ValidateEmail($email.val())) {
                    bootbox.alert("Please enter the email with valid email!");
                    return false;
                }

                if ($package.val() === "" || $package.val() == null) {
                    bootbox.alert("Please select a package!");
                    return false;
                }

                if (!$file1.find("img").length) {
                    bootbox.alert("Please upload your annual practicing certificate!");
                    return false;
                }

                if (!$file2.find("img").length) {
                    bootbox.alert("Please upload your business license certificate!");
                    return false;
                }

                return true;

            }

            function getEmailPhone() {
                $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    timeout: 60000,
                    url: 'control/getBasicInfo.jsp',
                    success: function (data, textStatus, jqXHR) {
                        console.log("Data: " + JSON.stringify(data));
                        $("#inputEmail").val(data.email);
                        $("#inputMobile").val(data.phone);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Fail get basic info: " + errorThrown);
                    }
                });
            }

            function initDropzone(boxID, btnID) {
                $("#" + boxID).dropzone({
                    url: "/post",
                    autoProcessQueue: false,
                    clickable: "#" + btnID,
                    maxFiles: "1",
                    maxFilesize: "0.65",
                    acceptedFiles: "image/*",
                    addRemoveLinks: true,
                    createImageThumbnails: true,
                    thumbnailHeight: null,
                    thumbnailWidth: null,
                    previewTemplate: '<div class="dz-preview dz-file-preview"> <div class="dz-details"> <div class="dz-filename"><span data-dz-name></span></div> <div class="dz-size" data-dz-size></div> <img data-dz-thumbnail /> </div> <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress></span></div></div>',
                    error: function (file, error) {
                        if (!file.accepted) {
                            this.removeFile(file);
                            bootbox.alert(error);
                        }

                    }
                });
            }

            //init felx-data-list
            function initFlexData(elemInputID, elemDivID, url, objData) {
                $('#' + elemInputID).flexdatalist({
                    minLength: 1,
                    searchIn: 'name',
                    searchDelay: 1000,
                    selectionRequired: true,
                    url: url,
                    visibleProperties: 'name',
                    cache: false,
                    valueProperty: 'value',
                    searchContain: false,
                    searchByWord: true,
                    params: {
                        master_cd: objData
                    }
                });

                $('#' + elemInputID).on('before:flexdatalist.data', function (response) {
                    $('#' + elemDivID).html('<img src="../assets/img/LoaderIcon.gif" />');
                });
                $('#' + elemInputID).on('after:flexdatalist.data', function (response) {
                    $('#' + elemDivID).html('');
                });
                $('#' + elemInputID + '-flexdatalist').on('keyup', function (event) {
                    if ($(this).val().trim() === "") {
                        $('#' + elemDivID).html('');
                    }
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
                    },
                    complete: function (jqXHR, textStatus) {
                        console.log("Success load: " + $select.attr("id"));
                    }
                });
            }

            function getPackageOption() {
                var $package = $("#serviceList");
                $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    timeout: 60000,
                    url: "control/getPackage.jsp",
                    success: function (data, textStatus, jqXHR) {
                        for (var i in data) {

                            var strInfo = '';

                            for (var j in data[i].html) {
                                strInfo += '<h4>' + data[i].html[j] + '</h4>';
                            }

                            var strDiv = '<div class="col-md-4"> <div class="service-box"> <i class="fa fa-thumbs-up"></i>' + strInfo + '<input type="hidden" id="pack_cd" value="' + data[i].code + '"/></div> </div>';
                            $package.append(strDiv);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log('Cannot get package list:' + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        $("#serviceList .service-box").hover(
                                function () {
                                    $(this).addClass("alert-warning");
                                },
                                function () {
                                    $(this).removeClass("alert-warning");
                                }
                        );
                    }
                });
            }

            function logOut() {
                bootbox.confirm({
                    message: "Are sure you want to logout now? Data will not be saved.",
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
                            window.location = "../Entrance/destroySession.jsp";
                        }
                    }
                });
            }

        </script>
    </body>


</html>
