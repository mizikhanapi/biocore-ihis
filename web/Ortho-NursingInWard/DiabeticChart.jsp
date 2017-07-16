<%-- 
    Document   : DiabeticChart
    Created on : Jun 9, 2017, 12:36:38 PM
    Author     : user
--%>
<div id="diabeticChartMain">
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control" id="diabeticChartSelectAssessment">
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
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="diabeticChartSelectAssessmentStartEnd">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="diabeticChartSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="text" class="form-control" id="diabeticChartSelectAssessmentEnd" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
                </div>
                <button type="submit" class="btn btn-default" id="diabeticChartSelectAssessmentStartEndBtn"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>


    <div id="tableDiabeticChartDiv">
        <table class="table table-bordered" id="tableDiabeticChartTable" style="width: 100%">
            <thead>
            <th>Date</th>
            <th>Time</th>
            <th>Dextrostix</th>
            <th>Doctor Name</th>
            <th>Approval</th>
            <th>Action</th>
            </thead>
            <tbody>
                <tr>
                    <td colspan="6" align="center">No Record To Show<br>Please Select A History Assessment</td>
                </tr> 
            </tbody>
        </table>
    </div>
</div>


<script>

    $(document).ready(function () {

        // Disabling Start And End Date
        $("#diabeticChartSelectAssessmentStartEnd").hide();



// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //

        // Function For View Assement Select Start
        $('#diabeticChartSelectAssessment').on('change', function () {

            $("#diabeticChartSelectAssessmentStartEnd").hide();

            var patientName = $('#pName').text();
            var patientPMI = $('#pIC').text();
            var filterBy = $('#diabeticChartSelectAssessment').val();
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
                $('#diabeticChartSelectAssessment').prop('selectedIndex', 0);
            } else if (filterBy === "custom") {
                $("#diabeticChartSelectAssessmentStartEnd").show();
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

                DiabeticChartTableFiter(datas);

            }

        });

        $("#diabeticChartSelectAssessmentStartEndBtn").on('click', function () {

            var patientPMI = $('#pIC').text();
            var strtDate = $('#diabeticChartSelectAssessmentStart').val();
            var endDate = $('#diabeticChartSelectAssessmentEnd').val();

            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

            var data2 = patientPMI + "|" + SnewDate + "^" + EnewDate + "|custom";

            DiabeticChartTableFiter(data2);

        });
        // Function For View Assement Select End


        // Function For View Assement Select For Add Update Delete Start
        function DiabeticChartTableFiterAUD() {

            var patientPMI = $('#pIC').text();
            var filterBy = $('#diabeticChartSelectAssessment').val();
            var selected = $("#diabeticChartSelectAssessment option:selected").text();
            var datas;
            var todayDate;

            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();

            todayDate = yy + "-" + mm + "-" + dd;


            if (selected === "View by") {

                resetTableDiabeticChart();

            } else if (selected === "Select date") {

                var strtDate = $('#diabeticChartSelectAssessmentStart').val();
                var endDate = $('#diabeticChartSelectAssessmentEnd').val();

                var sDate = strtDate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = endDate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

                datas = patientPMI + "|" + SnewDate + "^" + EnewDate + "|" + filterBy;
                DiabeticChartTableFiter(datas);

            } else {

                datas = patientPMI + "|" + todayDate + "|" + filterBy;
                DiabeticChartTableFiter(datas);

            }

        }
        // Function For View Assement Select For Add Update Delete End


        // Function for Table Start 
        function DiabeticChartTableFiter(viewData) {

            var data = {
                dataString: viewData,
                methodName: "view"
            };

            $.ajax({
                url: "../Ortho-NursingInWard/controller/DiabeticChartFunction.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    $('#tableDiabeticChartDiv').html(datas);

                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        }
        // Function for Table End


        // Reset Function for Table Start
        function resetTableDiabeticChart() {

            $("#tableDiabeticChartDiv").html('<table class="table table-bordered" id="tableDiabeticChartTable" style="width: 100%">\n\
                                        <thead>\n\
                                         <th>Date</th>\n\
                                         <th>Time</th>\n\\n\
                                         <th>Dextrostix</th>\n\
                                         <th>Doctor Name</th>\n\
                                         <th>Approval</th>\n\
                                         <th>Action</th>\n\
                                         </thead>\n\
                                         <tbody>\n\
                                             <tr>\n\
                                                 <td colspan="6" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                                             </tr> \n\
                                         </tbody>\n\
                                    </table>');

            $('#diabeticChartSelectAssessment').prop('selectedIndex', 0);

        }
        // Reset Function for Table End

// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //


// ---------------------------------------------------------------------------- Approve ------------------------------------------------------------------------------------------- //



        // Function For Update Button Start
        $('#tableDiabeticChartDiv').on('click', '#tableDiabeticChartTable #tableDiabeticChartPendingBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataDiabeticCharthidden").val();


            bootbox.confirm({
                message: "Are you sure want to approve this record ?",
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
                            url: "../Ortho-NursingInWard/controller/DiabeticChartFunction.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'approve'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Approve !!");
                                    DiabeticChartTableFiterAUD();

                                } else {

                                    bootbox.alert("Fail to Approve");

                                }

                            },
                            error: function (err) {

                            }
                        });

                    }
                }
            });


        });
        // Function For Update Button End

// ---------------------------------------------------------------------------- Approve ------------------------------------------------------------------------------------------- //



// ---------------------------------------------------------------------------- Insert ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#Ortho-NursingInWard_6').on('click', '#diabeticChartAddNewRecord', function (e) {

            $('#diabeticChartModalTitle').text("Add Diabetic Chart");
            $('#diabeticChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="diabeticChartAddModalBtn" role="button">Add Items</button>');

            $('#diabeticChartForm')[0].reset();

            $("#diabeticChartModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#DiabeticChart #diabeticChartModal_btnAdd_or_btnUpdate_div').on('click', '#diabeticChartAddModalBtn', function (e) {
            e.preventDefault();


            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            var hh = enDate.getHours();
            var m = enDate.getMinutes();
            var ss = enDate.getSeconds();
            var ms = enDate.getMilliseconds();

            var encounterDate = yy + "-" + mm + "-" + dd + " " + hh + ":" + m + ":" + ss + "." + ms;
            var date = $('#diabeticChartModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#diabeticChartModalTime').val();
            var dextrostix = $('#diabeticChartModalDextrostix').val();

            if (dextrostix === null) {
                dextrostix = "";
            }

            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;


            if (date === null || date === "") {
                bootbox.alert("Please Insert Assessment Date !!");
            } else if (time === null || time === "") {
                bootbox.alert("Please Insert Assessment Time !!");
            } else {

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "| | |" + newDate + " " + time + ":00.0|" + dextrostix + " |Pending";

                $.ajax({
                    type: "post",
                    url: "../Ortho-NursingInWard/controller/DiabeticChartFunction.jsp",
                    data: {dataString: datas, methodName: "add"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#DiabeticChart").modal('hide');
                            DiabeticChartTableFiterAUD();

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#DiabeticChart").modal('hide');

                        }
                    },
                    error: function (err) {
                        bootbox.alert("something wrong,error: " + err);
                    }
                });

            }

        });
        // Add Get Data And Send To Controller Function End



// ---------------------------------------------------------------------------- Insert ------------------------------------------------------------------------------------------- //



// ---------------------------------------------------------------------------- Update ------------------------------------------------------------------------------------------- //


        // Function For Update Button Start
        $('#tableDiabeticChartDiv').on('click', '#tableDiabeticChartTable #tableDiabeticChartUpdateBtn', function (e) {


            $('#diabeticChartModalTitle').text("Update Diabetic Chart");
            $('#diabeticChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="diabeticChartUpdateModalBtn" role="button">Update Items</button>');

            $('#diabeticChartForm')[0].reset();

            $("#diabeticChartModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });


            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataDiabeticCharthidden").val();

            var arrayData = rowData.split("|");

            $('#NIWDiabeticChartPmi').val(arrayData[0]);
            $('#NIWDiabeticChartHfc').val(arrayData[1]);
            $('#NIWDiabeticChartDate').val(arrayData[2]);
            $('#NIWDiabeticChartEncounterDate').val(arrayData[3]);

            $('#diabeticChartModalDate').val(arrayData[7]);
            $('#diabeticChartModalTime').val(arrayData[11]);

            $('#diabeticChartModalDextrostix').val(arrayData[8]);

            $("#DiabeticChart").modal('show');

        });
        // Function For Add Button End


        // Update Get Data And Send To Controller Function Start
        $('#DiabeticChart #diabeticChartModal_btnAdd_or_btnUpdate_div').on('click', '#diabeticChartUpdateModalBtn', function (e) {
            e.preventDefault();

            var date = $('#diabeticChartModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];


            var pmi_no = $('#NIWDiabeticChartPmi').val();
            var hfc_cd1 = $('#NIWDiabeticChartHfc').val();
            var epDate = $('#NIWDiabeticChartDate').val();
            var encounterDate = $('#NIWDiabeticChartEncounterDate').val();

            var time = $('#diabeticChartModalTime').val();
            var dextrostix = $('#diabeticChartModalDextrostix').val();

            if (dextrostix === null) {
                dextrostix = "";
            }

            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "| | |" + newDate + " " + time + ":00.0|" + dextrostix + " |Pending";

            $.ajax({
                type: "post",
                url: "../Ortho-NursingInWard/controller/DiabeticChartFunction.jsp",
                data: {dataString: datas, methodName: "update"},
                timeout: 10000,
                success: function (result) {

                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#DiabeticChart").modal('hide');
                        DiabeticChartTableFiterAUD();

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Update");
                        $("#DiabeticChart").modal('hide');

                    }
                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        });
        // Update Get Data And Send To Controller Function End

// ---------------------------------------------------------------------------- Update ------------------------------------------------------------------------------------------- //



// ---------------------------------------------------------------------------- Delete ------------------------------------------------------------------------------------------- //


        // Function For Delete Button Start
        $('#tableDiabeticChartDiv').on('click', '#tableDiabeticChartTable #tableDiabeticChartDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataDiabeticCharthidden").val();


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
                            url: "../Ortho-NursingInWard/controller/DiabeticChartFunction.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'delete'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    DiabeticChartTableFiterAUD();

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
        $("#diabeticChartSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });
        // Date Picker For Initial End

        // Date Picker For Final Start
        $('#diabeticChartSelectAssessmentStart').on('change', function () {

            $("#diabeticChartSelectAssessmentEnd").datepicker("destroy");
            $('#diabeticChartSelectAssessmentEnd').val('');
            var fromDate = $("#diabeticChartSelectAssessmentStart").datepicker("getDate");

            $('#diabeticChartSelectAssessmentEnd').datepicker({
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
