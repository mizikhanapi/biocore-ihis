<%-- 
    Document   : cartaPemerhatian
    Created on : Apr 17, 2017, 9:32:58 AM
    Author     : user
--%>
<div class="thumbnail">

    <!-- Tab Menu -->
    <div class="tabbable-panel cis-tab">
        <div class="tabbable-line">
            <ul class="nav nav-tabs ">
                <li class="active">
                    <a href="#Ortho-NursingInWard_1" data-toggle="tab" aria-expanded="false" >
                        <i class="fa fa-info-circle fa-lg"></i> Chart Observation </a>
                </li>
                <li class="">
                    <a href="#Ortho-NursingInWard_2" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-check fa-lg"></i> Chart 4H Observation for thrombophlebitis </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_3" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form Perawatan Ortopedik </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_4" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Chart Circulation </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_5" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Chart Daily Skin Assessment tool and Position </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_6" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Chart Diabetic </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_7" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Chart Fits </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_8" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Chart Redivac Drain </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_9" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Chart Urine </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_10" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form Wound Assessment </a>
                </li>
                <li>
                    <a href="#Ortho-NursingInWard_11" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Record Fluid Balance </a>
                </li>
            </ul>

            <div class="tab-content">
                <!-- content -->
                <div class="tab-pane active fade in" id="Ortho-NursingInWard_1">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#cobserved1" href="" class="soap-select" id="observationnewassessment"><i class="fa fa-comments  fa-li"></i>New Assessment</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="chartObservation.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_2">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#4hly" href="" class="soap-select" id="4hlynewassessment"><i class="fa fa-comments  fa-li" ></i>New Assessment</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="4hly.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_3">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#perawatan-ortho" href="" class="soap-select" id="trnewassessment"><i class="fa fa-comments  fa-li"></i> Add Perawatan Records</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="perawatan-ortho.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_4">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#circulationChart" href="" class="soap-select" id="chartCirculationAddNewRecord"><i class="fa fa-comments  fa-li"></i> Add Circulation Chart</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="chartCirculation.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_5">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#dailySkinTool" href="" class="soap-select" id="chartDailySkinToolAddNewRecord"><i class="fa fa-comments  fa-li"></i> Daily Skin Assessment Tool</a></li>
                        <li><a data-toggle="modal" data-target="#dailySkinPosition" href=""  class="soap-select" id="chartDailySkinPositionAddNewRecord"><i class="fa fa-history  fa-li"></i> Positioning Chart</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="chartDailySkin.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_6">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#DiabeticChart" href="" class="soap-select" id="diabeticChartAddNewRecord"><i class="fa fa-comments  fa-li"></i> Add New Diabetic Chart</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="DiabeticChart.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_7">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#FitsChart" href="" class="soap-select" id="newassessmentfit"><i class="fa fa-comments  fa-li"></i> Add New Fits Chart</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="FitsChart.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_8">
                    <ul class="soap-content nav">
                        <!--                        <li><a data-toggle="modal" data-target="#redivacDrainChart1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> 7am - 2pm</a></li>
                                                <li><a data-toggle="modal" data-target="#redivacDrainChart2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> 2pm - 9pm</a></li>
                                                <li><a data-toggle="modal" data-target="#redivacDrainChart3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> 9pm - 7am</a></li>-->
                        <li><a data-toggle="modal" data-target="#redivacDrainChart" href=""  class="soap-select" id="redivacnewassessment"><i class="fa fa-medkit  fa-li"></i>Add New Redivac Chart</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="redivacDrainChart.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_9">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#chartUrine" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Urine Info</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="chartUrine.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_10">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#woundAssessment" href="" class="soap-select" id="woundAssessmentAddNewRecord"><i class="fa fa-comments  fa-li"></i> Add New Wound Assessment</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="woundAssessment.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-NursingInWard_11">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#fluidBalanceIntake" href="" class="soap-select" id="fluidBalanceIntakeAddNewRecord"><i class="fa fa-comments  fa-li"></i> Intake (ml)</a></li>
                        <li><a data-toggle="modal" data-target="#fluidBalanceOutput" href=""  class="soap-select" id="fluidBalanceOutputAddNewRecord"><i class="fa fa-history  fa-li"></i> Output (ml)</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="fluidBalance.jsp"%>
                </div>
                <!-- content -->
            </div>

        </div>
    </div>
    <!-- Tab Menu -->
</div>


<%@include file="modal/chartObservation.jsp"%>
<%@include file="modal/4hly.jsp"%>
<%@include file="modal/perawatan-ortho.jsp"%>
<%@include file="modal/chartCirculation.jsp"%>
<%@include file="modal/chartDailySkin.jsp"%>
<%@include file="modal/DiabeticChart.jsp"%>
<%@include file="modal/FitsChart.jsp"%>
<%@include file="modal/redivacDrainChart.jsp"%>
<%@include file="modal/chartUrine.jsp"%>
<%@include file="modal/fluidBalance.jsp"%>
<%@include file="modal/woundAssessment.jsp"%>
<script src="../assets/js/btn.number.js" type="text/javascript"></script>
<script>
    $('#Ortho-NursingInWard_1').on('click', '#observationnewassessment', function (e) {
        e.preventDefault();
        $('#cobserved1 #btnNIWOBUPDATE').hide();
        $('#cobserved1 #btnNIWOBADD').show();
    });

    $('#Ortho-NursingInWard_2').on('click', '#4hlynewassessment', function (e) {
        e.preventDefault();
        $('#4hly #btnNIW4hlyUPDATE').hide();
        $('#4hly #btnNIW4hlyADD').show();
    });

    $('#Ortho-NursingInWard_3').on('click', '#trnewassessment', function (e) {
        e.preventDefault();
        $('#perawatan-ortho #btnNIWtruUPDATE').hide();
        $('#perawatan-ortho #btnNIWtrADD').show();
    });

    $('#Ortho-NursingInWard_7').on('click', '#newassessmentfit', function (e) {
        e.preventDefault();
        $('#FitsChart #btnNIWFitsUPDATE').hide();
        $('#FitsChart #btnNIWFitsADD').show();
    });

    $('#Ortho-NursingInWard_8').on('click', '#redivacnewassessment', function (e) {
        e.preventDefault();
        $('#redivacDrainChart #btnNIWredivacUPDATE').hide();
        $('#redivacDrainChart #btnNIWredivacADD').show();
    });
    
        $('#Ortho-NursingInWard_9').on('click', '#urinenewassessment', function (e) {
        e.preventDefault();
        $('#chartUrine #btnNIWurUPDATE').hide();
        $('#chartUrine #btnNIWurADD').show();
    });

</script>