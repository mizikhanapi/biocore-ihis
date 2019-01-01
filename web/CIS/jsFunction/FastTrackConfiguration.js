/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {


// ============================================================================================================================================================================= //
    // // On Load Start // //
// ============================================================================================================================================================================= //


    $('#squarespaceModal2').css('overflow', 'auto');
    $('#update_CIS01000001').css('overflow', 'auto');
    $('#update_CIS030001').css('overflow', 'auto');
    $('#CIS020003').css('overflow', 'auto');
    $('#CIS020004').css('overflow', 'auto');
    $('#CIS020005').css('overflow', 'auto');
    $('#CIS020006').css('overflow', 'auto');
    $('#CIS020008').css('overflow', 'auto');

    $('#fastTrackVitalSignsTrigger').on('click', function () {

        var patientName = $('#pName').text();

        if (patientName === "-") {
            bootbox.alert("You need to select the patient first.");
        } else {
            $("#squarespaceModal2").modal('show');
        }

    });

    $('#fastTrackDrugOrderTrigger').on('click', function () {

        var patientName = $('#pName').text();

        if (patientName === "-") {
            bootbox.alert("You need to select the patient first.");
        } else {
            $("#CIS040002").modal('show');
            searchHFCDetail('DTO');
        }

    });


// ============================================================================================================================================================================= //
    // // On Load End // //
// ============================================================================================================================================================================= //





// ============================================================================================================================================================================= //
    // // Initial Start // //
// ============================================================================================================================================================================= //


    $('#squarespaceModal2').on('show.bs.modal', function (e) {
        searchInitialize("DGS", "I");
        searchInitialize("CCN", "I");
        $("#tCISSubDGSSearchPersonalised-flexdatalist").hide();
        $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").hide();

        $("#fastTrackChiefComplaintTableDIV").load("fast-modal.jsp #fastTrackChiefComplaintTableDIV #fastTrackChiefComplaintTable");
        $("#fastTrackDiagnosisTableDIV").load("fast-modal.jsp #fastTrackDiagnosisTableDIV #fastTrackDiagnosisTable");

        $("#fastTrackChiefComplaintForm")[0].reset();
        $("#fastTrackVitalSignForm")[0].reset();
        $("#fastTrackDiagnosisForm")[0].reset();

        $("#fastTrackChiefComplaintAcceptComplains").hide();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });

    $('#squarespaceModal2').on('hide.bs.modal', function (e) {
        searchInitialize("DGS", "D");
        searchInitialize("CCN", "D");
        $("#tCISSubDGSSearchPersonalised-flexdatalist").hide();
        $('.collapse').collapse("hide");
    });


    $('#update_CIS01000001').on('show.bs.modal', function (e) {
        searchInitialize("CCN", "I");
        $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();
    });

    $('#update_CIS01000001').on('hide.bs.modal', function (e) {
        searchInitialize("CCN", "D");
        $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();
    });

    $('#update_CIS030001').on('show.bs.modal', function (e) {
        searchInitialize("DGS", "I");
        $("#tCISSubDGSSearchPersonalised_update-flexdatalist").hide();
    });

    $('#update_CIS030001').on('hide.bs.modal', function (e) {
        searchInitialize("DGS", "D");
        $("#tCISSubDGSSearchPersonalised_update-flexdatalist").hide();
    });





// ============================================================================================================================================================================= //
    // // Initial End // //
// ============================================================================================================================================================================= //



// ============================================================================================================================================================================= //
    // // Chief Start // //
// ============================================================================================================================================================================= //


    $('input[name="rCISSubCCNSearchType"]').on('click', function () {

        var type = $(this).val();

        if (type === 'CT') {
            $("#btnCISSubCCNAddPersonalised").show();
            $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").hide();
            $("#tCISSubCCNHFCSearch-flexdatalist").show();
            $("#tCISSubCCNHFCSearch-flexdatalist").val("");
        } else {
            $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").show();
            $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").val("");
            $("#tCISSubCCNHFCSearch-flexdatalist").hide();
            $("#btnCISSubCCNAddPersonalised").hide();
        }

    });

    $('input[name="rCISSubCCNSearchType_update"]').on('click', function () {

        var type = $(this).val();

        if (type === 'CT') {
            $("#btnCISSubCCNAddPersonalised_update").show();
            $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();
            $("#tCISSubCCNHFCSearch_update-flexdatalist").show();
        } else {
            $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").show();
            $("#tCISSubCCNHFCSearch_update-flexdatalist").hide();
            $("#btnCISSubCCNAddPersonalised_update").hide();
        }

    });



    //$('#btnCISSub' + code + 'AddPersonalised').click(function (e) {
    $('#btnCISSubCCNAddPersonalised').off('click').on('click', function (e) {
        e.preventDefault();

        var search_by = $('input[name="rCISSubCCNSearchType"]').val();
        var term_name = term_name = $("#tCISSubCCNHFCSearch").val();
        var term_code = $("#ccnCode").val();
        var new_code = $("#ccnCode").val();
        var code_type = $("#tCISSUBCCNCodeType").val();
        var code_valid = $("#tCISSubCCNHFCSearch").val();

        if (new_code === "") {
            new_code = getDate();
        }

        var dataPersonalised = {
            term_name: term_name,
            term_code: new_code,
            code_type: code_type
        };

        if (code_valid === "") {
            bootbox.alert("Please search and select a symptom before pressing the add button.");
        } else {
            addPersonalisedTerm(dataPersonalised);
        }

    });



// ============================================================================================================================================================================= //
    // // Chief End // //
// ============================================================================================================================================================================= //




// ============================================================================================================================================================================= //
    // // Doagnosis Start // //
// ============================================================================================================================================================================= //


    $('input[name="rCISSubDGSSearchType"]').on('click', function () {

        var type = $(this).val();

        if (type === 'CT') {
            $("#btnCISSubDGSAddPersonalised").show();
            $("#tCISSubDGSSearchPersonalised-flexdatalist").hide();
            $("#tCISSubDGSSearch-flexdatalist").show();
            $("#tCISSubDGSSearch-flexdatalist").val("");
        } else {
            $("#tCISSubDGSSearchPersonalised-flexdatalist").show();
            $("#tCISSubDGSSearchPersonalised-flexdatalist").val("");
            $("#tCISSubDGSSearch-flexdatalist").hide();
            $("#btnCISSubDGSAddPersonalised").hide();
        }

    });


    $('input[name="rCISSubDGSSearchType_update"]').on('click', function () {

        var type = $(this).val();

        if (type === 'CT') {
            $("#btnCISSubDGSAddPersonalised_update").show();
            $("#tCISSubDGSSearchPersonalised_update-flexdatalist").hide();
            $("#tCISSubDGSSearch_update-flexdatalist").show();
        } else {
            $("#tCISSubDGSSearchPersonalised_update-flexdatalist").show();
            $("#tCISSubDGSSearch_update-flexdatalist").hide();
            $("#btnCISSubDGSAddPersonalised_update").hide();
        }

    });

    //$('#btnCISSubDGSAddPersonalised').click(function (e) {
    $('#btnCISSubDGSAddPersonalised').off('click').on('click', function (e) {
        e.preventDefault();

        var search_by = $('input[name="rCISSubDGSSearchType"]').val();
        var term_name = term_name = $("#tCISSubDGSSearch").val();
        var term_code = $("#dgsCode").val();
        var new_code = $("#dgsCode").val();
        var code_type = $("#tCISSUBDGSCodeType").val();
        var code_valid = $("#tCISSubDGSSearch").val();

        if (new_code === "") {
            new_code = getDate();
        }

        var dataPersonalised = {
            term_name: term_name,
            term_code: new_code,
            code_type: code_type
        };

        if (code_valid === "") {
            bootbox.alert("Please search and select a diagnosis before pressing the add button");
        } else {
            addPersonalisedTermDGS(dataPersonalised);
        }

    });



    //function searching Diagnosis Ajax
    function searching(fieldId, loadingDivId, urlData, urlCode, codeFieldId) {

        $('#' + fieldId).flexdatalist({
            minLength: 1,
            searchIn: 'name',
            searchDelay: 2000,
            //data:arrayDGSDataAjax,
            url: urlData,
            cache: true,
            params: {
                timeout: 3000,
                success: function (result) {

                    if (result === undefined) {
                        $('#' + loadingDivId).html('No Record');
                    }
                }
            }
        });

        $("#" + fieldId).on('before:flexdatalist.data', function (response) {

            $('#' + loadingDivId).html('<img src="img/LoaderIcon.gif" />');
        });
        $("#" + fieldId).on('after:flexdatalist.data', function (response) {

            $('#' + loadingDivId).html('');
        });
        $("#" + fieldId).on('select:flexdatalist', function (response) {
            var searchName = $("#" + fieldId).val();

            $.ajax({
                type: "post",
                url: urlCode,
                timeout: 3000,
                data: {id: searchName},
                success: function (response) {

                    $("#" + codeFieldId).val(response.trim());

                }
            });

        });
    }


// ============================================================================================================================================================================= //
    // // Doagnosis End // //
// ============================================================================================================================================================================= //



// ============================================================================================================================================================================= //
    // // Vital Signs Start // //
// ============================================================================================================================================================================= //


    $(".BP-class").on('keyup keydown', function () {

        var input = this;

        if ($(this).val().length > 3) {
            bootbox.alert("Enter the specific value");
            $(this).val('');
            $(this).blur();
        } else if (input.validity.stepMismatch || isNaN(this.value)) {
            bootbox.alert("Enter whole number only.");
            $(this).val('');
            $(this).blur();
        } else if (!input.checkValidity()) {
            bootbox.alert(input.validationMessage);
            $(this).val('');
            $(this).blur();
        } else {
            var intNum = parseInt(this.value.replace(/[^0-9\.]/g, ''), 10);
            $(this).val(intNum);
        }

    });


    $(".rr-rate-input").on('keyup keydown', function () {

        var input = this;
        if ($(this).val().length > 3) {
            bootbox.alert("Enter the correct Respiratory rate");
            $(this).val('');
        } else if (input.validity.stepMismatch || isNaN(this.value)) {
            bootbox.alert("Enter whole number only.");
            $(this).val('');
        } else if (!input.checkValidity()) {
            bootbox.alert(input.validationMessage);
            $(this).val('');
        } else {
            var intNum = parseInt(this.value.replace(/[^0-9\.]/g, ''), 10);
            $(this).val(intNum);
        }

    });


    $("#OSat").on('keyup keydown', function () {

        if ($(this).val().length > 4) {
            bootbox.alert("Enter the correct Oxygen saturation");
            $(this).val('');
        } else if (this.validity.stepMismatch) {
            bootbox.alert("Enter number with one decimal place only.");
            $(this).val('');
        } else if (!this.checkValidity()) {
            bootbox.alert(this.validationMessage);
            $(this).val('');
        }

    });


    $("#slider").slider({
        range: "min",
        value: 1,
        step: 0.01,
        min: 1,
        max: 100,
        slide: function (event, ui) {
            //$("#BTemp").val(ui.value +" "+ ascii(176) + "C");
            $("#BTemp").val(ui.value);
        }
    });


    $("#BTemp").change(function () {

        var value = this.value.substring(1);
        $("#slider").slider("value", parseInt(value));

    });


    $('#BTemp').on('keyup', function () {

        var intNum = parseInt(this.value);
        var value = $(this).val();

        if (value.length > 5) {
            bootbox.alert("Please enter the correct Body Temperature");
            $(this).val('');
        } else if (intNum < 0 || intNum > 100) {
            bootbox.alert("Value for temperature must be within the range 0 - 100");
            $(this).val('');
        } else {
            var rounded = 0;
            if (value.length > 0) {
                var number = value;
                rounded = Math.round(number * 100) / 100;
                $(this).val(rounded);
            }
            $("#slider").slider("value", rounded);
        }

    });


// ============================================================================================================================================================================= //
    // // Vital Signs End // //
// ============================================================================================================================================================================= //




// ============================================================================================================================================================================= //
    // // Complain And Doagnosis Footer Button Start // //
// ============================================================================================================================================================================= //


    $('#squarespaceModal2 #collapseOne1').off('shown.bs.collapse').on('show.bs.collapse', function () {
        // do something…

        $("#fastTrackChiefComplaintAcceptComplains").show();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });


    $('#squarespaceModal2 #collapseOne1').off('hidden.bs.collapse').on('hide.bs.collapse', function () {
        // do something…

        $("#fastTrackChiefComplaintAcceptComplains").hide();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });


    $('#squarespaceModal2 #collapseTwo1').off('shown.bs.collapse').on('show.bs.collapse', function () {
        // do something…

        $("#fastTrackChiefComplaintAcceptComplains").hide();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });


    $('#squarespaceModal2 #collapseTwo1').off('hidden.bs.collapse').on('hide.bs.collapse', function () {
        // do something…

        $("#fastTrackChiefComplaintAcceptComplains").hide();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });


    $('#squarespaceModal2 #collapseThree1').off('shown.bs.collapse').on('show.bs.collapse', function () {
        // do something…

        $("#fastTrackChiefComplaintAcceptComplains").hide();
        $("#fastTrackChiefComplaintAcceptDiagnosis").show();

    });


    $('#squarespaceModal2 #collapseThree1').off('hidden.bs.collapse').on('hide.bs.collapse', function () {
        // do something…

        $("#fastTrackChiefComplaintAcceptComplains").hide();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });


// ============================================================================================================================================================================= //
    // // Complain And Doagnosis Footer Button Start // //
// ============================================================================================================================================================================= //


});


function ascii(a) {
    return String.fromCharCode(a);
}

function validateDuration(id) {

    $("#" + id).on('keyup', function () {
        var num_str = $(this).val().length;
        if (num_str > 3) {
            $(this).val('');
            bootbox.alert('Please enter correct duration.');
        }
    });

}