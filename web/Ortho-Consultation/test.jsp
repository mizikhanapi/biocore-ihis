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
                    <a href="#Ortho-Consultation_1" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-info-circle fa-lg"></i> Neurological Assessment Chart </a>
                </li>
                <li class="">
                    <a href="#Ortho-Consultation_2" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-check fa-lg"></i> Neurological Observation Chart  </a>
                </li>
                <li>
                    <a href="#Ortho-Consultation_3" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Pressure Injury Risk Assessment </a>
                </li>
                <li>
                    <a href="#Ortho-Consultation_4" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Physical Examination </a>
                </li>
                <li>
                    <a href="#Ortho-Consultation_5" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Reports </a>
                </li>
            </ul>

            <div class="tab-content">
                <!-- content -->
                <div class="tab-pane active fade in" id="Ortho-Consultation_1">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#neuAssessment1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Date & Time</a></li>
                        <li><a data-toggle="modal" data-target="#neuAssessment2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Muscle Power</a></li>
                        <li><a data-toggle="modal" data-target="#neuAssessment3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Sensory</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="neuAssessment.jsp"%>


                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Consultation_2">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#Neurosurgical0" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Date & Time</a></li>
                        <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Glosgow Coma Scale</a></li>
                        <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Blood Pressure</a></li>
                        <li><a data-toggle="modal" data-target="#Neurosurgical1" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Pupils</a></li>
                        <li><a data-toggle="modal" data-target="#Neurosurgical2" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Limb Movement</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="neuObservation.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Consultation_3">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#PIRAssessment1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> New Assessment</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="PIRAssessment.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Consultation_4">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Physical Exam</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="physicalExam.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Consultation_5">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Admit To Ward</a></li>
                        <li><a data-toggle="modal" data-target="#ong-pDetails2" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Form-Physiotherapy Referral</a></li>
                        <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Sijil Kerja Ringan</a></li>
                        <li><a data-toggle="modal" data-target="#ong-pDetails3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Referral Letter</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="con-report.jsp"%>
                </div>
                <!-- content -->
            </div>

        </div>
    </div>
    <!-- Tab Menu -->
</div>

<%@include file="modal/addNeurosurgical.jsp"%>
<%@include file="modal/neuAssessment.jsp"%>
<%@include file="modal/PIRAssessment.jsp"%>

<script src="../assets/js/btn.number.js" type="text/javascript"></script>