/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").hide();
    $("#tCISSubPMHSearchPersonalised-flexdatalist").hide();
    $("#tCISSubFMHSearchPersonalised-flexdatalist").hide();
    $("#tCISSubSOHSearchPersonalised-flexdatalist").hide();
    $("#tCISSubALGSearchPersonalised-flexdatalist").hide();
    $("#tCISSubIMUSearchPersonalised-flexdatalist").hide();
    $("#tCISSubDABSearchPersonalised-flexdatalist").hide();
    
    $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();
    $("#tCISSubPMHSearchPersonalised_update-flexdatalist").hide();
    $("#tCISSubFMHSearchPersonalised_update-flexdatalist").hide();
    $("#tCISSubSOHSearchPersonalised_update-flexdatalist").hide();
    $("#tCISSubALGSearchPersonalised_update-flexdatalist").hide();
    $("#tCISSubIMUSearchPersonalised_update-flexdatalist").hide();
    $("#tCISSubDABSearchPersonalised_update-flexdatalist").hide();
    
    initialiseRadioPersonalised("CCN","CCNHFC");
    initialiseRadioPersonalised("PMH","PMH");
    initialiseRadioPersonalised("FMH","FMH");
    initialiseRadioPersonalised("SOH","SOH");
    initialiseRadioPersonalised("ALG","ALG");
    initialiseRadioPersonalised("IMU","IMU");
    initialiseRadioPersonalised("DAB","DAB");
    
//    $('input[name="rCISSubCCNSearchType"]').on('click',function(){
//        var type = $(this).val();
//        if(type === 'CT'){
//            $("#btnCISSubCCNAddPersonalised").show();
//            $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").hide();
//            $("#tCISSubCCNHFCSearch-flexdatalist").show();
//        } else{
//            $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").show();
//            $("#tCISSubCCNHFCSearch-flexdatalist").hide();
//             $("#btnCISSubCCNAddPersonalised").hide();
//        }
//    });
//    
//    $('input[name="rCISSubCCNSearchType_update"]').on('click',function(){
//        var type = $(this).val();
//        if(type === 'CT'){
//            $("#btnCISSubCCNAddPersonalised_update").show();
//            $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();
//            $("#tCISSubCCNHFCSearch_update-flexdatalist").show();
//        } else{
//            $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").show();
//            $("#tCISSubCCNHFCSearch_update-flexdatalist").hide();
//             $("#btnCISSubCCNAddPersonalised_update").hide();
//           
//        }
//    });
    
//    $('#btnCISSubCCNAddPersonalised').click(function(e){
//        e.preventDefault();
//        var search_by = $('input[name="rCISSubCCNSearchType"]').val();
//        var term_name =  term_name = $("#tCISSubCCNHFCSearch").val();;
//        var term_code = getDate();
//        var code_type = $("#tCISSUBCodeType").val();
//        var dataPersonalised = {
//            term_name : term_name,
//            term_code : term_code,
//            code_type : code_type
//        }
//        addPersonalisedTerm(dataPersonalised);
//    });
    
});

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

