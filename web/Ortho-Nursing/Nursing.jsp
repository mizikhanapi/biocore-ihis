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
                                            <i class="fa fa-info-circle fa-lg"></i> Chart-Morse Scale Assessment </a>
                                    </li>
                                    <li class="">
                                        <a href="#tab_default_2" data-toggle="tab" aria-expanded="false">
                                            <i class="fa fa-check fa-lg"></i> Form-Nursing Assessment on Admission*(HOLD)  </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_3" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Form-Tindakan Perawatan Pesakit </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_4" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Progress Note </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <!-- content -->
                                    <div class="tab-pane active fade in" id="tab_default_1">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#morse1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> New Assessment</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="morsefallScale.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_2">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Date & Time</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Glosgow Coma Scale</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Blood Pressure</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Pupils</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Limb Movement</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%//@include file="morsefallScale.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_3">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#perawatan" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Rawatan / Perawatan</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="perawatan.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_4">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#continuation" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Continuation Sheet</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="continuation.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_5">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Admit To Ward</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Form-Physiotherapy Referral</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Sijil Kerja Ringan</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Referral Letter</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%//@include file="PIRAssessment.jsp"%>
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


        <%@include file="modal/morsefall.jsp"%>
        <%@include file="modal/perawatan.jsp"%>
        <%@include file="modal/continuation.jsp"%>
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
