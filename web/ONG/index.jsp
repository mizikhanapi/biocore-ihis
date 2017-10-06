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
        <div class="container-fluid margin-top-50px">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">

                    <div class="thumbnail">

                        <!-- Tab Menu -->
                        <div class="tabbable-panel cis-tab">
                            <div class="tabbable-line">
                                <ul class="nav nav-tabs ">
                                    <li class="active">
                                        <a href="#ONG_1" data-toggle="tab" aria-expanded="false">
                                            <i class="fa fa-info-circle fa-lg"></i> Personal Details </a>
                                    </li>
                                    <li class="">
                                        <a href="#ONG_2" data-toggle="tab" aria-expanded="false">
                                            <i class="fa fa-check fa-lg"></i> AnteNatal Record  </a>
                                    </li>
                                    <li >
                                        <a href="#ONG_3" data-toggle="tab" aria-expanded="true" id="CIS_PN_TAB">
                                            <i class="fa fa-th-list fa-lg"></i> Progress Notes </a>
                                    </li>
                                    <li >
                                        <a href="#ONG_4" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Frequent Observations Chart </a>
                                    </li>
                                    <li >
                                        <a href="#ONG_5" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Nursing Use </a>
                                    </li>
                                    <li >
                                        <a href="#ONG_6" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Nursery Feeding Chart </a>
                                    </li>
                                    <li >
                                        <a href="#ONG_7" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Maternity Unit </a>
                                    </li>
                                    <li >
                                        <a href="#ONG_8" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Labour Summary </a>
                                    </li>
                                    <li >
                                        <a href="#ONG_9" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Reports </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <!-- content -->
                                    <div class="tab-pane active fade in" id="ONG_1">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Gravity</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Past History</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Previous Pregnancy</a></li>
                                        </ul>

                                        <%//@include file="neuAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="ONG_2">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-anteNatal1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Blood Profile</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-anteNatal2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Care Plan</a></li>
                                        </ul>

                                        <%//@include file="neuObservation.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="ONG_3">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-progressNotes1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Clinical Notes</a></li>
                                        </ul>
                                        <%//@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="ONG_4">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-fObservationChart1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> T | P | R | BP</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-fObservationChart2" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Pupils</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-fObservationChart3" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Conscious State & Remarks</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-fObservationChart4" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Drugs Given</a></li>
                                        </ul>
                                        <%//@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="ONG_5">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Forms</a></li>
                                        </ul>
                                        <%//@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="ONG_6">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Type Strength of Milk</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Method of Feeding</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Aspirate Vomit</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Temperature</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Resp & HR (MIN)</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>PU</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>BO</a></li>
                                        </ul>
                                        <%//@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="ONG_7">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Intravenous Therapy</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Investigation</a></li>
                                        </ul>
                                        <%//@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="ONG_8">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Labour Onset</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Delivery Date & Time</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Labour Begin</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Conducterd & Witness</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Infant - Birth Record</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Mother - Transfer Observations</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Puerperium</a></li>
                                        </ul>
                                        <%//@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="ONG_9">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Discharge of Baby</a></li>
                                            <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Discharge Bill</a></li>
                                        </ul>
                                        <%//@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                </div>

                            </div>
                        </div>
                        <hr class="pemisah" />
                        <!-- Tab Menu -->
                    </div>
                </div>
            </div>
        </div>


        <%@include file="../CIS/specialistTemplate/ONG/personalDetail-modal.jsp" %>
        <%@include file="../CIS/specialistTemplate/ONG/anteNatal-modal.jsp" %>
        <%@include file="../CIS/specialistTemplate/ONG/progressNotes-modal.jsp" %>
        <%@include file="../CIS/specialistTemplate/ONG/frequentObservationsChart-modal.jsp" %>
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

        <script>
            $.get("index.jsp", function (data) {
                if (data !== null && data.length > 0 && data === 1) {
                    // refresh this page
                    document.location = document.location.href;
                }
            });
        </script>

    </body>
</html>
