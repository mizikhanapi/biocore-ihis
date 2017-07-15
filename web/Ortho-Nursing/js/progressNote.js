/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * * created by Ardhi Surya Ibrahim
 * email: rdsurya147@gmail.com 
 * insta: @rdcfc
 * github: rdsurya
 */

$(function () {
    var name = $('#pName').text().trim();
    var ic = $('#pIC').text().trim();

    if (name.localeCompare('-') !== 0 && ic.localeCompare('-') !== 0)
        loadProgressNotes();
    
    //initialise datepicker and timepicker for continuation modal.
    $('#proNote_date').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    $('#proNote_time').timepicker({
        'timeFormat': 'HH:mm',
        'scrollbar': 'true',
        'minTime': '00:00',
        'maxTime': '23:59',
        'interval': 1     
    });


});

//------------ bind function to add progress note button on patient name change------------

$('#pName').on('DOMSubtreeModified', function () {
    
    console.log('Name has change!');
    var name = $(this).text().trim();

    if (name.localeCompare('-') !== 0) {
        $('#proNote_modal_add').on('click', function () {
            var today = $.datepicker.formatDate('dd/mm/yy', new Date());
            $('#proNote_date').val(today);
            
            $('#proNote_time').timepicker('setTime', new Date());
            
            $('#div_proNote_btnAdd').show();
            $('#div_proNote_btnUpdate').hide();
            
            $('#proNote_date').prop('disabled', false);
            $('#proNote_time').prop('disabled', false);
            
        });
        
        console.log('Function is binded!');
    }
});

//===============================================================================================

//---- selecting how to view the notes: today, yesterday or specific dates------------
$('#proNote_viewBy').on('change', function () {
    var howTo = $(this).val();

    if (howTo === 'x') {
        $('#proNote_div_select_date').show();
    } else {
        $('#proNote_div_select_date').hide();
        loadProgressNotes();// view previous assessment
    }
});

//======================= end select view date=========================================

//---------------------- load assessment -------------------------------------
function loadProgressNotes() {

    var data = {
        day: $('#proNote_viewBy').val(),
        from: $('#proNote_dateFrom').val(),
        to: $('#proNote_dateTo').val()
    };

    console.log("loading progress notes");
    createScreenLoading();
    $.ajax({
        type: 'POST',
        data: data,
        timeout: 60000,
        url: "../Ortho-Nursing/controller/progressNote_retrieve.jsp",
        success: function (data, textStatus, jqXHR) {
            $('#div_view_progressNotes').html(data);
            console.log(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#div_view_progressNotes').html("Oopps! " + errorThrown);
        },
        complete: function (jqXHR, textStatus) {
            destroyScreenLoading();
        }
    });
}
//============================================================================

//----------------------- view previous assessment based on selected date range -----------------------------
$('#proNote_btnSearchByDate').on('click', function () {

    var dateFrom = $('#proNote_dateFrom').val();
    var dateTo = $('#proNote_dateTo').val();

    if (dateFrom === '' || dateTo === '') {
        bootbox.alert("Please pick the date range!");
    } else
        loadProgressNotes();
});

//==============================================================================


//-------------- Add new progress notes ------------------------------

//.... check for empty fields
function proNoteValueCheck() {
    var msg = "";

    var complete = true;

    var date = $('#proNote_date').val();
    var time = $('#proNote_time').val();
    var notes = $('#proNote_notes').val().trim();

    if (date === '') {
        msg = "Please pick a date.";
        complete = false;
    } else if (time === '') {
        msg = "Please pick a time.";
        complete = false;
    } else if (notes === '') {
        msg = "Please type some notes.";
        complete = false;
    }

    if (!complete) {
        bootbox.alert(msg);
    }

    return complete;
}

//..... add new notes on button click
$('#proNote_btnAdd').on('click', function () {

    if (proNoteValueCheck()) {
        var date = $('#proNote_date').val();
        var time = $('#proNote_time').val();
        var notes = $('#proNote_notes').val().trim();

        notes = notes.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

        var data = {
            enDate: date,
            enTime: time,
            notes: notes
        };

        var msg = "";
        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "../Ortho-Nursing/controller/progressNote_insert.jsp",
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    $('#continuation').modal('hide');
                    $('#continuation_form')[0].reset();
                    loadProgressNotes();
                    msg = "Progress note is added.";
                } else if (data.trim() === 'fail') {
                    msg = "Failed to add progress note!";
                } else if (data.trim() === 'duplicate') {
                    msg = "Progress notes on " + date + " at " + time + " has already existed.\nPlease pick a different date or time.";
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
});
//============== end add progress notes ==============================

//---------------- update progress note -------------------

//.... create the modal
$('#div_view_progressNotes').on('click', '#proNote_btnUpdate_modal', function(){
    var leDiv = $(this).closest(".media");
    
    var note = leDiv.find('p').text().trim();
    var dateArr = leDiv.find('dt').text().trim().split(" ");
    var date = dateArr[0];
    var time = dateArr[1];
    
    //console.log(note+date+time);
    
    $('#proNote_date').val(date);
    $('#proNote_time').val(time);    
    $('#proNote_notes').val(note);   
    
    //disable key data
    $('#proNote_date').prop('disabled', true);
    $('#proNote_time').prop('disabled', true);
    
    $('#div_proNote_btnAdd').hide();
    $('#div_proNote_btnUpdate').show();
    $('#continuation').modal('show');
});

//... update on button click
$('#proNote_btnUpdate').on('click', function(){
    
    if (proNoteValueCheck()) {
        var date = $('#proNote_date').val();
        var time = $('#proNote_time').val();
        var notes = $('#proNote_notes').val().trim();

        notes = notes.replace(/'/g, "\\\'").replace(/"/g, "\\\"");

        var data = {
            enDate: date,
            enTime: time,
            notes: notes
        };

        var msg = "";
        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "../Ortho-Nursing/controller/progressNote_update.jsp",
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    $('#continuation').modal('hide');
                    $('#continuation_form')[0].reset();
                    loadProgressNotes();
                    msg = "Progress note is updated.";
                } else if (data.trim() === 'fail') {
                    msg = "Failed to update progress note!";
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
});
//============== end update note ==========================

//------------ delete progress notes -----------------
$('#div_view_progressNotes').on('click', '#proNote_btnDelete', function(){
    var leDiv = $(this).closest(".media");
    
    var dateTime = leDiv.find('#proNote_hidden_dateTime').val();
    console.log(dateTime);
    
    var dateArr = leDiv.find('dt').text().trim().split(" ");
    var date = dateArr[0];
    var time = dateArr[1];
    
    bootbox.confirm({
        title: "Delete item?",
        message: "Are you sure you want to delete progress note on " + date + " at " + time + "?",
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
                    dateTime: dateTime
                };

                var msg = "";

                createScreenLoading();
                $.ajax({
                    type: 'POST',
                    url: "../Ortho-Nursing/controller/progressNote_delete.jsp",
                    timeout: 60000,
                    data: data,
                    success: function (data, textStatus, jqXHR) {
                        if (data.trim() === 'success') {
                            msg = "Progress note on " + date + " at " + time + " is deleted.";
                            loadProgressNotes();
                        } else if (data.trim() === 'fail') {
                            msg = "Failed to delete progress note on " + date + " at " + time + ".";
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
//=========== end update progress notes ==============