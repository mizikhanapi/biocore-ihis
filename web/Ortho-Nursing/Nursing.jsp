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
                    <a href="#Ortho-Nursing_1" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-info-circle fa-lg"></i> Chart-Morse Scale Assessment </a>
                </li>
<!--                <li class="">
                    <a href="#Ortho-Nursing_2" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-check fa-lg"></i> Form-Nursing Assessment on Admission*(HOLD)  </a>
                </li>
                <li>
                    <a href="#Ortho-Nursing_3" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form-Tindakan Perawatan Pesakit </a>
                </li>-->
                <li>
                    <a href="#Ortho-Nursing_4" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Progress Note </a>
                </li>
            </ul>

            <div class="tab-content">
                <!-- content -->
                <div class="tab-pane active fade in" id="Ortho-Nursing_1">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#morse1" href="" class="soap-select" id="morse_assessment_modal"><i class="fa fa-comments  fa-li"></i> New Assessment</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="morsefallScale.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Nursing_2">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Assessment Date & Time</a></li>
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
                <div class="tab-pane fade" id="Ortho-Nursing_3">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#perawatan" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Rawatan / Perawatan</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="perawatan.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Nursing_4">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#continuation" href="" class="soap-select" id="proNote_modal_add"><i class="fa fa-comments  fa-li"></i> Add Continuation Sheet</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="continuation.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Nursing_5">
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
<%@include file="modal/morsefall.jsp"%>
<%@include file="modal/perawatan.jsp"%>
<%@include file="modal/continuation.jsp"%>

<script src="../assets/js/btn.number.js" type="text/javascript"></script>
<script type="text/javascript" src="../Ortho-Nursing/js/create_destroy_loading.js"></script>
<script type="text/javascript" src="../Ortho-Nursing/js/morsefallScale.js"></script>
<script type="text/javascript" src="../Ortho-Nursing/js/progressNote.js"></script>


