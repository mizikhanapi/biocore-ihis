<%-- 
    Document   : ong_ward
    Created on : Jan 18, 2018, 9:26:58 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<div class="row">
    <div class="col-md-12">

        <div class="thumbnail">

            <!-- Tab Menu -->
            <div class="tabbable-panel cis-tab">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs ">

                        <li class="active">
                            <a href="#ONG_4" data-toggle="tab" aria-expanded="true" id="frequentObserbationTab">
                                <i class="fa fa-th-list fa-lg"></i> Frequent Observations Chart </a>
                        </li>
                        <li >
                            <a href="#ONG_5" data-toggle="tab" aria-expanded="true" id="nursingUseTab">
                                <i class="fa fa-th-list fa-lg"></i> Nursing Use </a>
                        </li>
                        <li >
                            <a href="#ONG_6" data-toggle="tab" aria-expanded="true" id="nurseryFeedingCharttab">
                                <i class="fa fa-th-list fa-lg"></i> Nursery Feeding Chart </a>
                        </li>
                        <li >
                            <a href="#ONG_7" data-toggle="tab" aria-expanded="true" id="maternityUnitTab">
                                <i class="fa fa-th-list fa-lg"></i> Maternity Unit </a>
                        </li>
                        <li >
                            <a href="#ONG_8" data-toggle="tab" aria-expanded="true" id="LabourSumaaryTab">
                                <i class="fa fa-th-list fa-lg"></i> Labour Summary </a>
                        </li>
                        <li >
                            <a href="#ONG_9" data-toggle="tab" aria-expanded="true" id="reportTab">
                                <i class="fa fa-th-list fa-lg"></i> Reports </a>
                        </li>
                    </ul>

                    <div class="tab-content">

                        <!-- content -->
                        <div class="tab-pane active fade in" id="ONG_4">
                            <ul class="soap-content nav">
                                <li><a data-toggle="modal" data-target="#ong-freqObservationChart" href="" class="soap-select" id="frequentObservationAddNewRecord"><i class="fa fa-comments  fa-li"></i>Add New Record</a></li>
                            </ul>
                            <hr class="pemisah" />
                            <%@include file="ong/frequentObservation.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="ONG_5">
                            <ul class="soap-content nav">
                                <li><a data-toggle="modal" data-target="#ong-nurseryUseMaster" id="nurseryUseMasterAddNewRecord" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Add Master</a></li>
                            </ul>
                            <hr class="pemisah" />
                            <%@include file="ong/nurseUse.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="ONG_6">
                            <ul class="soap-content nav">
                                <li><a data-toggle="modal" data-target="#ong-nurseryFeedingChart" href="" class="soap-select" id="nurseryFeedingChartAddNewRecord"><i class="fa fa-comments  fa-li"></i>Add New Record</a></li>
                            </ul>
                            <hr class="pemisah" />
                            <%@include file="ong/nurseryFeeding.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="ONG_7">
                            <ul class="soap-content nav">
                                <li><a data-toggle="modal" data-target="#ong-maternityUnit1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Intravenous Therapy</a></li>
                                <li><a data-toggle="modal" data-target="#ong-maternityUnit2" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Investigation</a></li>
                            </ul>
                            <hr class="pemisah" />
                            <%@include file="ong/maternityUnit.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="ONG_8">
                            <ul class="soap-content nav">
                                <li><a data-toggle="modal" data-target="#LS_labourModal" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>New Summary</a></li>
                                <!--                                <li><a data-toggle="modal" data-target="#ong-labourSummary2" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Delivery Date & Time</a></li>
                                                                <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Labour Begin</a></li>
                                                                <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Conducterd & Witness</a></li>
                                                                <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Infant - Birth Record</a></li>
                                                                <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Mother - Transfer Observations</a></li>
                                                                <li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Puerperium</a></li>-->
                            </ul>
                            <hr class="pemisah" />
                            <%@include file="ong/labourSummary.jsp"%>
                        </div>
                        <!-- content -->

                        <!-- content -->
                        <div class="tab-pane fade" id="ONG_9">
                            <ul class="soap-content nav">
                                <li><a id="DB_dischargeAddModal" class="soap-content" style="cursor: pointer;"><i class="fa fa-comments  fa-li"></i>Discharge of Baby</a></li>
                                <!--<li><a data-toggle="modal" data-target="#CIS01000001" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Discharge Bill</a></li>-->
                            </ul>
                            <%@include file="ong/dischargeBaby.jsp"%>
                        </div>
                        <!-- content -->
                    </div>

                </div>
            </div>

            <!-- Tab Menu -->
        </div>
    </div>
</div>




