/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//(function ($) {
//  $.each(['show', 'hide'], function (i, ev) {
//    var el = $.fn[ev];
//    $.fn[ev] = function () {
//      this.trigger(ev);
//      return el.apply(this, arguments);
//    };
//  });
//})(jQuery);

$(document).ready(function () {
    //Ortho-Consultation
    $(".general-exam").click(function () {
        $('.swapping-tab').hide();
        $("#generic-soap").show(400);
        $('#div_CIS_PATIENT_DASHBOARD').show();
//        $("#order-entry").hide();
//        $("#orthopedic-niw").hide();
//        $("#orthopedic-con").hide();
//        $("#orthopedic-ot").hide();
//        $("#ong").hide();
        
    });

    //Order-Entry
    $(".order-ety").click(function () {
        $('.swapping-tab').hide();
//        $("#generic-soap").hide();
        $("#order-entry").show(400);
//        $("#orthopedic-niw").hide();
//        $("#orthopedic-con").hide();
//        $("#orthopedic-ot").hide();
//        $("#ong").hide();
        $('#div_CIS_PATIENT_DASHBOARD').show();
        
    });

    //Ortho-Consultation
    $(".ortho-notes").click(function () {
        $('.swapping-tab').hide();
//        $("#generic-soap").hide();
//        $("#order-entry").hide();
//        $("#orthopedic-niw").hide();
        $("#orthopedic-con").show(400);
        $('#div_CIS_PATIENT_DASHBOARD').show();
//        $("#orthopedic-ot").hide();
//        $("#ong").hide();
     

    });

    //Ortho-Nursing
    $(".ortho-niward").click(function () {
         $('.swapping-tab').hide();
//        $("#generic-soap").hide();
//        $("#order-entry").hide();
        $("#orthopedic-niw").show(400);
        $('#div_CIS_PATIENT_DASHBOARD').show();
//        $("#orthopedic-con").hide();
//        $("#orthopedic-ot").hide();
//        $("#ong").hide();
       

    });

    //Ortho-OTheather
    $(".ortho-opthe").click(function () {
         $('.swapping-tab').hide();
//        $("#generic-soap").hide();
//        $("#order-entry").hide();
//        $("#orthopedic-niw").hide();
//        $("#orthopedic-con").hide();
        $("#orthopedic-ot").show(400);
        $('#div_CIS_PATIENT_DASHBOARD').show();
//        $("#ong").hide();
        

    });
    
    //ong-general
    $(".ong-general").click(function () {
         $('.swapping-tab').hide();
//        $("#generic-soap").hide();
//        $("#order-entry").hide();
//        $("#orthopedic-niw").hide();
//        $("#orthopedic-con").hide();
//        $("#orthopedic-ot").hide();
        $("#ong").show(400);
        $('#div_CIS_PATIENT_DASHBOARD').show();
       

    });
    
    //ong-ward
    $('#LinkOngCareWard').click(function(){
        $('.swapping-tab').hide();
        $('#ong-ward').show(400);
        $('#div_CIS_PATIENT_DASHBOARD').show();
    });
    
    //analyse
    $('#btnAnalysePatient').click(function(){
        $('.swapping-tab').hide();
        $('#div_CIS_PATIENT_DASHBOARD').hide();
        $("#CIS-analyseTab").show(400);
        
        var ic_no = $('#patient-detail-dashboard #pIC_2').text().trim();
        if(ic_no !=="-"){
            var anl_pmi = $('#ANL_idInputApp').val().trim();
            if(anl_pmi ===""){
                $('#ANL_idInputApp').val(ic_no);
                $('#ANL_idType').val("002");
            }
        }
    });
    
//    $('#CIS-analyseTab').on('hide', function(event) {
//        event.stopPropagation();
//        $('#div_CIS_PATIENT_DASHBOARD').show(400);
//    });
//    
//    $('#CIS-analyseTab').on('hide', '.thumbnail', function(event) {
//        event.stopPropagation();
//        
//    });
//    $('#CIS-analyseTab').on('hide', '.modal', function(event) {
//        event.stopPropagation();
//        
//    });
});