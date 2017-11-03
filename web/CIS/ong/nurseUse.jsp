<%-- 
    Document   : anteNatal
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
--%>

<div id="chartNursingUseMain">
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control" id="chartNursingUseSelectAssessment">
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
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="chartNursingUseSelectAssessmentStartEnd">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="chartNursingUseSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="email" class="form-control" id="chartNursingUseSelectAssessmentEnd" placeholder="15/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <button type="submit" class="btn btn-default" id="chartNursingUseSelectAssessmentStartEndBtn"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>

    <div class="row" >
        <div class="col-md-12" >
            <div id="tableChartNursingUseMasterDiv" class="clear-patient">
                <h5>Nursing Use Master Chart</h5>
                <div class="table-guling">
                    <table class="table table-bordered" id="tableChartNursingUseMasterTable" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Master Date</th>
                                <th>Range</th>
                                <th>Drug Details</th>
                                <th>Supply</th>
                                <th>Approval</th>
                                <th>Status</th>
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



    <hr/>
    <div class="row">
        <div class="col-md-12" >     

            <div id="tableChartNursingUseDetailDiv">
            </div>

        </div>
    </div>


</div>

<jsp:include page="specialistTemplate/ONG/nurseryUse-modal.jsp" />


<script>

    $(document).ready(function () {


        // Disabling Start And End Date
        $("#chartNursingUseSelectAssessmentStartEnd").hide();



// ---------------------------------------------------------------------------- VIew Master ------------------------------------------------------------------------------------------- //



        // Function For View Assement Select Start
        $('#chartNursingUseSelectAssessment').on('change', function () {

            $("#chartNursingUseSelectAssessmentStartEnd").hide();

            var patientName = $('#pName').text();
            var patientPMI = $('#pIC').text();
            var filterBy = $('#chartNursingUseSelectAssessment').val();
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
                $('#chartNursingUseSelectAssessment').prop('selectedIndex', 0);

            } else if (filterBy === "custom") {

                $("#chartNursingUseSelectAssessmentStartEnd").show();

            } else {

                if (filterBy === "") {
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

                ChartNursingUseTableFiter(datas);
                console.log(datas);

            }

        });

        $("#chartNursingUseSelectAssessmentStartEndBtn").on('click', function () {

            var patientPMI = $('#pIC').text();
            var strtDate = $('#chartNursingUseSelectAssessmentStart').val();
            var endDate = $('#chartNursingUseSelectAssessmentEnd').val();
            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
            var data2 = patientPMI + "|" + SnewDate + "^" + EnewDate + "|custom";

            ChartNursingUseTableFiter(data2);
            console.log(data2);


        });
        // Function For View Assement Select End



        // Function For View Assement Select For Add Update Delete Start
        function ChartNursingUseTableFiterAUD() {

            var patientPMI = $('#pIC').text();
            var filterBy = $('#chartNursingUseSelectAssessment').val();
            var selected = $("#chartNursingUseSelectAssessment option:selected").text();
            var datas;
            var todayDate;
            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();
            todayDate = yy + "-" + mm + "-" + dd;


            if (selected === "View by") {

                resetTableChartNursingUse();

            } else if (selected === "Select date") {

                var strtDate = $('#chartNursingUseSelectAssessmentStart').val();
                var endDate = $('#chartNursingUseSelectAssessmentEnd').val();
                var sDate = strtDate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];
                var eDate = endDate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];
                datas = patientPMI + "|" + SnewDate + "^" + EnewDate + "|" + filterBy;

                ChartNursingUseTableFiter(datas);
                console.log(datas);


            } else {

                datas = patientPMI + "|" + todayDate + "|" + filterBy;
                ChartNursingUseTableFiter(datas);
                console.log(datas);

            }


            document.getElementById('nurseryUseMasterChartModalDrugName').value = "";
            document.getElementById('nurseryUseMasterChartModalDrugSupplyOne').value = "";
            document.getElementById('nurseryUseMasterChartModalDrugSupplyOneDispensedBy').value = "";
            document.getElementById('nurseryUseMasterChartModalDrugSupplyTwo').value = "";
            document.getElementById('nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').value = "";


        }
        // Function For View Assement Select For Add Update Delete End



        // Function for Table Start 
        function ChartNursingUseTableFiter(viewData) {

            var data = {
                dataString: viewData,
                methodName: "viewMaster"
            };

            $.ajax({
                url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    $('#tableChartNursingUseMasterDiv').html(datas);

                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

            $('#tableChartNursingUseDetailDiv').html('');

        }
        // Function for Table End



        // Reset Function for Table Start
        function resetTableChartNursingUse() {


            $("#tableChartNursingUseMasterDiv").html('<h5>Nursing Use Master Chart</h5>\n\
                <div class="table-guling">\n\
                    <table class="table table-bordered" id="tableChartNursingUseMasterTable" style="width: 100%">\n\
                        <thead>\n\
                            <tr>\n\
                                <th>Master Date</th>\n\
                                <th>Range</th>\n\
                                <th>Drug Details</th>\n\
                                <th>Supply</th>\n\
                                <th>Approval</th>\n\
                                <th>Status</th>\n\
                                <th>Action</th>\n\
                            </tr>\n\
                        </thead>\n\
                        <tbody>\n\
                            <tr>\n\
                                <td colspan="7" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                            </tr>\n\
                        </tbody>\n\
                    </table>\n\
                </div>');


            $('#chartNursingUseSelectAssessment').prop('selectedIndex', 0);


        }
        // Reset Function for Table End



// ---------------------------------------------------------------------------- VIew Master ------------------------------------------------------------------------------------------- //





// ---------------------------------------------------------------------------- Insert Master ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#ONG_5').on('click', '#nurseryUseMasterAddNewRecord', function (e) {

            $('#nurseryUseMasterChartModalTitle').text("Add New Nursery Use Master Record");
            $('#nurseryUseMasterChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="nurseryUseMasterAddModalBtn" role="button">Add Items</button>');

            document.getElementById("nurseryUseMasterChartModalForm").reset();

            $('#nurseryUseMasterChartModalDrugName').val('');
            $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBy').val('');
            $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').val('');

            var val1 = $('#nurseryUseMasterChartModalDrugName').val().trim();
            var val2 = $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBy').val().trim();
            var val3 = $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').val().trim();

            flexDataListNurseUseReinitializeSearchDrug(val1);
            flexDataListNurseUseReinitializeSearchUserID(val2 + "|" + val3);

            $("#nurseryUseMasterChartModalMasterDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            $('#nurseryUseMasterChartModalMasterTime').timepicker({
                'timeFormat': 'HH:mm',
                'scrollbar': 'true',
                'minTime': '00:00',
                'maxTime': '23:59',
                'interval': 1
            });

            $("#nurseryUseMasterChartModalStartDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            $("#nurseryUseMasterChartModalEndDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });


        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#ong-nurseryUseMaster #nurseryUseMasterChartModal_btnAdd_or_btnUpdate_div').on('click', '#nurseryUseMasterAddModalBtn', function (e) {
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

            var date = $('#nurseryUseMasterChartModalMasterDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#nurseryUseMasterChartModalMasterTime').val();

            var startDate = $('#nurseryUseMasterChartModalStartDate').val();
            var ssDate = startDate.split('/');
            var newStartDate = ssDate[2] + "-" + ssDate[1] + "-" + ssDate[0];

            var endDate = $('#nurseryUseMasterChartModalEndDate').val();
            var seDate = endDate.split('/');
            var newEndDate = seDate[2] + "-" + seDate[1] + "-" + seDate[0];

            var drugCode = $('#nurseryUseMasterChartModalDrugCode').val();
            var supplyOne = $('#nurseryUseMasterChartModalDrugSupplyOne').val();
            var supplyOneDispensedBy = $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBy').val();
            var supplyTwo = $('#nurseryUseMasterChartModalDrugSupplyTwo').val();
            var supplyTwoDispensedBy = $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').val();

            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;


            if (date === null || date === "") {

                bootbox.alert("Please Insert Assessment Date !!");

                removeRestrictionForModal();

            } else if (time === null || time === "") {

                bootbox.alert("Please Insert Assessment Time !!");

                removeRestrictionForModal();

            } else if (supplyOne !== "" && supplyOneDispensedBy === "") {

                bootbox.alert("Please Fill The Dispensed By For The Supply One !!");

                removeRestrictionForModal();

            } else if (supplyTwo !== "" && supplyTwoDispensedBy === "") {

                bootbox.alert("Please Fill The Dispensed By For The Supply Two !!");

                removeRestrictionForModal();

            } else if (supplyOne === "" && supplyOneDispensedBy !== "") {

                bootbox.alert("Please Fill The Dispensed Quantity For The Supply One !!");

                removeRestrictionForModal();

            } else if (supplyTwo === "" && supplyTwoDispensedBy !== "") {

                bootbox.alert("Please Fill The Dispensed Quantity For The Supply Two !!");

                removeRestrictionForModal();

            } else {

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00.0|" +
                        newStartDate + " 00:00:00.0|" + newEndDate + " 00:00:00.0|" + drugCode + "|" + supplyOne + "|" + supplyOneDispensedBy + "|" + supplyTwo + "|"
                        + supplyTwoDispensedBy + "||Pending";

                console.log(datas);

                $.ajax({
                    type: "post",
                    url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                    data: {dataString: datas, methodName: "addMaster"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#ong-nurseryUseMaster").modal('hide');
                            ChartNursingUseTableFiterAUD();

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#ong-nurseryUseMaster").modal('hide');

                        }
                    },
                    error: function (err) {
                        bootbox.alert("something wrong,error: " + err);
                    }
                });

            }
        });
        // Add Get Data And Send To Controller Function End



// ---------------------------------------------------------------------------- Insert Master ------------------------------------------------------------------------------------------- //






// ---------------------------------------------------------------------------- Update Master ------------------------------------------------------------------------------------------- //


        // Function For Update Button Start
        $('#tableChartNursingUseMasterDiv').on('click', '#tableChartNursingUseMasterTable #tableNursingUseMasterChartUpdateBtn', function (e) {


            $('#nurseryUseMasterChartModalTitle').text("Update Nursery Use Master");
            $('#nurseryUseMasterChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="nurseryUseMasterChartUpdateModalBtn" role="button">Update Items</button>');

            document.getElementById("nurseryUseMasterChartModalForm").reset();

            $("#nurseryUseMasterChartModalStartDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            $("#nurseryUseMasterChartModalEndDate").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });


            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataNursingUseMasterCharthidden").val();

            var arrayData = rowData.split("|");

            $('#ONGNurseryUseMasterChartPmi').val(arrayData[0]);
            $('#ONGNurseryUseMasterChartHfc').val(arrayData[1]);
            $('#ONGNurseryUseMasterChartEpisodeDate').val(arrayData[2]);
            $('#ONGNurseryUseMasterChartEncounterDate').val(arrayData[3]);
            $('#ONGNurseryUseMasterChartMasterDate').val(arrayData[22]);

            $('#nurseryUseMasterChartModalMasterDate').val(arrayData[5]);
            $('#nurseryUseMasterChartModalMasterTime').val(arrayData[17]);

            $('#nurseryUseMasterChartModalStartDate').val(arrayData[7]);
            $('#nurseryUseMasterChartModalEndDate').val(arrayData[9]);

            $('#nurseryUseMasterChartModalDrugCode').val(arrayData[10]);
            $('#nurseryUseMasterChartModalDrugName').val(arrayData[20]);
            $('#nurseryUseMasterChartModalDrugRoute').val(arrayData[24]);
            $('#nurseryUseMasterChartModalDrugStrength').val(arrayData[23]);
            $('#nurseryUseMasterChartModalDrugFrequency').val(arrayData[26]);
            $('#nurseryUseMasterChartModalDrugSupplyOne').val(arrayData[11]);
            $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBy').val(arrayData[12]);
            $('#nurseryUseMasterChartModalDrugSupplyTwo').val(arrayData[13]);
            $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').val(arrayData[14]);

            var val1 = $('#nurseryUseMasterChartModalDrugName').val().trim();
            var val2 = $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBy').val().trim();
            var val3 = $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').val().trim();

            flexDataListNurseUseReinitializeSearchDrug(val1);
            flexDataListNurseUseReinitializeSearchUserID(val2 + "|" + val3);

            $("#ong-nurseryUseMaster").modal('show');

        });
        // Function For Add Button End


        // Update Get Data And Send To Controller Function Start
        $('#ong-nurseryUseMaster #nurseryUseMasterChartModal_btnAdd_or_btnUpdate_div').on('click', '#nurseryUseMasterChartUpdateModalBtn', function (e) {
            e.preventDefault();

            var pmi_no = $('#ONGNurseryUseMasterChartPmi').val();
            var hfc_cd1 = $('#ONGNurseryUseMasterChartHfc').val();
            var epDate = $('#ONGNurseryUseMasterChartEpisodeDate').val();
            var encounterDate = $('#ONGNurseryUseMasterChartEncounterDate').val();
            var masterDate = $('#ONGNurseryUseMasterChartMasterDate').val();

            var date = $('#nurseryUseMasterChartModalMasterDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#nurseryUseMasterChartModalMasterTime').val();

            var startDate = $('#nurseryUseMasterChartModalStartDate').val();
            var ssDate = startDate.split('/');
            var newStartDate = ssDate[2] + "-" + ssDate[1] + "-" + ssDate[0];

            var endDate = $('#nurseryUseMasterChartModalEndDate').val();
            var seDate = endDate.split('/');
            var newEndDate = seDate[2] + "-" + seDate[1] + "-" + seDate[0];

            var drugCode = $('#nurseryUseMasterChartModalDrugCode').val();
            var supplyOne = $('#nurseryUseMasterChartModalDrugSupplyOne').val();
            var supplyOneDispensedBy = $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBy').val();
            var supplyTwo = $('#nurseryUseMasterChartModalDrugSupplyTwo').val();
            var supplyTwoDispensedBy = $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').val();


            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + masterDate + "|" +
                    newStartDate + " 00:00:00.0|" + newEndDate + " 00:00:00.0|" + drugCode + "|" + supplyOne + "|" +
                    supplyOneDispensedBy + "|" + supplyTwo + "|" + supplyTwoDispensedBy;

            console.log(datas);

            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                data: {dataString: datas, methodName: "updateMaster"},
                timeout: 10000,
                success: function (result) {

                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#ong-nurseryUseMaster").modal('hide');
                        ChartNursingUseTableFiterAUD();

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Update");
                        $("#ong-nurseryUseMaster").modal('hide');

                    }
                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        });
        // Update Get Data And Send To Controller Function End


// ---------------------------------------------------------------------------- Update Master ------------------------------------------------------------------------------------------- //






// ---------------------------------------------------------------------------- Delete Master ------------------------------------------------------------------------------------------- //


        // Function For Delete Button Start
        $('#tableChartNursingUseMasterDiv').on('click', '#tableChartNursingUseMasterTable #tableNursingUseMasterChartDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataNursingUseMasterCharthidden").val();


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
                            url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'deleteMaster'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    ChartNursingUseTableFiterAUD();

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


// ---------------------------------------------------------------------------- Delete Master ------------------------------------------------------------------------------------------- //








// ---------------------------------------------------------------------------- Approve MasterDetail ------------------------------------------------------------------------------------------- //


        // Function For Approve Button Start
        $('#tableChartNursingUseMasterDiv').on('click', '#tableChartNursingUseMasterTable #tableNursingUseMasterChartPendingBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataNursingUseMasterCharthidden").val();


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
                            url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'approveMasterDetail'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Approve !!");
                                    ChartNursingUseTableFiterAUD();

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


// ---------------------------------------------------------------------------- Approve MasterDetail ------------------------------------------------------------------------------------------- //





// ---------------------------------------------------------------------------- Search Flexdata ------------------------------------------------------------------------------------------- //


        function flexDataListNurseUseReinitializeSearchDrug(fish) {


            $('#nurseryUseMasterChartModalDrugName').flexdatalist('destroy');


            $('#nurseryUseMasterChartModalDrugName').val(fish).flexdatalist({
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
                            $('#nurseryUseMasterChartModalDrugNameSearchResultDIV').html('No Record');
                        }

                    }

                }
            });

            $("#nurseryUseMasterChartModalDrugName").on('before:flexdatalist.data', function (response) {
                $('#nurseryUseMasterChartModalDrugNameSearchResultDIV').html('<img src="img/LoaderIcon.gif" />');
            });

            $("#nurseryUseMasterChartModalDrugName").on('after:flexdatalist.data', function (response) {
                $('#nurseryUseMasterChartModalDrugNameSearchResultDIV').html('');
            });

            $("#nurseryUseMasterChartModalDrugName").on('select:flexdatalist', function (response) {
                $('#nurseryUseMasterChartModalDrugNameSearchResultDIV').html('');
            });

            $('#nurseryUseMasterChartModalDrugName').on('select:flexdatalist', function (event, set, options) {

                console.log(set.value);

                var data = {
                    search: set.value
                };

                console.log(data);

                $.ajax({
                    type: "post",
                    url: "specialistTemplate/ONG/controller/nursingUseChartControllerSearchDrugCodeResult.jsp",
                    timeout: 10000,
                    data: data,
                    success: function (result) {

                        var resultString = result.trim();
                        var arrayData = resultString.split("|");

                        console.log(arrayData);

                        $('#nurseryUseMasterChartModalDrugCode').val(arrayData[0]);
                        $('#nurseryUseMasterChartModalDrugStrength').val(arrayData[4]);
                        $('#nurseryUseMasterChartModalDrugFrequency').val(arrayData[5]);
                        $('#nurseryUseMasterChartModalDrugRoute').val(arrayData[2]);

                    },
                    error: function (err) {

                    }
                });


            });




        }

        function flexDataListNurseUseReinitializeSearchUserID(fish) {

            var arrayFish = fish.split("|");

            var fish0 = arrayFish[0];
            var fish1 = arrayFish[1];

            $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBy').flexdatalist('destroy');
            $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').flexdatalist('destroy');


            // Supply One //
            $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBy').val(fish0).flexdatalist({
                minLength: 1,
                searchIn: 'name',
                searchDelay: 2000,
                selectionRequired: true,
                url: "specialistTemplate/ONG/controller/nursingUseChartControllerSearchDispensedBy.jsp",
                visibleProperties: 'name',
                cache: true,
                valueProperty: 'value',
                params: {
                    timeout: 3000,
                    success: function (result) {

                        if (result == null) {
                            $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBySearchResultDIV').html('No Record');
                        }

                    }

                }
            });

            $("#nurseryUseMasterChartModalDrugSupplyOneDispensedBy").on('before:flexdatalist.data', function (response) {
                $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBySearchResultDIV').html('<img src="img/LoaderIcon.gif" />');
            });

            $("#nurseryUseMasterChartModalDrugSupplyOneDispensedBy").on('after:flexdatalist.data', function (response) {
                $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBySearchResultDIV').html('');
            });

            $("#nurseryUseMasterChartModalDrugSupplyOneDispensedBy").on('select:flexdatalist', function (response) {
                $('#nurseryUseMasterChartModalDrugSupplyOneDispensedBySearchResultDIV').html('');
            });
            // Supply One //


            // Supply Two //
            $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy').val(fish1).flexdatalist({
                minLength: 1,
                searchIn: 'name',
                searchDelay: 2000,
                selectionRequired: true,
                url: "specialistTemplate/ONG/controller/nursingUseChartControllerSearchDispensedBy.jsp",
                visibleProperties: 'name',
                cache: true,
                valueProperty: 'value',
                params: {
                    timeout: 3000,
                    success: function (result) {

                        if (result == null) {
                            $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBySearchResultDIV').html('No Record');
                        }

                    }

                }
            });

            $("#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy").on('before:flexdatalist.data', function (response) {
                $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBySearchResultDIV').html('<img src="img/LoaderIcon.gif" />');
            });

            $("#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy").on('after:flexdatalist.data', function (response) {
                $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBySearchResultDIV').html('');
            });

            $("#nurseryUseMasterChartModalDrugSupplyTwoDispensedBy").on('select:flexdatalist', function (response) {
                $('#nurseryUseMasterChartModalDrugSupplyTwoDispensedBySearchResultDIV').html('');
            });
            // Supply Two //

        }



// ---------------------------------------------------------------------------- Search Flexdata ------------------------------------------------------------------------------------------- //



        var detailsDataMasterForView;


// ---------------------------------------------------------------------------- VIew Detail ------------------------------------------------------------------------------------------- //


        // Function For View Button Start
        $('#tableChartNursingUseMasterDiv').on('click', '#tableChartNursingUseMasterTable #tableNursingUseMasterChartShowDetailBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataNursingUseMasterCharthidden").val();
            console.log(datas);

            var arrayData = datas.split("|");
            console.log(arrayData);


            var pmiNo = arrayData[0];
            var hfcNo = arrayData[1];
            var masterDateTime = arrayData[22];
            var status = arrayData[16];
            var masterDate = arrayData[5];
            var masterTime = arrayData[17];


            var datasss = pmiNo + "|" + hfcNo + "|" + masterDateTime + "|" + status + "|" + masterDate + "|" + masterTime;

            detailsDataMasterForView = datasss;

            ChartNursingUseTableDetailFiter(datasss);


        });
        // Function For View Button End


        // Function For View Detail Start
        function ChartNursingUseTableDetailFiter(datas) {

            var arrayData = datas.split('|');
            var status = arrayData[3];


            var data = {
                dataString: datas,
                methodName: "viewDetail"
            };

            $.ajax({
                url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    $('#tableChartNursingUseDetailDiv').html(datas);

                    if (status === "Approved") {
                        document.getElementById("tableChartNursingUseDetailAddButton").disabled = true;
                    } else {
                        document.getElementById("tableChartNursingUseDetailAddButton").disabled = false;
                    }


                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        }
        // Function For View Detail End


// ---------------------------------------------------------------------------- VIew Detail ------------------------------------------------------------------------------------------- //




// ---------------------------------------------------------------------------- Insert Detail ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#tableChartNursingUseDetailDiv').on('click', '#tableChartNursingUseDetailAddButton', function (e) {

            $('#nurseryUseDetailChartModalTitle').text("Add New Nursery Use Detail Record");
            $('#nurseryUseDetailChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="nurseryUseDetailAddModalBtn" role="button">Add Items</button>');

            $('#nurseryUseDetailChartModalForm')[0].reset();

            var arrayData = detailsDataMasterForView.split('|');

            $('#nurseryUseDetailChartModalMasterDate').val(arrayData[4]);
            $('#nurseryUseDetailChartModalMasterTime').val(arrayData[5]);

            $("#nurseryUseDetailChartModalDetailDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            $('#nurseryUseDetailChartModalDetailTime').timepicker({
                'timeFormat': 'HH:mm',
                'scrollbar': 'true',
                'minTime': '00:00',
                'maxTime': '23:59',
                'interval': 1
            });


        });
        // Function For Add Button End



        // Add Get Data And Send To Controller Function Start
        $('#ong-nurseryUseDetail #nurseryUseDetailChartModal_btnAdd_or_btnUpdate_div').on('click', '#nurseryUseDetailAddModalBtn', function (e) {
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

            var date = $('#nurseryUseDetailChartModalMasterDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#nurseryUseDetailChartModalMasterTime').val();

            var detailDate = $('#nurseryUseDetailChartModalDetailDate').val();
            var ssDate = detailDate.split('/');
            var newDetailDate = ssDate[2] + "-" + ssDate[1] + "-" + ssDate[0];

            var detailTime = $('#nurseryUseDetailChartModalDetailTime').val();

            var description = $('#nurseryUseDetailChartModalDescription').val();

            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;


            if (detailDate === null || detailDate === "") {

                bootbox.alert("Please Insert Assessment Date !!");

                removeRestrictionForModal();

            } else if (detailTime === null || detailTime === "") {

                bootbox.alert("Please Insert Assessment Time !!");

                removeRestrictionForModal();

            } else {

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + newDate + " " + time + ":00.0|" +
                        newDetailDate + " " + detailTime + ":00.0|" + description + "|Pending";

                console.log(datas);

                $.ajax({
                    type: "post",
                    url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                    data: {dataString: datas, methodName: "addDetail"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#ong-nurseryUseDetail").modal('hide');
                            ChartNursingUseTableDetailFiter(detailsDataMasterForView);

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#ong-nurseryUseDetail").modal('hide');

                        }
                    },
                    error: function (err) {
                        bootbox.alert("something wrong,error: " + err);
                    }
                });

            }
        });
        // Add Get Data And Send To Controller Function End


// ---------------------------------------------------------------------------- Insert Detail ------------------------------------------------------------------------------------------- //



// ---------------------------------------------------------------------------- Update Detail ------------------------------------------------------------------------------------------- //


        // Function For Update Button Start
        $('#tableChartNursingUseDetailDiv').on('click', '#tableChartNursingUseDetailTable #tableNursingUseDetailChartUpdateBtn', function (e) {

            $('#nurseryUseDetailChartModalTitle').text("Update Nursery Use Detail");
            $('#nurseryUseDetailChartModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="nurseryUseDetailChartUpdateModalBtn" role="button">Update Items</button>');

            document.getElementById("nurseryUseDetailChartModalForm").reset();


            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataNursingUseDetailCharthidden").val();

            var arrayData = rowData.split("|");

            $('#ONGNurseryUseDetailChartPmi').val(arrayData[0]);
            $('#ONGNurseryUseDetailChartHfc').val(arrayData[1]);
            $('#ONGNurseryUseDetailChartEpisodeDate').val(arrayData[2]);
            $('#ONGNurseryUseDetailChartEncounterDate').val(arrayData[3]);
            $('#ONGNurseryUseDetailChartMasterDate').val(arrayData[11]);
            $('#ONGNurseryUseDetailChartDetailDate').val(arrayData[12]);

            $('#nurseryUseDetailChartModalMasterDate').val(arrayData[5]);
            $('#nurseryUseDetailChartModalMasterTime').val(arrayData[9]);

            $('#nurseryUseDetailChartModalDetailDate').val(arrayData[7]);
            $('#nurseryUseDetailChartModalDetailTime').val(arrayData[10]);

            $('#nurseryUseDetailChartModalDescription').val(arrayData[8]);

            $("#ong-nurseryUseDetail").modal('show');

        });
        // Function For Add Button End


        // Update Get Data And Send To Controller Function Start
        $('#ong-nurseryUseDetail #nurseryUseDetailChartModal_btnAdd_or_btnUpdate_div').on('click', '#nurseryUseDetailChartUpdateModalBtn', function (e) {
            e.preventDefault();

            var pmi_no = $('#ONGNurseryUseDetailChartPmi').val();
            var hfc_cd1 = $('#ONGNurseryUseDetailChartHfc').val();
            var epDate = $('#ONGNurseryUseDetailChartEpisodeDate').val();
            var encounterDate = $('#ONGNurseryUseDetailChartEncounterDate').val();
            var masterDate = $('#ONGNurseryUseDetailChartMasterDate').val();
            var detailDate = $('#ONGNurseryUseDetailChartDetailDate').val();

            var description = $('#nurseryUseDetailChartModalDescription').val();


            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "|" + masterDate + "|" +
                    detailDate + "|" + description;

            console.log(datas);

            $.ajax({
                type: "post",
                url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                data: {dataString: datas, methodName: "updateDetail"},
                timeout: 10000,
                success: function (result) {

                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#ong-nurseryUseDetail").modal('hide');
                        ChartNursingUseTableDetailFiter(detailsDataMasterForView);

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Update");
                        $("#ong-nurseryUseDetail").modal('hide');

                    }
                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        });
        // Update Get Data And Send To Controller Function End


// ---------------------------------------------------------------------------- Update Detail ------------------------------------------------------------------------------------------- //





// ---------------------------------------------------------------------------- Delete Detail ------------------------------------------------------------------------------------------- //


        // Function For Delete Button Start
        $('#tableChartNursingUseDetailDiv').on('click', '#tableChartNursingUseDetailTable #tableNursingUseDetailChartDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataNursingUseDetailCharthidden").val();


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
                            url: "specialistTemplate/ONG/controller/nursingUseChartController.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'deleteDetail'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    ChartNursingUseTableDetailFiter(detailsDataMasterForView);

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


// ---------------------------------------------------------------------------- Delete Detail ------------------------------------------------------------------------------------------- //




// ---------------------------------------------------------------------------- Date ------------------------------------------------------------------------------------------- //

        // Date Functions Start
        // Date Picker For Initial Start
        $("#chartNursingUseSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });
        // Date Picker For Initial End

        // Date Picker For Final Start
        $('#chartNursingUseSelectAssessmentStart').on('change', function () {

            $("#chartNursingUseSelectAssessmentEnd").datepicker("destroy");
            $('#chartNursingUseSelectAssessmentEnd').val('');
            var fromDate = $("#chartNursingUseSelectAssessmentStart").datepicker("getDate");
            $('#chartNursingUseSelectAssessmentEnd').datepicker({
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

            $('#ong-nurseryUseMaster').css('overflow', 'auto');
            $('#ong-nurseryUseDetail').css('overflow', 'auto');

        }

// ---------------------------------------------------------------------------- Modal Restriction ------------------------------------------------------------------------------------------- //



    });








</script>
