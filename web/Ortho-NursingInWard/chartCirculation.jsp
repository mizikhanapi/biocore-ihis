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
            <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<hr/>

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

            }

            ChartCircuTableFiter(datas);
        });
        // Function For View Assement Select End



        // Function for Table Start 
        function ChartCircuTableFiter(viewData) {

            var data = {
                dataString: viewData,
                methodName: "view"
            };

            console.log(data);

            $.ajax({
                url: "../Ortho-NursingInWard/controller/CirculationFunction.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {
                    //$('#tableChartCirculationDiv').html(datas);
                },
                error: function (err) {
                    bootbox.alert("something wrong,error: " + err);
                }
            });

        }
        // Function for Table End



        // Date Functions Start

        // Date Picker For Start
        $("#chartCirculationSelectAssessmentStart").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            maxDate: '+0d'
        });

        // Date Picker For End
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

        // Date Functions End


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