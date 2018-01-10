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
                    <a href="#Ortho-OperationTheater_2" data-toggle="tab" aria-expanded="false">
                        <i class="fa fa-check fa-lg"></i> Form Consent for Operation </a>
                </li>
                <li>
                    <a href="#Ortho-OperationTheater_3" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form Blood Transfusion Consent </a>
                </li>
<!--                <li>
                    <a href="#Ortho-OperationTheater_4" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form Incision Procedure </a>
                </li>
                <li>
                    <a href="#Ortho-OperationTheater_5" data-toggle="tab" aria-expanded="true">
                        <i class="fa fa-th-list fa-lg"></i> Form Anaesthetic Record </a>
                </li>-->
            </ul>

            <div class="tab-content">
                <!-- content -->
<!--                <div class="tab-pane active fade in" id="Ortho-OperationTheater_1">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#operationRecord1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add new Record</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%//@include file="operationRecord.jsp"%>
                </div>-->
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
                        <li><a id="BTCF" data-toggle="modal" data-target="#bloodTransfusionConsentForm" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Consent</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%//@include file="PIRAssessment.jsp"%>
                </div>
                <!-- content -->

                <!-- content -->
<!--                <div class="tab-pane fade" id="Ortho-OperationTheater_4">
                    <ul class="soap-content nav">
                        <li><a data-toggle="modal" data-target="#procedureIncision1" href="" class="soap-select"><i class="fa fa-comments  fa-li"></i> Add Procedure Incision</a></li>
                    </ul>
                    <hr class="pemisah" />
                    <%//@include file="procedureIncision.jsp"%>
                </div>-->
                <!-- content -->

                <!-- content -->
<!--                <div class="tab-pane fade" id="Ortho-OperationTheater_5">
                    <%//@include file="PIRAssessment.jsp"%>
                </div>-->
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

    var ddMMyyyyHHmmss, HHmmss, ddMMyyyy, timeStamp;

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

    $('#addNextOfKinInfo').click(function () {
        var name, ic, relWithPatient, relWithNext, patientName;
        name = $("#nextOfKinName").val();
        ic = $("#nextOfKinIC").val();
        relWithPatient = $("#relaitonWithPatient").val();
        relWithNext = $("#relationWitNextOfKin").val();
        patientName = $("#pName").text();

        if (name === "") {
            bootbox.alert("Fill in the Nent of Kin Name !");
            $("#nextOfKinName").focus();
        } else if (containsNumber(name)) {
            bootbox.alert("Unvalid Name, Contain Numbers !");
            $("#nextOfKinName").focus();
        } else if (ic === "") {
            bootbox.alert("Fill in the Next of Kin IC");
            $('#nextOfKinIC').focus();
        } else if (relWithPatient === "") {
            bootbox.alert("Fill in the Relation with Patient");
            $("#relaitonWithPatient").focus();
        } else if (containsNumber(relWithPatient)) {
            bootbox.alert("Unvalid Relation, Contain Numbers !");
            $("#relaitonWithPatient").focus();
        } else if (relWithNext === "") {
            bootbox.alert("Fill in the Relation with Next of Kin");
            $("#relationWitNextOfKin").focus();
        } else if (containsNumber(relWithNext)) {
            bootbox.alert("Unvalid Relation, Contain Numbers !");
            $("#relationWitNextOfKin").focus();
        } else {

            sendDate(name, ic, relWithPatient, relWithNext, patientName);
        }


    });

    $('#printBloodTransfusionForm').click(function () {
        var divID = 'bloodTransfusionForm';
        printReport(divID);
        $('#addConsentToOpration').modal('toggle');
    });

    $("#Ortho-OperationTheater_3").on('click', '#BTCF', function () {

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
                console.log(patientBio);
                var patientBioList = patientBio.split("#");
                var patientBioList1 = patientBioList[0].split("|");
                getDateNow();
                $("#BTCF-currDate").html(ddMMyyyy);
                $("#BTCF-patientName").html(patientBioList1[1]);
                $("#BTCF-sex").html(patientBioList1[4]);
                $("#BTCF-age").html(patientBioList1[6]);
                $("#BTCF-IC").html(patientBioList1[2]);
                $("#BTCF-address").html(patientBioList[22] + "," + patientBioList[29] + "" + patientBioList[25] + "," + patientBioList[27]);
            },
            error: function (err) {
                console.log("ERROR: " + err);
            }

        });

    });


    function sendDate(name, ic, relWithPatient, relWithNext, patientName) {
        var datas = {
            'name': name,
            'ic': ic,
            'relWithPatient': relWithPatient,
            'relWithNext': relWithNext,
            'patientName': patientName
        };
        console.log(datas);
        $.ajax({
            type: 'POST',
            url: '../Ortho-operationTheater/report-ConsentForOperation.jsp',
            data: datas,
            timeout: 10000,
            success: function (form) {
                console.log("succ: " + form.trim());
                $("#test2").val(form.trim());
                $("#test2").html(form.trim());
                $('#test2').trigger('contentchanged');
                $('#addConsentToOpration').modal('toggle');
                $('#opreationConsentForm').modal();
//               printReport();
            },
            error: function (err) {
                console.log("ERROR: " + err);
            }

        });
    }
    ;
    function printReport(divIDs)
    {
        var divElements = $('#' + divIDs).html();
        var popupWin = window.open('', '_blank', 'width=1080,height=768');
        popupWin.document.open();
        popupWin.document.write('<html><body onload="window.print()">' + divElements + '</html>');
        popupWin.document.close();
    }
    function containsNumber(any) {
        var alpha = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/; //for sentence allow space
        //var re = /^[A-Za-z]+$/; for one word only don't allow space
        if (alpha.test(any))//contain no number
            return false;
        else               //comtain number
            return true;
    }
    ;

</script>