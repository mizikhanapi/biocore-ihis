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
                        <li><a data-toggle="modal" data-target="#neuAssessment1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Assessment Date & Time</a></li>
                        <li id="musclePower"><a data-toggle="modal" data-target="#neuAssessment2" href=""  class="musclePoser"><i class="fa fa-history  fa-li"></i> Muscle Power</a></li>
                        <li><a data-toggle="modal" data-target="#neuAssessment3" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Sensory</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="neuAssessment.jsp"%>
                    <!--                    <script>
                                            $('#musclePower').on('click', '.musclePoser', function () {
                                                //$('#actionPE').hide();
                                                //$('#updatePE').hide();
                                                //$('#ortho_physical_exam').show();
                                            });
                                        </script>-->

                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Consultation_2">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#Neurosurgical0" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i>Observation Date & Time</a></li>
                        <li id="glosgow_coma_scale"><a data-toggle="modal" data-target="#CIS020002" href=""  class="gcs"><i class="fa fa-history  fa-li"></i> Glosgow Coma Scale</a></li>
                        <li id="blood_pressure"><a data-toggle="modal" data-target="#CIS020003" href=""  class="blood_pressure"><i class="fa fa-medkit  fa-li"></i> Blood Pressure</a></li>
                        <li><a data-toggle="modal" data-target="#Neurosurgical1" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Pupils</a></li>
                        <li><a data-toggle="modal" data-target="#Neurosurgical2" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Limb Movement</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="neuObservation.jsp"%>


                    <script>
                        $('#blood_pressure').on('click', '.blood_pressure', function () {
                            $("#neuAssessment2").load("../Ortho-Consultation/modal/neuAssessment.jsp");
                            //$('#actionPE').hide();
                            //$('#updatePE').hide();
                            //$('#ortho_physical_exam').show();
                        });
                    </script>
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
                        <li id="physical"><a data-toggle="modal" data-target="#CIS020009" href="" class="physical_exam"><i class="fa fa-comments  fa-li"></i>New Examination</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="physicalExam.jsp"%>

                    <script>
                        $('#physical').on('click', '.physical_exam', function () {
                            $('#actionPE').hide();
                            $('#updatePE').hide();
                            $('#ortho_physical_exam').show();
                        });
                    </script>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-Consultation_5">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#ong-pDetails1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Admit To Ward</a></li>
                        <li><a id="PhysoitherpyReferralForm" data-toggle="modal" data-target="#PhysoitherpyReferralFormModel" href=""  class="soap-select"><i class="fa fa-history  fa-li"></i> Form-Physiotherapy Referral</a></li>
                        <li><a id="SijilKerjaRinganForm" data-toggle="modal" data-target="#AddSijilKerjaRinganModel" href=""  class="soap-select"><i class="fa fa-medkit  fa-li"></i> Sijil Kerja Ringan</a></li>
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
<script>
    $('#blood_pressure').on('click', '.blood_pressure', function () {
        $('#bloodPressure').hide();
        $('#updateBloodP').hide();
        $('#actionBloodP').hide();
        $('#BP_setting').hide();
        $('#ortho_actionBloodP').show();
    });
    $('#glosgow_coma_scale').on('click', '.gcs', function () {
        $('#updatePGSC').hide();
        $('#actionPGSC').hide();
        $('#ortho_actionPGSC').show();
    });

</script>
<%@include file="report-PhysiotherapyReferral.jsp"%>
<%@include file="report-SijilKerjaRingan.jsp"%>
<%@include file="modal/AddSijilKerjaRingan.jsp"%>


<script>
    var ddMMyyyyHHmmss, HHmmss, ddMMyyyy, timeStamp;


    $(document).ready(function () {

        searching("tCISSubDGSSearchReport", "tCISSubDGSSearchLoadingReport", "../CIS/search/ResultDGSSearch.jsp", "../CIS/search/ResultDGSSearchCode.jsp", "dgsCodeReport");
    });
    $('#SKRDM-startDate').datepicker({dateFormat: 'dd/mm/yy'});
    $('#SKRDM-endDate').datepicker({dateFormat: 'dd/mm/yy'});

    function getDateNow() {
        //yyyy-MM-dd HH:mm:ss
        var nowDate = new Date();
        timeStamp = nowDate;
        var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;
        //months
        var month = (nowDate.getMonth() + 1);
        if (month < 10) {
            ZeroMonth = "0" + month;
        } else {
            ZeroMonth = month;
        }
        //days
        var day = (nowDate.getDate());
        if (day < 10) {
            ZeroDay = "0" + day;
        } else {
            ZeroDay = day;
        }
        //years
        var year = (nowDate.getFullYear());
        //hours
        var hours = nowDate.getHours();
        //minutes
        var minutes = nowDate.getMinutes();
        if (minutes < 10) {
            ZeroMinutes = "0" + minutes;
        } else {
            ZeroMinutes = minutes;
        }
        //seconds
        var seconds = nowDate.getSeconds();
        if (seconds < 10) {
            ZeroSeconds = "0" + seconds;
        } else {
            ZeroSeconds = seconds;
        }
        //complete day
        ddMMyyyyHHmmss = ZeroDay + "/" + ZeroMonth + "/" + year + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
        ddMMyyyy = ZeroDay + "/" + ZeroMonth + "/" + year;
    }
    ;
    $("#Ortho-Consultation_5").on('click', '#PhysoitherpyReferralForm', function () {

        var datas = {
            'pmiNo': pmiNo,
            'episodeDate': episodeDate
        };
        $.ajax({
            type: 'POST',
            url: '../CIS/search/searchPatient.jsp',
            data: datas,
            timeout: 10000,
            success: function (patientBio) {
                var patientBioList = patientBio.split("#");
                var patientBioList1 = patientBioList[0].split("|");
                $("#PRF-patientName").html(patientBioList1[1]);
                $("#PRF-sex").html(patientBioList1[4]);
                $("#PRF-age").html(patientBioList1[6]);
                $("#PRF-hfc").html("<%=session.getAttribute("HFC_NAME")%>");
                $("#PRF-doctor").html("<%=session.getAttribute("USER_NAME")%>");
                getDateNow();
                $("#PRF-currDate").html(ddMMyyyy);
            }, error: function (err) {
                console.log(err);
            }
        });
    });

    $("#Ortho-Consultation_5").on('click', '#SijilKerjaRinganForm', function () {

        var datas = {
            'pmiNo': pmiNo,
            'episodeDate': episodeDate
        };
        $.ajax({
            type: 'POST',
            url: '../CIS/search/searchPatient.jsp',
            data: datas,
            timeout: 10000,
            success: function (patientBio) {
                var patientBioList = patientBio.split("#");
                var patientBioList1 = patientBioList[0].split("|");
                var hfcName = "<%=session.getAttribute("HFC_NAME")%>";
                $("#SKRF-patientName").html(patientBioList1[1]);
                getDateNow();
                $("#SKRF-currDate").html(ddMMyyyy);
                $("#SKRF-hfcName").html(hfcName);

            }, error: function (err) {
                console.log(err);
            }
        });
    });
    $('#AddSijilKerjaRinganModel').on('click', '#generateSijilKerjaRinganModel', function () {
        var diagnosis, startDate, endDate, extraComment;
        diagnosis = $("#tCISSubDGSSearchReport").val();
        startDate = $("#SKRDM-startDate").val();
        endDate = $("#SKRDM-endDate").val();
        extraComment = $("#drComment").val();


        if (diagnosis === "") {
            bootbox.alert("Search the Diagnosis.");
            $('#tCISSubDGSSearchReport').focus();
        } else if (startDate === "") {
            bootbox.alert("Plese Select the Start Date.");
            $('#SKRDM-startDate').focus();
        } else if (endDate === "") {
            bootbox.alert("Please Select the End Date.");
            $("#SKRDM-endDate").focus();
        } else {
            $("#SKRF-diagnosis").html(diagnosis);
            $("#SKRF-drComment").html(extraComment);
            $("#SKRF-startDate").html(startDate);
            $("#SKRF-endDate").html(endDate);
            $('#AddSijilKerjaRinganModel').modal('toggle');
            $("#SijilKerjaRinganFormModel").modal();
        }
    });
    $('#printSijilKerjaRinganForm').click(function () {
//    $('#SijilKerjaRinganFormModel').on('click', '#printSijilKerjaRinganForm', function () {
        var divID = 'SijilKerjaRinganFormBody';
        printReport(divID);
        $('#SijilKerjaRinganFormModel').modal('toggle');
    });

    $('#printPhysoitherpyReferralForm').click(function () {
        var divID = 'PhysoitherpyReferralFormBody';
        printReport(divID);
        $('#PhysoitherpyReferralFormModel').modal('toggle');
    });
    function printReport(divIDs)
    {
        var divElements = $('#' + divIDs).html();
        var popupWin = window.open('', '_blank', 'width=1080,height=768');
        popupWin.document.open();
        popupWin.document.write('<html><body onload="window.print()">' + divElements + '</html>');
        popupWin.document.close();
    }
    ;
</script>
<%@include file="modal/addNeurosurgical.jsp"%>
<%@include file="modal/neuAssessment.jsp"%>
<%@include file="modal/PIRAssessment.jsp"%>

<script src="../assets/js/btn.number.js" type="text/javascript"></script>
