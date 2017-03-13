<%-- 
    Document   : user_main
    Created on : Feb 16, 2017, 3:17:16 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<% Conn conn = new Conn();%>
<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    USER MANAGEMENT
    <span class="pull-right">
        <button id="UM_btnAddNew" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#UM_detail" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD User</button>
    </span>
</h4>
<!-- Add Button End -->


<!-- Add Modal Start -->
<div class="modal fade" id="UM_detail" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 50%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add New User</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="UM_form">

                    <div class="col-md-12">

                        <div class="row">
                            <br/><h4>Basic Personal Information</h4><br/>


                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Name *</label>
                                    <div class="col-md-8">
                                        <input id="UM_name" type="text" placeholder="Insert Staff Name" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Title *</label>
                                    <div class="col-md-8">
                                        <select id="UM_title" class="form-control input-md">
                                            <option value="">-- Select title --</option>
                                            <%
                                                String sqlTitle = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0026'";
                                                ArrayList<ArrayList<String>> dataTitle = conn.getData(sqlTitle);

                                                for (int i = 0; i < dataTitle.size(); i++) {

                                            %><option value="<%=dataTitle.get(i).get(0)%>"><%=dataTitle.get(i).get(1)%></option><%
                                                }
                                            %>

                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div> <!--end of first row--> 

                        <div class="row"> <!--start second row-->

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">IC/ID No *</label>
                                    <div class="col-md-8">
                                        <input id="UM_icno"  type="text" placeholder="Insert Staff IC or ID Number" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Email *</label>
                                    <div class="col-md-8">
                                        <input id="UM_email"  type="text" placeholder="Insert email" class="form-control input-md" maxlength="100">
                                    </div>
                                </div>
                            </div>

                        </div> <!--end second row-->

                    </div> <!--end basic info-->

                    <div class="col-md-12"> <!-- start of user id information -->


                        <div class="row">
                            <hr/><h4>User ID Information</h4><br/>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User ID *</label>
                                    <div class="col-md-8">
                                        <input id="UM_userID"  type="text" placeholder="Insert User ID" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Health Facility *</label>
                                    <div class="col-md-8">
                                        <input id="UM_hfc"  type="text" placeholder="Search Health Facility" class="form-control input-md">
                                        <div id="UM_hfc_match">
                                            <!--search result-->
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Password *</label>
                                    <div class="col-md-8">
                                        <input id="UM_password"  type="password" placeholder=" Type your Password" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Retype Password *</label>
                                    <div class="col-md-8">
                                        <input id="UM_password2"  type="password" placeholder="Confirm the Password" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Room No *</label>
                                    <div class="col-md-8">
                                        <input id="UM_roomNo"  type="text" placeholder="Insert staff room number" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div> <!-- end of user id information -->

                    <div class="col-md-12"> <!-- start of detail information -->

                        <div class="row">
                            <hr/><h4>Detail Information</h4><br/>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Date of Birth *</label>
                                    <div class="col-md-8">
                                        <input id="UM_dob"  type="text" placeholder="DD/MM/YYYY" class="form-control input-md" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Gender *</label>
                                    <div class="col-md-8">
                                        <select id="UM_gender" class="form-control input-md">
                                            <option value="">-- Select gender --</option>
                                            <%
                                                String sqlGender = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0041'";
                                                ArrayList<ArrayList<String>> dataGender = conn.getData(sqlGender);

                                                for (int i = 0; i < dataGender.size(); i++) {

                                            %><option value="<%=dataGender.get(i).get(0)%>"><%=dataGender.get(i).get(1)%></option><%
                                                }
                                            %>  
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Occupation *</label>
                                    <div class="col-md-8">
                                        <select id="UM_occupation" class="form-control input-md">
                                            <option value="">-- Select occupation --</option>  
                                            <%
                                                String sqlOccupation = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0050'";
                                                ArrayList<ArrayList<String>> dataOccupation = conn.getData(sqlOccupation);

                                                for (int i = 0; i < dataOccupation.size(); i++) {

                                            %><option value="<%=dataOccupation.get(i).get(0)%>"><%=dataOccupation.get(i).get(1)%></option><%
                                                }
                                            %>  
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Nationality *</label>
                                    <div class="col-md-8">
                                        <select id="UM_nationality" class="form-control input-md">
                                            <option value="">-- Select nationality --</option>  
                                            <%
                                                String sqlNationality = "Select detail_reference_code, description FROM adm_lookup_detail WHERE master_reference_code = '0011'";
                                                ArrayList<ArrayList<String>> dataNationality = conn.getData(sqlNationality);

                                                for (int i = 0; i < dataNationality.size(); i++) {

                                            %><option value="<%=dataNationality.get(i).get(0)%>"><%=dataNationality.get(i).get(1)%></option><%
                                                }
                                            %>  
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Office Tel No</label>
                                    <div class="col-md-8">
                                        <input id="UM_officeTel"  type="text" placeholder="Insert Office telephone (Optional)" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Home Tel No</label>
                                    <div class="col-md-8">
                                        <input id="UM_homeTel"  type="text" placeholder="Insert Home telephone number (Optional)" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Mobile Phone *</label>
                                    <div class="col-md-8">
                                        <input id="UM_mobile"  type="text" placeholder="Insert Mobile phone number" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Fax No</label>
                                    <div class="col-md-8">
                                        <input id="UM_fax"  type="text" placeholder="Insert Fax number (Optional)" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                        </div>


                    </div> <!-- end of detail information -->

                    <div class="col-md-12"> <!-- start of additional information -->

                        <div class="row">
                            <hr/><h4>Additional Information</h4><br/>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User ID Category</label>
                                    <div class="col-md-8">
                                        <input id="UM_userIDCategory" type="text" placeholder="Insert ID category (Optional)" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User Type</label>
                                    <div class="col-md-8">
                                        <input id="UM_userType"  type="text" placeholder="Insert user type(Optional)" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User Group</label>
                                    <div class="col-md-8">
                                        <input id="UM_userGroup" type="text" placeholder="Insert user group(Optional)" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User Classification</label>
                                    <div class="col-md-8">
                                        <input id="UM_userClass"  type="text" placeholder="Insert user classification(Optional)" class="form-control input-md" maxlength="10">
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Start Date *</label>
                                    <div class="col-md-8">
                                        <input id="UM_startDate" type="text" placeholder="DD/MM/YYYY"  class="form-control input-md" readonly>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">End Date *</label>
                                    <div class="col-md-8">
                                        <input id="UM_endDate"  type="text" placeholder="DD/MM/YYYY" class="form-control input-md" readonly>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">User ID Status *</label>
                                    <div class="col-md-8">
                                        <select id="UM_userIDStatus" class="form-control input-md">
                                            <option value="0">Active</option>
                                            <option value="1">Terminated</option>
                                            <option value="2">Suspended</option>
                                        </select>
                                    </div>
                                </div>                          
                            </div>

                            <div class="col-md-6">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">Mother's name *</label>
                                    <div class="col-md-8">
                                        <input id="UM_mother"  type="text" placeholder="Insert the staff mother's name" class="form-control input-md" maxlength="30">
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div> <!-- end of additional information -->

                    <div class="col-md-12"> <!-- start of user profile pic -->

                        <div class="row">
                            <hr/><h4>User Profile Picture</h4><br/>

                            <!-- Text input-->
                            <div class="form-group">

                                <div style="width: 50%; margin: 0 auto">
                                    <input class="form-control" id="inputFileToLoad" type="file" accept=".jpg, .png, .gif" >

                                </div>
                            </div>
                            <!-- Text input-->
                            <div class="form-group">

                                <div style="width: 50%; margin: 0 auto">
                                    <div id="dym">



                                    </div>

                                </div>
                            </div>

                        </div><hr/>
                    </div><!-- end of user profile pic -->

                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="UM_btnAdd">Add</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="reset" id="btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->                         
<!-- Add Part End -->

<script src="libraries/validator.js" type="text/javascript"></script>
<script>

    (function ($) {
        $.fn.checkFileType = function (options) {
            var defaults = {
                allowedExtensions: [],
                success: function () {},
                error: function () {}
            };
            options = $.extend(defaults, options);

            return this.each(function () {

                $(this).on('change', function () {
                    var value = $(this).val(),
                            file = value.toLowerCase(),
                            extension = file.substring(file.lastIndexOf('.') + 1);

                    if ($.inArray(extension, options.allowedExtensions) === -1) {
                        options.error();
                        $(this).focus();
                    } else {
                        options.success();

                    }

                });

            });
        };

    })(jQuery);

    var gambarURI = "";

    $('#inputFileToLoad').checkFileType({
        allowedExtensions: ['jpg', 'jpeg'],
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


    $(document).ready(function () {

        var isHFCselected = false;
        var selectedHFC = "";

        $('#UM_dob').datepicker({
            changeMonth: true,
            changeYear: true,
            maxDate: 0,
            dateFormat: 'dd/mm/yy'
        });

        $('#UM_startDate').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

        $('#UM_endDate').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

        function UM_reset() {
            document.getElementById("UM_form").reset();
        }

        $('#UM_btnAddNew').on('click', function () {

            UM_reset();
            $('#UM_endDate').datepicker('option', 'minDate', null);
            isHFCselected = false;
            selectedHFC = "";
            gambarURI = "";
            $('#dym').html("");
        });

        $('#btnReset').on('click', function () {
            UM_reset();
        });

        $('#UM_btnAdd').on('click', function () {

            var startDateX = $('#UM_startDate').datepicker('getDate');
            var endDateX = $('#UM_endDate').datepicker('getDate');

            var name = $('#UM_name').val();
            var title = $('#UM_title').val();
            var icNo = $('#UM_icno').val();
            var email = $('#UM_email').val();
            var userID = $('#UM_userID').val();
            var hfc = $('#UM_hfc').val();
            var password = $('#UM_password').val();
            var password2 = $('#UM_password2').val();
            var dob = $('#UM_dob').val();
            var gender = $('#UM_gender').val();
            var occupation = $('#UM_occupation').val();
            var nationality = $('#UM_nationality').val();
            var officeTel = $('#UM_officeTel').val();
            var homeTel = $('#UM_homeTel').val();
            var mobilePhone = $('#UM_mobile').val();
            var faxNo = $('#UM_fax').val();
            var userIDCategory = $('#UM_userIDCategory').val();
            var userType = $('#UM_userType').val();
            var userGroup = $('#UM_userGroup').val();
            var userClass = $('#UM_userClass').val();
            var startDate = $('#UM_startDate').val();
            var endDate = $('#UM_endDate').val();
            var userIDStatus = $('#UM_userIDStatus').val();
            var mother = $('#UM_mother').val();
            var roomNo = $('#UM_roomNo').val();

            $('#UM_detail').css('overflow', 'auto');

            if (name === "") {
                //$('#UM_detail').modal('hide');

                bootbox.alert("Fill in the staff name");

            } else if (title === "") {
                bootbox.alert("Select the title");

            } else if (icNo === "") {
                bootbox.alert("Fill in the staff IC/ID Number");

            } else if (email === "") {
                bootbox.alert("Fill in the staff email");

            } else if (userID === "") {
                bootbox.alert("Fill in the staff user ID");

            } else if (hfc === "") {
                bootbox.alert("Fill in the staff health facility");

            } else if (password === "" || password2 === "") {
                bootbox.alert("Fill in all password fields");

            } else if (dob === "") {
                bootbox.alert("Select the staff date of birth");

            } else if (gender === "") {
                bootbox.alert("Select the staff gender");

            } else if (occupation === "") {
                bootbox.alert("Select the staff occupation");

            } else if (nationality === "") {
                bootbox.alert("Select the staff nationality");

            } else if (mobilePhone === "") {
                bootbox.alert("Fill in the staff mobile phone number");

            } else if (startDate === "" || endDate === "") {
                bootbox.alert("Select the start date and end date of the staff");

            } else if (mother === "") {
                bootbox.alert("Insert the mother's name");

            } else if (roomNo === "") {
                bootbox.alert("Insert the staff room number");

            } else if (ValidateEmail(email) === false) {
                bootbox.alert("Invalid email address");
                $('#UM_email').val("");

            } else if (isHFCselected === false || selectedHFC !== hfc) {
                bootbox.alert("Choose existing health facility");
                $('#UM_hfc').val("");

            } else if (password.length < 5) {
                bootbox.alert("Password is too short. Password must have at least 6 characters");
                $('#UM_password').val("");
                $('#UM_password2').val("");

            } else if (password !== password2) {
                bootbox.alert("Password and password confirmation does not match");
                $('#UM_password').val("");
                $('#UM_password2').val("");

            } else if (officeTel !== "" && validatePhonenumber(officeTel) === false) {
                bootbox.alert("Invalid office telephone number. Only numbers and +, - signs are allowed.");
                $('#UM_officeTel').val("");

            } else if (faxNo !== "" && validatePhonenumber(faxNo) === false) {
                bootbox.alert("Invalid fax number. Only numbers and +, - signs are allowed.");
                $('#UM_fax').val("");

            } else if (homeTel !== "" && validatePhonenumber(homeTel) === false) {
                bootbox.alert("Invalid home telephone number. Only numbers and +, - signs are allowed.");
                $('#UM_homeTel').val("");

            } else if (validatePhonenumber(mobilePhone) === false) {
                bootbox.alert("Invalid mobile phone number. Only numbers and +, - signs are allowed.");
                $('#UM_mobile').val("");

            } else if (startDateX > endDateX) {
                bootbox.alert("End date must be later than start date");
                $('#UM_endDate').datepicker('option', 'minDate', startDateX);
                $('#UM_endDate').val("");

            } else {

                var array = hfc.split("|");
                hfc = array[0].trim();

                var data = {
                    name: name,
                    title: title,
                    icNo: icNo,
                    email: email,
                    userID: userID,
                    hfc: hfc,
                    password: password,
                    dob: dob,
                    gender: gender,
                    occupation: occupation,
                    nationality: nationality,
                    officeTel: officeTel,
                    homeTel: homeTel,
                    mobilePhone: mobilePhone,
                    faxNo: faxNo,
                    userIDCategory: userIDCategory,
                    userType: userType,
                    userGroup: userGroup,
                    userClass: userClass,
                    startDate: startDate,
                    endDate: endDate,
                    userIDStatus: userIDStatus,
                    mother: mother,
                    roomNo: roomNo,
                    picture: gambarURI
                };

                $.ajax({
                    url: "user_insert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#userTable').load('user_table.jsp');
                            $('#UM_detail').modal('hide');
                            bootbox.alert("New user is added");
                            UM_reset();
                            $('#dym').html("");
                            $('#inputFileToLoad').val("");
                            gambarURI = "";

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");
                            //$('#UM_detail').modal('hide');
                            UM_reset();

                        } else {
                            bootbox.alert(datas.trim());

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    }

                });
            }

        });

        $('#UM_hfc').on('keyup', function () {

            var input = $('#UM_hfc').val();

            if (input.length > 0) {

                var data = {input: input};

                $.ajax({
                    url: "UM_result.jsp",
                    type: 'POST',
                    data: data,
                    timeout: 10000,
                    success: function (data) {
                        $('#UM_hfc_match').html(data);
                        $('#UM_hfc_matchlist li').on('click', function () {

                            $('#UM_hfc').val($(this).text());
                            $('#UM_hfc_match').text('');
                            isHFCselected = true;
                            selectedHFC = $('#UM_hfc').val();

                        });
                    },
                    error: function () {
                        $('#UM_hfc_match').text('Problem!');
                    }

                });

            } else {
                $('#UM_hfc_match').text('');
            }

        });




    });



</script>

