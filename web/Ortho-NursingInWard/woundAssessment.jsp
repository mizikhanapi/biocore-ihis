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
    <div id="tableWoundAssessmentDiv">
        <table class="table table-bordered" id="tableWoundAssessmentTable" style="width: 100%">
            <tr>
                <th rowspan="2">Date</th>
                <th rowspan="2">Date of next dressing change</th>
                <th rowspan="2">Wound Dimensions in cm</th>
                <th rowspan="2">Exudate Level</th>
                <th rowspan="2">Exudate Colour</th>
                <th rowspan="2">Wound Bed in %</th>
                <th rowspan="2">Wound Edges</th>
                <th rowspan="2">Surrounding Skin</th>
                <th rowspan="2">Signs of Clinical Infaction</th>
                <th colspan="2">Patient Pain</th>
                <th rowspan="2">Wound Progress</th>
                <th rowspan="2">Dressing Plan</th>
                <th rowspan="2">Action</th>
            </tr>
            <tr>
                <th>During Removal</th>
                <th>While in place</td>
            </tr>
            <tr>
                <td colspan="14" align="center">No Record To Show<br>Please Select A History Assessment</td>
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

// ---------------------------------------------------------------------------- VIew ------------------------------------------------------------------------------------------- //



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


