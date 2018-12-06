/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {

    initialisedModalSearch("squarespaceModal2", "tCISSubCCNHFCSearchPersonalised", "CCN", "CCNHFC");
    initialisedModalSearch("update_CIS01000001", "tCISSubCCNHFCSearchPersonalised_update", "CCN", "CCNHFC");

});

function initialisedModalSearch(modal_id, personalised_id, modal_name, modal_name2) {

    $("#" + modal_id).on('show.bs.modal', function () {

        searchInitialize(modal_name, "I");
        $("#" + personalised_id + "-flexdatalist").hide();
        initialiseRadioPersonalised(modal_name, modal_name2);

        $("#fastTrackChiefComplaintTableDIV").load("fast-modal.jsp #fastTrackChiefComplaintTableDIV #fastTrackChiefComplaintTable");
        $("#fastTrackDiagnosisTableDIV").load("fast-modal.jsp #fastTrackDiagnosisTableDIV #fastTrackDiagnosisTable");

        $("#fastTrackChiefComplaintForm")[0].reset();
        $("#fastTrackVitalSignForm")[0].reset();
        $("#fastTrackDiagnosisForm")[0].reset();

        $("#fastTrackChiefComplaintAcceptComplains").hide();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });

    $("#" + modal_id).on('hide.bs.modal', function () {

        searchInitialize(modal_name, "D");
        $('.collapse').collapse("hide");

    });


    $('#squarespaceModal2 #collapseOne1').off('shown.bs.collapse').on('shown.bs.collapse', function () {
        // do something…

        $("#fastTrackChiefComplaintAcceptComplains").show();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });


    $('#squarespaceModal2 #collapseOne1').off('hidden.bs.collapse').on('hidden.bs.collapse', function () {
        // do something…

        $("#fastTrackChiefComplaintAcceptComplains").hide();
        $("#fastTrackChiefComplaintAcceptDiagnosis").hide();

    });





}


function initialiseRadioPersonalised(code, field) {

    $('input[name="rCISSub' + code + 'SearchType"]').on('click', function () {

        var type = $(this).val();

        if (type === 'CT') {
            $("#btnCISSub" + code + "AddPersonalised").show();
            $("#tCISSub" + field + "SearchPersonalised-flexdatalist").hide();
            $("#tCISSub" + field + "Search-flexdatalist").show();
            $("#tCISSub" + field + "Search-flexdatalist").val("");
        } else {
            $("#tCISSub" + field + "SearchPersonalised-flexdatalist").show();
            $("#tCISSub" + field + "SearchPersonalised-flexdatalist").val("");
            $("#tCISSub" + field + "Search-flexdatalist").hide();
            $("#btnCISSub" + code + "AddPersonalised").hide();
        }

    });

    // to ensure correct search field is shown when during open and close modal
    $('input[name="rCISSub' + code + 'SearchType"]').click();

    $('input[name="rCISSub' + code + 'SearchType_update"]').on('click', function () {

        var type = $(this).val();

        if (type === 'CT') {
            $("#btnCISSub" + code + "AddPersonalised_update").show();
            $("#tCISSub" + field + "SearchPersonalised_update-flexdatalist").hide();
            $("#tCISSub" + field + "Search_update-flexdatalist").show();
        } else {
            $("#tCISSub" + field + "SearchPersonalised_update-flexdatalist").show();
            $("#tCISSub" + field + "Search_update-flexdatalist").hide();
            $("#btnCISSub" + code + "AddPersonalised_update").hide();
        }

    });



    //$('#btnCISSub' + code + 'AddPersonalised').click(function (e) {
    $('#btnCISSub' + code + 'AddPersonalised').off('click').on('click', function (e) {
        e.preventDefault();

        var search_by = $('input[name="rCISSub' + code + 'SearchType"]').val();
        var term_name = term_name = $("#tCISSub" + field + "Search").val();
        var term_code = $("#ccnCode").val();
        var new_code = $("#ccnCode").val();
        var code_type = $("#tCISSUB" + code + "CodeType").val();
        var code_valid = $("#tCISSubCCNHFCSearch").val();

        if (new_code === "") {
            new_code = getDate();
        }

        var dataPersonalised = {
            term_name: term_name,
            term_code: new_code,
            code_type: code_type
        };

        console.log(dataPersonalised);

        if (code_valid === "") {
            bootbox.alert("Please search and select a symptom before pressing the add button.");
        } else {
            addPersonalisedTerm(dataPersonalised);
        }

    });

}

function validateDuration(id) {

    $("#" + id).on('keyup', function () {
        var num_str = $(this).val().length;
        if (num_str > 3) {
            $(this).val('');
            bootbox.alert('Please enter correct duration.');
        }
    })

}
