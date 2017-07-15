<%-- 
    Document   : fluidBalance
    Created on : Jun 9, 2017, 5:22:58 PM
    Author     : user
--%>
<div id="fluidBalanceMain">
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control" id="fluidBalanceSelectAssessment">
                    <option selected="" disabled="">View by</option>
                    <option value="today">Today</option>
                    <option value="yesterday">Yesterday</option>
                    <option value="7day">7 Days</option>
                    <option value="30day">30 Days</option>
                    <option value="60day">60 Days</option>
                    <option value="custom">Select date</option>
                </select>
            </div>
        </div>
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="fluidBalanceSelectAssessmentStartEnd">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="fluidBalanceSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="email" class="form-control" id="fluidBalanceSelectAssessmentEnd" placeholder="15/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <button type="submit" class="btn btn-default" id="fluidBalanceSelectAssessmentStartEndBtn"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div id="tableFluidBalanceIntakeDiv">
                <h5>Intake</h5>
                <table class="table table-bordered" id="tableFluidBalanceIntakeTable" style="width: 100%">
                    <thead>
                        <tr>
                            <th rowspan="2">Date</th>
                            <th rowspan="2">Time</th>
                            <th colspan="2">Oral</th>
                            <th colspan="2">Intravenous</th>
                            <th colspan="2">Other (Specify)</th>
                            <th rowspan="2">Action</th>
                        </tr>
                        <tr>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Type</th>
                            <th>Amount</th>
                            <th>Type</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="9" align="center">No Record To Show<br>Please Select A History Assessment</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-6">
            <div id="tableFluidBalanceOutputDiv">
                <h5>Output</h5>
                <table class="table table-bordered" id="tableFluidBalanceOutputTable" style="width: 100%">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Urine</th>
                            <th>Vomitus</th>
                            <th>Gastric Suction</th>
                            <th>Other (Specify)</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="7" align="center">No Record To Show<br>Please Select A History Assessment</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<script>

    $(document).ready(function () {

        // Disabling Start And End Date
        $("#fluidBalanceSelectAssessmentStartEnd").hide();



// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //

        // Function For View Assement Select Start
        $('#fluidBalanceSelectAssessment').on('change', function () {

            $("#fluidBalanceSelectAssessmentStartEnd").hide();

            var patientName = $('#pName').text();
            var patientPMI = $('#pIC').text();
            var filterBy = $('#fluidBalanceSelectAssessment').val();
            var datas;
            var todayDate;

            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            var hh = enDate.getHours();
            var m = enDate.getMinutes();
            var ss = enDate.getSeconds();
            var ms = enDate.getMilliseconds();

            todayDate = yy + "-" + mm + "-" + dd;

            if (patientName === "-") {
                bootbox.alert("You need to select the patient !!!");
                $('#fluidBalanceSelectAssessment').prop('selectedIndex', 0);
            } else if (filterBy === "custom") {
                $("#fluidBalanceSelectAssessmentStartEnd").show();
            } else {

                if (filterBy === "") {
                    bootbox.alert("Please Choose Correct Assessment");
                } else if (filterBy === "today") {
                    //  $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|today";
                } else if (filterBy === "yesterday") {
                    //  $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|yesterday";
                } else if (filterBy === "7day") {
                    // $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|7day";
                } else if (filterBy === "30day") {
                    //  $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|30day";
                } else if (filterBy === "60day") {
                    //  $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|60day";
                }

                FluidBalanceTableFiter(datas);

            }

        });

        $("#fluidBalanceSelectAssessmentStartEndBtn").on('click', function () {

            var patientPMI = $('#pIC').text();
            var strtDate = $('#fluidBalanceSelectAssessmentStart').val();
            var endDate = $('#fluidBalanceSelectAssessmentEnd').val();

            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

            var data2 = patientPMI + "|" + SnewDate + "^" + EnewDate + "|custom";

            FluidBalanceTableFiter(data2);

        });
        // Function For View Assement Select End



        // Function For View Assement Select For Add Update Delete Start
        function FluidBalanceTableFiterAUD() {

            var patientPMI = $('#pIC').text();
            var filterBy = $('#fluidBalanceSelectAssessment').val();
            var selected = $("#fluidBalanceSelectAssessment option:selected").text();
            var datas;
            var todayDate;

            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();

            todayDate = yy + "-" + mm + "-" + dd;

            if (selected === "View by") {

                resetTableFluidBalance();

            } else if (selected === "Select date") {

                var strtDate = $('#fluidBalanceSelectAssessmentStart').val();
                var endDate = $('#fluidBalanceSelectAssessmentEnd').val();
                var sDate = strtDate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
                var eDate = endDate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                datas = patientPMI + "|" + SnewDate + "^" + EnewDate + "|" + filterBy;

                FluidBalanceTableFiter(datas);

            } else {

                datas = patientPMI + "|" + todayDate + "|" + filterBy;
                FluidBalanceTableFiter(datas);

            }

        }
        // Function For View Assement Select For Add Update Delete End



        // Function for Table Start 
        function FluidBalanceTableFiter(viewData) {

            var data = {
                dataString: viewData,
                methodName: "view"
            };

            $.ajax({
                url: "../Ortho-NursingInWard/controller/FluidBalanceFunction.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    var arrayData = datas.split("<ShammugamRamasamySeperator></ShammugamRamasamySeperator>");

                    var tableIntake = arrayData[0];
                    var tableOutput = arrayData[1];

                    $('#tableFluidBalanceIntakeDiv').html(tableIntake);
                    $('#tableFluidBalanceOutputDiv').html(tableOutput);

                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        }
        // Function for Table End


        // Reset Function for Table Start
        function resetTableFluidBalance() {

            $("#tableFluidBalanceIntakeDiv").html('<h5>Intake</h5>\n\
                            <table class="table table-bordered" id="tableFluidBalanceIntakeTable" style="width: 100%">\n\
                                <thead>\n\
                                    <tr>\n\
                                        <th rowspan="2">Date</th>\n\
                                        <th rowspan="2">Time</th>\n\
                                        <th colspan="2">Oral</th>\n\
                                        <th colspan="2">Intravenous</th>\n\
                                        <th colspan="2">Other (Specify)</th>\n\
                                        <th rowspan="2">Action</th>\n\
                                    </tr>\n\
                                    <tr>\n\
                                        <th>Type</th>\n\
                                        <th>Amount</th>\n\
                                        <th>Type</th>\n\
                                        <th>Amount</th>\n\
                                        <th>Type</th>\n\
                                        <th>Amount</th>\n\
                                    </tr>\n\
                                </thead>\n\
                                <tbody>\n\
                                    <tr>\n\
                                        <td colspan="9" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                                    </tr>\n\
                                </tbody>\n\
                                < /table>');


            $("#tableFluidBalanceOutputDiv").html('<h5>Output</h5>\n\
                                <table class="table table-bordered" id="tableFluidBalanceOutputTable" style="width: 100%">\n\
                                    <thead>\n\
                                        <tr>\n\
                                            <th>Date</th>\n\
                                            <th>Time</th>\n\
                                            <th>Urine</th>\n\
                                            <th>Vomitus</th>\n\
                                            <th>Gastric Suction</th>\n\
                                            <th>Other (Specify)</th>\n\
                                            <th>Action</th>\n\
                                        </tr>\n\
                                    </thead>\n\
                                    <tbody>\n\
                                        <tr>\n\
                                            <td colspan="7" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                                        </tr>\n\
                                    </tbody>\n\
                                    < /table>');

            $('#fluidBalanceSelectAssessment').prop('selectedIndex', 0);

        }
        // Reset Function for Table End


// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //



// ---------------------------------------------------------------------------- Delete ------------------------------------------------------------------------------------------- //


        // Function For Delete Button Start
        $('#tableFluidBalanceIntakeDiv').on('click', '#tableFluidBalanceIntakeTable #tableFluidBalanceIntakeDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataFluidBalanceIntakehidden").val();

            bootbox.confirm({
                message: "Are you sure want to delete this record ?",
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
                            type: "post",
                            url: "../Ortho-NursingInWard/controller/FluidBalanceFunction.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'deleteFluidIntake'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    FluidBalanceTableFiterAUD();

                                } else {

                                    bootbox.alert("Fail to Delete");
                                }

                            },
                            error: function (err) {

                            }
                        });
                    }
                }
            });
        });
        // Function For Delete Skin Button End


        // Function For Delete Position Button Start
        $('#tableFluidBalanceOutputDiv').on('click', '#tableFluidBalanceOutputTable #tableFluidBalanceOutputDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataFluidBalanceOutputhidden").val();

            bootbox.confirm({
                message: "Are you sure want to delete this record ?",
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
                            type: "post",
                            url: "../Ortho-NursingInWard/controller/FluidBalanceFunction.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'deleteFluidOutput'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    FluidBalanceTableFiterAUD();

                                } else {

                                    bootbox.alert("Fail to Delete");
                                }

                            },
                            error: function (err) {

                            }
                        });
                    }
                }
            });
        });
        // Function For Delete Button End


// ---------------------------------------------------------------------------- Delete ------------------------------------------------------------------------------------------- //





// ---------------------------------------------------------------------------- Date ------------------------------------------------------------------------------------------- //

        // Date Functions Start
        // Date Picker For Initial Start
        $("#fluidBalanceSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });
        // Date Picker For Initial End

        // Date Picker For Final Start
        $('#fluidBalanceSelectAssessmentStart').on('change', function () {

            $("#fluidBalanceSelectAssessmentEnd").datepicker("destroy");
            $('#fluidBalanceSelectAssessmentEnd').val('');
            var fromDate = $("#fluidBalanceSelectAssessmentStart").datepicker("getDate");

            $('#fluidBalanceSelectAssessmentEnd').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                yearRange: '1990:+0',
                minDate: fromDate,
                maxDate: '+0d'
            });

        });
        // Date Picker For Final Start
        // Date Functions End

// ---------------------------------------------------------------------------- Date ------------------------------------------------------------------------------------------- //


    });

</script>



<!--


 <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                                &nbsp;
                                <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

                            </td>
                            
                            
                              <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                                &nbsp;
                                <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

                            </td>-->