<%-- 
    Document   : chartCirculation
    Created on : Jun 9, 2017, 10:13:20 AM
    Author     : Mizi K (UI)
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
%>

<div id="chartCirculationMain">
    <div class="row">
        <div class="col-md-8">
            <h4>Consultation Notes</h4>
        </div>
        <div class="col-md-4" style="padding-top: 20px">
            <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
            <div class="col-sm-6" style="padding-right: 0px;">
                <select class="form-control" id="chartCirculationSelectAssessment">
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
        <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="chartCirculationSelectAssessmentStartEnd">
            <div class="col-sm-12 form-inline" style="padding-right: 0px;">
                <div class="form-group">
                    <label for="exampleInputName2">Start</label>
                    <input type="text" class="form-control" id="chartCirculationSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">to</label>
                    <input type="email" class="form-control" id="chartCirculationSelectAssessmentEnd" placeholder="15/06/2017" style="margin-bottom: 0px !important;" readonly>
                </div>
                <button type="submit" class="btn btn-default" id="chartCirculationSelectAssessmentStartEndBtn"><i class="fa fa-search fa-lg"></i></button>
            </div>
        </div>
    </div>

    <div id="tableChartCirculationDiv">
        <table class="table table-bordered" id="tableChartCirculationTable" style="width: 100%">
            <thead>
            <th>Date</th>
            <th>Time</th>
            <th>Colour</th>
            <th>Sensation</th>
            <th>Hot / Cold</th>
            <th>Movement</th>
            <th>Others</th>
            <th>Action</th>
            </thead>
            <tbody>
                <tr>
                    <td colspan="8" align="center">No Record To Show<br>Please Select A History Assessment</td>
                </tr> 
            </tbody>

        </table>

    </div>
</div>
<script>

    $(document).ready(function () {


        // Disabling Start And End Date
        $("#chartCirculationSelectAssessmentStartEnd").hide();

// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //

        // Function For View Assement Select Start
        $('#chartCirculationSelectAssessment').on('change', function () {

            $("#chartCirculationSelectAssessmentStartEnd").hide();

            var patientName = $('#pName').text();
            var patientPMI = $('#pIC').text();
            var filterBy = $('#chartCirculationSelectAssessment').val();
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
                $('#chartCirculationSelectAssessment').prop('selectedIndex', 0);
            } else if (filterBy === "custom") {
                $("#chartCirculationSelectAssessmentStartEnd").show();
            } else {

                if (filterBy === "0") {
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

                ChartCircuTableFiter(datas);

            }

        });

        $("#chartCirculationSelectAssessmentStartEndBtn").on('click', function () {

            var patientPMI = $('#pIC').text();
            var strtDate = $('#chartCirculationSelectAssessmentStart').val();
            var endDate = $('#chartCirculationSelectAssessmentEnd').val();

            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

            var data2 = patientPMI + "|" + SnewDate + "^" + EnewDate + "|custom";

            ChartCircuTableFiter(data2);

        });
        // Function For View Assement Select End




        // Function For View Assement Select For Add Update Delete Start
        function ChartCircuTableFiterAUD() {

            var patientPMI = $('#pIC').text();
            var filterBy = $('#chartCirculationSelectAssessment').val();
            var selected = $("#chartCirculationSelectAssessment option:selected").text();
            var datas;
            var todayDate;

            var enDate = new Date();
            var dd = ("0" + enDate.getDate()).slice(-2);
            var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
            var yy = enDate.getFullYear();

            todayDate = yy + "-" + mm + "-" + dd;


            if (selected === "View by") {

                resetTableChartCirculation();

            } else if (selected === "Select date") {

                var strtDate = $('#chartCirculationSelectAssessmentStart').val();
                var endDate = $('#chartCirculationSelectAssessmentEnd').val();

                var sDate = strtDate.split('/');
                var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

                var eDate = endDate.split('/');
                var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

                datas = patientPMI + "|" + SnewDate + "^" + EnewDate + "|" + filterBy;
                ChartCircuTableFiter(datas);

            } else {

                datas = patientPMI + "|" + todayDate + "|" + filterBy;
                ChartCircuTableFiter(datas);

            }

        }
        // Function For View Assement Select For Add Update Delete End


        // Function for Table Start 
        function ChartCircuTableFiter(viewData) {

            var data = {
                dataString: viewData,
                methodName: "view"
            };

            $.ajax({
                url: "../Ortho-NursingInWard/controller/CirculationFunction.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    $('#tableChartCirculationDiv').html(datas);

                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        }
        // Function for Table End




        // Reset Function for Table Start
        function resetTableChartCirculation() {

            $("#tableChartCirculationDiv").html('<table class="table table-bordered" id="tableChartCirculationTable" style="width: 100%">\n\
                                    <thead>\n\
                                    <th>Date</th>\n\
                                    <th>Time</th>\n\
                                    <th>Colour</th>\n\
                                    <th>Sensation</th>\n\
                                    <th>Hot / Cold</th>\n\
                                    <th>Movement</th>\n\
                                    <th>Others</th>\n\
                                    <th>Action</th>\n\
                                    </thead>\n\
                                    <tbody>\n\
                                    <tr>\n\
                                    <td colspan="8" align="center">No Record To Show<br>Please Select A History Assessment</td>\n\
                                    </tr>\n\
                                    </tbody>\n\
                                    </table>');

            $('#chartCirculationSelectAssessment').prop('selectedIndex', 0);

        }
        // Reset Function for Table End


// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //





// ---------------------------------------------------------------------------- Insert ------------------------------------------------------------------------------------------- //


        // Function For Add Button Start
        $('#Ortho-NursingInWard_4').on('click', '#chartCirculationAddNewRecord', function (e) {

            $('#chartCirculationModalTitle').text("Add Circulation Chart");
            $('#chartCirculationModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="chartCirculationAddModalBtn" role="button">Add Items</button>');

            $('#chartCirculationForm')[0].reset();

            $("#chartCirculationModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#circulationChart #chartCirculationModal_btnAdd_or_btnUpdate_div').on('click', '#chartCirculationAddModalBtn', function (e) {
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
            var date = $('#chartCirculationModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var time = $('#chartCirculationModalTime').val();
            var colour = $('#chartCirculationModalColour').val();
            var sensation = $('#chartCirculationModalSensation').val();
            var hotcold = $("input[name='HotCold']:checked").val();
            var movement = $('#chartCirculationModalMovement').val();
            var others = $('#chartCirculationModalOthers').val();
            var pmi_no = pmiNo;
            var hfc_cd1 = hfc_cd;
            var epDate = episodeDate;


            if (date === null || date === "") {
                bootbox.alert("Please Insert Assessment Date !!");
            } else if (time === null || time === "") {
                bootbox.alert("Please Insert Assessment Time !!");
            } else {

                if (hotcold === undefined) {
                    hotcold = "";
                }

                var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "| | |" + newDate + " " + time + ":00.0|" + colour + "|" + sensation + "|" + hotcold + "|" + movement + "|" + others;
                console.log(datas);

                $.ajax({
                    type: "post",
                    url: "../Ortho-NursingInWard/controller/CirculationFunction.jsp",
                    data: {dataString: datas, methodName: "add"},
                    timeout: 10000,
                    success: function (result) {

                        if (result.trim() === 'true') {

                            bootbox.alert("Successfully Added !!");
                            $("#circulationChart").modal('hide');
                            ChartCircuTableFiterAUD();

                        } else if (result.trim() === 'false') {

                            bootbox.alert("Fail to Add");
                            $("#circulationChart").modal('hide');

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
        $('#tableChartCirculationDiv').on('click', '#tableChartCirculationTable #tableChartCirculationUpdateBtn', function (e) {


            $('#chartCirculationModalTitle').text("Update Circulation Chart");
            $('#chartCirculationModal_btnAdd_or_btnUpdate_div').html('<button type="button" class="btn btn-success btn-block btn-lg" id="chartCirculationUpdateModalBtn" role="button">Update Items</button>');

            $('#chartCirculationForm')[0].reset();

            $("#chartCirculationModalDate").datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: '+0d',
                dateFormat: 'dd/mm/yy'
            });

            //get the row value
            var row = $(this).closest("tr");
            var rowData = row.find("#dataChartCirculationhidden").val();

            var arrayData = rowData.split("|");

            $('#NIWChartCirculationPmi').val(arrayData[0]);
            $('#NIWChartCirculationHfc').val(arrayData[1]);
            $('#NIWChartCirculationEpisodeDate').val(arrayData[2]);
            $('#NIWChartCirculationEncounterDate').val(arrayData[3]);

            $('#chartCirculationModalDate').val(arrayData[7]);
            $('#chartCirculationModalTime').val(arrayData[13]);

            $('#chartCirculationModalColour').val(arrayData[8]);
            $('#chartCirculationModalSensation').val(arrayData[9]);
            $("input[name='HotCold'][value='" + arrayData[10] + "']").prop('checked', true);
            $('#chartCirculationModalMovement').val(arrayData[11]);
            $('#chartCirculationModalOthers').val(arrayData[12]);

            $("#circulationChart").modal('show');


        });
        // Function For Update Button End

        // Update Get Data And Send To Controller Function Start
        $('#circulationChart #chartCirculationModal_btnAdd_or_btnUpdate_div').on('click', '#chartCirculationUpdateModalBtn', function (e) {
            e.preventDefault();

            var date = $('#chartCirculationModalDate').val();
            var sDate = date.split('/');
            var newDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var pmi_no = $('#NIWChartCirculationPmi').val();
            var hfc_cd1 = $('#NIWChartCirculationHfc').val();
            var epDate = $('#NIWChartCirculationEpisodeDate').val();
            var encounterDate = $('#NIWChartCirculationEncounterDate').val();
            var time = $('#chartCirculationModalTime').val();
            var colour = $('#chartCirculationModalColour').val();
            var sensation = $('#chartCirculationModalSensation').val();
            var hotcold = $("input[name='HotCold']:checked").val();
            var movement = $('#chartCirculationModalMovement').val();
            var others = $('#chartCirculationModalOthers').val();


            if (hotcold === undefined) {
                hotcold = "";
            }

            var datas = pmi_no + "|" + hfc_cd1 + "|" + epDate + "|" + encounterDate + "| | |" + newDate + " " + time + ":00.0|" + colour + "|" + sensation + "|" + hotcold + "|" + movement + "|" + others;
            console.log(datas);

            $.ajax({
                type: "post",
                url: "../Ortho-NursingInWard/controller/CirculationFunction.jsp",
                data: {dataString: datas, methodName: "update"},
                timeout: 10000,
                success: function (result) {

                    if (result.trim() === 'true') {

                        bootbox.alert("Successfully Updated !!");
                        $("#circulationChart").modal('hide');
                        ChartCircuTableFiterAUD();

                    } else if (result.trim() === 'false') {

                        bootbox.alert("Fail to Update");
                        $("#circulationChart").modal('hide');

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


        // Function For Update Button Start
        $('#tableChartCirculationDiv').on('click', '#tableChartCirculationTable #tableChartCirculationDeleteBtn', function (e) {

            //get the row value
            var row = $(this).closest("tr");
            var datas = row.find("#dataChartCirculationhidden").val();


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
                            url: "../Ortho-NursingInWard/controller/CirculationFunction.jsp",
                            timeout: 10000,
                            data: {dataString: datas, methodName: 'delete'},
                            success: function (result) {

                                if (result.trim() === 'true') {

                                    bootbox.alert("Successfully Deleted !!");
                                    ChartCircuTableFiterAUD();

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
        $("#chartCirculationSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });
        // Date Picker For Initial End

        // Date Picker For Final Start
        $('#chartCirculationSelectAssessmentStart').on('change', function () {

            $("#chartCirculationSelectAssessmentEnd").datepicker("destroy");
            $('#chartCirculationSelectAssessmentEnd').val('');
            var fromDate = $("#chartCirculationSelectAssessmentStart").datepicker("getDate");

            $('#chartCirculationSelectAssessmentEnd').datepicker({
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
