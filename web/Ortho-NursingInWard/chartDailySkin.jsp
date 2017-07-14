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

// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //




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