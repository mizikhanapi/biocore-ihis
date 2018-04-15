<%-- 
    Document   : personalInfo
    Created on : Apr 16, 2018, 2:14:21 AM
    Author     : user
--%>

<%@page import="ADM_helper.LookupHelper"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);
    //                          0       1           2               3                   4                   5                           6
    String query = "SELECT `USER_NAME`, `EMAIL`, `MOBILE_PHONE`, `NATIONALITY_CODE`, `NEW_ICNO`, Date_format(birth_date, '%d/%m/%Y'),`SEX_CODE` FROM adm_users WHERE `USER_ID`='" + user_id + "' limit 1;";
    Conn con = new Conn();
    ArrayList<ArrayList<String>> arrData = con.getData(query);

    LookupHelper lh = new LookupHelper("99_iHIS_99");
    String nationality = lh.getLookupDetailDescription("0001", arrData.get(0).get(3));

    String gender = "";
    switch (arrData.get(0).get(6)) {
        case "001":
            gender = "Male";
            break;
        case "002":
            gender = "Female";
            break;
        default:
            gender = "Other";
    }

%>
<div class="main" style="width: 75%; margin: auto; background: #f2f4f8;">
    <form class="form-horizontal" role="form" id="personalForm">
        <div class="form-group">

            <label for="regName" class="col-sm-3 control-label">
                Name:
            </label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="regName" maxlength="180" placeholder="Enter your full name" readonly value="<%=arrData.get(0).get(0)%>"/>
            </div>
        </div>
        <div class="form-group">

            <label for="regIC" class="col-sm-3 control-label">
                Identity Card/ Passport No:
            </label>
            <div class="col-sm-9">
                <input type="text" class="form-control code-input" id="regIC" maxlength="30" placeholder="Enter your identity card or passport number" readonly value="<%=arrData.get(0).get(4)%>"/>
            </div>
        </div>
        <div class="form-group">

            <label for="regDOB" class="col-sm-3 control-label">
                Date of Birth:
            </label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="regDOB" readonly placeholder="Click to pop-up calendar" value="<%=arrData.get(0).get(5)%>"/>
            </div>
        </div>
        <div class="form-group">

            <label for="regSex" class="col-sm-3 control-label">
                Gender:
            </label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="regSex" readonly value="<%=gender%>"/>
            </div>
        </div>
        <div class="form-group">

            <label for="regCountry" class="col-sm-3 control-label">
                Country of Origin:
            </label>
            <div class="col-sm-9">
                <input type="text" class="form-control" id="regCountry" required readonly value="<%=nationality%>"/>
                <div id="regCountryMatch" class="search-drop">
                    <!--search result-->
                </div>
            </div>
        </div>
        <div class="form-group">

            <label for="regPhone" class="col-sm-3 control-label">
                Mobile Phone no*:
            </label>
            <div class="col-sm-9">
                <input type="tel" class="form-control" id="regPhone" placeholder="Enter your mobile phone number" maxlength="30" required autocomplete="tel" value="<%=arrData.get(0).get(2)%>"/>
            </div>
        </div>
        <div class="form-group">

            <label for="regEmail" class="col-sm-3 control-label">
                Email*:
            </label>
            <div class="col-sm-9">
                <input type="email" class="form-control" id="regEmail" placeholder="Enter your email address" maxlength="100" required autocomplete="email" value="<%=arrData.get(0).get(1)%>"/>
            </div>
        </div>

    </form>
    <input type="hidden" id="regEmailHid" value="<%=arrData.get(0).get(1)%>"/>
    <input type="hidden" id="regPhoneHid" value="<%=arrData.get(0).get(2)%>"/>
    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-4">

            <button class="btn btn-success" id="btnSave">
                <i class="fa fa-floppy-o" aria-hidden="true"></i> Save
            </button>

            <button class="btn btn-default" id="btnReset">
                Reset
            </button>
        </div>
    </div>

</div>
<script>
    $(function () {
        $('#btnReset').on('click', function () {
            $('#regEmail').val($('#regEmailHid').val());
            $('#regPhone').val($('#regPhoneHid').val());
        });

        $('#btnSave').on('click', function () {
            var email = $('#regEmail').val();
            var phone = $('#regPhone').val();

            if (email === "" || !ValidateEmail(email)) {
                bootbox.alert("Please fill in email with valid email format.");
                return;
            }

            if (phone === "" || !validatePhonenumber(phone)) {
                bootbox.alert("Please fill in phone number with valid format. Only numbers.");
                return;
            }

            var input = {
                email: email,
                phone: phone
            };

            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: input,
                dataType: 'json',
                url: "personal/personal_update.jsp",
                success: function (data, textStatus, jqXHR) {
                    bootbox.alert(data.msg);
                    if(data.isValid){
                        $('#regEmailHid').val(email);
                        $('#regPhoneHid').val(phone);
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error: "+errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        });
    });//end ready
</script>