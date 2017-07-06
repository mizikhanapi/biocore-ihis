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
                    <a href="#Ortho-OperationTheater_1" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-info-circle fa-lg"></i> Form Operation Record </a>
                </li>
                <li class="">
                    <a href="#Ortho-OperationTheater_2" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-check fa-lg"></i> Form Consent for Operation </a>
                </li>
                <li>
                    <a href="#Ortho-OperationTheater_3" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form Blood Transfusion Consent </a>
                </li>
                <li>
                    <a href="#Ortho-OperationTheater_4" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form Incision Procedure </a>
                </li>
                <li>
                    <a href="#Ortho-OperationTheater_5" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form Anaesthetic Record </a>
                </li>
            </ul>

            <div class="tab-content">
                <!-- content -->
                <div class="tab-pane active fade in" id="Ortho-OperationTheater_1">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#operationRecord1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add new Record</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%@include file="operationRecord.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-OperationTheater_2">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#addConsentToOpration" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Consent</a>
<!--                            <a id="Print" class="soap-select" data-toggle="modal" data-target="#opreationConsentForm">Print</a></li>-->
                    </ul>
                    <hr class="pemisah" />
                    <%//@include file="neuObservation.jsp"%>
                    <div id="test2" display="hidden"></div>
                </div>
                
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-OperationTheater_3">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#bloodTransfusionConsentForm" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Consent</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%//@include file="PIRAssessment.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-OperationTheater_4">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#procedureIncision1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Procedure Incision</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%//@include file="procedureIncision.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
                <div class="tab-pane fade" id="Ortho-OperationTheater_5">
                    <%//@include file="PIRAssessment.jsp"%>
                </div>
                <!-- content -->


            </div>

        </div>
    </div>
    <!-- Tab Menu -->
</div>
<%@include file="modal/operationRecord.jsp"%>
<%@include file="modal/procedureIncision.jsp"%>
<%@include file="modal/AddConsentOperation.jsp"%>
<%@include file="report-BloodTransfusionConsent.jsp"%>

<script src="../assets/js/btn.number.js" type="text/javascript"></script>
<script>
  
    $('#addNextOfKinInfo').click(function () {
        var name, ic, relWithPatient, relWithNext,patientName;
        name = $("#nextOfKinName").val();
        ic = $("#nextOfKinIC").val();
        relWithPatient = $("#relaitonWithPatient").val();
        relWithNext = $("#relationWitNextOfKin").val();
        patientName = $("#pName").text();
        sendDate(name, ic, relWithPatient, relWithNext,patientName);
    });
    
    $('#printBloodTransfusionForm').click(function () {
       var divID = 'bloodTransfusionForm';
        printReport(divID);
    });
  
  
  
    function sendDate(name, ic, relWithPatient, relWithNext,patientName) {
        var datas = {
               'name':name,
               'ic':ic,
               'relWithPatient':relWithPatient,
               'relWithNext':relWithNext,
               'patientName':patientName
           };
           console.log(datas);
        $.ajax({
           type:'POST',
           url:'../Ortho-operationTheater/report-ConsentForOperation.jsp',
           data: datas,
           timeout:10000,
           success: function(form){
               console.log("succ: "+form.trim());
               $("#test2").val(form.trim());
               $("#test2").html(form.trim());
               $('#test2').trigger('contentchanged');
               $('#addConsentToOpration').hide();
               $('.modal-backdrop').hide();
               $('#opreationConsentForm').modal();
//               printReport();
           },
           error: function(err){
               console.log("ERROR: "+err);
           }
           
        });
    };
    function printReport(divIDs)
    {
        var divElements = $('#'+divIDs).html();
        var popupWin = window.open('', '_blank', 'width=1080,height=768');
        popupWin.document.open();
        popupWin.document.write('<html><body onload="window.print()">' + divElements + '</html>');
        popupWin.document.close();
    }

</script>