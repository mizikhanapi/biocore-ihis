/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
    $(".CIS-OE-SPO-DATE").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: "dd-mm-yy"
    });

    $('.CIS-OE-SPO-TIME').timepicker({
        timeFormat: 'H:mm ',
        interval: 60,
        minTime: '00:00',
        maxTime: '23:59',
        defaultTime: '13:00',
        startTime: '10:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true
    });
    $(".CIS-OE-SPO-DATE").datepicker("setDate", new Date());
    $("#tCISOESPOSearch").prop("disabled", true);
    searching("tCISOESPOProblemName","tCISOESPOProblemNameLoading","search/ResultCCNSearch.jsp","problemCodeSPO","search/ResultCCNSearchCode.jsp");
    
   // searchPOSSurgical("tCISOESPOSearch", "tCISOESPOSearchLoading", "");
    searchPOSSurgicalCategory("tCISOESPOCategoryName", "tCISOESPOCategoryNameLoading", "");
    $("#tCISOESPOCategoryName").on("select:flexdatalist",function(value){
        $("#tCISOESPOSearch").prop("disabled", false);
        var category_code = $(this).val();
        searchPOSSurgicalProcedure("tCISOESPOSearch", "tCISOESPOSearchLoading", "",category_code);
    });
    
    $("#tCISOESPOSearch").on("select:flexdatalist",function(value){
        var name = $(this).val();
        var cat_cd = $("#tCISOESPOCategoryName").val();
        var data = {
            name:name,
            cat_cd:cat_cd
        }
        
        $.ajax({
            type:"POST",
            url:"search/ResultPOSSurgicalSearchCode.jsp",
            timeout:3000,
            data:data,
            success:function(e){
                 $("#tCISOESPOSearchCode").val(e.trim());
            }
        })
    });
    
    $("#btnCIS_OE_POSSurgical_ADD").click(function(e){
        e.preventDefault();
        var cat_cd =  $("#tCISOESPOCategoryName").val();
        var procedure_cd =  $("#tCISOESPOSearchCode").val();
        var procedure =  $("#tCISOESPOSearch").val();
        
        var obj = {
            procedure: procedure,
            procedureCode: procedure_cd,
            hfcOrderDetail: hfcOrderDetail,
            hfcProviderDetail: hfcProviderDetail,
            problemCode: problemCode,
            problemName: problemName,
            priority: priority,
            priorityCode: priorityCode,
            patientCondition: patientCondition,
            patientConditionCode: patientConditionCd,
            date: date,
            comment: commentArea
        }
    })
});