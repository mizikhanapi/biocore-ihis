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
                                            <i class="fa fa-info-circle fa-lg"></i> Form Operation Record </a>
                                    </li>
                                    <li class="">
                                        <a href="#tab_default_2" data-toggle="tab" aria-expanded="false">
                                            <i class="fa fa-check fa-lg"></i> Form Consent for Operation </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_3" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Form Blood Transfusion Consent </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_4" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Form Incision Procedure </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_5" data-toggle="tab" aria-expanded="true">
                                            <i class="fa fa-th-list fa-lg"></i> Form Anaesthetic Record </a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <!-- content -->
                                    <div class="tab-pane active fade in" id="tab_default_1">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add new Record</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="neuAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_2">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Consent</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="neuObservation.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_3">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Consent</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->
                                    
                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_4">
                                        <ul class="soap-content nav">
                                            <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Procedure Incision</a></li>
                                        </ul>
                                        <hr class="pemisah" />
                                        <%@include file="PIRAssessment.jsp"%>
                                    </div>
                                    <!-- content -->

                                    <!-- content -->
                                    <div class="tab-pane fade" id="tab_default_5">
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
