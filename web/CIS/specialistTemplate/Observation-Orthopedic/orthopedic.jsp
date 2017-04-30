<%-- 
    Document   : cartaPemerhatian
    Created on : Apr 17, 2017, 9:32:58 AM
    Author     : mizi
--%>
<div class="row">
    <div class="col-md-12">
        <div class="thumbnail">

            <!-- Tab Menu -->
            <div class="tabbable-panel cis-tab">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">
                        <li class="active">
                            <a href="#neuassessment" data-toggle="tab" aria-expanded="false">
                                <i class="fa fa-info-circle fa-lg"></i> Neurological Assessment Chart </a>
                        </li>
                        <li class="">
                            <a href="#neuobservation" data-toggle="tab" aria-expanded="false">
                                <i class="fa fa-check fa-lg"></i> Neurological Observation Chart  </a>
                        </li>
                        <li >
                            <a href="#PIRA" data-toggle="tab" aria-expanded="true">
                                <i class="fa fa-th-list fa-lg"></i> Pressure Injury Risk Assessment </a>
                        </li>
                    </ul>

                    <div class="tab-content">
                        <!-- content -->
                        <div class="tab-pane active fade in" id="neuassessment">
                            <%@include file="neuAssessment.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="neuobservation">
                            <%@include file="neuObservation.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="PIRA">
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
<%@include file="modal/addNeurosurgical.jsp"%>