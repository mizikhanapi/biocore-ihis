/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//---- selecting how to view the notes: today, yesterday or specific dates------------
$('#MS_viewBy').on('change', function () {
    var howTo = $(this).val();

    if (howTo === 'x') {
        $('#MS_div_selectDate').show();
    } else {
        $('#MS_div_selectDate').hide();
    }
});

//======================= end select view date=========================================



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

    if(morseDate === '' || morseDate == null){
        status = false;
        msg = "Please pick a date.";
    }
    else if(morseTime == null){
        status = false;
        msg = "Please pick a time.";
    }
    else if (fall == null) {
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
            pmiNo: pmiNo,
            epDate: episodeDate,
            enDate: morseDate
        };
        
        var msg="";
        
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "../Ortho-Nursing/controller/morseAss_insert.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                if(data.trim()=== 'success'){
                    msg="Assessment is added.";
                    $('#morse1').modal('hide');
                    $('#morseForm')[0].reset();
                }
                else if(data.trim()=== 'fail'){
                    msg="Failed to add assessment.";
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                msg = "Oopps! "+ errorThrown;
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
                bootbox.alert(msg);
            }
            
        });
    }

});


//===================================================================
