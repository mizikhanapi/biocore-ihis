<%-- 
    Document   : analyse
    Created on : Oct 23, 2017, 11:05:08 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<div class="row">
    <div class="col-md-12">

        <div class="thumbnail">

            <!-- Tab Menu -->
            <div class="tabbable-panel cis-tab">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a data-toggle="tab" aria-expanded="false">
                                <i class="fa fa-info-circle fa-lg"></i> Analyse Patient </a>
                        </li>
                        <li class="pull-right">
                            <a href="#generic-soap" class="panelito general-exam">
                                <i class="fa fa-chevron-left"></i> Back to General Examination </a>
                        </li>

                    </ul>

                    <div class="tab-content">
                        <!-- content -->
                        <div class="tab-pane active fade in" id="Analyse_tab1">
                            <p class="pull-right">
                                <button class="btn btn-info" type="button" name="searchPatient" title="Show/Hide search area" onclick="$('#ANL_searchPatient').toggle();"><i class="fa fa-eye fa-lg"></i>&nbsp;Search</button>
                            </p>
                            <div class="row ANL-toggle" id="ANL_searchPatient">
                                <form class="form-horizontal" name="myFormApp" id="myFormApp">
                                    <!-- Select Basic -->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="selectbasic">ID Type</label>
                                        <div class="col-md-4">

                                            <select id="ANL_idType" name="idType" class="form-control">

                                            </select>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control input-md" id="ANL_idInputApp" name="idInputApp" placeholder="ID"/>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button class="btn btn-primary" type="button" id="ANL_btnSearch" name="searchPatient"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
                                    </div>
                                </form>
                            </div>

                            <div class="row ANL-toggle" id="ANL_div_info" style="display: none;">
                                <div id="ANL_div_patientBiodata"></div>
                            </div>

                            <hr class="pemisah" />

                            <div class="row">
                                <div class="col-md-8">
                                    <h4>Past Records</h4>
                                </div>
                                <div class="col-md-4" style="padding-top: 20px">
                                    <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
                                    <div class="col-sm-6 " style="padding-right: 0px;">
                                        <select class="form-control" id="ANL_viewBy">
                                            <option value="" selected disabled> --View by-- </option>
                                            <option value="0">Today</option>
                                            <option value="1">Yesterday</option>
                                            <option value="7">7 Days</option>
                                            <option value="30">30 Days</option>
                                            <option value="60">60 Days</option>
                                            <option value="x">Select date</option>
                                            <option value="all">All</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
                                    <div class="col-sm-12 form-inline" style="padding-right: 0px; display: none;" id="ANL_div_selectDate">
                                        <div class="form-group">
                                            <label for="exampleInputName2">Start</label>
                                            <input type="text" class="form-control" id="ANL_dateFrom" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail2">to</label>
                                            <input type="text" class="form-control" id="ANL_dateTo" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
                                        </div>
                                        <button type="submit" class="btn btn-default" id="ANL_btnSearchRecord"><i class="fa fa-search fa-lg"></i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="row table-guling" id="ANL_viewDiv" style="max-height: 500px; height: 100%; width: 100%; overflow-y: auto; overflow-style: panner;">

                            </div>

                        </div>
                        <!-- content -->

                    </div>

                </div>
            </div>

            <!-- Tab Menu -->
        </div>
    </div>
</div>
<!-- Add Modal Start -->
<div class="modal fade" id="ANL_modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 90%; min-height: 350px; height: auto;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="REP_modalTitle"></h3>
            </div>
            <div class="modal-body" id="REP_modalBody" style="overflow: auto; max-width: 1500px; width: 100%; margin: auto;">

                <div class="chart-container" style="height: 100%; min-height: 550px; width: 100%; min-width: 550px;">
                    <canvas id="ANL_canvas" style="height: 500px;"></canvas>
                </div>

                <!-- content goes here -->
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<!-- Add Modal End -->  
<div class="modal fade" id="ANL_modalImageView" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Result Image</h3>
            </div>
            <div class="modal-body">
                <h4 class="text-danger" id="ANL_imgText">The selected record has no image</h4>
                <div class="form-group" id="ANL_imgHolderDiv">
                    <img src="" id="ANL_imgHolder" alt="Exam Result" class="img-responsive" style="height: 100%; width: 100%">
                </div>

            </div>   
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    $(function () {
        $('#ANL_searchPatient #myFormApp #ANL_idType').load('search/SearchModal.jsp #myFormApp #idType option');
    });


    //--- initialise datepicker for from ----
    $('#ANL_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });

    //--- initialise datepicker for to after changes on from ------------
    $('#ANL_dateFrom').on('change', function () {

        $("#ANL_dateTo").datepicker("destroy");
        $('#ANL_dateTo').val('');
        var fromDate = $("#ANL_dateFrom").datepicker("getDate");

        $('#ANL_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });

    });

//    $('#ANL_viewBy').on('focus', function(){
//        var hiddenPat = $('#ANL_hidden_patientBio');
//        
//        if(hiddenPat.length < 1){
//            bootbox.alert("Search a patient first!");
//            return false;
//        }
//    });

    function ANL_gotPatient() {
        var hiddenPat = $('#ANL_hidden_patientBio');

        if (hiddenPat.length < 1) {
            bootbox.alert("Search a patient first!");
            return false;
        } else {
            return true;
        }
    }

    $('#ANL_viewBy').on('change', function () {

        var howTo = $(this).val();
        $('#ANL_dateFrom').val("");
        $("#ANL_dateTo").val("");

        if (howTo === 'x') {
            $('#ANL_div_selectDate').show();
        } else {
            $('#ANL_div_selectDate').hide();
            if (ANL_gotPatient()) {
                ANL_loadData();
            }
        }
    });

    $('#ANL_btnSearchRecord').on('click', function () {

        if (ANL_gotPatient()) {
            var dateFrom = $('#ANL_dateFrom').val();
            var dateTo = $('#ANL_dateTo').val();

            if (dateFrom === "" || dateTo === "") {
                bootbox.alert("Please choose the dates");
            } else {
                ANL_loadData();
            }
        }

    });

    function ANL_searchPatient(idType, id) {

        createScreenLoading();
        var data = {
            idType: idType,
            id: id
        };

        $.ajax({
            type: 'POST',
            timeout: 60000,
            data: data,
            url: "analyse/controller/getPatientBiodata.jsp",
            success: function (data, textStatus, jqXHR) {

                if (data.trim() === "0") {
                    bootbox.alert("Cannot find the patient. Try different ID.");
                } else {
                    $('#ANL_div_patientBiodata').html(data);
                    $('.ANL-toggle').hide();
                    $('#ANL_div_info').show();

                    $('#ANL_viewDiv').html("");
                    $('#ANL_viewBy').val("30");
                    ANL_loadData();
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert("Oops! " + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });

    }

    $('#ANL_btnSearch').on('click', function () {
        var idType = $('#ANL_idType').val();
        var id = $('#ANL_idInputApp').val();

        if (idType == null || idType === "" || id === "") {
            bootbox.alert("Please complete all inputs.");
        } else {
            ANL_searchPatient(idType, id);
        }
    });


    //------------------ retrieve data
    function ANL_loadData() {
        var patArr = $('#ANL_div_patientBiodata').find('#ANL_hidden_patientBio').val().split("|");
        var data = {
            day: $('#ANL_viewBy').val(),
            from: $('#ANL_dateFrom').val(),
            to: $('#ANL_dateTo').val(),
            pmiNo: patArr[0]
        };
        //console.log(data);
        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "analyse/controller/getPastRecord.jsp",
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === "0") {
                    bootbox.alert("This patient has no records on the selected time.");
                    $('#ANL_viewDiv').html("");
                } else {
                    $('#ANL_viewDiv').html(data);
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#ANL_viewDiv').html(errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });

    }


    //-------------------graph processing-------------------------------------
    function ANL_getRandomColor() {
        var letters = '0123456789ABCDEF'.split('');
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    function ANL_getUniqueColors(t)
    {
        t = parseInt(t);
        if (t < 2) {
//                throw new Error("'t' must be greater than 1.");
            var err = [];
            err.push(ANL_hsvToRgb(360, 200, 100));
            return err;
        }


        // distribute the colors evenly on
        // the hue range (the 'H' in HSV)
        var i = 360 / (t - 1);

        // hold the generated colors
        var r = [];
        var sv = 70;
        for (var x = 0; x < t; x++) {
            // alternate the s, v for more
            // contrast between the colors.
            sv = sv > 90 ? 70 : sv + 10;
            r.push(ANL_hsvToRgb(i * x, sv, sv));
        }
        return r;
    }

    function ANL_hsvToRgb(h, s, v) {
        var r, g, b;
        var i;
        var f, p, q, t;

        // Make sure our arguments stay in-range
        h = Math.max(0, Math.min(360, h));
        s = Math.max(0, Math.min(100, s));
        v = Math.max(0, Math.min(100, v));

        // We accept saturation and value arguments from 0 to 100 because that's
        // how Photoshop represents those values. Internally, however, the
        // saturation and value are calculated from a range of 0 to 1. We make
        // That conversion here.
        s /= 100;
        v /= 100;

        if (s == 0) {
            // Achromatic (grey)
            r = g = b = v;
            return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
        }

        h /= 60; // sector 0 to 5
        i = Math.floor(h);
        f = h - i; // factorial part of h
        p = v * (1 - s);
        q = v * (1 - s * f);
        t = v * (1 - s * (1 - f));

        switch (i) {
            case 0:
                r = v;
                g = t;
                b = p;
                break;

            case 1:
                r = q;
                g = v;
                b = p;
                break;

            case 2:
                r = p;
                g = v;
                b = t;
                break;

            case 3:
                r = p;
                g = q;
                b = v;
                break;

            case 4:
                r = t;
                g = p;
                b = v;
                break;

            default: // case 5:
                r = v;
                g = p;
                b = q;
        }

        return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
    }

    //--------------------------------- general lhr bar graph ----------------------------------------
    $('#ANL_viewDiv').on('click', '#ANL_btnGraph', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

        createScreenLoading();
        var dataArr = $(this).closest('td').find('.hidden');
        var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
        $('#ANL_canvas').html("");
        var canvas = $('#ANL_canvas');

        var lhrData = [];
        var lhrLabel = [];
        var lhrColour = [];

        var intT = 0;

        dataArr.each(function () {
            var tempArr = $(this).text().split("|");
            lhrLabel.push(tempArr[1]);
            lhrData.push(tempArr[2]);
            intT++;
            //lhrColour.push(ANL_getRandomColor());
        });
        console.log(intT);
        var lhrColourTemp = ANL_getUniqueColors(intT);
        console.log(lhrColourTemp.length);

        for (var tempI = 0; tempI < lhrColourTemp.length; tempI++) {
            var strRGBA = "rgba(" + lhrColourTemp[tempI][0] + ", " + lhrColourTemp[tempI][1] + ", " + lhrColourTemp[tempI][2] + ", 0.5)";
            lhrColour.push(strRGBA);
        }


        new Chart(canvas,
                {
                    type: "bar",
                    data: {
                        labels: lhrLabel,
                        datasets: [{
                                label: "Frequency",
                                data: lhrData,
                                fill: false,
                                backgroundColor: lhrColour,
                                borderColor: lhrColour,
                                borderWidth: 1
                            }]
                    },
                    options: {
                        legend: {
                            display: false,
                            position: 'top',
                            labels: {
                                boxWidth: 40,
                                fontColor: 'black'
                            }
                        },
                        scales: {
                            yAxes: [{
                                    ticks: {beginAtZero: true}
                                }],
                            xAxes: [{
                                    maxBarThickness: 30,
                                    categoryPercentage: 0.5,
                                    barPercentage: 1,
                                    stacked: false,
                                    beginAtZero: true,
                                    scaleLabel: {
                                        labelString: 'Description'
                                    },
                                    ticks: {
                                        stepSize: 1,
                                        min: 0,
                                        autoSkip: false
                                    }
                                }]
                        },
                        title: {
                            display: true,
                            fontSize: 20,
                            fontFamily: 'Arial',
                            text: chartTitle,
                            padding: 20
                        }
                    }
                });

        $('#ANL_modal').modal('show');
        destroyScreenLoading();

    });

    //------------------------------------------- general VTS line chart ---------------------------------------------------------------------

    $('#ANL_viewDiv').on('click', '#ANL_btnGraphLine', function () {
        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

        createScreenLoading();
        var dataArr = $(this).closest('td').find('.hidden');
        var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
        $('#ANL_canvas').html("");
        var canvas = $('#ANL_canvas');

        var lhrData = [];
        var lhrLabel = [];


        dataArr.each(function () {
            var tempArr = $(this).text().split("|");
            lhrLabel.push(tempArr[4]);
            lhrData.push(tempArr[3]);


        });


        var dataReading = {
            label: chartTitle,
            data: lhrData,
            lineTension: 0.3,
            fill: false,
            borderColor: 'purple',
            backgroundColor: 'transparent',
            pointBorderColor: 'purple',
            pointBackgroundColor: 'purple',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var chartOptions = {
            legend: {
                display: false,
                position: 'top',
                labels: {
                    boxWidth: 40,
                    fontColor: 'black'
                }
            },
            title: {
                display: true,
                fontSize: 20,
                fontFamily: 'Arial',
                text: chartTitle
            },
            tooltips: {
                mode: 'index',
                intersect: true
            },
            responsive: true,
            scales: {
                yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1"
                    }]
            }
        };

        var chartData = {
            labels: lhrLabel,
            datasets: [dataReading]
        };


        var lineChart = new Chart(canvas, {
            type: 'line',
            data: chartData,
            options: chartOptions
        });

        $('#ANL_modal').modal('show');
        destroyScreenLoading();

    });

    //--------------------------------------- blood pressure line chart -----------------------------------------------------
    $("#ANL_viewDiv").on('click', '#ANL_btnGraphBP', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

        createScreenLoading();
        var dataArr = $(this).closest('td').find('.hidden');
        var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
        $('#ANL_canvas').html("");
        var canvas = $('#ANL_canvas');

        var sitSysArr = [];
        var sitDiasArr = [];
        var sitPulseArr = [];
        var standSysArr = [];
        var standDiasArr = [];
        var standPulseArr = [];
        var supSysArr = [];
        var supDiasArr = [];
        var supPulseArr = [];
        var dateArr = [];
        var lhrColour = [];


        dataArr.each(function () {
            var tempArr = $(this).text().split("|");
            sitSysArr.push(tempArr[3]);
            sitDiasArr.push(tempArr[4]);
            sitPulseArr.push(tempArr[5]);
            standSysArr.push(tempArr[6]);
            standDiasArr.push(tempArr[7]);
            standPulseArr.push(tempArr[8]);
            supSysArr.push(tempArr[9]);
            supDiasArr.push(tempArr[10]);
            supPulseArr.push(tempArr[11]);
            dateArr.push(tempArr[12]);

        });


        var lhrColourTemp = ANL_getUniqueColors(9);

        for (var tempI = 0; tempI < lhrColourTemp.length; tempI++) {
            var strRGBA = "rgba(" + lhrColourTemp[tempI][0] + ", " + lhrColourTemp[tempI][1] + ", " + lhrColourTemp[tempI][2] + ", 0.8)";
            lhrColour.push(strRGBA);
        }


        var dataSitSys = {
            label: "Sit Systol (mmHg)",
            data: sitSysArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[0],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[0],
            pointBackgroundColor: lhrColour[0],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSitDias = {
            label: "Sit Diastol (mmHg)",
            data: sitDiasArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[1],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[1],
            pointBackgroundColor: lhrColour[1],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSitPulse = {
            label: "Sit pulse (bpm)",
            data: sitPulseArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[2],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[2],
            pointBackgroundColor: lhrColour[2],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataStandSys = {
            label: "Stand Systol (mmHg)",
            data: standSysArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[3],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[3],
            pointBackgroundColor: lhrColour[3],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataStandDias = {
            label: "Stand Diastol (mmHg)",
            data: standDiasArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[4],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[4],
            pointBackgroundColor: lhrColour[4],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataStandPulse = {
            label: "Stand pulse (bpm)",
            data: standPulseArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[5],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[5],
            pointBackgroundColor: lhrColour[5],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSupSys = {
            label: "Supine Systol (mmHg)",
            data: supSysArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[6],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[6],
            pointBackgroundColor: lhrColour[6],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSupDias = {
            label: "Supine Diastol (mmHg)",
            data: supDiasArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[7],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[7],
            pointBackgroundColor: lhrColour[7],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSupPulse = {
            label: "Supine pulse (bpm)",
            data: supPulseArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[8],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[8],
            pointBackgroundColor: lhrColour[8],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var chartOptions = {
            plugins: {
                valueOnGraph: false
            },
            legend: {
                display: true,
                position: 'top',
                labels: {
                    boxWidth: 40,
                    fontColor: 'black'
                }
            },
            title: {
                display: true,
                fontSize: 20,
                fontFamily: 'Arial',
                text: chartTitle
            },
            tooltips: {
                mode: 'index',
                intersect: true,
                position: 'nearest'
            },
            responsive: true,
            maintainAspectRatio: true,
            scales: {
                yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1"
                    }]
            }
        };

        var chartData = {
            labels: dateArr,
            datasets: [dataSitSys, dataSitDias, dataSitPulse, dataStandSys, dataStandDias, dataStandPulse, dataSupSys, dataSupDias, dataSupPulse]
        };


        var lineChart = new Chart(canvas, {
            type: 'line',
            data: chartData,
            options: chartOptions
        });

        $('#ANL_modal').modal('show');
        destroyScreenLoading();

    });

    //--------------------------------------- height weight line chart -----------------------------------------------------
    $("#ANL_viewDiv").on('click', '#ANL_btnGraphHtWt', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

        createScreenLoading();
        var dataArr = $(this).closest('td').find('.hidden');
        var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
        $('#ANL_canvas').html("");
        var canvas = $('#ANL_canvas');

        var heightArr = [];
        var weightArr = [];
        var dateArr = [];
        var lhrColour = [];


        dataArr.each(function () {
            var tempArr = $(this).text().split("|");
            weightArr.push(tempArr[3]);
            heightArr.push(tempArr[4]);
            dateArr.push(tempArr[5]);

        });


        var lhrColourTemp = ANL_getUniqueColors(2);

        for (var tempI = 0; tempI < lhrColourTemp.length; tempI++) {
            var strRGBA = "rgba(" + lhrColourTemp[tempI][0] + ", " + lhrColourTemp[tempI][1] + ", " + lhrColourTemp[tempI][2] + ", 0.8)";
            lhrColour.push(strRGBA);
        }


        var dataWeight = {
            label: "Weight(kg)",
            data: weightArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[0],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[0],
            pointBackgroundColor: lhrColour[0],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataHeight = {
            label: "Height(cm)",
            data: heightArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[1],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[1],
            pointBackgroundColor: lhrColour[1],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };


        var chartOptions = {
            legend: {
                display: true,
                position: 'top',
                labels: {
                    boxWidth: 40,
                    fontColor: 'black'
                }
            },
            title: {
                display: true,
                fontSize: 20,
                fontFamily: 'Arial',
                text: chartTitle
            },
            tooltips: {
                mode: 'index',
                intersect: true,
                position: 'nearest'
            },
            responsive: true,
            maintainAspectRatio: true,
            scales: {
                yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1"
                    }]
            }
        };

        var chartData = {
            labels: dateArr,
            datasets: [dataWeight, dataHeight]
        };


        var lineChart = new Chart(canvas, {
            type: 'line',
            data: chartData,
            options: chartOptions
        });

        $('#ANL_modal').modal('show');
        destroyScreenLoading();

    });

    // Define a plugin to provide data labels
    Chart.plugins.register({
        id: "valueOnGraph",
        afterDatasetsDraw: function (chart, easing) {
            // To only draw at the end of animation, check for easing === 1
            var ctx = chart.ctx;

            chart.data.datasets.forEach(function (dataset, i) {
                var meta = chart.getDatasetMeta(i);
                if (!meta.hidden) {
                    meta.data.forEach(function (element, index) {
                        // Draw the text in black, with the specified font
                        ctx.fillStyle = 'rgb(0, 0, 0)';

                        var fontSize = 16;
                        var fontStyle = 'normal';
                        var fontFamily = 'Helvetica Neue';
                        ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

                        // Just naively convert to string for now
                        var dataString = dataset.data[index].toString();

                        // Make sure alignment settings are correct
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'middle';

                        var padding = 5;
                        var position = element.tooltipPosition();
                        ctx.fillText(dataString, position.x, position.y - (fontSize / 2) - padding);
                    });
                }
            });
        }
    });

    //------- show image------------
    $("#ANL_viewDiv").on('click', '#ANL_btnViewImage', function () {
        var td = $(this).closest('td');
        var type = td.find("#ANL_resType").val();
        console.log(type);

        var input;
        if (type === "RIS") {
            var arrData = td.find("#ANL_hidden_res").val().split("|");
            input = {
                hfc_cd: arrData[2],
                pmi_no: arrData[5],
                encounter_date: arrData[6],
                code: arrData[7],
                type: type
            };
        }
        else if(type === "LIS"){
            var code = td.find('#ANL_hidden_res').val();
            input = {
                code:code,
                type:type
            };
        }
        else if(type === "OPT"){
            var arrData = td.find("#ANL_hidden_res").val().split("|");
            input = {
                type: type,
                pmi_no: arrData[8],
                order_no: arrData[6],
                hfc_cd : arrData[2],
                code : arrData[7]
            };
        }

        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "analyse/controller/getImage.jsp",
            data: input,
            dataType: 'json',
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                if (data.haveImage) {
                    $('#ANL_imgHolder').attr("src", data.src);
                    $('#ANL_imgHolderDiv').show();
                    $('#ANL_imgText').hide();
                } else {
                    $('#ANL_imgHolderDiv').hide();
                    $('#ANL_imgText').show();
                    console.log(data.query);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
                $('#ANL_modalImageView').modal('show');
            }
        });
    });

</script>