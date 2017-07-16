<%-- 
    Document   : chartDailySkin
    Created on : Jun 9, 2017, 11:01:04 AM
    Author     : Mizi K (UI)
--%>

<div id="chartDailySkinMain">
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control" id="chartDailySkinSelectAssessment">
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
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="chartDailySkinSelectAssessmentStartEnd">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="chartDailySkinSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="email" class="form-control" id="chartDailySkinSelectAssessmentEnd" placeholder="15/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <button type="submit" class="btn btn-default" id="chartDailySkinSelectAssessmentStartEndBtn"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-7" style="overflow: auto" >
            <div id="tableChartDailySkinToolDiv">
                <h5>Daily Skin Assessment Tool</h5>
                <table class="table table-bordered" id="tableChartDailySkinToolTable" style="width: 100%">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Temperature</th>
                            <th>Color</th>
                            <th>Moisture</th>
                            <th>Skin Turgor</th>
                            <th>Integrity</th>
                            <th>Assesor</th>
                            <th>Action</th>
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
        <div class="col-md-5" style="overflow: auto">
            <div id="tableChartDailySkinPositionDiv">
                <h5>Positioning Chart</h5>
                <table class="table table-bordered" id="tableChartDailySkinPositionTable" style="width: 100%">
                    <thead>
                        <tr>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Position / Activity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4" align="center">No Record To Show<br>Please Select A History Assessment</td>
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
        $("#chartDailySkinSelectAssessmentStartEnd").hide();

// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //

        // Function For View Assement Select Start
        $('#chartDailySkinSelectAssessment').on('change', function () {

            $("#chartDailySkinSelectAssessmentStartEnd").hide();

            var patientName = $('#pName').text();
            var patientPMI = $('#pIC').text();
            var filterBy = $('#chartDailySkinSelectAssessment').val();
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
                $('#chartDailySkinSelectAssessment').prop('selectedIndex', 0);
            } else if (filterBy === "custom") {
                $("#chartDailySkinSelectAssessmentStartEnd").show();
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

                ChartDailySkinTableFiter(datas);
            }

        });

        $("#chartDailySkinSelectAssessmentStartEndBtn").on('click', function () {

            var patientPMI = $('#pIC').text();
            var strtDate = $('#chartDailySkinSelectAssessmentStart').val();
            var endDate = $('#chartDailySkinSelectAssessmentEnd').val();
            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
            var data2 = patientPMI + "|" + SnewDate + "^" + EnewDate + "|custom";

            ChartDailySkinTableFiter(data2);

        });
        // Function For View Assement Select End

        // Function For View Assement Select For Add Update Delete Start
        function ChartDailySkinTableFiterAUD() {

            var patientPMI = $('#pIC').text();
            var filterBy = $('#chartDailySkinSelectAssessment').val();
            var selected = $("#chartDailySkinSelectAssessment option:selected").text();
            var datas;
            var todayDate;
            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            todayDate = yy + "-" + mm + "-" + dd;
            if (selected === "View by") {

                resetTableChartDailySkin();

            } else if (selected === "Select date") {

                var strtDate = $('#chartDailySkinSelectAssessmentStart').val();
                var endDate = $('#chartDailySkinSelectAssessmentEnd').val();
                var sDate = strtDate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
                var eDate = endDate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                datas = patientPMI + "|" + SnewDate + "^" + EnewDate + "|" + filterBy;

                ChartDailySkinTableFiter(datas);

            } else {

                datas = patientPMI + "|" + todayDate + "|" + filterBy;
                ChartDailySkinTableFiter(datas);

            }

        }
        // Function For View Assement Select For Add Update Delete End


        // Function for Table Start 
        function ChartDailySkinTableFiter(viewData) {

            var data = {
                dataString: viewData,
                methodName: "view"
            };
            $.ajax({
                url: "../Ortho-NursingInWard/controller/ChartDailySkinFunction.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    var arrayData = datas.split("<ShammugamRamasamySeperator></ShammugamRamasamySeperator>");
                    var tableSkinTool = arrayData[0];
                    var tablePosition = arrayData[1];
                    $('#tableChartDailySkinToolDiv').html(tableSkinTool);
                    $('#tableChartDailySkinPositionDiv').html(tablePosition);
                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });
        }
        // Function for Table End



        // Reset Function for Table Start
        function resetTableChartDailySkin() {

            $("#tableChartDailySkinToolDiv").html('<h5>Daily Skin Assessment Tool</h5>\n\
                                    <table class="table table-bordered" id="tableChartDailySkinToolTable" style="width: 100%">\n\
                                        <thead>\n\
                                            <tr>\n\
                                                <th>Date</th>\n\
                                                <th>Time</th>\n\
                                                <th>Temperature</th>\n\
                                                <th>Color</th>\n\
                                                <th>Moisture</th>\n\
                                                <th>Skin Turgor</th>\n\
                                                <th>Integrity</th>\n\
                                                <th>Assesor</th>\n\
                                                <th>Action</th>\n\
                                            </tr>\n\
                                        </thead>\n\
                                        <tbody>\n\
                                            <tr>\n\
                                                <td colspan="9" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                                            </tr>\n\
                                        </tbody>\n\
                                        </table>');


            $("#tableChartDailySkinPositionDiv").html('<h5>Positioning Chart</h5>\n\
                <table class="table table-bordered" id="tableChartDailySkinPositionTable" style="width: 100%">\n\
                    <thead>\n\
                        <tr>\n\
                            <th>Date</th>\n\
                            <th>Time</th>\n\
                            <th>Position / Activity</th>\n\
                            <th>Action</th>\n\
                        </tr>\n\
                    </thead>\n\
                    <tbody>\n\
                        <tr>\n\
                            <td colspan="4" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                        </tr>\n\
                    </tbody>\n\
                </table>');

            $('#chartDailySkinSelectAssessment').prop('selectedIndex', 0);

        }
        // Reset Function for Table End

// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //



// ---------------------------------------------------------------------------- Insert Skin Tool ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#Ortho-NursingInWard_5').on('click', '#chartDailySkinToolAddNewRecord', function (e) {

            $('#dailySkinToolModalTitle').text("Daily Skin Assessment Tool");
            $('#dailySkinToolModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="dailySkinToolAddModalBtn" role="button">Add Items</button>');

            $('#dailySkinToolModalForm')[0].reset();

            $("#dailySkinToolModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#dailySkinTool #dailySkinToolModal_btnAdd_or_btnUpdate_div').on('click', '#dailySkinToolAddModalBtn', function (e) {
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
            var date = $('#dailySkinToolModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#dailySkinToolModalTime').val();
            var Temperature = $("input[name='Temperature']:checked").val();
            var Color = $("input[name='Color']:checked").val();
            var Moisture = $("input[name='Moisture']:checked").val();
            var SkinTurgor = $("input[name='SkinTurgor']:checked").val();
            var Integrity = $("input[name='Integrity']:checked").val();
            var ReferToTeam = $("input[name='ReferToTeam']:checked").val();

            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;


            if (date === null || date === "") {
                bootbox.alert("Please Insert Assessment Date !!");
            } else if (time === null || time === "") {
                bootbox.alert("Please Insert Assessment Time !!");
            } else {

                if (Temperature === undefined) {
                    Temperature = "";
                } else if (Color === undefined) {
                    Color = "";
                } else if (Moisture === undefined) {
                    Moisture = "";
                } else if (SkinTurgor === undefined) {
                    SkinTurgor = "";
                } else if (Integrity === undefined) {
                    Integrity = "";
                } else if (ReferToTeam === undefined) {
                    ReferToTeam = "";
                }

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00.0|" + Temperature + "|" + Color + "|" + Moisture + "|" + SkinTurgor + "|" + Integrity + "|" + ReferToTeam;
                console.log(datas);

                $.ajax({
                    type: "post",
                    url: "../Ortho-NursingInWard/controller/ChartDailySkinFunction.jsp",
                    data: {dataString: datas, methodName: "addSkinTool"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#dailySkinTool").modal('hide');
                            ChartDailySkinTableFiterAUD();

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#dailySkinTool").modal('hide');

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


// ---------------------------------------------------------------------------- Insert Skin Position ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#Ortho-NursingInWard_5').on('click', '#chartDailySkinPositionAddNewRecord', function (e) {

            $('#dailySkinPositionModalTitle').text("Positioning Chart");
            $('#dailySkinPositionModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="dailySkinPositionAddModalBtn" role="button">Add Items</button>');

            $('#dailySkinPositionForm')[0].reset();

            $("#dailySkinPositionModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#dailySkinPosition #dailySkinPositionModal_btnAdd_or_btnUpdate_div').on('click', '#dailySkinPositionAddModalBtn', function (e) {
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
            var date = $('#dailySkinPositionModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#dailySkinPositionModalTime').val();
            var activity = $('#dailySkinPositionModalActivity').val();

            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;


            if (date === null || date === "") {
                bootbox.alert("Please Insert Assessment Date !!");
            } else if (time === null || time === "") {
                bootbox.alert("Please Insert Assessment Time !!");
            } else {

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00.0|" + activity;
                console.log(datas);

                $.ajax({
                    type: "post",
                    url: "../Ortho-NursingInWard/controller/ChartDailySkinFunction.jsp",
                    data: {dataString: datas, methodName: "addPosition"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#dailySkinPosition").modal('hide');
                            ChartDailySkinTableFiterAUD();

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#dailySkinPosition").modal('hide');

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



// ---------------------------------------------------------------------------- Update Skin Tool ------------------------------------------------------------------------------------------- //


        // Function For Update Button Start
        $('#tableChartDailySkinToolDiv').on('click', '#tableChartDailySkinToolTable #tableChartDailySkinToolUpdateBtn', function (e) {


            $('#dailySkinToolModalTitle').text("Daily Skin Assessment Tool");
            $('#dailySkinToolModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="dailySkinToolUpdateModalBtn" role="button">Update Items</button>');

            $('#dailySkinToolModalForm')[0].reset();

            $("#dailySkinToolModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataChartDailySkinToolhidden").val();

            var arrayData = rowData.split("|");

            $('#NIWDailySkinToolPmi').val(arrayData[0]);
            $('#NIWDailySkinToolHfc').val(arrayData[1]);
            $('#NIWDailySkinToolEpisodeDate').val(arrayData[2]);
            $('#NIWDailySkinToolEncounterDate').val(arrayData[3]);

            $('#dailySkinToolModalDate').val(arrayData[5]);
            $('#dailySkinToolModalTime').val(arrayData[13]);

            $("input[name='Temperature'][value='" + arrayData[6] + "']").prop('checked', true);
            $("input[name='Color'][value='" + arrayData[7] + "']").prop('checked', true);
            $("input[name='Moisture'][value='" + arrayData[8] + "']").prop('checked', true);
            $("input[name='SkinTurgor'][value='" + arrayData[9] + "']").prop('checked', true);
            $("input[name='Integrity'][value='" + arrayData[10] + "']").prop('checked', true);
            $("input[name='ReferToTeam'][value='" + arrayData[12] + "']").prop('checked', true);

            $("#dailySkinTool").modal('show');

        });
        // Function For Update Button End

        // Update Get Data And Send To Controller Function Start
        $('#dailySkinTool #dailySkinToolModal_btnAdd_or_btnUpdate_div').on('click', '#dailySkinToolUpdateModalBtn', function (e) {
            e.preventDefault();


            var date = $('#dailySkinToolModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var pmi_no = $('#NIWDailySkinToolPmi').val();
            var hfc_cd1 = $('#NIWDailySkinToolHfc').val();
            var epDate = $('#NIWDailySkinToolEpisodeDate').val();
            var encounterDate = $('#NIWDailySkinToolEncounterDate').val();

            var time = $('#dailySkinToolModalTime').val();
            var Temperature = $("input[name='Temperature']:checked").val();
            var Color = $("input[name='Color']:checked").val();
            var Moisture = $("input[name='Moisture']:checked").val();
            var SkinTurgor = $("input[name='SkinTurgor']:checked").val();
            var Integrity = $("input[name='Integrity']:checked").val();
            var ReferToTeam = $("input[name='ReferToTeam']:checked").val();

            if (Temperature === undefined) {
                Temperature = "";
            } else if (Color === undefined) {
                Color = "";
            } else if (Moisture === undefined) {
                Moisture = "";
            } else if (SkinTurgor === undefined) {
                SkinTurgor = "";
            } else if (Integrity === undefined) {
                Integrity = "";
            } else if (ReferToTeam === undefined) {
                ReferToTeam = "";
            }

            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00.0|" + Temperature + "|" + Color + "|" + Moisture + "|" + SkinTurgor + "|" + Integrity + "|" + ReferToTeam;

            $.ajax({
                type: "post",
                url: "../Ortho-NursingInWard/controller/ChartDailySkinFunction.jsp",
                data: {dataString: datas, methodName: "updateSkinTool"},
                timeout: 10000,
                success: function (result) {
                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#dailySkinTool").modal('hide');
                        ChartDailySkinTableFiterAUD();

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Updated");
                        $("#dailySkinTool").modal('hide');

                    }
                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        });
        // Update Get Data And Send To Controller Function End

// ---------------------------------------------------------------------------- Update Skin Tool ------------------------------------------------------------------------------------------- //





// ---------------------------------------------------------------------------- Update Position ------------------------------------------------------------------------------------------- //


        // Function For Update Button Start
        $('#tableChartDailySkinPositionDiv').on('click', '#tableChartDailySkinPositionTable #tableChartDailySkinPositionUpdateBtn', function (e) {


            $('#dailySkinPositionModalTitle').text("Positioning Chart");
            $('#dailySkinPositionModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="dailySkinPositionUpdateModalBtn" role="button">Update Items</button>');

            $('#dailySkinPositionForm')[0].reset();

            $("#dailySkinPositionModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataChartDailySkinPositionhidden").val();

            var arrayData = rowData.split("|");

            $('#NIWDailySkinPositionPmi').val(arrayData[0]);
            $('#NIWDailySkinPositionHfc').val(arrayData[1]);
            $('#NIWDailySkinPositionEpisodeDate').val(arrayData[2]);
            $('#NIWDailySkinPositionEncounterDate').val(arrayData[3]);

            $('#dailySkinPositionModalDate').val(arrayData[5]);
            $('#dailySkinPositionModalTime').val(arrayData[7]);

            $('#dailySkinPositionModalActivity').val(arrayData[6]);

            $("#dailySkinPosition").modal('show');


        });
        // Function For Update Button End


        // Update Get Data And Send To Controller Function Start
        $('#dailySkinPosition #dailySkinPositionModal_btnAdd_or_btnUpdate_div').on('click', '#dailySkinPositionUpdateModalBtn', function (e) {
            e.preventDefault();
            
            var date = $('#dailySkinPositionModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var pmi_no = $('#NIWDailySkinPositionPmi').val();
            var hfc_cd1 = $('#NIWDailySkinPositionHfc').val();
            var epDate = $('#NIWDailySkinPositionEpisodeDate').val();
            var encounterDate = $('#NIWDailySkinPositionEncounterDate').val();

            var time = $('#dailySkinPositionModalTime').val();
            var activity = $('#dailySkinPositionModalActivity').val();


            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00.0|" + activity;
            console.log(datas);

            $.ajax({
                type: "post",
                url: "../Ortho-NursingInWard/controller/ChartDailySkinFunction.jsp",
                data: {dataString: datas, methodName: "updatePosition"},
                timeout: 10000,
                success: function (result) {

                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#dailySkinPosition").modal('hide');
                        ChartDailySkinTableFiterAUD();

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Update");
                        $("#dailySkinPosition").modal('hide');

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
        $('#tableChartDailySkinToolDiv').on('click', '#tableChartDailySkinToolTable #tableChartDailySkinToolDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataChartDailySkinToolhidden").val();

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
                            url: "../Ortho-NursingInWard/controller/ChartDailySkinFunction.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'deleteSkinTool'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    ChartDailySkinTableFiterAUD();

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
        $('#tableChartDailySkinPositionDiv').on('click', '#tableChartDailySkinPositionTable #tableChartDailySkinPositionDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataChartDailySkinPositionhidden").val();

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
                            url: "../Ortho-NursingInWard/controller/ChartDailySkinFunction.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'deletePosition'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    ChartDailySkinTableFiterAUD();

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
        $("#chartDailySkinSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });
        // Date Picker For Initial End

        // Date Picker For Final Start
        $('#chartDailySkinSelectAssessmentStart').on('change', function () {

            $("#chartDailySkinSelectAssessmentEnd").datepicker("destroy");
            $('#chartDailySkinSelectAssessmentEnd').val('');
            var fromDate = $("#chartDailySkinSelectAssessmentStart").datepicker("getDate");
            $('#chartDailySkinSelectAssessmentEnd').datepicker({
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

<td>09/06/2017</td>
                            <td>10:59 AM</td>
                            <td>Normal</td>
                            <td>Redness</td>
                            <td>Dry</td>
                            <td>Poor</td>
                            <td>No</td>
                            <td>Mizi K</td>
                            <td>
                                <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                                &nbsp;
                                <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
                            </td>
                            
                            
                            
                            
                            
                             <td>09/06/2017</td>
                        <td>11:11 AM</td>
                        <td>On Top</td>
                        <td>
                            <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
                            &nbsp;
                            <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
                        </td>-->