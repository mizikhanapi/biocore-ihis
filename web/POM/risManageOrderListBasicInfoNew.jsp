<%-- 
    Document   : risManageOrderListBasicInfoNew
    Created on : Mar 28, 2017, 4:43:19 PM
    Author     : Shammugam
--%>

<h4>
    Basic Info
    <div class="pull-right">
        <button id="patientOrderShowVitalSign" name="patientOrderShowVitalSign" class="btn btn-default" data-toggle="modal" ><i class="fa fa-info-circle fa-lg"></i> &nbsp; Show Vital Signs </button>
    </div>
</h4>

<!--    <hr/>-->
<form class="form-horizontal" name="risManageOrderDetailContentBasicInfoForm" id="risManageOrderDetailContentBasicInfoForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">PMI No.</label>
                <div class="col-md-7">
                    <input id="rispatientpmino" name="rispatientpmino" type="text" placeholder="" readonly class="form-control input-md">   
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Name</label>
                <div class="col-md-7">
                    <input id="rispatientName" name="rispatientName" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">New IC No.</label>
                <div class="col-md-7">
                    <input id="rispatientnic" name="rispatientnic" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Gender</label>
                <div class="col-md-7">
                    <input id="rispatientGender" name="rispatientGender" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">D.O.B</label>
                <div class="col-md-7">
                    <input id="rispatientBdate" name="rispatientBdate" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Blood Type</label>
                <div class="col-md-7">
                    <input id="rispatientBtype" name="rispatientBtype" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

    </div>
</form>

<h5>
    ALLERGY LIST
</h5>

<div id="risManageAllergyListTableDiv" class="form-group">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%;cursor: pointer;" id="risManageAllergyListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th>HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>ALLERGY CODE</th>
        <th>ALLERGY DESCRIPTION</th>
        <th>COMMENT</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr/>

<h4>Diagnosis Info</h4>
<!--<hr/>-->
<div id="risManageDiagnosisListTableDiv" class="form-group">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%;cursor: pointer;" id="risManageDiagnosisListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th>HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>DIAGNOSIS CODE</th>
        <th>DIAGNOSIS DESCRIPTION</th>
        <th>COMMENT</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr/>

<h4>
    Request Info
    <span class="pull-right">
        <button id="risOrderDetailRefreshBtn" class="btn btn-default" title="Refresh Order Detail">
            <i class="fa fa-refresh fa-lg"></i>
        </button>
        <button id="risOrderNewRequestButton" class="btn btn-primary" >
            <i class="fa fa-plus fa-lg"></i>&nbsp; New Request
        </button>
    </span>
</h4>
<!--<hr/>-->
<form class="form-horizontal" name="risManageOrderDetailContentOrderInfoForm" id="risManageOrderDetailContentOrderInfoForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order No.</label>
                <div class="col-md-7">
                    <input id="risOrderNo" name="risOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                </div>
            </div>

        </div>


        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order Date</label>
                <div class="col-md-7">
                    <input id="risOrderDate" name="risOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                    <input id="posEpDate" type="hidden">
                </div>
            </div>

        </div>


        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Location</label>
                <div class="col-md-7">
                    <input id="risOrderLocationCode" name="risOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>


    </div>
</form>
<!--<hr/>-->
<h4>
    Order Detail
</h4>


<div id="risManageOrderDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%;cursor: pointer;" id="risManageOrderDetailsListTable">
        <thead>
        <th style="display: none">Hidden</th>    
        <th style="width: 5%">Procedure Code</th>
        <th style="width: 20%">Procedure Name</th>
        <th style="width: 5%">Price (RM)</th>
        <th style="width: 20%">Comment</th>
        <th style="width: 5%">Encounter Date</th>
        <th style="width: 5%">Status</th>
        <th style="width: 5%">Perform Procedure</th>
        <th style="width: 5%">Cancel Order</th>

        </thead>
        <tbody>

        </tbody>
    </table>
</div>
<hr/>
<h4>
    Item Preparation
</h4>
<div id="posItemPreparation" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%;cursor: pointer;" id="tablepositemprepare">
        <thead>
        <th style="width: 5%">Item Code</th>
        <th style="width: 20%">Item Name</th>
        <th style="width: 5%">Current Value</th>
        <th style="width: 20%">Quantity On hand</th>
        <th style="width: 5%">Request Quantity</th>
        <th style="width: 5%">Total Value</th>

        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<hr/>
<div class="pull-left" id="patientOrderDispenseButtonDiv" > 
    <!--<button class="btn btn-success " type="button" id="btnRISOrderSave" name="btnRISOrderSave" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Save &nbsp;</button>-->
    <!--<button class="btn btn-primary " type="button" id="btnRISOrderSendResults" name="btnRISOrderSendResults" > <i class="fa fa-print fa-lg" ></i>&nbsp; Send Result &nbsp;</button>-->
    <button class="btn btn-default " type="button" id="btnRISClearOrderDetail" name="btnRISClearOrderDetail" > <i class="fa fa-arrow-circle-left fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>
<div class="pull-right">
    <input type="hidden" id="RIS_callingID"/>
    <button class="btn btn-warning" type="button" id="btnRISCall" name="btnVerifySpecimenCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Call Patient &nbsp;</button>
    <button class="btn btn-danger" type="button" id="btnRISCancelCall" name="btnVerifySpecimenDeclineCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Decline Call Patient &nbsp;</button>
</div>
<script src="order_detail_js/order_detail_main.js?v1.2" type="text/javascript"></script>


<script>


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


    // Getting Order Id And Date Start
    $('#risOrderDetailContent').off('click', '#patientOrderShowVitalSign').on('click', '#patientOrderShowVitalSign', function (e) {

        e.preventDefault();

        var patientPMINo = $("#rispatientpmino").val();

        if (patientPMINo === "" || patientPMINo === null) {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            bootbox.alert("Please Select A Order First");

        } else {

            $('<div class="loading">Loading</div>').appendTo('body');

            var data = {
                patientPMINo: patientPMINo
            };

            $.ajax({
                url: "patientGetAllVitalSigns.jsp",
                type: 'POST',
                data: data,
                timeout: 3000,
                success: function (data) {

                    $("#patientOrderDetailsVitalSignContent").html(data);
                    $('#patientOrderDetailsVitalSignModal').modal('show');
                    $('.loading').hide();

                }
            });



        }

    });
    // Getting Order Id And Date End


    $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphBP', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

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

        $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

    });



    $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphLine', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

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

        $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

    });




    $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphHtWt', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

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
            datasets: [dataWeight]
        };


        var lineChart = new Chart(canvas, {
            type: 'line',
            data: chartData,
            options: chartOptions
        });

        $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

    });

</script>