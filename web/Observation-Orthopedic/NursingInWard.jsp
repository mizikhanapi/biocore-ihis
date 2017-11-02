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
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Date & Time</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Blood Presure</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Respiratory Rate</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Oxygen Saturation</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Pan Scale</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Comments</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="neuAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_2">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Date & Time</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Site of IV Canulation</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Pain Score</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Yes | No</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Additive</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Thrombo phlebitis</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> V.I.P. Score</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="neuObservation.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_3">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Perawatan Records</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_4">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Circulation Chart</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_5">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Daily Skin Assessment Tool</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Positioning Chart</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_6">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Diabetic Chart</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_7">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Fits Chart</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_8">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> 7am - 2pm</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> 2pm - 9pm</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> 9pm - 7am</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_9">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Urine Info</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_10">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add New Wound Assessment</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_11">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Intake (ml)</a></li>
                                            <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Output (ml)</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
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


        <%@include file="modal/addNeurosurgical.jsp"%>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

     
           
    </body>
</html>
