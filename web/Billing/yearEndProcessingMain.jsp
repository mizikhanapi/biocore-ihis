<%-- 
    Document   : yearEndProcessingMain
    Created on : Nov 20, 2017, 2:05:04 PM
    Author     : Shammugam
--%>
<div>
    <h2>Year End Processing</h2>

    <div class="col-md-12" style="padding-top: 50px;padding-bottom: 20px;">
        <div id="backup" class="progress">
            <div id="backupPB" class="progress-bar">
                <div id="percentBackup"></div>
            </div>
        </div>
        <button id="yearEndProcessBackupBtn" type="submit" class="btn btn-info btn-lg btn-block" > <i class="fa fa-refresh fa-lg" aria-hidden="true"></i> &nbsp; Backup Customer Data</button><br>
    </div>

    <div class="col-md-12" style="padding-top: 20px;padding-bottom: 20px;">
        <div id="process" class="progress">
            <div id="processPB" class="progress-bar">
                <div id="percentProcess"></div>
            </div>
        </div>
        <button id="yearEndProcessProcessBtn" type="submit" class="btn btn-info btn-lg btn-block" disabled> <i class="fa fa-spinner fa-lg" aria-hidden="true"></i>  &nbsp; Start Year End Processing</button><br>
    </div>

    <div class="col-md-12" style="padding-top: 20px;padding-bottom: 50px;">
        <div id="restore" class="progress">
            <div id="restorePB" class="progress-bar">
                <div id="percentRestore"></div>
            </div>
        </div>
        <button id="yearEndProcessRestoreBtn" type="submit" class="btn btn-info btn-lg btn-block" disabled> <i class="fa fa-repeat fa-lg" aria-hidden="true"></i> &nbsp; Restore Customer Data</button><br>
    </div>
</div>

<script>

    $(document).ready(function () {


        // Back Up Data Function Start
        $('#yearEndProcessingMainDIV').on('click', '#yearEndProcessingMain #yearEndProcessBackupBtn', function (e) {


            var date = new Date();

            var month = ("0" + (date.getMonth() + 1)).slice(-2);

            var monthLength = month.length;

            if (monthLength !== 2) {
                month = "0" + month;
            }

            bootbox.confirm({
                message: "Are you sure want to backup the billing data ?",
                title: "Backup Data ?",
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

                    if (result === true) {


                        $.ajax({
                            url: "controllerProcessYearEndProcess/yearEndProcessingBackUp.jsp",
                            type: "post",
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                var d = datas.split("|");

                                if (d[1] === '1') {

                                    var elem = document.getElementById('backupPB');
                                    var width = 0;
                                    var id = setInterval(frame, 100);
                                    var status = d[3];

                                    function frame() {

                                        console.log("In Frame");

                                        if (width >= status) {

                                            clearInterval(id);

                                            document.getElementById('messageHeader').innerHTML = "Success!";
                                            document.getElementById('messageContent').innerHTML = d[2];
                                            $("#alertMessage").modal();

                                            if (month === "11" || month === "12" || month === "01") {

                                                $('#yearEndProcessProcessBtn').prop('disabled', false);

                                            }

                                        } else {

                                            width++;
                                            elem.style.width = width + '%';
                                            document.getElementById('percentBackup').innerHTML = width * 1 + '%';

                                        }

                                    }

                                } else {

                                    document.getElementById('messageHeader').innerHTML = "Failed!";
                                    document.getElementById('messageContent').innerHTML = d[2];
                                    $("#alertMessage").modal();

                                }

                            },
                            error: function (err) {
                                alert("Error! Deletion Ajax failed!!");
                            }

                        });

                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

        });
        // Back Up Data Function End


        // Start End Processing Function Start
        $('#yearEndProcessingMainDIV').on('click', '#yearEndProcessingMain #yearEndProcessProcessBtn', function (e) {


            var date = new Date();

            var month = ("0" + (date.getMonth() + 1)).slice(-2);

            var monthLength = month.length;

            if (monthLength !== 2) {
                month = "0" + month;
            }

            bootbox.confirm({
                message: "Are you sure want to start year end processing ?",
                title: "Start Year End Processing ?",
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

                    if (result === true) {


                        $.ajax({
                            url: "controllerProcessYearEndProcess/yearEndProcessingStartYearEndProcessing.jsp",
                            type: "post",
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                var d = datas.split("|");

                                if (d[1] === '1') {

                                    var elem = document.getElementById('processPB');
                                    var width = 0;
                                    var id = setInterval(frame, 100);
                                    var status = d[3];

                                    function frame() {

                                        console.log("In Frame");

                                        if (width >= status) {

                                            clearInterval(id);

                                            document.getElementById('messageHeader').innerHTML = "Success!";
                                            document.getElementById('messageContent').innerHTML = d[2];
                                            $("#alertMessage").modal();

                                        } else {

                                            width++;
                                            elem.style.width = width + '%';
                                            document.getElementById('percentProcess').innerHTML = width * 1 + '%';

                                        }

                                    }

                                } else {

                                    document.getElementById('messageHeader').innerHTML = "Failed!";
                                    document.getElementById('messageContent').innerHTML = d[2];
                                    $("#alertMessage").modal();
                                    $('#btnRestore').prop('disabled', false);

                                }
                            },
                            error: function (err) {

                                document.getElementById('messageHeader').innerHTML = "Error!";
                                document.getElementById('messageContent').innerHTML = "Processing failed.";
                                $("#alertMessage").modal();

                            }

                        });

                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

        });
        // Start End Processing Function End


        // Restore Customer Data Function Start
        $('#yearEndProcessingMainDIV').on('click', '#yearEndProcessingMain #yearEndProcessRestoreBtn', function (e) {


            var date = new Date();

            var month = ("0" + (date.getMonth() + 1)).slice(-2);

            var monthLength = month.length;

            if (monthLength !== 2) {
                month = "0" + month;
            }

            bootbox.confirm({
                message: "Are you sure want to restore customer data ?",
                title: "Restore Customer Data ?",
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

                    if (result === true) {


                        $.ajax({
                            url: "controllerProcessYearEndProcess/yearEndProcessingRestoreCustomerData.jsp",
                            type: "post",
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                var d = datas.split("|");

                                if (d[1] === '1') {

                                    var elem = document.getElementById('restorePB');
                                    var width = 0;
                                    var id = setInterval(frame, 100);
                                    var status = d[3];

                                    function frame() {

                                        console.log("In Frame");

                                        if (width >= status) {

                                            clearInterval(id);

                                            document.getElementById('messageHeader').innerHTML = "Success!";
                                            document.getElementById('messageContent').innerHTML = d[2];
                                            $("#alertMessage").modal();

                                            $('#btnProcess').prop('disabled', false);

                                        } else {

                                            width++;
                                            elem.style.width = width + '%';
                                            document.getElementById('percentRestore').innerHTML = width * 1 + '%';

                                        }

                                    }

                                } else {

                                    document.getElementById('messageHeader').innerHTML = "Failed!";
                                    document.getElementById('messageContent').innerHTML = d[2];
                                    $("#alertMessage").modal();

                                }
                            },
                            error: function (err) {

                                document.getElementById('messageHeader').innerHTML = "Error!";
                                document.getElementById('messageContent').innerHTML = "Processing failed.";
                                $("#alertMessage").modal();

                            }

                        });

                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

        });
        // Restore Customer Data Function End


    });

</script>