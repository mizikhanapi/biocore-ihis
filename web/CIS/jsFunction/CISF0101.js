/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



$(document).ready(function () {

    initialisedModalSearch("squarespaceModal2", "tCISSubCCNHFCSearchPersonalised", "CCN", "CCNHFC");

});

function initialisedModalSearch(modal_id, personalised_id, modal_name, modal_name2) {

    $("#" + modal_id).on('show.bs.modal', function () {

        searchInitialize(modal_name, "I");
        $("#" + personalised_id + "-flexdatalist").hide();
        initialiseRadioPersonalised(modal_name, modal_name2);
        $("#fastTrackChiefComplaintForm")[0].reset();
        $("#fastTrackVitalSignForm")[0].reset();
        $("#fastTrackDiagnosisForm")[0].reset();

    });

    $("#" + modal_id).on('hide.bs.modal', function () {

        searchInitialize(modal_name, "D");

    });

}


function initialiseRadioPersonalised(code, field) {

    $('input[name="rCISSub' + code + 'SearchType"]').on('click', function () {
        
        var type = $(this).val();
        
        if (type === 'CT') {
            $("#btnCISSub" + code + "AddPersonalised").show();
            $("#tCISSub" + field + "SearchPersonalised-flexdatalist").hide();
            $("#tCISSub" + field + "Search-flexdatalist").show();
        } else {
            $("#tCISSub" + field + "SearchPersonalised-flexdatalist").show();
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
        var term_code = getDate();
        var code_type = $("#tCISSUB" + code + "CodeType").val();
        var code_valid = $("#tCISSubCCNHFCSearch").val();

        var dataPersonalised = {
            term_name: term_name,
            term_code: term_code,
            code_type: code_type
        };

        if (code_valid === "") {
            bootbox.alert("Please search and select a symptom before pressing the add button !!!");
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
