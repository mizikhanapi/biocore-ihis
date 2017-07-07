/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    searchHFCOnly("tCIS_ADWHFCreferFrom", "tCIS_ADWHFCreferFromLoading");

    $("#tCIS_ADWHFCreferFrom").on("select:flexdatalist", function (response) {
        getHFCCode($(this).val(), "tCIS_ADWHFCreferFromCd","hfcOrderDetailADW","tCIS_ADWreferFrom","tCIS_ADWreferFromLoading");
    });

    searchHFCOnly("tCIS_ADWsearchHFC","tCIS_ADWsearchHFCLoading");
    
    $("#tCIS_ADWsearchHFC").on("select:flexdatalist", function (response){
        getHFCCode($(this).val(),"tCIS_ADWsearchHFCCd","hfcProviderDetailADW","tCIS_ADWsearchDis","tCIS_ADWsearchDisLoading");

    });
    
    $("#tCIS_ADWreferFrom").on("select:flexdatalist",function(response){
        var hfc_cd = $("#tCIS_ADWHFCreferFromCd").val();
        console.log(hfc_cd);
       $.ajax({
           type:"POST",
           timeout:3000,
           url:"search/ResultDISCIPLINESearchCode.jsp?hfc_cd="+hfc_cd,
           data:{
               name:$(this).val()
              
           },
           success:function(response){
               //this ajax will response discipline code for hfc from
               $("#tCIS_ADWreferFromCd").val(response.trim());
           }
       }) 
    });
    
    $("#tCIS_ADWsearchDis").on("select:flexdatalist",function(response){
        var hfc_cd = $("#tCIS_ADWsearchHFCCd").val();
        console.log(hfc_cd);
       $.ajax({
           type:"POST",
           timeout:3000,
           url:"search/ResultDISCIPLINESearchCode.jsp?hfc_cd="+hfc_cd,
           data:{
               name:$(this).val()
           },
           success:function(response){
               //this ajax will response discipline Code for hfc patient admit to;
               $("#tCIS_ADWsearchDisCd").val(response.trim());
               searchWard("tCIS_ADWwardName","tCIS_ADWwardNameLoading",hfc_cd,response.trim(),"");
           }
       }) 
    });
    
    $("#tCIS_ADWwardName").on("select:flexdatalist",function(response){
        
        var hfc_cd = $("#tCIS_ADWsearchHFCCd").val();
        var discipline_cd = $("#tCIS_ADWsearchDisCd").val();
        
        $.ajax({
            type: "POST",
            timeout: 3000,
            url: "search/ResultWARDSearchCode.jsp",
            data: {
                name: $(this).val(),
                hfc_code:hfc_cd,
                discipline_cd:discipline_cd
            },
            success: function (response) {
                console.log(response)
                //this ajax will response discipline Code for hfc patient admit to;
                $("#tCIS_ADWwardNameCd").val(response.trim());
                
            }
        }) 
    })
    


});