<%-- 
    Document   : tenant
    Created on : Apr 14, 2018, 11:23:31 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%    Object objTenant = session.getAttribute(MySessionKey.TENANT_CD);
    if (objTenant == null) {
        response.sendRedirect("../Entrance/destroySession.jsp");
        return;
    }

    String tenant_cd = (String) objTenant;

    if (!"???".equals(tenant_cd)) {
        response.sendRedirect("home.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | Tenant Management System</title>
        <!-- header -->
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <div class="col-sm-3 col-md-2 sidebar">
                    <div class="brand"></div>
                    <!-- logo -->
                    <div class="logo">
                        Welcome to <span>iHIS</span>
                    </div>
                    <!-- logo -->

                    <!-- profile Sidebar -->
                    <%@include file="side_profile.jsp" %>
                    <hr/>
                    <!-- profile Sidebar -->                    
                </div>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">
                                <div style="width: 80%; margin: auto; background: #f2f4f8;">
                                    <h3>Tenant Registration Form</h3>
                                    <hr/>
                                    <%@include file="form/tenant.jsp" %>
                                    <div class="form-group">
                                        <div class="col-sm-offset-4 col-sm-4">

                                            <button class="btn btn-primary" id="btnSignUp">
                                                Submit
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
            </div>
            <!-- main -->		

        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="../assets/js/jquery-ui.js"></script>
        <script type="text/javascript" src="../assets/js/jquery.flexdatalist.min.js"></script>
        <script type="text/javascript" src="../assets/js/rd.jquery.preventKey.js"></script>
        <script type="text/javascript" src="../assets/js/rd.jquery.validator.js"></script>
        <script type="text/javascript" src="../assets/js/create_destroy_loading.js"></script>
        <script src="../assets/js/bootbox.min.js" type="text/javascript"></script>
        <!-- Placed at the end of the document so the pages load faster -->


        <script>
            history.forward();
            createScreenLoading();
            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");

                //init state list
                $.ajax({
                    type: 'POST',
                    url: "control/getDetailFlexList.jsp",
                    data: {
                        master_cd: "0002",
                        keyword: ""
                    },
                    dataType: 'json',
                    timeout: 60000,
                    success: function (data, textStatus, jqXHR) {
                        data.forEach(function (item)
                        {
                            if (item.value !== "00")
                                $('#regState').append("<option value='" + item.value + "'>" + item.name + "</option>");
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("Oops! Can't load state: " + errorThrown);
                    }
                });

                destroyScreenLoading();

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

                initFlexData("regPostcode", "regPostcodeMatch", "control/getDetailFlexList.jsp", "0079");


                $('#btnReset').on('click', function () {
                    $('#regForm')[0].reset();
                    $('#regPostcodeMatch').html('');
                });

                $('#regState').on('change', function () {
                    var code = $('#regState').val();
                    $('#regTown').html('<option  value="0" >-- Select the town --</option>');
                    if (code !== '0') {

                        var dataFields = {code: code, process: "district"};

                        $.ajax({
                            type: "POST",
                            url: "../SystemAdmin/HFM_result.jsp",
                            data: dataFields,
                            timeout: 5000,
                            success: function (data) {
                                $('#regDistrict').html(data);
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("can't load district: " + errorThrown);
                            }
                        });
                    } else {
                        $('#regDistrict').html('<option  value="0" >-- Select the district --</option>');
                    }
                });


                $('#regDistrict').on('change', function () {

                    var code = $('#regDistrict').val();
                    if (code !== '0') {

                        if (code === '00') {
                            var front = $('#regState').val();
                            code = front + '00';
                        }

                        var dataFields = {code: code, process: "town"};

                        $.ajax({
                            type: "POST",
                            url: "../SystemAdmin/HFM_result.jsp",
                            data: dataFields,
                            timeout: 5000,
                            success: function (data) {
                                $('#regTown').html(data);
                            },
                            error: function (err) {
                                console.log("Ajax error");
                            }
                        });
                    } else {
                        $('#regTown').html('<option  value="0" >-- Select the town --</option>');
                    }

                });

                function validateMyForm() {
                    if (!$('#regForm')[0].checkValidity()) {
                        $('<input type="submit">').hide().appendTo('#regForm').click().remove();
                        return false;
                    }

                    var state = $('#regState').val();
                    if (state === "0") {
                        bootbox.alert("Select the state!", function () {
                            $('#regState').focus();
                        });
                        return false;
                    }

                    var district = $('#regDistrict').val();
                    if (district === "0") {
                        bootbox.alert("Select the district!", function () {
                            $('#regDistrict').focus();
                        });
                        return false;
                    }

                    var town = $('#regTown').val();
                    if (town === "0") {
                        bootbox.alert("Select the town!", function () {
                            $('#regTown').focus();
                        });
                        return false;
                    }

                    var pos = $('#regPostcode').val();
                    if (pos == null || pos === "") {
                        bootbox.alert("Select existing postcode!", function () {
                            $('#regPostcode-flexdatalist').val("");
                            $('#regPostcode-flexdatalist').focus();
                        });
                        return false;
                    }

                    var phone = $('#regPhone').val().trim();
                    if (phone !== "" && !validatePhonenumber(phone)) {
                        bootbox.alert("Invalid mobile phone number. Only numbers and +, - signs are allowed.", function () {
                            $('#regPhone').val("");
                            $('#regPhone').focus();

                        });
                        return false;
                    }

                    var fax = $('#regFax').val().trim();
                    if (fax !== "" && !validatePhonenumber(fax)) {
                        bootbox.alert("Invalid mobile fax number. Only numbers and +, - signs are allowed.", function () {
                            $('#regFax').val("");
                            $('#regFax').focus();

                        });
                        return false;
                    }

                    var email = $('#regEmail').val().trim();
                    if (email !== "" && !validateEmail(email)) {
                        bootbox.alert("Invalid email format!", function () {
                            $('#regEmail').val("");
                            $('#regEmail').focus();

                        });
                        return false;
                    }

                    return true;
                }


                $('#btnSignUp').on('click', function () {
                    if (validateMyForm()) {
                        createScreenLoading();
                        var tenant_cd = $('#regCode').val();
                        var tenant_name = $('#regName').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                        var add1 = $('#regAddress1').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                        var add2 = $('#regAddress2').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                        var add3 = $('#regAddress3').val().replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                        var town = $('#regTown').val();
                        var district = $('#regDistrict').val();
                        var state = $('#regState').val();
                        var pos = $('#regPostcode').val();
                        var phone = $('#regPhone').val();
                        var fax = $('#regFax').val();
                        var email = $('#regEmail').val();

                        var input = {
                            code: tenant_cd,
                            name: tenant_name,
                            add1: add1,
                            add2: add2,
                            add3: add3,
                            town: town,
                            district: district,
                            state: state,
                            pos: pos,
                            phone: phone,
                            fax: fax,
                            email: email
                        };

                        $.ajax({
                            type: 'POST',
                            data: input,
                            timeout: 60000,
                            url: "control/registerTenant.jsp",
                            dataType: 'json',
                            success: function (data, textStatus, jqXHR) {
                                bootbox.alert(data.msg, function(){
                                    if(data.url != null){
                                        window.location = data.url;
                                    }
                                });
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("Oops! "+errorThrown);
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }
                        });
                    }
                });



            });




        </script>

    </body>

</html>
