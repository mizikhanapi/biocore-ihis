<%-- 
    Document   : FitsChart
    Created on : Jun 9, 2017, 12:55:20 PM
    Author     : user
--%>
<div id="woodAssessmentMain">
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control" id="woodAssessmentSelectAssessment">
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
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="woodAssessmentSelectAssessmentStartEnd">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="woodAssessmentSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="text" class="form-control" id="woodAssessmentSelectAssessmentEnd" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
                </div>
                <button type="submit" class="btn btn-default" id="woodAssessmentSelectAssessmentStartEndBtn"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>
    <div id="tableWoundAssessmentDiv" style="overflow-y: auto">
        <table class="table table-bordered" id="tableWoundAssessmentTable" style="width: 100%">
            <tr>
                <th rowspan="2">Date</th>
                <th rowspan="2">Date of next dressing change</th>
                <th colspan="3">Wound Dimensions in cm</th>
                <th rowspan="2">Exudate Level</th>
                <th rowspan="2">Exudate Colour</th>
                <th rowspan="2">Wound Bed in %</th>
                <th rowspan="2">Wound Edges</th>
                <th rowspan="2">Surrounding Skin</th>
                <th rowspan="2">Signs of Clinical Infaction</th>
                <th colspan="2">Patient Pain</th>
                <th rowspan="2">Wound Progress</th>
                <th colspan="4">Dressing Plan</th>
                <th rowspan="2">Action</th>
            </tr>
            <tr>
                <th>1</th>
                <th>2</th>
                <th>3</th>
                <th>During Removal</th>
                <th>While in place</th>
                <th>Primary Dressing</th>
                <th>Size & no. of pieces</th>
                <th>Secondary Dressing</th>
                <th>Size & no. of pieces</th>
            </tr>
            <tr>
                <td colspan="19" align="center">No Record To Show<br>Please Select A History Assessment</td>
            </tr>
        </table>
    </div>
</div>

<script>

    $(document).ready(function () {

        // Disabling Start And End Date
        $("#woodAssessmentSelectAssessmentStartEnd").hide();



// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //

        // Function For View Assement Select Start
        $('#woodAssessmentSelectAssessment').on('change', function () {

            $("#woodAssessmentSelectAssessmentStartEnd").hide();

            var patientName = $('#pName').text();
            var patientPMI = $('#pIC').text();
            var filterBy = $('#woodAssessmentSelectAssessment').val();
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
                $('#woodAssessmentSelectAssessment').prop('selectedIndex', 0);
            } else if (filterBy === "custom") {
                $("#woodAssessmentSelectAssessmentStartEnd").show();
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

                WoundAssementTableFiter(datas);

            }

        });

        $("#woodAssessmentSelectAssessmentStartEndBtn").on('click', function () {

            var patientPMI = $('#pIC').text();
            var strtDate = $('#woodAssessmentSelectAssessmentStart').val();
            var endDate = $('#woodAssessmentSelectAssessmentEnd').val();

            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

            var data2 = patientPMI + "|" + SnewDate + "^" + EnewDate + "|custom";

            WoundAssementTableFiter(data2);

        });
        // Function For View Assement Select End


        // Function For View Assement Select For Add Update Delete Start
        function WoundAssementTableFiterAUD() {

            var patientPMI = $('#pIC').text();
            var filterBy = $('#woodAssessmentSelectAssessment').val();
            var selected = $("#woodAssessmentSelectAssessment option:selected").text();
            var datas;
            var todayDate;

            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();

            todayDate = yy + "-" + mm + "-" + dd;


            if (selected === "View by") {

                resetTableWoundAssement();

            } else if (selected === "Select date") {

                var strtDate = $('#woodAssessmentSelectAssessmentStart').val();
                var endDate = $('#woodAssessmentSelectAssessmentEnd').val();

                var sDate = strtDate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = endDate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

                datas = patientPMI + "|" + SnewDate + "^" + EnewDate + "|" + filterBy;
                WoundAssementTableFiter(datas);

            } else {

                datas = patientPMI + "|" + todayDate + "|" + filterBy;
                WoundAssementTableFiter(datas);

            }

        }
        // Function For View Assement Select For Add Update Delete End


        // Function for Table Start 
        function WoundAssementTableFiter(viewData) {

            var data = {
                dataString: viewData,
                methodName: "view"
            };

            $.ajax({
                url: "../Ortho-NursingInWard/controller/WoundAssementFunction.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    $('#tableWoundAssessmentDiv').html(datas);

                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        }
        // Function for Table End


        // Reset Function for Table Start
        function resetTableWoundAssement() {

            $("#tableWoundAssessmentDiv").html('<table class="table table-bordered" id="tableWoundAssessmentTable" style="width: 100%">\n\
                                        <tr>\n\
                                            <th rowspan="2">Date</th>\n\
                                            <th rowspan="2">Date of next dressing change</th>\n\
                                            <th colspan="3">Wound Dimensions in cm</th>\n\
                                            <th rowspan="2">Exudate Level</th>\n\
                                            <th rowspan="2">Exudate Colour</th>\n\
                                            <th rowspan="2">Wound Bed in %</th>\n\
                                            <th rowspan="2">Wound Edges</th>\n\
                                            <th rowspan="2">Surrounding Skin</th>\n\
                                            <th rowspan="2">Signs of Clinical Infaction</th>\n\
                                            <th colspan="2">Patient Pain</th>\n\
                                            <th rowspan="2">Wound Progress</th>\n\
                                            <th colspan="4">Dressing Plan</th>\n\
                                            <th rowspan="2">Action</th>\n\
                                        </tr>\n\
                                        <tr>\n\
                                            <th>1</th>\n\
                                            <th>2</th>\n\
                                            <th>3</th>\n\
                                            <th>During Removal</th>\n\
                                            <th>While in place</th>\n\
                                            <th>Primary Dressing</th>\n\
                                            <th>Size & no. of pieces</th>\n\
                                            <th>Secondary Dressing</th>\n\
                                            <th>Size & no. of pieces</th>\n\
                                        </tr>\n\
                                        <tr>\n\
                                            <td colspan="19" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                                        </tr>\n\
                                    </table>');

            $('#woodAssessmentSelectAssessment').prop('selectedIndex', 0);

        }
        // Reset Function for Table End

// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //



// ---------------------------------------------------------------------------- Insert ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#Ortho-NursingInWard_10').on('click', '#woundAssessmentAddNewRecord', function (e) {

            $('#woundAssessmentModalTitle').text("Add Wound Assessment");
            $('#woundAssessmentModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="woundAssessmentAddModalBtn" role="button">Add Items</button>');

            $('#woundAssessmentForm')[0].reset();

            $("#woundAssessmentModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            $("#woundAssessmentModalDateFuture").datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#woundAssessment #woundAssessmentModal_btnAdd_or_btnUpdate_div').on('click', '#woundAssessmentAddModalBtn', function (e) {
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

            var date = $('#woundAssessmentModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
            var dateFuture = $('#woundAssessmentModalDateFuture').val();
            var fDate = dateFuture.split('/');
            var newDate2 = fDate[2] + "-" + fDate[1] + "-" + fDate[0];
            var dimension1 = $('#woundAssessmentModalDimension1').val();
            var dimension2 = $('#woundAssessmentModalDimension2').val();
            var dimension3 = $('#woundAssessmentModalDimension3').val();

            var ExudateLevel = $("input[name='ExudateLevel']:checked").val();
            var ExudateColour = $("input[name='ExudateColour']:checked").val();
            var WoundBed = $("input[name='WoundBed']:checked").val();
            var WoundEdges = $("input[name='WoundEdges']:checked").val();
            var SurroundingSkin = $("input[name='SurroundingSkin']:checked").val();
            var UrinaryCatheter = $("input[name='UrinaryCatheter']:checked").val();
            var VaccumDressing = $("input[name='VaccumDressing']:checked").val();

            var pain1 = $('#woundAssessmentModalPain1').val();
            var pain2 = $('#woundAssessmentModalPain2').val();
            var plan1 = $('#woundAssessmentModalPlan1').val();
            var plan2 = $('#woundAssessmentModalPlan2').val();
            var plan3 = $('#woundAssessmentModalPlan3').val();
            var plan4 = $('#woundAssessmentModalPlan4').val();


            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;


            if (date === null || date === "") {
                bootbox.alert("Please Insert Assessment Date !!");
            } else {

                if (ExudateLevel === undefined) {
                    ExudateLevel = "";
                } else if (ExudateColour === undefined) {
                    ExudateColour = "";
                } else if (WoundBed === undefined) {
                    WoundBed = "";
                } else if (WoundEdges === undefined) {
                    WoundEdges = "";
                } else if (SurroundingSkin === undefined) {
                    SurroundingSkin = "";
                } else if (UrinaryCatheter === undefined) {
                    UrinaryCatheter = "";
                } else if (VaccumDressing === undefined) {
                    VaccumDressing = "";
                }

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " 00:00:00:0|" + newDate2 + " 00:00:00:0|" + dimension1 + "|" + dimension2 + "|"
                        + dimension3 + "|" + ExudateLevel + "|" + ExudateColour + "|" + WoundBed + "|" + WoundEdges + "|" + SurroundingSkin + "|" + UrinaryCatheter
                        + "|" + pain1 + "|" + pain2 + "|" + VaccumDressing + "|" + plan1 + "|" + plan2 + "|" + plan3 + "|" + plan4;

                $.ajax({
                    type: "post",
                    url: "../Ortho-NursingInWard/controller/WoundAssementFunction.jsp",
                    data: {dataString: datas, methodName: "add"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#woundAssessment").modal('hide');
                            WoundAssementTableFiterAUD();

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#woundAssessment").modal('hide');

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
        $('#tableWoundAssessmentDiv').on('click', '#tableWoundAssessmentTable #tableWoundAssessmentUpdateBtn', function (e) {


            $('#woundAssessmentModalTitle').text("Update Wound Assessment");
            $('#woundAssessmentModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="woundAssessmentUpdateModalBtn" role="button">Update Items</button>');

            $('#woundAssessmentForm')[0].reset();

            $("#woundAssessmentModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            $("#woundAssessmentModalDateFuture").datepicker({
                changeMonth: true,
                changeYear: true,
                minDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataWoundAssessmenthidden").val();

            var arrayData = rowData.split("|");

            $('#NIWWoundAssessmentPmi').val(arrayData[0]);
            $('#NIWWoundAssessmentHfc').val(arrayData[1]);
            $('#NIWWoundAssessmentEpisodeDate').val(arrayData[2]);
            $('#NIWWoundAssessmentEncounterDate').val(arrayData[3]);

            $('#woundAssessmentModalDate').val(arrayData[5]);
            $('#woundAssessmentModalDateFuture').val(arrayData[7]);

            $('#woundAssessmentModalDimension1').val(arrayData[8]);
            $('#woundAssessmentModalDimension2').val(arrayData[9]);
            $('#woundAssessmentModalDimension3').val(arrayData[10]);

            $("input[name='ExudateLevel'][value='" + arrayData[11] + "']").prop('checked', true);
            $("input[name='ExudateColour'][value='" + arrayData[12] + "']").prop('checked', true);
            $("input[name='WoundBed'][value='" + arrayData[13] + "']").prop('checked', true);
            $("input[name='WoundEdges'][value='" + arrayData[14] + "']").prop('checked', true);
            $("input[name='SurroundingSkin'][value='" + arrayData[15] + "']").prop('checked', true);
            $("input[name='UrinaryCatheter'][value='" + arrayData[16] + "']").prop('checked', true);

            $('#woundAssessmentModalPain1').val(arrayData[17]);
            $('#woundAssessmentModalPain2').val(arrayData[18]);

            $("input[name='VaccumDressing'][value='" + arrayData[19] + "']").prop('checked', true);

            $('#woundAssessmentModalPlan1').val(arrayData[20]);
            $('#woundAssessmentModalPlan2').val(arrayData[21]);
            $('#woundAssessmentModalPlan3').val(arrayData[22]);
            $('#woundAssessmentModalPlan4').val(arrayData[23]);

            $("#woundAssessment").modal('show');


        });
        // Function For Update Button End

        // Update Get Data And Send To Controller Function Start
        $('#woundAssessment #woundAssessmentModal_btnAdd_or_btnUpdate_div').on('click', '#woundAssessmentUpdateModalBtn', function (e) {
            e.preventDefault();

            var date = $('#woundAssessmentModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
            var dateFuture = $('#woundAssessmentModalDateFuture').val();
            var fDate = dateFuture.split('/');
            var newDate2 = fDate[2] + "-" + fDate[1] + "-" + fDate[0];
            var dimension1 = $('#woundAssessmentModalDimension1').val();
            var dimension2 = $('#woundAssessmentModalDimension2').val();
            var dimension3 = $('#woundAssessmentModalDimension3').val();

            var ExudateLevel = $("input[name='ExudateLevel']:checked").val();
            var ExudateColour = $("input[name='ExudateColour']:checked").val();
            var WoundBed = $("input[name='WoundBed']:checked").val();
            var WoundEdges = $("input[name='WoundEdges']:checked").val();
            var SurroundingSkin = $("input[name='SurroundingSkin']:checked").val();
            var UrinaryCatheter = $("input[name='UrinaryCatheter']:checked").val();
            var VaccumDressing = $("input[name='VaccumDressing']:checked").val();

            var pain1 = $('#woundAssessmentModalPain1').val();
            var pain2 = $('#woundAssessmentModalPain2').val();
            var plan1 = $('#woundAssessmentModalPlan1').val();
            var plan2 = $('#woundAssessmentModalPlan2').val();
            var plan3 = $('#woundAssessmentModalPlan3').val();
            var plan4 = $('#woundAssessmentModalPlan4').val();

            var pmi_no = $('#NIWWoundAssessmentPmi').val();
            var hfc_cd1 = $('#NIWWoundAssessmentHfc').val();
            var epDate = $('#NIWWoundAssessmentEpisodeDate').val();
            var encounterDate = $('#NIWWoundAssessmentEncounterDate').val();

            if (ExudateLevel === undefined) {
                ExudateLevel = "";
            } else if (ExudateColour === undefined) {
                ExudateColour = "";
            } else if (WoundBed === undefined) {
                WoundBed = "";
            } else if (WoundEdges === undefined) {
                WoundEdges = "";
            } else if (SurroundingSkin === undefined) {
                SurroundingSkin = "";
            } else if (UrinaryCatheter === undefined) {
                UrinaryCatheter = "";
            } else if (VaccumDressing === undefined) {
                VaccumDressing = "";
            }

            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " 00:00:00:0|" + newDate2 + " 00:00:00:0|" + dimension1 + "|" + dimension2 + "|"
                    + dimension3 + "|" + ExudateLevel + "|" + ExudateColour + "|" + WoundBed + "|" + WoundEdges + "|" + SurroundingSkin + "|" + UrinaryCatheter
                    + "|" + pain1 + "|" + pain2 + "|" + VaccumDressing + "|" + plan1 + "|" + plan2 + "|" + plan3 + "|" + plan4;

            $.ajax({
                type: "post",
                url: "../Ortho-NursingInWard/controller/WoundAssementFunction.jsp",
                data: {dataString: datas, methodName: "update"},
                timeout: 10000,
                success: function (result) {

                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#woundAssessment").modal('hide');
                        WoundAssementTableFiterAUD();

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Update");
                        $("#woundAssessment").modal('hide');

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
        $('#tableWoundAssessmentDiv').on('click', '#tableWoundAssessmentTable #tableWoundAssessmentDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataWoundAssessmenthidden").val();


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
                            url: "../Ortho-NursingInWard/controller/WoundAssementFunction.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'delete'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    WoundAssementTableFiterAUD();

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
        $("#woodAssessmentSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });
        // Date Picker For Initial End

        // Date Picker For Final Start
        $('#woodAssessmentSelectAssessmentStart').on('change', function () {

            $("#woodAssessmentSelectAssessmentEnd").datepicker("destroy");
            $('#woodAssessmentSelectAssessmentEnd').val('');
            var fromDate = $("#woodAssessmentSelectAssessmentStart").datepicker("getDate");

            $('#woodAssessmentSelectAssessmentEnd').datepicker({
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


<!--                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
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
                </td>-->


