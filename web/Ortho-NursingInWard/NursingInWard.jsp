<%-- 
    Document   : cartaPemerhatian
    Created on : Apr 17, 2017, 9:32:58 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carta Pemerhatian</title>
        <%@include file="../assets/header.html"%>
        <link href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">

                    <div class="thumbnail">

                        <!-- Tab Menu -->
                        <div class="tabbable-panel cis-tab">
                            <div class="tabbable-line">
                                <ul class="nav nav-tabs ">
                                    <li class="active">
                                        <a href="#tab_default_1" data-toggle="tab" aria-expanded="false">
                                            <i class="fa fa-info-circle fa-lg"></i> Chart Observation </a>
                                    </li>
                                    <li class="">
                                        <a href="#tab_default_2" data-toggle="tab" aria-expanded="false">
                                            <i class="fa fa-check fa-lg"></i> Chart 4H Observation for thrombophlebitis </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_3" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Form Perawatan Ortopedik </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_4" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Chart Circulation </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_5" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Chart Daily Skin Assessment tool and Position </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_6" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Chart Diabetic </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_7" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Chart Fits </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_8" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Chart Redivac Drain </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_9" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Chart Urine </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_10" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Form Wound Assessment </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_11" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Record Fluid Balance </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <!-- content -->
                                    <div class="tab-pane active fade in" id="tab_default_1">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#cobserved1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Date & Time</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Blood Presure</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Respiratory Rate</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Oxygen Saturation</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Pan Scale</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Comments</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="chartObservation.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_2">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#4hly" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>New Assessment</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="4hly.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_3">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#perawatan-ortho" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Perawatan Records</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="perawatan-ortho.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_4">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#circulationChart" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Circulation Chart</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="chartCirculation.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_5">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#chartDailySkin1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Daily Skin Assessment Tool</a></li>
                                            <li><a data-toggle="modal" data-target="#chartDailySkin2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Positioning Chart</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="chartDailySkin.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_6">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#DiabeticChart" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Diabetic Chart</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="DiabeticChart.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_7">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#FitsChart" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Fits Chart</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="FitsChart.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_8">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#redivacDrainChart1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> 7am - 2pm</a></li>
                                            <li><a data-toggle="modal" data-target="#redivacDrainChart2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> 2pm - 9pm</a></li>
                                            <li><a data-toggle="modal" data-target="#redivacDrainChart3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> 9pm - 7am</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="redivacDrainChart.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_9">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#chartUrine" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Urine Info</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="chartUrine.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_10">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Wound Assessment</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%//@include file="fluidBalance.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_11">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#fluidBalance1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Intake (ml)</a></li>
                                            <li><a data-toggle="modal" data-target="#fluidBalance2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Output (ml)</a></li>
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
                </div>
            </div>
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
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <script>
            $('.btn-number').click(function (e) {
                e.preventDefault();

                fieldName = $(this).attr('data-field');
                type = $(this).attr('data-type');
                var input = $("input[name='" + fieldName + "']");
                var currentVal = parseInt(input.val());
                if (!isNaN(currentVal)) {
                    if (type == 'minus') {

                        if (currentVal > input.attr('min')) {
                            input.val(currentVal - 1).change();
                        }
                        if (parseInt(input.val()) == input.attr('min')) {
                            $(this).attr('disabled', true);
                        }

                    } else if (type == 'plus') {

                        if (currentVal < input.attr('max')) {
                            input.val(currentVal + 1).change();
                        }
                        if (parseInt(input.val()) == input.attr('max')) {
                            $(this).attr('disabled', true);
                        }

                    }
                } else {
                    input.val(0);
                }
            });
            $('.input-number').focusin(function () {
                $(this).data('oldValue', $(this).val());
            });
            $('.input-number').change(function () {

                minValue = parseInt($(this).attr('min'));
                maxValue = parseInt($(this).attr('max'));
                valueCurrent = parseInt($(this).val());

                name = $(this).attr('name');
                if (valueCurrent >= minValue) {
                    $(".btn-number[data-type='minus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    alert('Sorry, the minimum value was reached');
                    $(this).val($(this).data('oldValue'));
                }
                if (valueCurrent <= maxValue) {
                    $(".btn-number[data-type='plus'][data-field='" + name + "']").removeAttr('disabled')
                } else {
                    alert('Sorry, the maximum value was reached');
                    $(this).val($(this).data('oldValue'));
                }


            });
            $(".input-number").keydown(function (e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
                        // Allow: Ctrl+A
                                (e.keyCode == 65 && e.ctrlKey === true) ||
                                // Allow: home, end, left, right
                                        (e.keyCode >= 35 && e.keyCode <= 39)) {
                            // let it happen, don't do anything
                            return;
                        }
                        // Ensure that it is a number and stop the keypress
                        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                            e.preventDefault();
                        }
                    });
        </script>

    </body>
</html>
