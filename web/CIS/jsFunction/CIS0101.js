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
        console.log(dataPersonalised);
        $.ajax({
            type:'POST',
            url:'search/InsertPersonalised.jsp',
            data:dataPersonalised,
            timeout:3000,
            success:function(response){
                console.log(response)
                var data_response = response.trim().split("[-|-]");
                var status = data_response[0];
                if(status === "ALREADY"){
                    alert("The clinical term already added in your personalised. Please search in personalise to select the term")
//                    var data_already = data_response[1].split("|");
//                    var already_term_code = data_already[0];
//                    var already_term_name = data_already[1];
//                    $('#ccnCode').val(already_term_code);
//                     $("#tCISSubCCNHFCSearchPersonalised").val(already_term_name);
//                     $("input[name='radio'][value='P']").prop("checked",true);
//                     $("#tCISSubCCNHFCSearchPersonalised").show();
//                    $("#tCISSubCCNHFCSearch-flexdatalist").hide();
                    retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");
                } else{
                   // $('#ccnCode').val(term_code);
                   retriveDataSearchingSubjective("tCISSubCCNHFCSearch", "tCISSubCCNHFCSearchLoading", "search/ResultCCNSearch.jsp", "search/ResultCCNSearchCode.jsp", "ccnCode", "");
                    alert("The clinical term successfully added in your personalised. Please search in personalise to select the term");
                }
                
            }
        })
        

    })
    
});