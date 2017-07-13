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


<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control" id="chartCirculationSelectAssessment">
                <option value="0">View by</option>
                <option value="1">Today</option>
                <option value="2">Yesterday</option>
                <option value="3">7 Days</option>
                <option value="4">30 Days</option>
                <option value="5">60 Days</option>
                <option value="6">Select date</option>
            </select>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" id="chartCirculationSelectAssessmentStartEnd">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="chartCirculationSelectAssessmentStart" placeholder="14/06/2017" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="chartCirculationSelectAssessmentEnd" placeholder="15/06/2017" style="margin-bottom: 0px !important;">
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
            } else if (filterBy === "6") {
                $("#chartCirculationSelectAssessmentStartEnd").show();
            } else {

                if (filterBy === "0") {
                    bootbox.alert("Please Choose Correct Assessment");
                } else if (filterBy === "1") {
                    //  $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|today";
                } else if (filterBy === "2") {
                    //  $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|yesterday";
                } else if (filterBy === "3") {
                    // $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|7day";
                } else if (filterBy === "4") {
                    //  $('<div class="loading">Loading</div>').appendTo('body');
                    datas = patientPMI + "|" + todayDate + "|30day";
                } else if (filterBy === "5") {
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
                dateFormat: 'dd/mm/yy'
            });

        });
        // Function For Add Button End


        // Add Get Data And Send To Controller Function Start
        $('#circulationChart #chartCirculationModal_btnAdd_or_btnUpdate_div').on('click', '#chartCirculationAddModalBtn', function (e) {
            e.preventDefault();

        });

        // Add Get Data And Send To Controller Function End



// ---------------------------------------------------------------------------- Insert ------------------------------------------------------------------------------------------- //





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


<!--       

<td>09/06/2017</td>
<td>10:27 AM</td>
<td>Blue</td>
<td>good</td>
<td>Hot</td>
<td>Forward</td>
<td>that guy~</td>
<td>
    <a id="" data-toggle="modal" data-target="#edit"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    &nbsp;
    <a id="" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
</td>

-->