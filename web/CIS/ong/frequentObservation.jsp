<%-- 
    Document   : anteNatal
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
--%>


<div id="freqObservationChartMain">
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;" >
                <select class="form-control" id="freqObservationChartSelectAssessment">
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
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="freqObservationChartSelectAssessmentStartEnd">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="freqObservationChartSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="text" class="form-control" id="freqObservationChartSelectAssessmentEnd" placeholder="14/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <button type="submit" class="btn btn-default" id="freqObservationChartSelectAssessmentStartEndBtn"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>

    <div id="tableFreqObservationChartDiv" class="table-guling clear-patient">
        <table class="table table-bordered" id="tableFreqObservationChartTable" style="width: 100%">
            <thead>
            <th>Date</th>
            <th>Time</th>
            <th>Temperature</th>
            <th>Pulse</th>
            <th>Respiration</th>
            <th>B. Pressure</th>
            <th>Pupil Details</th>
            <th>Conscious State &amp; Remarks</th>
            <th>Drugs Given</th>
            <th>Record Information</th>
            <th>Action</th>
            </thead>
            <tbody>
                <tr>
                    <td colspan="11" align="center">No Record To Show<br>Please Select A History Assessment</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="specialistTemplate/ONG/frequentObservationsChart-modal.jsp" />



<script>



    $('.decimalNumbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
            this.value = this.value.replace(/[^0-9\.]/g, '');
        }
    });


    $('.singleNumbersOnly').keyup(function () {
        if (this.value !== this.value.replace(/[^0-9]/g, '')) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
    });


    $(document).ready(function () {


        // Disabling Start And End Date
        $("#freqObservationChartSelectAssessmentStartEnd").hide();

// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //


        // Function For View Assement Select Start
        $('#freqObservationChartSelectAssessment').on('change', function () {

            $("#freqObservationChartSelectAssessmentStartEnd").hide();

            var patientName = $('#pName').text();
            var patientPMI = $('#pIC').text();
            var filterBy = $('#freqObservationChartSelectAssessment').val();
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
                $('#freqObservationChartSelectAssessment').prop('selectedIndex', 0);
            } else if (filterBy === "custom") {
                $("#freqObservationChartSelectAssessmentStartEnd").show();
            } else {

                if (filterBy === "0") {
                    bootbox.alert("Please Choose Correct Assessment");
                } else if (filterBy === "today") {
                    datas = patientPMI + "|" + todayDate + "|today";
                } else if (filterBy === "yesterday") {
                    datas = patientPMI + "|" + todayDate + "|yesterday";
                } else if (filterBy === "7day") {
                    datas = patientPMI + "|" + todayDate + "|7day";
                } else if (filterBy === "30day") {
                    datas = patientPMI + "|" + todayDate + "|30day";
                } else if (filterBy === "60day") {
                    datas = patientPMI + "|" + todayDate + "|60day";
                }

                FreqObservationChartTableFiter(datas);
                console.log(datas);

            }

        });


        $("#freqObservationChartSelectAssessmentStartEndBtn").on('click', function () {

            var patientPMI = $('#pIC').text();
            var strtDate = $('#freqObservationChartSelectAssessmentStart').val();
            var endDate = $('#freqObservationChartSelectAssessmentEnd').val();

            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

            var data2 = patientPMI + "|" + SnewDate + "^" + EnewDate + "|custom";

            FreqObservationChartTableFiter(data2);
            console.log(data2);

        });
        // Function For View Assement Select End



        // Function For View Assement Select For Add Update Delete Start
        function FreqObservationChartTableFiterAUD() {

            var patientPMI = $('#pIC').text();
            var filterBy = $('#freqObservationChartSelectAssessment').val();
            var selected = $("#freqObservationChartSelectAssessment option:selected").text();
            var datas;
            var todayDate;

            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();

            todayDate = yy + "-" + mm + "-" + dd;


            if (selected === "View by") {

                resetTableFreqObservationChart();

            } else if (selected === "Select date") {

                var strtDate = $('#freqObservationChartSelectAssessmentStart').val();
                var endDate = $('#freqObservationChartSelectAssessmentEnd').val();

                var sDate = strtDate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = endDate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

                datas = patientPMI + "|" + SnewDate + "^" + EnewDate + "|" + filterBy;
                FreqObservationChartTableFiter(datas);

            } else {

                datas = patientPMI + "|" + todayDate + "|" + filterBy;
                FreqObservationChartTableFiter(datas);

            }

        }
        // Function For View Assement Select For Add Update Delete End



        // Function for Table Start 
        function FreqObservationChartTableFiter(viewData) {


            $('<div class="loading">Loading</div>').appendTo('body');


            var data = {
                dataString: viewData,
                methodName: "view"
            };

            $.ajax({
                url: "specialistTemplate/ONG/controller/freqObservationChartController.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    $('#tableFreqObservationChartDiv').html(datas);

                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        }
        // Function for Table End



        // Reset Function for Table Start
        function resetTableFreqObservationChart() {

            $("#tableFreqObservationChartDiv").html('<table class="table table-bordered" id="tableFreqObservationChartTable" style="width: 100%">\n\
                <thead>\n\
                    <th>Date</th>\n\
                    <th>Time</th>\n\
                    <th>Temperature</th>\n\
                    <th>Pulse</th>\n\
                    <th>Respiration</th>\n\
                    <th>BP</th>\n\
                    <th>Pupil Right</th>\n\
                    <th>Pupil Left</th>\n\
                    <th>Conscious State &amp; Remarks</th>\n\
                    <th>Drugs Given</th>\n\
                    <th>Doctor Approval</th>\n\
                    <th>Action</th>\n\
                    </thead>\n\
                    <tbody>\n\
                        <tr>\n\
                            <td colspan="12" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                        </tr>\n\
                    </tbody>\n\
                </table>');

            $('#freqObservationChartSelectAssessment').prop('selectedIndex', 0);

        }
        // Reset Function for Table End


// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //


// ----------------------------------------------------------------- Search Flexdata Drug Function ------------------------------------------------------------------------------------------- //


        function flexDataListFreqObserReinitializeSearch(fish) {


            $('#freqObservationChartModalDrugGiven').flexdatalist('destroy');


            $('#freqObservationChartModalDrugGiven').val(fish).flexdatalist({
                minLength: 1,
                searchIn: 'name',
                searchDelay: 2000,
                selectionRequired: true,
                url: "specialistTemplate/ONG/controller/nursingUseChartControllerSearchDrugCode.jsp",
                visibleProperties: 'name',
                cache: true,
                valueProperty: 'value',
                params: {
                    timeout: 3000,
                    success: function (result) {

                        if (result == null) {
                            $('#freqObservationChartModalDrugGivenSearchResultDIV').html('No Record');
                        }

                    }

                }
            });


            $("#freqObservationChartModalDrugGiven").on('before:flexdatalist.data', function (response) {
                $('#freqObservationChartModalDrugGivenSearchResultDIV').html('<img src="img/LoaderIcon.gif" />');
            });


            $("#freqObservationChartModalDrugGiven").on('after:flexdatalist.data', function (response) {
                $('#freqObservationChartModalDrugGivenSearchResultDIV').html('');
            });


            $("#freqObservationChartModalDrugGiven").on('select:flexdatalist', function (response) {
                $('#freqObservationChartModalDrugGivenSearchResultDIV').html('');
            });


        }


// ----------------------------------------------------------------- Search Flexdata Drug Function ------------------------------------------------------------------------------------------- //




// ---------------------------------------------------------------------------- Insert ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#ONG_4').on('click', '#frequentObservationAddNewRecord', function (e) {

            $('#freqObservationChartModalTitle').text("Add New Frequent Observation");
            $('#freqObservationChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="frequentObservationAddModalBtn" role="button">Add Items</button>');

            $('#freqObservationChartModalForm')[0].reset();

            var harini = new Date();
            var hariniyangtelahconvert = ("0" + harini.getDate()).slice(-2) + "/" + ("0" + (harini.getMonth() + 1)).slice(-2) + "/" + harini.getFullYear();
            $('#freqObservationChartModalDate').val(hariniyangtelahconvert);

            $('#freqObservationChartModalDrugGiven').val('');

            var val = $('#freqObservationChartModalDrugGiven').val().trim();

            flexDataListFreqObserReinitializeSearch(val);

        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#ong-freqObservationChart #freqObservationChartModal_btnAdd_or_btnUpdate_div').on('click', '#frequentObservationAddModalBtn', function (e) {
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
            var date = $('#freqObservationChartModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#freqObservationChartModalTime').val();
            var temperature = $('#freqObservationChartModalTemperature').val();
            var pulse = $('#freqObservationChartModalPulse').val();
            var respiration = $('#freqObservationChartModalRespiration').val();
            var bpSys = $('#freqObservationChartModalBPSys').val();
            var bpDia = $('#freqObservationChartModalBPDia').val();
            var pupilLeftReact = $('#freqObservationChartModalPupilLeftReact').val();
            var pupilLeftSize = $('#freqObservationChartModalPupilLeftSize').val();
            var pupilRightReact = $('#freqObservationChartModalPupilRightReact').val();
            var pupilRightSize = $('#freqObservationChartModalPupilRightSize').val();
            var consiousState = $('#freqObservationChartModalConsiousState').val();
            var drugGiven = $('#freqObservationChartModalDrugGiven').val();


            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;


            if (date === null || date === "") {

                bootbox.alert("Please Insert Assessment Date !!");

                removeRestrictionForModal();

            } else if (time === null || time === "") {

                bootbox.alert("Please Insert Assessment Time !!");

                removeRestrictionForModal();

            } else {

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00:00.0|" +
                        temperature + "|" + pulse + "|" + respiration + "|" + bpSys + "|" + bpDia + "|" + pupilLeftReact + "|" + pupilLeftSize + "|" +
                        pupilRightReact + "|" + pupilRightSize + "|" + consiousState + "|" + drugGiven + "||Pending";

                console.log(datas);

                $.ajax({
                    type: "post",
                    url: "specialistTemplate/ONG/controller/freqObservationChartController.jsp",
                    data: {dataString: datas, methodName: "add"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#ong-freqObservationChart").modal('hide');
                            FreqObservationChartTableFiterAUD();

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#ong-freqObservationChart").modal('hide');

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
        $('#tableFreqObservationChartDiv').on('click', '#tableFreqObservationChartTable #tableFreqObservationChartUpdateBtn', function (e) {


            $('#freqObservationChartModalTitle').text("Update Frequency Observation");
            $('#freqObservationChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="freqObservationChartUpdateModalBtn" role="button">Update Items</button>');


            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataFreqObservationCharthidden").val();

            var arrayData = rowData.split("|");
            var ti = arrayData[19].split(":");
            var newTi = ti[0];
            console.log(ti);
            $('#ONGFreqObservationChartPmi').val(arrayData[0]);
            $('#ONGFreqObservationChartHfc').val(arrayData[1]);
            $('#ONGFreqObservationChartEpisodeDate').val(arrayData[2]);
            $('#ONGFreqObservationChartEncounterDate').val(arrayData[3]);

            $('#freqObservationChartModalDate').val(arrayData[5]);
            $('#freqObservationChartModalTime').val(newTi);

            $('#freqObservationChartModalTemperature').val(arrayData[6]);
            $('#freqObservationChartModalPulse').val(arrayData[7]);
            $('#freqObservationChartModalRespiration').val(arrayData[8]);
            $('#freqObservationChartModalBPSys').val(arrayData[9]);
            $('#freqObservationChartModalBPDia').val(arrayData[10]);
            $('#freqObservationChartModalPupilLeftReact').val(arrayData[14]);
            $('#freqObservationChartModalPupilLeftSize').val(arrayData[13]);
            $('#freqObservationChartModalPupilRightReact').val(arrayData[12]);
            $('#freqObservationChartModalPupilRightSize').val(arrayData[11]);
            $('#freqObservationChartModalConsiousState').val(arrayData[15]);
            $('#freqObservationChartModalDrugGiven').val(arrayData[16]);


            var val = $('#freqObservationChartModalDrugGiven').val().trim();

            flexDataListFreqObserReinitializeSearch(val);

            $("#ong-freqObservationChart").modal('show');

        });
        // Function For Add Button End


        // Update Get Data And Send To Controller Function Start
        $('#ong-freqObservationChart #freqObservationChartModal_btnAdd_or_btnUpdate_div').on('click', '#freqObservationChartUpdateModalBtn', function (e) {
            e.preventDefault();

            var date = $('#freqObservationChartModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];


            var pmi_no = $('#ONGFreqObservationChartPmi').val();
            var hfc_cd1 = $('#ONGFreqObservationChartHfc').val();
            var epDate = $('#ONGFreqObservationChartEpisodeDate').val();
            var encounterDate = $('#ONGFreqObservationChartEncounterDate').val();

            var time = $('#freqObservationChartModalTime').val();

            var temperature = $('#freqObservationChartModalTemperature').val();
            var pulse = $('#freqObservationChartModalPulse').val();
            var respiration = $('#freqObservationChartModalRespiration').val();
            var bpSys = $('#freqObservationChartModalBPSys').val();
            var bpDia = $('#freqObservationChartModalBPDia').val();
            var pupilLeftReact = $('#freqObservationChartModalPupilLeftReact').val();
            var pupilLeftSize = $('#freqObservationChartModalPupilLeftSize').val();
            var pupilRightReact = $('#freqObservationChartModalPupilRightReact').val();
            var pupilRightSize = $('#freqObservationChartModalPupilRightSize').val();
            var consiousState = $('#freqObservationChartModalConsiousState').val();
            var drugGiven = $('#freqObservationChartModalDrugGiven').val();


            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00:00.0|" +
                    temperature + "|" + pulse + "|" + respiration + "|" + bpSys + "|" + bpDia + "|" + pupilLeftReact + "|" + pupilLeftSize + "|" +
                    pupilRightReact + "|" + pupilRightSize + "|" + consiousState + "|" + drugGiven + "||Pending";

            console.log(datas);

            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/controller/freqObservationChartController.jsp",
                data: {dataString: datas, methodName: "update"},
                timeout: 10000,
                success: function (result) {

                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#ong-freqObservationChart").modal('hide');
                        FreqObservationChartTableFiterAUD();

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Update");
                        $("#ong-freqObservationChart").modal('hide');

                    }
                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        });
        // Update Get Data And Send To Controller Function End

// ---------------------------------------------------------------------------- Update ------------------------------------------------------------------------------------------- //



// ---------------------------------------------------------------------------- Approve ------------------------------------------------------------------------------------------- //


        // Function For Approve Button Start
        $('#tableFreqObservationChartDiv').on('click', '#tableFreqObservationChartTable #tableFreqObservationChartPendingBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataFreqObservationCharthidden").val();


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
                            url: "specialistTemplate/ONG/controller/freqObservationChartController.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'approve'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Approve !!");
                                    FreqObservationChartTableFiterAUD();

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
        // Function For Approve Button End


// ---------------------------------------------------------------------------- Approve ------------------------------------------------------------------------------------------- //





// ---------------------------------------------------------------------------- Delete ------------------------------------------------------------------------------------------- //


        // Function For Delete Button Start
        $('#tableFreqObservationChartDiv').on('click', '#tableFreqObservationChartTable #tableFreqObservationChartDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataFreqObservationCharthidden").val();


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
                            url: "specialistTemplate/ONG/controller/freqObservationChartController.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'delete'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    FreqObservationChartTableFiterAUD();

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
        $("#freqObservationChartSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });
        // Date Picker For Initial End


        // Date Picker For Final Start
        $('#freqObservationChartSelectAssessmentStart').on('change', function () {

            $("#freqObservationChartSelectAssessmentEnd").datepicker("destroy");
            $('#freqObservationChartSelectAssessmentEnd').val('');
            var fromDate = $("#freqObservationChartSelectAssessmentStart").datepicker("getDate");

            $('#freqObservationChartSelectAssessmentEnd').datepicker({
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





// ---------------------------------------------------------------------------- Modal Restriction ------------------------------------------------------------------------------------------- //


        function removeRestrictionForModal() {

            $('#ong-freqObservationChart').css('overflow', 'auto');

        }

// ---------------------------------------------------------------------------- Modal Restriction ------------------------------------------------------------------------------------------- //


    });

</script>


