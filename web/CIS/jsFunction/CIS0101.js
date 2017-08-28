/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").hide();
 
    $('input[name="rCISSubCCNSearchType"]').on('click',function(){
        var type = $(this).val();
        if(type === 'CT'){
            $("#btnCISSubCCNAddPersonalised").show();
            $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").hide();
            
            $("#tCISSubCCNHFCSearch-flexdatalist").show();
        } else{
            $("#tCISSubCCNHFCSearchPersonalised-flexdatalist").show();
            $("#tCISSubCCNHFCSearch-flexdatalist").hide();
             $("#btnCISSubCCNAddPersonalised").hide();
           
        }
    });
    
       
    $('input[name="rCISSubCCNSearchType_update"]').on('click',function(){
        var type = $(this).val();
        if(type === 'CT'){
            $("#btnCISSubCCNAddPersonalised_update").show();
            $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").hide();
            
            $("#tCISSubCCNHFCSearch_update-flexdatalist").show();
        } else{
            $("#tCISSubCCNHFCSearchPersonalised_update-flexdatalist").show();
            $("#tCISSubCCNHFCSearch_update-flexdatalist").hide();
             $("#btnCISSubCCNAddPersonalised_update").hide();
           
        }
    });
    
    $('#btnCISSubCCNAddPersonalised').click(function(e){
        e.preventDefault();
        var search_by = $('input[name="rCISSubCCNSearchType"]').val();
        var term_name =  term_name = $("#tCISSubCCNHFCSearch").val();;
        var term_code = getDate();
        var code_type = $("#tCISSUBCodeType").val();
        var dataPersonalised = {
            term_name : term_name,
            term_code : term_code,
            code_type : code_type
        }
        addPersonalisedTerm(dataPersonalised);
    });
    
});

