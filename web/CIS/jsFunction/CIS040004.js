/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(e){
    
    $("#CIS040004").on('show.bs.modal',function(){
        searchInitialize("FLU", "I");
    });
    $("#update_CIS040004").on('show.bs.modal', function () {
        searchInitialize("FLU", "I");
    });
    
    $("#CIS040004").on('hide.bs.modal', function () {
        searchInitialize("FLU", "D");
    })
    $("#update_CIS040004").on('hide.bs.modal', function () {
        searchInitialize("FLU", "D");
    })
    
    
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
                
                $("#UdocFLUCode").val(e.trim());
            }
        });
    });
    
   
    
})