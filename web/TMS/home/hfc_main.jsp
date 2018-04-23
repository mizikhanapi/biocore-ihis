<%-- 
    Document   : hfc_main
    Created on : Apr 15, 2018, 4:03:16 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ADM_helper.MySession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<!-- Add Part Start -->
<!-- Add Button Start -->
<%
    String tenant_name = (String) session.getAttribute(MySessionKey.TENANT_NAME);
%>
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    HEALTH FACILITY MANAGEMENT

    <span class="pull-right">
        <button id="HFM_btnAddNew" class="btn btn-success" data-status="pagado" data-id="1" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD Health Facility</button>
    </span>

</h4>
<div class="table-guling" id="hfcTableDiv"></div>
<!-- Add Button End -->
<!-- Add Modal Start -->
<div class="modal fade" id="HFM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg" style="color: red"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New Health Facility</h3>
            </div>
            <div class="modal-body">
                <%@include file="../form/hfc.jsp" %>
                <hr/>

                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group hide_show" role="group" id="HFM_AddDiv">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="HFM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group hide hide_show" role="group" id="HFM_UpdateDiv">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="HFM_btnUpdate">Update</button>
                    </div>
                    <div class="btn-group hide hide_show" role="group" id="HFM_LogoDiv">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="HFM_btnLogo">Save</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="HFM_btnReset" class="btn btn-default btn-block btn-lg" role="button" >Reset</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->
<script>
    createScreenLoading();
    $('#inputFileToLoad').checkFileType({
        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
        success: function () {
            loadImageFileAsURL();
        },
        error: function () {
            bootbox.alert('Incompatible file type');
            $('#inputFileToLoad').val("");
            $('#dym').html("");
            gambarURI = "";
        }
    });


    var gambarURI = "";

    function loadImageFileAsURL()
    {

        var iSize = 0;

        iSize = ($("#inputFileToLoad")[0].files[0].size / 1024);

        var sizeSmall = false;

        if (iSize / 1024 > 1) {
            sizeSmall = false;

        } else {

            iSize = (Math.round(iSize * 100) / 100);

            sizeSmall = iSize <= 45;

        }

        if (sizeSmall) {
            document.getElementById("dym").innerHTML = '<div class="loader"></div>';
            var filesSelected = document.getElementById("inputFileToLoad").files;
            if (filesSelected.length > 0)
            {
                var fileToLoad = filesSelected[0];

                var fileReader = new FileReader();

                fileReader.onload = function (fileLoadedEvent)
                {

                    gambarURI = fileLoadedEvent.target.result;


                    document.getElementById("dym").innerHTML = '<img id="myImage">';

                    document.getElementById("myImage").src = gambarURI;
                };

                fileReader.readAsDataURL(fileToLoad);
            }

        } else {

            bootbox.alert("File size must not exceed 40kb");
            $('#inputFileToLoad').val("");
            gambarURI = "";
            $('#dym').html("");
        }


    }

    $('#HFM_tenant').prop("readonly", true);
    $('#hfcTableDiv').load("home/hfc_table.jsp");

    $(document).ready(function () {
        codeValidityKeyUp(".code-input");
        preventPipeKeyUp("input");

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
                        $('#HFM_state').append("<option value='" + item.value + "'>" + item.name + "</option>");
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Oops! Can't load state: " + errorThrown);
            }
        });

        $('#HFM_establishedDate').datepicker({
            changeYear: true,
            changeMonth: true,
            maxDate: '0',
            dateFormat: 'dd/mm/yy',
            yearRange: '-100:nn'
        });


        function HFM_reset() {
            document.getElementById("HFM_form").reset();
            $('#dym').html("");
            $('#HFM_postcodeMatch').html('');

        }


        $('#HFM_btnReset').on('click', function () {

            HFM_reset();
        });

        $('#HFM_btnAddNew').on('click', function () {
            $('#HFM_detail').modal('show');
            $('.hide_show').hide();
            $('.form-group').show();
            $('#HFM_AddDiv').show();
            $('#HFM_hfcCode').prop("disabled", false);
            $('#HFM_statusDiv').hide();
            HFM_reset();
            $('#HFM_tenant').val("<%=tenant_name%>");
            $('#HFM_detail').css('overflow', 'auto');

        });

        function validateHfcInput() {
            if (!$('#HFM_form')[0].checkValidity()) {
                $('<input type="submit">').hide().appendTo('#HFM_form').click().remove();
                return false;
            }

            var state = $('#HFM_state').val();
            if (state === "0") {
                bootbox.alert("Select the state!", function () {
                    $('#HFM_state').focus();
                });
                return false;
            }

            var district = $('#HFM_district').val();
            if (district === "0") {
                bootbox.alert("Select the district!", function () {
                    $('#HFM_district').focus();
                });
                return false;
            }

            var town = $('#HFM_town').val();
            if (town === "0") {
                bootbox.alert("Select the town!", function () {
                    $('#HFM_town').focus();
                });
                return false;
            }

            var pos = $('#HFM_postcode').val();
            if (pos == null || pos === "") {
                bootbox.alert("Select existing postcode!", function () {
                    $('#HFM_postcode-flexdatalist').val("");
                    $('#HFM_postcode-flexdatalist').focus();
                });
                return false;
            }

            var phone = $('#HFM_telNo').val().trim();
            if (phone !== "" && !validatePhonenumber(phone)) {
                bootbox.alert("Invalid mobile phone number. Only numbers and +, - signs are allowed.", function () {
                    $('#HFM_telNo').val("");
                    $('#HFM_telNo').focus();

                });
                return false;
            }

            var fax = $('#HFM_faxNo').val().trim();
            if (fax !== "" && !validatePhonenumber(fax)) {
                bootbox.alert("Invalid mobile fax number. Only numbers and +, - signs are allowed.", function () {
                    $('#HFM_faxNo').val("");
                    $('#HFM_faxNo').focus();

                });
                return false;
            }

            var email = $('#HFM_email').val().trim();
            if (email !== "" && !ValidateEmail(email)) {
                bootbox.alert("Invalid email format!", function () {
                    $('#HFM_email').val("");
                    $('#HFM_email').focus();

                });
                return false;
            }

            var hfcCode = $('#HFM_hfcCode').val();
            var gotSpecialChar = /[!@#$%^&*()+=,?\/\\:;\"\' ]/.test(hfcCode);
            if (gotSpecialChar) {
                bootbox.alert("Health facility code must only contain alphanumeric characters!", function () {
                    $('#HFM_hfcCode').val('');
                    $('#HFM_hfcCode').focus();
                });
                return false;

            }

            var esDate = $('#HFM_establishedDate').val().trim();
            if (esDate !== "" && !isValidDate(esDate)) {
                bootbox.alert("Invalid date format! Please follow dd/mm/yyyy format", function () {
                    $('#HFM_establishedDate').val('');
                    $('#HFM_establishedDate').focus();
                });
                return false;
            }

            var ip = $('#HFM_IP').val().trim();
            if (ip !== "" && !ValidateIPaddress(ip)) {
                bootbox.alert("Invalid IP format", function () {
                    $('#HFM_IP').val('');
                    $('#HFM_IP').focus();
                });
                return false;
            }

            return true;
        }

        $('#HFM_btnAdd').on('click', function () {

            if (!validateHfcInput()) {
                return;
            }

            var hfcName = $('#HFM_hfcName').val();
            var hfcCode = $('#HFM_hfcCode').val();
            var address1 = $('#HFM_address1').val();
            var address2 = $('#HFM_address2').val();
            var address3 = $('#HFM_address3').val();
            var state = $('#HFM_state').val();
            var district = $('#HFM_district').val();
            var town = $('#HFM_town').val();
            var postcode = $('#HFM_postcode').val();
            var faxNo = $('#HFM_faxNo').val();
            var telNo = $('#HFM_telNo').val();
            var email = $('#HFM_email').val();
            var contactPerson = $('#HFM_contactPerson').val();
            var IP_NO = $('#HFM_IP').val();
            var server = $('#HFM_server').val();
            var category = $('#HFM_category').val();
            var tenant = $('#HFM_tenant').val();
            var type = $('#HFM_type').val();
            var subtype = $('#HFM_subtype').val();
            var director = $('#HFM_director').val();
            var status = $('#HFM_status').val();
            var establishDate = $('#HFM_establishedDate').val();



            hfcName = hfcName.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            address1 = address1.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            address2 = address2.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            address3 = address3.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            contactPerson = contactPerson.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            director = director.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

            createScreenLoading();

            var data = {
                hfcName: hfcName,
                hfcCode: hfcCode,
                address1: address1,
                address2: address2,
                address3: address3,
                state: state,
                district: district,
                town: town,
                postcode: postcode,
                faxNo: faxNo,
                telNo: telNo,
                email: email,
                contactPerson: contactPerson,
                IP_NO: IP_NO,
                server: server,
                category: category,
                type: type,
                subtype: subtype,
                director: director,
                establishDate: establishDate,
                logo: gambarURI
            };

            $.ajax({
                url: "home/hfc_insert.jsp",
                type: "post",
                data: data,
                timeout: 60000,
                dataType: 'json',
                success: function (datas) {

                    bootbox.alert(datas.msg);
                    if (datas.isValid) {
                        $('#HFM_detail').modal('hide');
                        $('#hfcTableDiv').load('home/hfc_table.jsp');
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }

            });


        });


        $('#HFM_state').on('change', function () {
            var code = $('#HFM_state').val();
            $('#HFM_town').html('<option  value="0" >-- Select the town --</option>');
            if (code !== '0') {

                var dataFields = {code: code, process: "district"};

                $.ajax({
                    type: "POST",
                    url: "../SystemAdmin/HFM_result.jsp",
                    data: dataFields,
                    timeout: 5000,
                    success: function (data) {
                        $('#HFM_district').html(data);
                    },
                    error: function (err) {
                        console.log("Ajax error");
                    }
                });
            } else {
                $('#HFM_district').html('<option  value="0" >-- Select the district --</option>');
            }
        });


        $('#HFM_district').on('change', function () {

            var code = $('#HFM_district').val();
            if (code !== '0') {

                if (code === '00') {
                    var front = $('#HFM_state').val();
                    code = front + '00';
                }

                var dataFields = {code: code, process: "town"};

                $.ajax({
                    type: "POST",
                    url: "../SystemAdmin/HFM_result.jsp",
                    data: dataFields,
                    timeout: 5000,
                    success: function (data) {
                        $('#HFM_town').html(data);
                    },
                    error: function (err) {
                        console.log("Ajax error");
                    }
                });
            } else {
                $('#HFM_town').html('<option  value="0" >-- Select the town --</option>');
            }

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

        initFlexData("HFM_postcode", "HFM_postcodeMatch", "control/getDetailFlexList.jsp", "0079");

//        $('#hfcTableDiv').on('click', '#HFT_btnLogoModal', function(){
//            $('#HFM_detail').modal('show');
//            $('.form-group').hide();
//            $('.hide_show').hide();
//            $('.logo_div').show();
//            $('#HFM_LogoDiv').show();
//        });

        $('#hfcTableDiv').on('click', '#HFT_btnActivate', function () {
            var arrData = $(this).closest('td').find("#HFT_hidden").val().split("|");
            var hfc_cd = arrData[0];
            var hfc_name = arrData[2];
            var ask = "Are you sure you want to activate (" + hfc_cd + ") " + hfc_name + "?";
            activateHFC(ask, hfc_cd, "0");
        });

        $('#hfcTableDiv').on('click', '#HFT_btnDeactivate', function () {
            var arrData = $(this).closest('td').find("#HFT_hidden").val().split("|");
            var hfc_cd = arrData[0];
            var hfc_name = arrData[2];
            var ask = "Are you sure you want to deactivate (" + hfc_cd + ") " + hfc_name + "?";
            activateHFC(ask, hfc_cd, "1");
        });


        function activateHFC(ask, hfc_cd, status) {
            bootbox.confirm({
                message: ask,
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
                        createScreenLoading();
                        var input = {
                            hfc_cd: hfc_cd,
                            status: status
                        };
                        $.ajax({
                            type: 'POST',
                            data: input,
                            dataType: 'json',
                            url: "home/hfc_activate.jsp",
                            timeout: 60000,
                            success: function (data, textStatus, jqXHR) {
                                bootbox.alert(data.msg);
                                if (data.isValid) {
                                    $('#hfcTableDiv').load("home/hfc_table.jsp");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("Error: " + errorThrown);
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }
                        });
                    }
                }
            });

        }

        destroyScreenLoading();


        function disabledTemporary(obj) {
            $(obj).prop('disabled', true);
            setTimeout(function () {
                $(obj).prop('disabled', false);
            }, 60000);
        }

        $('#hfcTableDiv').on('click', '#HFT_btnResendEmail', function () {
            var arrData = $(this).closest('td').find("#HFT_hidden").val().split("|");
            var hfc_cd = arrData[0];
            var hfc_name = arrData[2];

            var leObj = this;

            bootbox.confirm({
                message: "Are you sure you wan to resend the Admin ID for (" + hfc_cd + ") " + hfc_name + "?",
                buttons: {
                    confirm: {
                        label: 'Send please',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'Cancel',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if (result) {
                        createScreenLoading();
                        var input = {
                            hfc_cd: hfc_cd,
                            hfc_name: hfc_name
                        };
                        $.ajax({
                            type: 'POST',
                            data: input,
                            dataType: 'json',
                            url: "home/resendEmail.jsp",
                            timeout: 60000,
                            success: function (data, textStatus, jqXHR) {
                                bootbox.alert(data.msg);
                                if (data.isValid) {
                                    disabledTemporary(leObj);
                                }
                                if (!data.hasLookup) {
                                    ajaxCopyLookup(input);
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log("Error: " + errorThrown);
                            },
                            complete: function (jqXHR, textStatus) {
                                destroyScreenLoading();
                            }
                        });
                    }
                }
            });


        });

        function ajaxCopyLookup(input) {
            $.ajax({
                type: 'POST',
                data: input,
                dataType: 'json',
                url: "home/copyLookupDetail.jsp",
                timeout: 60000,
                success: function (data, textStatus, jqXHR) {
                   console.log(data.msg);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + errorThrown);
                }
            });
        }


    });//end ready


</script>


