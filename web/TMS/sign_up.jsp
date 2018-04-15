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
                            <%@include file="form/user.jsp" %>
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
                            $('#regCountry-flexdatalist').val("");
                            $('#regCountry-flexdatalist').focus();

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
                    
                    var email = $('#regEmail').val();
                    if(!ValidateEmail(email)){
                        bootbox.alert("Invalid email format!", function(){
                            $('#regEmail').val("");
                            $('#regEmail').focus();
                        });
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
