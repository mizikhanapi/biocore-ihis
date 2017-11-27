<%-- 
    Document   : anteNatal
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
--%>


<div id="nurseryFeedingChartMain">
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control" id="nurseryFeedingChartSelectAssessment">
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
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="nurseryFeedingChartSelectAssessmentStartEnd">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="nurseryFeedingChartSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="text" class="form-control" id="nurseryFeedingChartSelectAssessmentEnd" placeholder="14/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <button type="submit" class="btn btn-default" id="nurseryFeedingChartSelectAssessmentStartEndBtn"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>

    <div id="tableNurseryFeedingChartDiv" class="table-guling clear-patient">
        <table class="table table-bordered" id="tableNurseryFeedingChartTable" style="width: 100%">
            <thead>
            <th>Date</th>
            <th>Time</th>
            <th>Strength of Milk</th>
            <th>Method of Feeding</th>
            <th>Aspirate Vomit</th>
            <th>Temperature</th>
            <th>Respiration</th>
            <th>PU</th>
            <th>BO</th>
            <th>Remarks</th>
            <th>Approval</th>
            <th>Action</th>   
            </thead>
            <tbody>
                <tr>
                    <td colspan="12" align="center">No Record To Show<br>Please Select A History Assessment</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="specialistTemplate/ONG/nurseryFeeding-modal.jsp" />





<script>
    $('#nurseryFeedingChartModalFeedingMethod').on('change',function(){
        var jenissusu = $(this).val();
        if(jenissusu==="01"){
            $('#susupower').hide();
        }else{
            $('#susupower').show();
        }
    });
    $(document).ready(function () {


        // Disabling Start And End Date
        $("#nurseryFeedingChartSelectAssessmentStartEnd").hide();


// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //

        // Function For View Assement Select Start
        $('#nurseryFeedingChartSelectAssessment').on('change', function () {

            $("#nurseryFeedingChartSelectAssessmentStartEnd").hide();

            var patientName = $('#pName').text();
            var patientPMI = $('#pIC').text();
            var filterBy = $('#nurseryFeedingChartSelectAssessment').val();
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
                $('#nurseryFeedingChartSelectAssessment').prop('selectedIndex', 0);
            } else if (filterBy === "custom") {
                $("#nurseryFeedingChartSelectAssessmentStartEnd").show();
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

                NurseryFeedingChartTableFiter(datas);
                console.log(datas);

            }

        });

        $("#nurseryFeedingChartSelectAssessmentStartEndBtn").on('click', function () {

            var patientPMI = $('#pIC').text();
            var strtDate = $('#nurseryFeedingChartSelectAssessmentStart').val();
            var endDate = $('#nurseryFeedingChartSelectAssessmentEnd').val();

            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

            var data2 = patientPMI + "|" + SnewDate + "^" + EnewDate + "|custom";

            NurseryFeedingChartTableFiter(data2);
            console.log(data2);

        });
        // Function For View Assement Select End



        // Function For View Assement Select For Add Update Delete Start
        function NurseryFeedingChartTableFiterAUD() {

            var patientPMI = $('#pIC').text();
            var filterBy = $('#nurseryFeedingChartSelectAssessment').val();
            var selected = $("#nurseryFeedingChartSelectAssessment option:selected").text();
            var datas;
            var todayDate;

            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();

            todayDate = yy + "-" + mm + "-" + dd;


            if (selected === "View by") {

                resetTableNurseryFeedingChart();

            } else if (selected === "Select date") {

                var strtDate = $('#nurseryFeedingChartSelectAssessmentStart').val();
                var endDate = $('#nurseryFeedingChartSelectAssessmentEnd').val();

                var sDate = strtDate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = endDate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

                datas = patientPMI + "|" + SnewDate + "^" + EnewDate + "|" + filterBy;
                NurseryFeedingChartTableFiter(datas);

            } else {

                datas = patientPMI + "|" + todayDate + "|" + filterBy;
                NurseryFeedingChartTableFiter(datas);

            }

        }
        // Function For View Assement Select For Add Update Delete End



        // Function for Table Start 
        function NurseryFeedingChartTableFiter(viewData) {

            var data = {
                dataString: viewData,
                methodName: "view"
            };

            $.ajax({
                url: "specialistTemplate/ONG/controller/nurseryFeedingChartController.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    $('#tableNurseryFeedingChartDiv').html(datas);

                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        }
        // Function for Table End



        // Reset Function for Table Start
        function resetTableNurseryFeedingChart() {

            $("#tableNurseryFeedingChartDiv").html('<table class="table table-bordered" id="tableNurseryFeedingChartTable" style="width: 100%">\n\
                <thead>\n\
                <th>Date</th>\n\
                <th>Time</th>\n\
                <th>Strength of Milk</th>\n\
                <th>Method of Feeding</th>\n\
                <th>Aspirate Vomit</th>\n\
                <th>Temperature</th>\n\
                <th>Respiration</th>\n\
                <th>PU</th>\n\
                <th>BO</th>\n\
                <th>Remarks</th>\n\
                <th>Approval</th>\n\
                <th>Action</th>\n\
                </thead>\n\
                <tbody>\n\
                    <tr>\n\
                        <td colspan="12" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                    </tr>\n\
                </tbody>\n\
            </table>');

            $('#nurseryFeedingChartSelectAssessment').prop('selectedIndex', 0);

        }
        // Reset Function for Table End


// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //





// ---------------------------------------------------------------------------- Insert ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#ONG_6').on('click', '#nurseryFeedingChartAddNewRecord', function (e) {

            $('#nurseryFeedingChartModalTitle').text("Add New Nursery Feeding");
            $('#nurseryFeedingChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="nurseryFeedingChartAddModalBtn" role="button">Add Items</button>');

            $('#nurseryFeedingChartModalForm')[0].reset();

//            $("#nurseryFeedingChartModalDate").datepicker({
//                changeMonth: true,
//                changeYear: true,
//                maxDate: '+0d',
//                dateFormat: 'dd/mm/yy'
//            });
//
//            $('#nurseryFeedingChartModalTime').timepicker({
//                'timeFormat': 'HH:mm',
//                'scrollbar': 'true',
//                'minTime': '00:00',
//                'maxTime': '23:59',
//                'interval': 1
//            });

        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#ong-nurseryFeedingChart #nurseryFeedingChartModal_btnAdd_or_btnUpdate_div').on('click', '#nurseryFeedingChartAddModalBtn', function (e) {
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
            var date = $('#nurseryFeedingChartModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#nurseryFeedingChartModalTime').val();
            var milkStrength = $('#nurseryFeedingChartModalMilkStrength').val();
            var feedingMethod = $('#nurseryFeedingChartModalFeedingMethod').val();
            var aspirateVomit = $('#nurseryFeedingChartModalAspirateVomit').val();
            var temperature = $('#nurseryFeedingChartModalTemperature').val();
            var respiration = $('#nurseryFeedingChartModalRespiration').val();
            var pu = $('#nurseryFeedingChartModalPU').val();
            var bo = $('#nurseryFeedingChartModalBO').val();
            var remark = $('#nurseryFeedingChartModalRemark').val();

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

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00.0|" +
                        milkStrength + "|" + feedingMethod + "|" + aspirateVomit + "|" + temperature + "|" + respiration + "|" +
                        pu + "|" + bo + "|" + remark + "||Pending";

                console.log(datas);

                $.ajax({
                    type: "post",
                    url: "specialistTemplate/ONG/controller/nurseryFeedingChartController.jsp",
                    data: {dataString: datas, methodName: "add"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#ong-nurseryFeedingChart").modal('hide');
                            NurseryFeedingChartTableFiterAUD();

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#ong-nurseryFeedingChart").modal('hide');

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
        $('#tableNurseryFeedingChartDiv').on('click', '#tableNurseryFeedingChartTable #tableNurseryFeedingChartUpdateBtn', function (e) {


            $('#nurseryFeedingChartModalTitle').text("Update Nursery Feeding");
            $('#nurseryFeedingChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="nurseryFeedingChartUpdateModalBtn" role="button">Update Items</button>');

            $('#nurseryFeedingChartModalForm')[0].reset();

//            $("#nurseryFeedingChartModalDate").datepicker({
//                changeMonth: true,
//                changeYear: true,
//                maxDate: '+0d',
//                dateFormat: 'dd/mm/yy'
//            });

//            $('#nurseryFeedingChartModalTime').timepicker({
//                'timeFormat': 'HH:mm',
//                'scrollbar': 'true',
//                'minTime': '00:00',
//                'maxTime': '23:59',
//                'interval': 1
//            });



            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataNurseryFeedingCharthidden").val();

            var arrayData = rowData.split("|");
            var ti = arrayData[16].split(":");
            var newTi = ti[0];
            console.log(newTi);
            $('#ONGNurseryFeedingChartPmi').val(arrayData[0]);
            $('#ONGNurseryFeedingChartHfc').val(arrayData[1]);
            $('#ONGNurseryFeedingChartEpisodeDate').val(arrayData[2]);
            $('#ONGNurseryFeedingChartEncounterDate').val(arrayData[3]);

            $('#nurseryFeedingChartModalDate').val(arrayData[5]);
            $('#nurseryFeedingChartModalTime').val(newTi);

            
            $('#nurseryFeedingChartModalFeedingMethod').val(arrayData[7]);
            var jenissusu = arrayData[7];
            if(jenissusu==="01"){
                $('#susupower').hide();
                $('#nurseryFeedingChartModalMilkStrength').val("-");
            }else{
                $('#susupower').show();
                $('#nurseryFeedingChartModalMilkStrength').val(arrayData[6]);
            }
            $('#nurseryFeedingChartModalAspirateVomit').val(arrayData[8]);
            $('#nurseryFeedingChartModalTemperature').val(arrayData[9]);
            $('#nurseryFeedingChartModalRespiration').val(arrayData[10]);
            $('#nurseryFeedingChartModalPU').val(arrayData[11]);
            $('#nurseryFeedingChartModalBO').val(arrayData[12]);
            $('#nurseryFeedingChartModalRemark').val(arrayData[13]);

            $("#ong-nurseryFeedingChart").modal('show');

        });
        // Function For Add Button End


        // Update Get Data And Send To Controller Function Start
        $('#ong-nurseryFeedingChart #nurseryFeedingChartModal_btnAdd_or_btnUpdate_div').on('click', '#nurseryFeedingChartUpdateModalBtn', function (e) {
            e.preventDefault();

            var date = $('#nurseryFeedingChartModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];


            var pmi_no = $('#ONGNurseryFeedingChartPmi').val();
            var hfc_cd1 = $('#ONGNurseryFeedingChartHfc').val();
            var epDate = $('#ONGNurseryFeedingChartEpisodeDate').val();
            var encounterDate = $('#ONGNurseryFeedingChartEncounterDate').val();

            var time = $('#nurseryFeedingChartModalTime').val();
//            var sTime = time.split(':');
//            var newTime = sTime[0] + ":" + sTime[1];

            var milkStrength = $('#nurseryFeedingChartModalMilkStrength').val();
            var feedingMethod = $('#nurseryFeedingChartModalFeedingMethod').val();
            var aspirateVomit = $('#nurseryFeedingChartModalAspirateVomit').val();
            var temperature = $('#nurseryFeedingChartModalTemperature').val();
            var respiration = $('#nurseryFeedingChartModalRespiration').val();
            var pu = $('#nurseryFeedingChartModalPU').val();
            var bo = $('#nurseryFeedingChartModalBO').val();
            var remark = $('#nurseryFeedingChartModalRemark').val();

            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00:00.0|" +
                    milkStrength + "|" + feedingMethod + "|" + aspirateVomit + "|" + temperature + "|" + respiration + "|" +
                    pu + "|" + bo + "|" + remark + "||Pending";

            console.log(datas);


            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/controller/nurseryFeedingChartController.jsp",
                data: {dataString: datas, methodName: "update"},
                timeout: 10000,
                success: function (result) {

                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#ong-nurseryFeedingChart").modal('hide');
                        NurseryFeedingChartTableFiterAUD();

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Update");
                        $("#ong-nurseryFeedingChart").modal('hide');

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
        $('#tableNurseryFeedingChartDiv').on('click', '#tableNurseryFeedingChartTable #tableNurseryFeedingChartPendingBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataNurseryFeedingCharthidden").val();


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
                            url: "specialistTemplate/ONG/controller/nurseryFeedingChartController.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'approve'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Approve !!");
                                    NurseryFeedingChartTableFiterAUD();

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
        $('#tableNurseryFeedingChartDiv').on('click', '#tableNurseryFeedingChartTable #tableNurseryFeedingChartDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataNurseryFeedingCharthidden").val();


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
                            url: "specialistTemplate/ONG/controller/nurseryFeedingChartController.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'delete'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    NurseryFeedingChartTableFiterAUD();

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
        $("#nurseryFeedingChartSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });
        // Date Picker For Initial End


        // Date Picker For Final Start
        $('#nurseryFeedingChartSelectAssessmentStart').on('change', function () {

            $("#nurseryFeedingChartSelectAssessmentEnd").datepicker("destroy");
            $('#nurseryFeedingChartSelectAssessmentEnd').val('');
            var fromDate = $("#nurseryFeedingChartSelectAssessmentStart").datepicker("getDate");

            $('#nurseryFeedingChartSelectAssessmentEnd').datepicker({
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

            $('#ong-nurseryFeedingChart').css('overflow', 'auto');

        }

// ---------------------------------------------------------------------------- Modal Restriction ------------------------------------------------------------------------------------------- //





    });

</script>





<!--
<table class="table table-bordered" id="tableNurseryFeedingChartTable" style="width: 100%">
    <thead>
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Strength of Milk</th>
            <th>Method of Feeding</th>
            <th>Aspirate Vomit</th>
            <th>Temperature</th>
            <th>Respiration</th>
            <th>PU</th>
            <th>BO</th>
            <th>Remarks</th>
            <th>Approval</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="12" align="center">No Record To Show<br>Please Select A History Assessment</td>
        </tr>
    </tbody>
</table>-->