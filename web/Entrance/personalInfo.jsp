<%-- 
    Document   : personalInfo
    Created on : Mar 2, 2017, 10:15:38 AM
    Author     : user
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();

    String userID = session.getAttribute("USER_ID").toString();

    //                          0       1              2            3                                      4            5          6            7           8           9           10        11              12                13              14              
    String query = "SELECT  room_no, hfc_name, oc.description, DATE_FORMAT(birth_date,'%d/%m/%Y'), sx.description, new_icno, home_phone, office_phone, mobile_phone, a.fax_no, a.email, id_category_code, tit.description, nat.description, mother_name "
            + "FROM adm_users a join adm_health_facility b on health_facility_code = hfc_cd "
            + "join adm_lookup_detail oc on oc.detail_reference_code = occupation_code and oc.master_reference_code = '0050' "
            + "join adm_lookup_detail sx on sx.detail_reference_code = sex_code and sx.master_reference_code = '0041' "
            + "join adm_lookup_detail tit on tit.detail_reference_code = title and tit.master_reference_code = '0026' "
            + "join adm_lookup_detail nat on nat.detail_reference_code = nationality_code and nat.master_reference_code = '0011'"
            + " WHERE user_id = '" + userID + "'";

    ArrayList<ArrayList<String>> personalData = conn.getData(query);


%>

<form class="form-horizontal" autocomplete="off">

    <div class="col-md-12"> <!-- start of user id information -->

        <input id="PI_hidden" type="hidden" value="<%= String.join("|", personalData.get(0))%>">

        <div class="row">
            <br/><h4>User ID Information</h4><br/>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">User ID</label>
                    <div class="col-md-8">
                        <input id="PI_userID" value="<%= session.getAttribute("USER_ID").toString()%>"  type="text" class="form-control input-md" readonly>
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Room No</label>
                    <div class="col-md-8">
                        <input id="PI_roomNo"  type="text"  class="form-control input-md" readonly>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Health Facility</label>
                    <div class="col-md-8">
                        <input id="PI_hfc"  type="text" class="form-control input-md" readonly>

                    </div>
                </div>
            </div>

        </div>



    </div> <!-- end of user id information -->

    <div class="col-md-12">

        <div class="row">
            <hr/><h4>Basic Personal Information</h4><br/>


            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Name</label>
                    <div class="col-md-8">
                        <input id="PI_name" type="text" value="<%=session.getAttribute("USER_NAME").toString()%>" class="form-control input-md" readonly>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Title</label>
                    <div class="col-md-8">
                        <input id="PI_title" type="text" class="form-control input-md" readonly>
                    </div>
                </div>
            </div>

        </div> <!--end of first row--> 

        <div class="row"> <!--start second row-->

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">IC/ID No</label>
                    <div class="col-md-8">
                        <input id="PI_icno"  type="text" class="form-control input-md" readonly>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Email *</label>
                    <div class="col-md-8">
                        <input id="PI_email"  type="text" placeholder=" Insert email. Example: staff.email@example.com" class="form-control input-md" maxlength="100">
                    </div>
                </div>
            </div>

        </div> <!--end second row-->

    </div> <!--end basic info-->



    <div class="col-md-12"> <!-- start of detail information -->

        <div class="row">
            <hr/><h4>Detail Information</h4><br/>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Date of Birth</label>
                    <div class="col-md-8">
                        <input id="PI_dob"  type="text" class="form-control input-md" readonly>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Gender</label>
                    <div class="col-md-8">
                        <input id="PI_gender"  type="text" class="form-control input-md" readonly>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Occupation</label>
                    <div class="col-md-8">
                        <input id="PI_occupation"  type="text" class="form-control input-md" readonly>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Nationality</label>
                    <div class="col-md-8">
                        <input id="PI_nationality"  type="text" class="form-control input-md" readonly>
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
                        <input id="PI_mobile"  type="text" placeholder="Insert Mobile phone number" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Home Tel No</label>
                    <div class="col-md-8">
                        <input id="PI_homeTel"  type="text" placeholder="Insert Home telephone number (Optional)" class="form-control input-md" maxlength="30">
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
                        <input id="PI_officeTel"  type="text" placeholder="Insert Office telephone (Optional)" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Fax No</label>
                    <div class="col-md-8">
                        <input id="PI_fax"  type="text" placeholder="Insert Fax number (Optional)" class="form-control input-md" maxlength="30">
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-6">
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Mother's name</label>
                    <div class="col-md-8">
                        <input id="PI_mother"  type="text" class="form-control input-md" readonly>
                    </div>
                </div>
            </div>

        </div>


    </div> <!-- end of detail information -->

</form>
<div class="col-md-12">
    <br/>
    <div class="text-center">
        <button id="PI_btnChange" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Save</button>
        <button id="PI_btnCancel"  class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Cancel</button>
    </div>
</div>
<script src="../SystemAdmin/libraries/validator.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        disableButton();
        setTextField();
    });

    function setTextField() {

        var longString = $('#PI_hidden').val();
        var arrayData = longString.split("|");


        var hfc = arrayData[1], roomNo = arrayData[0], title = arrayData[12], icNo = arrayData[5], email = arrayData[10], dob = arrayData[3], gender = arrayData[4], occupation = arrayData[2], nationality = arrayData[13], mobileNo = arrayData[8], homeTel = arrayData[6], officeTel = arrayData[7], faxNo = arrayData[9], mother = arrayData[14];

        $('#PI_roomNo').val(roomNo);
        $('#PI_hfc').val(hfc);
        $('#PI_title').val(title);
        $('#PI_icno').val(icNo);
        $('#PI_email').val(email);
        $('#PI_dob').val(dob);
        $('#PI_gender').val(gender);
        $('#PI_occupation').val(occupation);
        $('#PI_nationality').val(nationality);
        $('#PI_mobile').val(mobileNo);
        $('#PI_fax').val(faxNo);
        $('#PI_officeTel').val(officeTel);
        $('#PI_homeTel').val(homeTel);
        $('#PI_mother').val(mother);
    }

    $("input[type='text']").change(function () {
        enableButton();
    });

    $('#PI_btnCancel').on('click', function () {
        disableButton();
        setTextField();
    });

    function enableButton() {
        $("#PI_btnChange").removeClass("disabled");
        $("#PI_btnCancel").removeClass("disabled");
        $("#PI_btnChange").prop('disabled', false);
        $("#PI_btnCancel").prop('disabled', false);
    }

    function disableButton() {
        $("#PI_btnChange").addClass("disabled");
        $("#PI_btnCancel").addClass("disabled");
        $("#PI_btnChange").prop('disabled', true);
        $("#PI_btnCancel").prop('disabled', true);
    }

    $('#PI_btnChange').on('click', function () {

        var email, mobile, home, office, fax;

        mobile = $('#PI_mobile').val();
        fax = $('#PI_fax').val();
        office = $('#PI_officeTel').val();
        home = $('#PI_homeTel').val();
        email = $('#PI_email').val();

        if (mobile === "") {
            bootbox.alert("Fill in the mobile phone number");

        } else if (email === "") {
            bootbox.alert("Fill in the email");

        } else if (validatePhonenumber(mobile) === false) {
            bootbox.alert("Invalid mobile phone number. Only numbers and +, - signs are allowed.");
            $('#PI_mobile').val("");

        } else if (ValidateEmail(email) === false) {
            bootbox.alert("Invalid email address");
            $('#PI_email').val("");

        } else if (fax !== "" && validatePhonenumber(fax) === false) {
            bootbox.alert("Invalid fax number. Only numbers and +, - signs are allowed.");
            $('#PI_fax').val("");

        } else if (office !== "" && validatePhonenumber(office) === false) {
            bootbox.alert("Invalid offiece telephone number. Only numbers and +, - signs are allowed.");
            $('#PI_officeTel').val("");

        } else if (home !== "" && validatePhonenumber(home) === false) {
            bootbox.alert("Invalid home telephone number. Only numbers and +, - signs are allowed.");
            $('#PI_homeTel').val("");

        } else {
            var data = {
                email: email,
                mobile: mobile,
                home: home,
                office: office,
                fax: fax
            };

            $.ajax({
                type: 'POST',
                url: "profile_update.jsp",
                data: data,
                success: function (data) {

                    if (data.trim() === "success") {
                        bootbox.alert("Your profile information is updated");
                        $('#personalInfo').load("personalInfo.jsp");

                    } else {
                        bootbox.alert("Opps! Something went wrong");
                        disableButton();
                        setTextField();
                    }

                }
            });



        }


    });

</script>