/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    
//    $("#tCISSubPMHSearchPersonalised-flexdatalist").hide();
//    $("#tCISSubFMHSearchPersonalised-flexdatalist").hide();
//    $("#tCISSubSOHSearchPersonalised-flexdatalist").hide();
//    $("#tCISSubALGSearchPersonalised-flexdatalist").hide();
//    $("#tCISSubIMUSearchPersonalised-flexdatalist").hide();
//    $("#tCISSubDABSearchPersonalised-flexdatalist").hide();
    
//    $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();
//    $("#tCISSubPMHSearchPersonalised_update-flexdatalist").hide();
//    $("#tCISSubFMHSearchPersonalised_update-flexdatalist").hide();
//    $("#tCISSubSOHSearchPersonalised_update-flexdatalist").hide();
//    $("#tCISSubALGSearchPersonalised_update-flexdatalist").hide();
//    $("#tCISSubIMUSearchPersonalised_update-flexdatalist").hide();
//    $("#tCISSubDABSearchPersonalised_update-flexdatalist").hide();

validateDuration("duration");
validateDuration("uduration");
    
    initialisedModalSearch("CIS01000001","tCISSubCCNHFCSearchPersonalised","CCN","CCNHFC");
    initialisedModalSearch("update_CIS01000001","tCISSubCCNHFCSearchPersonalised_update","CCN","CCNHFC");
    
    initialisedModalSearch("CIS01000003","tCISSubPMHSearchPersonalised","PMH","PMH");
    initialisedModalSearch("update_CIS01000003","tCISSubPMHSearchPersonalised_update","PMH","PMH");
    
    initialisedModalSearch("CIS01000004","tCISSubFMHSearchPersonalised","FMH","FMH");
    initialisedModalSearch("update_CIS01000004","tCISSubFMHSearchPersonalised_update","FMH","FMH");
    
    initialisedModalSearch("CIS01000005", "tCISSubSOHSearchPersonalised", "SOH", "SOH");
    initialisedModalSearch("update_CIS01000005", "tCISSubSOHSearchPersonalised_update", "SOH", "SOH");
    
    initialisedModalSearch("CIS01000007", "tCISSubALGSearchPersonalised", "ALG", "ALG");
    initialisedModalSearch("update_CIS01000007", "tCISSubALGSearchPersonalised_update", "ALG", "ALG");
    
    initialisedModalSearch("CIS01000008", "tCISSubIMUSearchPersonalised", "IMU", "IMU");
    initialisedModalSearch("update_CIS01000008", "tCISSubIMUSearchPersonalised_update", "IMU", "IMU");
    
    initialisedModalSearch("CIS01000009", "tCISSubDABSearchPersonalised", "DAB", "DAB");
    initialisedModalSearch("update_CIS01000009", "tCISSubDABSearchPersonalised_update", "DAB", "DAB");
    
    
});

function initialisedModalSearch(modal_id,personalised_id,modal_name,modal_name2){
        $("#"+modal_id).on('show.bs.modal',function(){
        searchInitialize(modal_name, "I");
        $("#"+personalised_id+"-flexdatalist").hide();
        initialiseRadioPersonalised(modal_name,modal_name2);
    });
    $("#"+modal_id).on('hide.bs.modal', function () {
        searchInitialize(modal_name, "D");
    });
}


function initialiseRadioPersonalised(code,field){
        $('input[name="rCISSub'+code+'SearchType"]').on('click',function(){
        var type = $(this).val();
        if(type === 'CT'){
            $("#btnCISSub"+code+"AddPersonalised").show();
            $("#tCISSub"+field+"SearchPersonalised-flexdatalist").hide();
            $("#tCISSub"+field+"Search-flexdatalist").show();
        } else{
            $("#tCISSub"+field+"SearchPersonalised-flexdatalist").show();
            $("#tCISSub"+field+"Search-flexdatalist").hide();
             $("#btnCISSub"+code+"AddPersonalised").hide();
        }
    });
    
    $('input[name="rCISSub'+code+'SearchType_update"]').on('click',function(){
        var type = $(this).val();
        if(type === 'CT'){
            $("#btnCISSub"+code+"AddPersonalised_update").show();
            $("#tCISSub"+field+"SearchPersonalised_update-flexdatalist").hide();
            $("#tCISSub"+field+"Search_update-flexdatalist").show();
        } else{
            $("#tCISSub"+field+"SearchPersonalised_update-flexdatalist").show();
            $("#tCISSub"+field+"Search_update-flexdatalist").hide();
             $("#btnCISSub"+code+"AddPersonalised_update").hide();
           
        }
    });
    
    $('#btnCISSub'+code+'AddPersonalised').click(function (e) {
        e.preventDefault();
        var search_by = $('input[name="rCISSub'+code+'SearchType"]').val();
        var term_name = term_name = $("#tCISSub"+field+"Search").val();
        ;
        var term_code = getDate();
        var code_type = $("#tCISSUB"+code+"CodeType").val();
        var dataPersonalised = {
            term_name: term_name,
            term_code: term_code,
            code_type: code_type
        }
        addPersonalisedTerm(dataPersonalised);
    });
}

function validateDuration(id){
    $("#"+id).on('keyup', function () {
        var num_str = $(this).val().length;
        if (num_str > 3) {
            $(this).val('');
            bootbox.alert('Please enter correct duration.');
        }
    })
}