/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function initDatepicker(id){
    $("#"+id).datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
}

function destroyDatepicker(id){
    $("#"+id).datepicker("destroy");    
}

function initTimepicker(id){
    $("#"+id).timepicker({
        'timeFormat': 'HH:mm',
        'scrollbar': 'true',
        'minTime': '00:00',
        'maxTime': '23:59',
        'interval': 1,
        'startTime': new Date()
    });
}

function destroyTimepicker(id){
    $("#"+id).timepicker("destroy");
}
