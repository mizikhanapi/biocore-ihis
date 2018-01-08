/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    $('#t_MANAGE_Appointment_START_TIME').ptTimeSelect();
    $('#t_MANAGE_Appointment_END_TIME').ptTimeSelect();

    $('#div_VIEW_DURATION_APPOINMENT #btn_DELETE_APPOINTMENT_DURATION').on('click', function (e) {
        e.preventDefault();
        var row = $(this).closest("tr");    // Find the row
        var start_time = row.find("#start_time_appointment_duration").text(); // Find the text
        var duration = row.find("#duration_appointment_duration").text(); // Find the text

        var deleteData = {
            start_time: start_time,
            duration: duration
        }
        var c = confirm("Are you sure want delete ?");

        if (c === true) {
            $.ajax({
                url: 'DeleteAppointmentDuration.jsp',
                type: 'POST',
                timeout: 3000,
                data: deleteData,
                success: function (response) {
                    if (response.trim() === 'success') {
                        $("#div_VIEW_DURATION_APPOINMENT").load("adminAppointmentAjax.jsp #div_VIEW_DURATION_APPOINMENT");
                    } else {
                        console.log(response);
                    }
                }
            })
        } else {
            return false;
        }



    })


    $('#btn_MANAGE_Appointment_DURATION_ADD').click(function (e) {
        
        var hfc_cd = $('#t_MANAGE_Appointment_HFC_CD').val();
        var discipline_cd = $('#t_MANAGE_Appointment_DIS_CODE').val();
        var sub_discipline_cd = $('#t_MANAGE_Appointment_SUBDIS_CODE').val();

        var start_time = $('#t_MANAGE_Appointment_START_TIME').val();
        var end_time = $('#t_MANAGE_Appointment_END_TIME').val();
        var duration = $('#t_MANAGE_Appointment_DURATION').val();
        
        if(start_time === ""){
            alert("Please enter the start time");
        }else if(end_time === ""){
            alert("Please enter the end time");
        }else if(duration === ""){
            alert("Please enter the duration");
        }else {
            
        
        
        var store_duration = "00:"+duration+":00"
        var durationX = parseInt(duration) / 60;

        var starttimeAppointment = ConvertTimeformat('24', start_time);
        var endtimeAppointment = ConvertTimeformat('24', end_time);

        var a = moment(starttimeAppointment, 'HH:mm');
        var b = moment(endtimeAppointment, 'HH:mm');
        var x = b.diff(a, 'hours', true)
        
        if(x < 0){
            alert("you need check back your start time and end time");
        } else{

        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: 'checkAppointmentDuration.jsp',
            data: {manageAppointmentData: ""},
            timeout: 3000,
            success: function (response) {
            
                console.log("fromm check duration " + response.trim());
                if (response.trim() === '[HAVE-DATA]') {
                    var r = confirm("The appointment duration already added. Proceed if you want to overwrite the appointment duration");
                    if (r === true) {

                        $.ajax({
                            type: 'POST',
                            url: 'DeleteAllAppointmentDuration.jsp',
                            data: {manageAppointmentData: ""},
                            timeout: 3000,
                            success: function (response) {
                                console.log("fromm delete duration " + response.trim());
                                var hfc_cd = $('#t_MANAGE_Appointment_HFC_CD').val();
                                var discipline_cd = $('#t_MANAGE_Appointment_DIS_CODE').val();
                                var sub_discipline_cd = $('#t_MANAGE_Appointment_SUBDIS_CODE').val();

                                var start_time = $('#t_MANAGE_Appointment_START_TIME').val();
                                var end_time = $('#t_MANAGE_Appointment_END_TIME').val();
                                var duration = $('#t_MANAGE_Appointment_DURATION').val();
                                

                                var durationX = parseInt(duration) / 60;

                                var starttimeAppointment = ConvertTimeformat('24', start_time);
                                var endtimeAppointment = ConvertTimeformat('24', end_time);

                                var a = moment(starttimeAppointment, 'HH:mm');
                                var b = moment(endtimeAppointment, 'HH:mm');
                                var x = b.diff(a, 'hours', true)

                                var no_slot = parseFloat(x) / parseFloat(durationX);
                                var startTime;
                                for (var i = 0; i < no_slot; i++) {
                                    startTime = a.format("HH:mm");
                                    var c = a.add(parseInt(duration), 'm');

                                    var manageAppointmentData = {
                                        hfc_cd: hfc_cd,
                                        discipline_cd: discipline_cd,
                                        sub_discipline_cd: sub_discipline_cd,
                                        start_time: startTime,
                                        duration: store_duration
                                    }
                                    startTime = c.format("HH:mm");
                                    // console.log(manageAppointmentData);
                                    addDuration(manageAppointmentData);
                                }
                                  $("#div_VIEW_DURATION_APPOINMENT").load("main/ManageAppointment.jsp #div_VIEW_DURATION_APPOINMENT");
                                  //location.reload();
                            }
                        })



                    } else {
                        return false
                    }

                } else {
                        var hfc_cd = $('#t_MANAGE_Appointment_HFC_CD').val();
                        var discipline_cd = $('#t_MANAGE_Appointment_DIS_CODE').val();
                        var sub_discipline_cd = $('#t_MANAGE_Appointment_SUBDIS_CODE').val();

                        var start_time = $('#t_MANAGE_Appointment_START_TIME').val();
                        var end_time = $('#t_MANAGE_Appointment_END_TIME').val();
                        var duration = $('#t_MANAGE_Appointment_DURATION').val();

                        var durationX = parseInt(duration) / 60;

                        var starttimeAppointment = ConvertTimeformat('24', start_time);
                        var endtimeAppointment = ConvertTimeformat('24', end_time);

                        var a = moment(starttimeAppointment, 'HH:mm');
                        var b = moment(endtimeAppointment, 'HH:mm');
                        var x = b.diff(a, 'hours', true)

                        var no_slot = parseFloat(x) / parseFloat(durationX);
                        var startTime;
                        for (var i = 0; i < no_slot; i++) {
                            startTime = a.format("HH:mm");
                            var c = a.add(parseInt(duration), 'm');

                            var manageAppointmentData = {
                                hfc_cd: hfc_cd,
                                discipline_cd: discipline_cd,
                                sub_discipline_cd: sub_discipline_cd,
                                start_time: startTime,
                                duration: store_duration
                            }
                            startTime = c.format("HH:mm");
                            // console.log(manageAppointmentData);
                            addDuration(manageAppointmentData);
                        }
                        $("#div_VIEW_DURATION_APPOINMENT").load("main/ManageAppointment.jsp #div_VIEW_DURATION_APPOINMENT");
                        //location.reload();
                }
            }
        })
}

//        
      
}

    });

});


function addDuration(manageAppointmentData) {
    $.ajax({
        type: 'POST',
        url: 'addAppointmentDuration.jsp',
        data: manageAppointmentData,
        timeout: 3000,
        success: function (response) {
            if (response.trim() === 'success') {
                console.log("fromm add duration " + response.trim());
                // alert('The Appointment time successfully added');
                // $("#div_VIEW_DURATION_APPOINMENT").load("adminAppointmentAjax.jsp #div_VIEW_DURATION_APPOINMENT");

            } else {
                console.log(response);
            }
        }
    })
}

  $(document).ready(function(){
      
      $("#hfc_code").hide();
       $("#t_SEARCH_HFC_CANCEL").hide()
       $("#t_SEARCH_HFC_VIEW_Appointment").hide();
       
       $("#t_SEARCH_HFC_CHANGE_HFC").click(function(){
           location.href = "patientSelectHFC.jsp";
//            $("#t_SEARCH_HFC_VIEW_Appointment").show();
//            $("#t_SEARCH_HFC_CANCEL").show();
//            $("#hfc_code").show();
//                   
//        $("#subDiscipline").show();
//        $("#divDiscipline").show();
//            $("#t_SEARCH_Appointment_HFC_NAME").hide();
//            $("#t_SEARCH_Appointment_DIS_NAME").hide();
//            $("#t_SEARCH_Appointment_SUBDIS_NAME").hide();
//            $(this).hide();
       })
       
       $("#t_SEARCH_HFC_CANCEL").click(function(){
           $(this).hide();
           $("#t_SEARCH_HFC_VIEW_Appointment").hide();
           $("#t_SEARCH_HFC_CHANGE_HFC").show();
                       $("#t_SEARCH_Appointment_HFC_NAME").show();
        $("#t_SEARCH_Appointment_DIS_NAME").show();
        $("#t_SEARCH_Appointment_SUBDIS_NAME").show();
        $("#hfc_code").hide();

        $("#subDiscipline").hide();
        $("#divDiscipline").hide();

       })
                $("#hfc_code").on('change',function(){
                    
                    $.ajax({
                      url:"search/getSelectDiscipline.jsp",
                      data:{
                          hfc_cd : $("#hfc_code").val()
                      },
                      timeout:3000,
                      success:function(r){
                          console.log(r);
                          $("#divDiscipline").html(r.trim());
                      }
                    })
                });
                
                $("#btnSelectHFC").click( function(e){
                    e.preventDefault();
                    var hfc_cd = $("#hfc_code").val();
                    var hfc_name = $("#hfc_code option:selected").text();
                    var dis_cd = $("#dis_code").val();
                    var dis_name = $("#dis_code option:selected").text();
                    var subdis_cd = $("#subdis_code").val();
                    var subdis_name = $("#subdis_code option:selected").text();
                    
                    var data = {
                        hfc_cd:hfc_cd,
                        hfc_name:hfc_name,
                        dis_cd:dis_cd,
                        dis_name:dis_name,
                        subdis_cd:subdis_cd,
                        subdis_name:subdis_name
                    }
                    $.ajax({
                        url:"setSessionPatient.jsp",
                        timeout:3000,
                        data:data,
                        success:function(r){
                            if(r.trim() === "|SUCCESS|"){
                                location.href = "index.jsp"
                            }else{
                                bootbox.alert("Choose the correct Health Facility");
                            }
                        }
                    })
                    console.log(data);
                });
                

                
            });
             $(document).on('change','#dis_code',function(){
                    $.ajax({
                        url:"search/getSelectSubdiscipline.jsp",
                        data:{
                             hfc_cd : $("#hfc_code").val(),
                             dis_cd: $("#dis_code").val()
                        },
                        timeout:3000,
                        success:function(r){
                            console.log(r.trim())
                            $("#subDiscipline").html(r.trim());
                        }
                    })
                });
                