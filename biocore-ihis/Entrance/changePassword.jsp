<%-- 
    Document   : changePassword
    Created on : Mar 2, 2017, 10:32:45 AM
    Author     : user
--%>

<h4 class="text-center">Password:</h4>
<form class="form-horizontal" autocomplete="off" style="width: 50%; margin: 0 auto" id="C_form">

    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">Old password</label>
        <div class="col-md-4">
            <input type="password"  class="form-control" id="oldPassword" maxlength="10">

        </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">New Password</label>
        <div class="col-md-4">
            <input type="password"  class="form-control" id="newPassword"  maxlength="10">

        </div>
    </div>

    <!-- Text input-->
    <div class="form-group">
        <label class="col-md-4 control-label" for="textinput">Retype Password</label>
        <div class="col-md-4">
            <input type="password"  class="form-control" id="newPassword2" maxlength="10">

        </div>
    </div>


</form>
<div class="col-md-12">
    <br/>
    <div class="text-center">
        <button id="btnChange" name="button1id" class="btn btn-success"><i class="fa fa-floppy-o fa-lg"></i>&nbsp; Change</button>
        <button id="btnClear" name="button2id" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
    </div>
</div>
<!--<div class="btn-group btn-group-justified center-block" role="group" aria-label="group button" style="width: 35%; padding-top: 2%">
    <div class="btn-group" role="group" >
        <button class="btn btn-success btn-block btn-lg" id="btnChange">Change</button>

    </div>
    <div class="btn-group" role="group">
        <button   class="btn btn-default btn-block btn-lg" id="btnClear">Clear</button>
    </div>
</div>-->

<script type="text/javascript">

    $('#btnClear').on('click', function () {
        document.getElementById("C_form").reset();
    });

    $('#btnChange').on('click', function () {
        var oldPassword = $('#oldPassword').val();
        var newPassword = $('#newPassword').val();
        var newPassword2 = $('#newPassword2').val();

        if (oldPassword === "") {
            bootbox.alert("Please fill in your old password");

        } else if (newPassword === "") {
            bootbox.alert("Please fill in your new password");

        } else if (newPassword2 === "") {
            bootbox.alert("Please retype your new password");

        } else if (newPassword2 !== newPassword) {
            bootbox.alert("The new password and retype password do not match");
            $('#newPassword').val("");
            $('#newPassword2').val("");

        } else if (newPassword === oldPassword) {
            bootbox.alert("New password must not be the same as old password");
            $('#newPassword').val("");
            $('#newPassword2').val("");

        } else {

            var data = {newPassword: newPassword, oldPassword: oldPassword};

            $.ajax({
                type: 'POST',
                data: data,
                url: "changePassword_process.jsp",
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === "success") {

                        bootbox.alert("Your password is successfully changed", function () {
                            window.location = "destroySession.jsp";
                        });

                    } else if (data.trim() === "fail") {

                        bootbox.alert("Update fail");

                    } else {

                        bootbox.alert(data.trim());
                        $('#newPassword').val("");
                        $('#newPassword2').val("");
                        $('#oldPassword').val("");

                    }



                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Something went wrong. Try again later");
                }
            });

        }

    });

</script>
