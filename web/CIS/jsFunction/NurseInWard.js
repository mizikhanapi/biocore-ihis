/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//--------------------------------------chart observation----------------------------------------------//
$(document).ready(function () {
    $('#NIWObsDate').datepicker();
});


$('#btnNIWaddps').on('click', function (e) {
    e.preventDefault();
    $('#actionPS #btnNIWps').show();
    $('#actionPS #acceptPSBtn').hide();
});

$('#btnNIWOBADD').on('click', function (e) {
    e.preventDefault();
    var date = $('#NIWObsDate').val();
    var time = $('#NIWObsTime').val();
    var systolic = $('#NIWOBsystolic').val();
    var dialotic = $('#NIWOBdiatolic').val();
    var pulse = $('#NIWOBpulse').val();
    var respiratoryRate = $('#NIWOBrr').val();
    var oxygenSatu = $('#NIWOBos').val();
    var painScore = $('#NIWOBps').val();
    var comment = $('#NIWOBcomment').val();

    var pmi_no = $('#pmiNumber').text();
    var hfc_cd1 = hfc_cd;
    var epDate = episodeDate;
    console.log(pmi_no + " " + hfc_cd1 + " " + epDate);
});


