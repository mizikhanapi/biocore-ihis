<%-- 
    Document   : index
    Created on : Apr 12, 2018, 6:00:27 PM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="java.net.InetAddress"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    InetAddress ia = InetAddress.getLocalHost();
    String node = ia.getHostName();

    String webRootPath = application.getRealPath("").replace("\\", "/");

    String yurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    Config.getBase_url(request);
    Config.getFile_url(session);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up page</title>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" >
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/jquery.flexdatalist.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/mystyles.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="../assets/header.html" />
    </head>
    <body>
        <!--
        <h1>Hello World! Welcome to <%=node%></h1>
        <p>Server host name is: <b><%=request.getServerName()%></b></p>
        <p>Context Path is: <b><%=request.getContextPath()%></b></p>
        <p>Web Root is: <b><%=webRootPath%></b></p>
        <p>Web Root is: <b><%=yurl%></b></p>
        -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-md-offset-6">
                    <div class="card card-container">
                        <div class="profile-img-card">
                            <img src="../assets/i-his.logo.svg" class="logo-login">
                        </div>                       
                    </div>
                </div>
            </div>


            <div class="row">

                <div class="col-md-8 col-md-offset-2">
                    <div  class="thumbnail">

                        <div class="main" style="width: 80%; margin: auto; background: #f2f4f8;">
                            <h3>Sign Up Form</h3>
                            <hr/>
                            <form class="form-horizontal" role="form" id="regForm">
                                <div class="form-group">

                                    <label for="regName" class="col-sm-3 control-label">
                                        Name:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="regName" maxlength="180" placeholder="Enter your full name" required autocomplete="name"/>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="regIC" class="col-sm-3 control-label">
                                        Identity Card/ Passport No:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control code-input" id="regIC" placeholder="Enter your identity card or passport number" required/>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="regDOB" class="col-sm-3 control-label">
                                        Date of Birth:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="regDOB" readonly placeholder="Click to pop-up calendar" required/>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="regSex" class="col-sm-3 control-label">
                                        Select Gender:
                                    </label>
                                    <div class="col-sm-9">
                                        <select class="form-control" id="regSex" required>
                                            <option value="001">Male</option>
                                            <option value="002">Female</option>
                                            <option value="003">Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="regCountry" class="col-sm-3 control-label">
                                        Country of Origin:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="regCountry" placeholder="Type to search your country" autocomplete="off" required/>
                                        <div id="regCountryMatch" class="search-drop">
                                            <!--search result-->
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="regPhone" class="col-sm-3 control-label">
                                        Mobile Phone no:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="tel" class="form-control" id="regPhone" placeholder="Enter your mobile phone number" maxlength="30" required autocomplete="tel"/>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="regEmail" class="col-sm-3 control-label">
                                        Email:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="regEmail" placeholder="Enter your email address" maxlength="100" required autocomplete="email"/>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="regUserID" class="col-sm-3 control-label">
                                        User ID:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control code-input" id="regUserID" placeholder="Enter your unique user ID" maxlength="30" required/>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="repPwd1" class="col-sm-3 control-label">
                                        Password:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="regPwd1" maxlength="50" placeholder="Enter your password" required autocomplete="new-password"/>
                                    </div>
                                </div>
                                <div class="form-group">

                                    <label for="repPwd2" class="col-sm-3 control-label">
                                        Retype Password:
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" class="form-control" id="regPwd2" maxlength="50" placeholder="Confirm your password" required autocomplete="new-password"/>
                                    </div>
                                </div>                                

                            </form>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-4">

                                    <button class="btn btn-primary" id="btnSignUp">
                                        Sign Up
                                    </button>

                                    <button class="btn btn-default" id="btnReset">
                                        Reset
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>

            </div>
        </div>

        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootbox.min.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.flexdatalist.min.js" type="text/javascript"></script>
        <script src="../assets/js/create_destroy_loading.js" type="text/javascript"></script>
        <script src="../assets/js/rd.jquery.preventKey.js" type="text/javascript"></script>
        <script src="../assets/js/rd.jquery.validator.js" type="text/javascript"></script>

        <script>
            $(function () {
                preventPipeKeyPress("input");
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");

                //init datepicker
                $('#regDOB').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    maxDate: 0,
                    dateFormat: 'dd/mm/yy',
                    yearRange: "-100:+nn"
                });

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
                }

                initFlexData("regCountry", "regCountryMatch", "control/getDetailFlexList.jsp", "0001");


                $('#btnReset').on('click', function () {
                    $('#regForm')[0].reset();
                    $('#regCountryMatch').html('');
                });

                function validateMyForm() {
                    $('#regDOB').prop('readonly', false);
                    if (!$('#regForm')[0].checkValidity()) {
                        $('<input type="submit">').hide().appendTo('#regForm').click().remove();
                        $('#regDOB').prop('readonly', true);
                        return false;
                    }
                    $('#regDOB').prop('readonly', true);

                    var country = $('#regCountry').val();
                    console.log("Country: " + country);

                    if (country == null || country === "") {
                        bootbox.alert("Please select existing country!", function () {
                            $('#regDOB-flexdatalist').val("");
                            $('#regDOB-flexdatalist').focus();

                        });
                        return false;
                    }

                    var phone = $('#regPhone').val();
                    if (!validatePhonenumber(phone)) {
                        bootbox.alert("Invalid mobile phone number. Only numbers and +, - signs are allowed.", function () {
                            $('#regPhone').val("");
                            $('#regPhone').focus();

                        });
                        return false;
                    }

                    var pwd1 = $('#regPwd1').val();
                    var pwd2 = $('#regPwd2').val();
                    if (pwd1.length < 6) {
                        bootbox.alert("Password must at least have 6 characters!", function () {
                            $('#regPwd1').val('');
                            $('#regPwd2').val('');
                            $('#regPwd1').focus();

                        });
                        return false;
                    }

                    if (pwd1 !== pwd2) {
                        bootbox.alert("The password do not match!", function () {
                            $('#regPwd1').val('');
                            $('#regPwd2').val('');
                            $('#regPwd1').focus();

                        });
                        return false;
                    }

                    return true;
                }

                $('#btnSignUp').on('click', function () {
                    if (validateMyForm()) {
                        createScreenLoading();
                        var name = $('#regName').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                        var ic_no = $('#regIC').val();
                        var dob = $('#regDOB').val();
                        var country = $('#regCountry').val();
                        var email = $('#regEmail').val();
                        var pwd = $('#regPwd1').val();
                        var sex = $('#regSex').val();
                        var userID = $('#regUserID').val();
                        var phone = $('#regPhone').val();

                        var input = {
                            name: name,
                            ic_no: ic_no,
                            dob: dob,
                            phone: phone,
                            country: country,
                            email: email,
                            pwd: pwd,
                            sex: sex,
                            userID: userID
                        };

                        $.ajax({
                            type: 'POST',
                            url: "control/registerUser.jsp",
                            data: input,
                            timeout: 60000,
                            dataType: 'json',
                            success: function (data, textStatus, jqXHR) {
                                if(data.isValid){
                                    bootbox.alert(data.msg);
                                    $('#btnReset').click();
                                }
                                else{
                                    bootbox.alert("<b class='text-danger'>"+data.msg+"<b>");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("Error: "+errorThrown);
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }
                        });


                    }
                });

            });// end document ready
        </script>
    </body>
</html>
