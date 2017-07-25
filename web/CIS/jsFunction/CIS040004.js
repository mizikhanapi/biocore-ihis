/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(e){
    searchDOCTORValue("tCISPlanFLUDOCSearch", "tCISPlanFLUDOCSearchLoading", hfc_cd, "");
    
    $("#tCISPlanFLUDOCSearch").on('select:flexdatalist',function(e){
        $.ajax({
            type: 'POST',
            timeout: 3000,
            url: 'search/ResultDOCTORSearchCode.jsp',
            data: {
                name: $(this).val(),
                hfc_code: hfc_cd
            },
            success: function (e) {
                console.log(e.trim());
                $("#docFLUCode").val(e.trim());
            }
        });
    });
    
    $("#tCISPlanFLUDOCSearch_Update").on('select:flexdatalist',function(e){
        $.ajax({
            type: 'POST',
            timeout: 3000,
            url: 'search/ResultDOCTORSearchCode.jsp',
            data: {
                name: $(this).val(),
                hfc_code: hfc_cd
            },
            success: function (e) {
                console.log(e.trim());
                $("#UdocFLUCode").val(e.trim());
            }
        });
    })
    searchDOCTORValue("tCISPlanFLUDOCSearch_Update", "tCISPlanFLUDOCSearchLoading_Update", hfc_cd, "");
    
})