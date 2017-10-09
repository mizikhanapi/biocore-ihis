/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * created by Ardhi Surya Ibrahim
 * email: rdsurya147@gmail.com 
 * insta: @rdcfc
 * github: rdsurya
 */


$(function () {
    var name = $('#pName').text().trim();
    var ic = $('#pIC').text().trim();

    if (name.localeCompare('-') !== 0 && ic.localeCompare('-') !== 0)
        loadMorsefallAssessment();
    
    var today = $.datepicker.formatDate('dd/mm/yy', new Date());
    $('#morseDate').val(today);
});

//---------- bind function to add new assessment button-----------
$('#pName').on('DOMSubtreeModified', function () {
    
    //console.log('Name has change!');
    var name = $(this).text().trim();

    if (name.localeCompare('-') !== 0) {
        $('#morse_assessment_modal').on('click', function () {
            var today = $.datepicker.formatDate('dd/mm/yy', new Date());
            $('#morseDate').val(today);
                                  
             $('#morse_btnAdd_div').show();
             $('#morse_btnUpdate_div').hide();
            
            $('#morseDate').prop('disabled', false);
            $('input[name="morseTime"]').prop('disabled', false);
            
        });
        
        //console.log('Function is binded!');
    }
});
//========== end binding ==========================

//---- selecting how to view the notes: today, yesterday or specific dates------------
$('#MS_viewBy').on('change', function () {
    var howTo = $(this).val();

    if (howTo === 'x') {
        $('#MS_div_selectDate').show();
    } else {
        $('#MS_div_selectDate').hide();
        loadMorsefallAssessment();// view previous assessment
    }
});

//======================= end select view date=========================================

//---------------------- load assessment -------------------------------------
function loadMorsefallAssessment() {

    var data = {
        day: $('#MS_viewBy').val(),
        from: $('#MS_dateFrom').val(),
        to: $('#MS_dateTo').val()
    };

    console.log("loading assessment");
    createScreenLoading();
    $.ajax({
        type: 'POST',
        data: data,
        timeout: 60000,
        url: "../Ortho-Nursing/controller/morseAss_retrieve.jsp",
        success: function (data, textStatus, jqXHR) {
            $('#div_morseAss_table').html(data);
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#div_morseAss_table').html("Oopps! " + errorThrown);
        },
        complete: function (jqXHR, textStatus) {
            destroyScreenLoading();
        }
    });
}
//============================================================================


//----------------------- view previous assessment based on selected date range -----------------------------
$('#MS_btnSearchByDate').on('click', function () {
    console.log('Search button click');
    var dateFrom = $('#MS_dateFrom').val();
    var dateTo = $('#MS_dateTo').val();
    
    if (dateFrom === '' || dateTo === ''){
     bootbox.alert("Please pick the date range!");   
    }        
    else
        loadMorsefallAssessment();
});

//==============================================================================



//----------- Add new morse assessment ------------------------------


function morseValueCheck() {
    var status = true;

    var morseDate = $('#morseDate').val();
    var morseTime = $('input[name=morseTime]:checked').val();
    var fall = $('input[name=rad_fall]:checked').val();
    var diagnosis = $('input[name=rad_diagnos]:checked').val();
    var movement = $('input[name=rad_pergerakan]:checked').val();
    var venofix = $('input[name=rad_venofix]:checked').val();
    var badan = $('input[name=rad_badan]:checked').val();
    var mental = $('input[name=rad_mental]:checked').val();

    var msg = "";

    if (morseDate === '' || morseDate == null) {
        status = false;
        msg = "Please pick a date.";
    } else if (morseTime == null) {
        status = false;
        msg = "Please pick a time.";
    } else if (fall == null) {
        status = false;
        msg = "Please tick a score for fall history.";
    } else if (diagnosis == null) {
        status = false;
        msg = "Please tick a score for diagnosis.";
    } else if (movement == null) {
        status = false;
        msg = "Please tick a score for ambulatory aid.";
    } else if (venofix == null) {
        status = false;
        msg = "Please tick a score for IV Venofix/Syringe Pump.";
    } else if (badan == null) {
        status = false;
        msg = "Please tick a score for body structure/movement.";
    } else if (mental == null) {
        status = false;
        msg = "Please tick a score for mental status.";
    }

    if (!status) {
        bootbox.alert(msg);
        $('#morse1').css('overflow', 'auto');
    }

    return status;
}

//.... On button morse_btnAdd click .......

$('#morse_btnAdd').on('click', function () {


    //check first all value are checked
    //var isAllChecked = morseValueCheck();

    //get all value from the checked radio button
    if (morseValueCheck()) {
        var morseDate = $('#morseDate').val();
        var morseTime = $('input[name=morseTime]:checked').val();
        var fall = $('input[name=rad_fall]:checked').val();
        var diagnosis = $('input[name=rad_diagnos]:checked').val();
        var movement = $('input[name=rad_pergerakan]:checked').val();
        var venofix = $('input[name=rad_venofix]:checked').val();
        var badan = $('input[name=rad_badan]:checked').val();
        var mental = $('input[name=rad_mental]:checked').val();

        var data = {
            fall: fall,
            diagnosis: diagnosis,
            movement: movement,
            venofix: venofix,
            badan: badan,
            mental: mental,
            morseTime: morseTime,
//            pmiNo: pmiNo,
//            epDate: episodeDate,
            enDate: morseDate
        };

        var msg = "";

        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "../Ortho-Nursing/controller/morseAss_insert.jsp",
            timeout: 60000,
            data: data,
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    msg = "Assessment is added.";
                    $('#morse1').modal('hide');
                    $('#morseForm')[0].reset();
                    loadMorsefallAssessment();
                } else if (data.trim() === 'fail') {
                    msg = "Failed to add assessment.";
                } else if (data.trim() === 'duplicate') {
                    msg = "Assessment record on date " + morseDate + " at " + morseTime + " has already existed.\nPlease pick a different date or time.";
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                msg = "Oopps! " + errorThrown;
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
                bootbox.alert(msg);
                $('#morse1').css('overflow', 'auto');
            }

        });
    }

});


//===================================================================

//---------------------- update assessment record -------------------
//... create modal...
$('#div_morseAss_table').on('click', '#MS_update_modal', function () {
    var hidden = $(this).closest('td').find('#MS_hidden_value').val();
    var arrData = hidden.split("|");

    $('#morseDate').val(arrData[3]);
    $("input[name=morseTime][value=" + arrData[4] + "]").prop('checked', true);
    $("input[name=rad_fall][value=" + arrData[5] + "]").prop('checked', true);
    $("input[name=rad_diagnos][value=" + arrData[6] + "]").prop('checked', true);
    $("input[name=rad_pergerakan][value=" + arrData[7] + "]").prop('checked', true);
    $("input[name=rad_venofix][value=" + arrData[8] + "]").prop('checked', true);
    $("input[name=rad_badan][value=" + arrData[9] + "]").prop('checked', true);
    $("input[name=rad_mental][value=" + arrData[10] + "]").prop('checked', true);



    //disable date and time selection.
    $('input[name="morseTime"]').prop('disabled', true);
    $('#morseDate').prop('disabled', true);
    $('#morse_btnAdd_div').hide();
    $('#morse_btnUpdate_div').show();
    console.log(hidden);
    $('#morse1').modal('show');
});

//... restore modal .....
$('#morse1').on('hidden.bs.modal', function () {
    console.log("Modal is closed");
    $('input[name="morseTime"]').prop('disabled', false);
    $('#morseDate').prop('disabled', false);
    $('#morse_btnAdd_div').show();
    $('#morse_btnUpdate_div').hide();
    $('#morseForm')[0].reset();
    
    var today = $.datepicker.formatDate('dd/mm/yy', new Date());
    $('#morseDate').val(today);
});

//............. update on click button ....
$('#morse_btnUpdate').on('click', function () {
    //get all value from the checked radio button
    if (morseValueCheck()) {
        var morseDate = $('#morseDate').val();
        var morseTime = $('input[name=morseTime]:checked').val();
        var fall = $('input[name=rad_fall]:checked').val();
        var diagnosis = $('input[name=rad_diagnos]:checked').val();
        var movement = $('input[name=rad_pergerakan]:checked').val();
        var venofix = $('input[name=rad_venofix]:checked').val();
        var badan = $('input[name=rad_badan]:checked').val();
        var mental = $('input[name=rad_mental]:checked').val();

        var data = {
            fall: fall,
            diagnosis: diagnosis,
            movement: movement,
            venofix: venofix,
            badan: badan,
            mental: mental,
            morseTime: morseTime,
//            pmiNo: pmiNo,
//            epDate: episodeDate,
            enDate: morseDate
        };

        var msg = "";

        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "../Ortho-Nursing/controller/morseAss_update.jsp",
            timeout: 60000,
            data: data,
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    msg = "Assessment on " + morseDate + " at " + morseTime + " is updated.";
                    $('#morse1').modal('hide');
                    $('#morseForm')[0].reset();
                    loadMorsefallAssessment();
                } else if (data.trim() === 'fail') {
                    msg = "Failed to update assessment on " + morseDate + " at " + morseTime + ".";
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                msg = "Oopps! " + errorThrown;
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
                bootbox.alert(msg);
                $('#morse1').css('overflow', 'auto');
            }

        });
    }

});
//============================end update=======================================

//----------------- delete assessment ---------------------------------
$('#div_morseAss_table').on('click', '#MS_delete_modal', function () {
    var hidden = $(this).closest('td').find('#MS_hidden_value').val();
    var arrData = hidden.split("|");

    var morseDate = arrData[3];
    var morseTime = arrData[4];

    bootbox.confirm({
        title: "Delete item?",
        message: "Are you sure you want to delete assessment on " + morseDate + " at " + morseTime + "?",
        buttons: {
            confirm: {
                label: "Yes",
                className: "btn-success"
            },
            cancel: {
                label: "No",
                className: "btn-danger"
            }
        },
        callback: function (result) {

            if (result) {
                var data = {
                    morseTime: morseTime,
                    enDate: morseDate
                };

                var msg = "";

                createScreenLoading();
                $.ajax({
                    type: 'POST',
                    url: "../Ortho-Nursing/controller/morseAss_delete.jsp",
                    timeout: 60000,
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        if (data.trim() === 'success') {
                            msg = "Assessment on " + morseDate + " at " + morseTime + " is deleted.";
                            loadMorsefallAssessment();
                        } else if (data.trim() === 'fail') {
                            msg = "Failed to delete assessment on " + morseDate + " at " + morseTime + ".";
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        msg = "Oopps! " + errorThrown;
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                        bootbox.alert(msg);
                        
                    }

                });

            }
        }
    });

});
//=========================end delete ==============================

//----------------------- approve record ---------------------------
$('#div_morseAss_table').on('click', '#MS_approve_modal', function () {
    var hidden = $(this).closest('td').find('#MS_hidden_value').val();
    var arrData = hidden.split("|");

    var morseDate = arrData[3];
    var morseTime = arrData[4];

    bootbox.confirm({
        title: "Approve record?",
        message: "Are you sure you want to approve assessment on " + morseDate + " at " + morseTime + "?\nOnce you approved it, you cannot edit it anymore.",
        buttons: {
            confirm: {
                label: "Yes",
                className: "btn-success"
            },
            cancel: {
                label: "No",
                className: "btn-danger"
            }
        },
        callback: function (result) {

            if (result) {
                var data = {
                    morseTime: morseTime,
                    enDate: morseDate
                };

                var msg = "";

                createScreenLoading();
                $.ajax({
                    type: 'POST',
                    url: "../Ortho-Nursing/controller/morseAss_approve.jsp",
                    timeout: 60000,
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        if (data.trim() === 'success') {
                            msg = "Assessment on " + morseDate + " at " + morseTime + " is approved.";
                            loadMorsefallAssessment();
                        } else if (data.trim() === 'fail') {
                            msg = "Failed to approve assessment on " + morseDate + " at " + morseTime + ".";
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        msg = "Oopps! " + errorThrown;
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                        bootbox.alert(msg);
                        
                    }

                });

            }
        }
    });

});
//======================= end approval =============================