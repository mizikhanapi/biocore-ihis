/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    var _discipline_CODE = $("#t_SEARCH_Appointment_DIS_CODE").val();
    var _subdiscipline_CODE = $("#t_SEARCH_Appointment_SUBDIS_CODE").val();
    var _hfc_cd_CODE = $("#t_SEARCH_Appointment_HFC_CD").val();
    var _start_time = $("#t_ADD_Appointment_START_TIME").val() + ":00";
    var _end_time = $("#t_ADD_Appointment_END_TIME").val();
    var _duration = $("#t_ADD_Appointment_DURATION").val() + ":00";

    $.ajax({
        url: 'calender/SelectTIMEAvailability.jsp',
        method: 'POST',
        timeout: 3000,
        data: {
            hfc_cd: $("#t_ADD_Appointment_HFC_CD").val(),
            discipline_cd: $("#t_ADD_Appointment_DIS_CODE").val(),
            subdiscipline_cd: $("#t_ADD_Appointment_SUBDIS_CODE").val()
        },
        success: function (result) {
            $("#div_ADD_Appoinment_TIME").html(result);
        }
    });

    initilizeAppointmentCalendar(_hfc_cd_CODE, _discipline_CODE, _subdiscipline_CODE, _start_time, _end_time, _duration);
    //initilizeAppointmentCalendarPatient(_hfc_cd_CODE, _discipline_CODE, _subdiscipline_CODE, _start_time, _end_time, _duration)
    $.ajax({
        url: "calender/AppointmentData.jsp",
        timeout: 3000,
        method: "POST",
        data: {

        },
        success: function (response) {
            console.log(response);
        }
    });

    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        $('#AppointmentCalender').fullCalendar('render');
    });

    $("#t_SEARCH_PMI_NO").hide();
    $("#t_SEARCH_ID_NO").hide();
    $("#select_TYPE_SEARCH_PATIENT").on('change', function () {
        var type = $("#select_TYPE_SEARCH_PATIENT option:selected").val();
        if (type === 'PMI') {
            $("#t_SEARCH_PMI_NO").show();
            $("#t_SEARCH_IC_NO").hide();
            $("#t_SEARCH_ID_NO").hide();
        } else if (type === 'ID') {
            $("#t_SEARCH_ID_NO").show();
            $("#t_SEARCH_PMI_NO").hide();
            $("#t_SEARCH_IC_NO").hide();
        } else if (type === 'IC') {
            $("#t_SEARCH_IC_NO").show();
            $("#t_SEARCH_PMI_NO").hide();
            $("#t_SEARCH_ID_NO").hide();
        }
    });

    // calendar.fullCalendar( 'render' );
    
    
    $("#AppointmentViewModal").on('hidden.bs.modal',function(){
        $("#btn_CANCEL_Appoinment_CANCEL").show();
        $("#btn_CANCEL_Appoinment_REACTIVE").hide();
    })

    $("#AppointmentAdd").on('shown.bs.modal', function () {
        $.ajax({
            url: 'calender/SelectDoctorAvailability.jsp',
            method: 'POST',
            timeout: 3000,
            data: {
                hfc_cd: $("#t_ADD_Appointment_HFC_CD").val(),
                discipline_cd: $("#t_ADD_Appointment_DIS_CODE").val(),
                subdiscipline_cd: $("#t_ADD_Appointment_SUBDIS_CODE").val()
            },
            success: function (result) {
                $("#div_ADD_Appoinment_Doctor").html(result);
            }
        });
    });

    $(function () {
        $('#t_ADD_Appoinment_Date').datepicker({dateFormat: 'dd-mm-yy'});
    });

    $('#t_SEARCH_Patient_ADD_Appointment').click(function (e) {
        e.preventDefault();
        var dataSearchPatient = {
            pmiNo: $('#t_SEARCH_PMI_NO').val(),
            icNo: $('#t_SEARCH_IC_NO').val(),
            idNo: $('#t_SEARCH_ID_NO').val()
        };
        $.ajax({
            url: 'adminSearchAppointmentAjax.jsp',
            method: 'post',
            data: dataSearchPatient,
            timeout: 10000,
            success: function (result) {
                // console.log(result);
                if (result === "") {
                    alert("Error");
                } else {
                    console.log(result)

                    var result = result.trim();
                    var dataResultPatient = result.split("|");

                    $('#t_ADD_Appointment_PMI_NO').val(dataResultPatient[0]);
                    $('#t_ADD_Appointment_Patient_Name').val(dataResultPatient[1]);
                    $('#t_ADD_Appointment_ID_NO').val(dataResultPatient[2]);
                    $('#t_ADD_Appointment_IC_NO').val(dataResultPatient[3]);

                    $('#t_SEARCH_PMI_NO').val('');
                    $('#t_SEARCH_IC_NO').val('');
                    $('#t_SEARCH_ID_NO').val('');
                }
            },
            error: function (err) {
                alert("Patient not found");
            }
        });

    });

    $("#btn_ADD_Appoinment_ADD").click(function (e) {
        e.preventDefault();
        var dateConvert = $("#t_ADD_Appoinment_Date").val().split("-");
        var _pmi_no = $("#t_ADD_Appointment_PMI_NO").val();
        var _ic_no = $("#t_ADD_Appointment_IC_NO").val();
        var _id_no = $("#t_ADD_Appointment_ID_NO").val();
        var _patient_name = $("#t_ADD_Appointment_Patient_Name").val();
        var _doctor = $("#t_ADD_Appoinment_Doctor option:selected").val();
        var _date = dateConvert[2] + "-" + dateConvert[1] + "-" + dateConvert[0];
        var _time = $("#t_ADD_Appoinment_Time option:selected").val();
        var _type = $("#t_ADD_Appoinment_Type option:selected").val();
        var _discipline = $("#t_ADD_Appointment_DIS_CODE").val();
        var _subdiscipline = $("#t_ADD_Appointment_SUBDIS_CODE").val();
        var _hfc_cd = $("#t_ADD_Appointment_HFC_CD").val();
        
        
        if (_pmi_no === "" || _ic_no === "" || _id_no === "") {
            alert("Please select the patient")
        } else if (_patient_name === "") {
            alert("No patient name. Please select the patient");
        } else if (_doctor === "") {
            alert("No doctor selected. Please select the doctor");
        } else if (dateConvert === "") {
            alert("No date selected. Please select the date");
        } else if (_time === "") {
            alert("No time selected. Please select the time");
        } else if (_type === "") {
            alert("No type selected. Please select the type");
        } else{

        var data = {
            pmiNo: _pmi_no,
            dataUserId: _id_no,
            patientName: _patient_name,
            ic: _ic_no,
            discipline: _discipline,
            subdiscipline: _subdiscipline,
            doctor: _doctor,
            dateAppointment: _date,
            timeAppointment: _time,
            typeAppointment: _type,
            HfcCode: _hfc_cd
        };

        $.ajax({
            url: "patientCheckAppointmentAjax.jsp",
            type: "post",
            data: data,
            timeout: 10000,
            success: function (result) {

                result = result.trim();
                //console.log(result);
                if (result === "clinicOff") {
                    alert("The clinic is off. Please pick other date");
                } else if (result === "datePicked") {
                    alert("Date Picked");
                } else if (result === "slotPicked") {
                    alert("slotPicked");
                } else if (result === "appointmentInsert") {
                    alert("appointmentInsert");
                } else if (result === "appointmentAlreadyInsert") {
                    var confirmation = confirm("By clicking OK you are directly Save the info");
                    if (confirmation == true) {

                        insertAppointment(data);
                        $("#appointmentTable").load("patientAppointmentAjax.jsp #appointmentTable");
                        $("#viewAppointmentTable").load("adminAppointmentAjax.jsp #viewAppointmentTable");
                    } else {
                        alert("Your Appointment not been added");
                        return false;
                    }

                } else if (result == "appointmentInsertstatusActivestatusInactive") {
                    var confirmation = confirm("By clicking OK you are directly Save the info");
                    if (confirmation == true) {

                        insertAppointment(data);
                        $("#appointmentTable").load("patientAppointmentAjax.jsp #appointmentTable");
                    } else {
                        alert("Your Appointment not been added");
                        return false;
                    }

                } else if (result == "appointmentInsertstatusCanceled") {
                    var confirmation = confirm("The chosen date has been canceled before. Click Ok if you want to proceed with make the appointment on that date");
                    if (confirmation == true) {

                        insertAppointment(data);
                        $("#appointmentTable").load("patientAppointmentAjax.jsp #appointmentTable");
                        $("#appointmentTable").load("adminAppointmentAjax.jsp #appointmentTable");
                        $("#appointmentTable").load("medicalStaffNurseAjax.jsp #appointmentTable");
                        $("#appointmentTable").load("medicalStaffDoctorAjax.jsp #appointmentTable");
                    } else {
                        alert("Your Appointment not been added");
                        return false;
                    }

                } else if (result == "doctorOnLeave") {
                    alert("The doctor is on leave. Please choose other doctor");
                } else if (result == "doctorNotDuty") {
                    alert("The doctor is not in their duty. Please choose other doctor");
                } else if (result == "holiday") {
                    alert("The picked date is Holiday. Please view holiday in the View Holiday tab");
                }


            },
            error: function (err) {
                //alert("error");
                console.log(err);
            }
        });
        
            }
    });
    
    $("#btn_CANCEL_Appoinment_CANCEL").click(function(e){
      $("#AppointmentCancelReason").modal('show');
    });
    $("#btn_CANCEL_Appoinment_REACTIVE").click(function (e) {
        if (confirm("Do you want to active this appointment?") == true) {
            var pmiNo = $("#d_APP_V_PATIENT_PMI").text();
            var date = $("#d_APP_V_PATIENT_APPOINTMENT_DATE").text();
            var hfc = $("#d_APP_V_PATIENT_HFC").text();
            var discipline = $("#d_APP_V_PATIENT_DIS").text();
            var subdiscipline = $("#d_APP_V_PATIENT_SUBDIS").text();
            var data = {
               
                pmiNo: pmiNo,
                date: date,
                hfc: hfc,
                discipline: discipline,
                subdiscipline: subdiscipline
            }
            $.ajax({
                method: "POST",
                url: "reactiveAppointment.jsp",
                timeout: 3000,
                data: data,
                success: function (r) {
                    console.log(r);
                    if (r.trim() === "success") {
                        $("#AppointmentViewModal").modal('hide')
                        $('#AppointmentCalender').fullCalendar('refetchEvents');
                    }
                }
            })
        } else {
           
        }
    });

    $("#tab_ADD_Appointment").click(function () {
        //initilizeAppointmentCalendar();
        $('#AppointmentCalender').fullCalendar('render');
    });
    
    $("#btn_CANCEL_Appointment_CONFIRM").click(function(e){
        e.preventDefault();
        var reason = $("#t_CANCEL_Appointment_REASON").val();
        var pmiNo = $("#d_APP_V_PATIENT_PMI").text();
        var date = $("#d_APP_V_PATIENT_APPOINTMENT_DATE").text();
        var hfc = $("#d_APP_V_PATIENT_HFC").text();
        var discipline = $("#d_APP_V_PATIENT_DIS").text();
        var subdiscipline = $("#d_APP_V_PATIENT_SUBDIS").text();
        
        var data= {
            reason:reason,
            pmiNo:pmiNo,
            date:date,
            hfc:hfc,
            discipline:discipline,
            subdiscipline:subdiscipline
        }
        
       $.ajax({
           method:"POST",
           url:"cancelAppointment.jsp",
           timeout:3000,
           data:data,
           success:function(r){
               console.log(r);
               if(r.trim() === "success"){
                   $("#AppointmentViewModal").modal('hide')
                   $('#AppointmentCalender').fullCalendar( 'refetchEvents' );
               }
           }
       })
    })

});

function initilizeAppointmentCalendar(_hfc_cd_CODE, _discipline_CODE, _subdiscipline_CODE, start_time, end_time, slot_duration) {

    var slot = slot_duration.split(":");

    $('#AppointmentCalender').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        slotDuration: slot_duration,
        minTime: start_time,
        maxTime: end_time,
        eventAfterAllRender: function (view) {
            console.log('All Items Rendered!');
        },
        dayClick: function (date, allDay, jsEvent, view) {

            var dateArray = date._i;
            var click_date = new Date(date._d);
            var current_date = new Date();
            console.log(click_date);
            console.log(current_date);
            if (click_date < current_date) {
                alert("You cannot make appointment before today date");
            } else {
               

                var view = $('#AppointmentCalender').fullCalendar('getView');
                if (view.name === 'month') {
                    $('#AppointmentCalender').fullCalendar('changeView', 'agendaDay');
                    $('#AppointmentCalender').fullCalendar('gotoDate', date);
                } else {

                    $("#AppointmentAdd").modal("show");
                    var hour = dateArray[3];
                    var minutes = dateArray[4];
                    if (hour < 10) {
                        hour = "0" + hour
                    }
                    if (minutes < 10) {
                        minutes = "0" + minutes
                    }

                    var selectedTime = hour + ":" + minutes + ":00"
                    var date2 = date.format().substr(0, 10);
                    var datAR = date2.split("-");
                    var newDate = datAR[2] + "-" + datAR[1] + "-" + datAR[0];
          
                    $("#t_ADD_Appoinment_Date").val(newDate);
                    $("#t_ADD_Appoinment_Time").val(selectedTime);
                }
            }
        },

        eventClick: function (calEvent, jsEvent, view) {
            $("#btn_CANCEL_Appoinment_REACTIVE").hide();
            var id = calEvent.id;
            var idAry = id.split("[-|-]");
            var appointment_date = idAry[0];
            var pmi_no = idAry[1];
            var detail_data = {
                pmi_no: pmi_no,
                appointment_date: appointment_date
            }
           
            var date = appointment_date.split(" ");
            var appDateArray = date[0].split("-");
            if(compareDate(appDateArray[0],appDateArray[1]-1,appDateArray[2])){
                 $("#btn_CANCEL_Appoinment_CANCEL").prop("disabled",true);
            }else{
                if(idAry[2] === ""){
                    $("#btn_CANCEL_Appoinment_CANCEL").prop("disabled",false);
                }else{
                    $("#btn_CANCEL_Appoinment_CANCEL").hide();
                    $("#btn_CANCEL_Appoinment_REACTIVE").show();
                    
                }
                
            }
            
            getAppointmentDetail(detail_data);
            $("#AppointmentViewModal").modal("show");
        },

        events: "calender/AppointmentData.jsp?h=" + _hfc_cd_CODE + "&d=" + _discipline_CODE + "&s=" + _subdiscipline_CODE + "&p=" + slot[1],
    });
}

function insertAppointment(data) {
    $.ajax({
        url: "patientInsertAppointmentAjax.jsp",
        type: "post",
        data: data,
        timeout: 10000,
        success: function (result) {

            alert("Your Appointment is success added");
            $('#AppointmentCalender').fullCalendar( 'refetchEvents' );
            $("#t_ADD_Appointment_PMI_NO").val("");
            $("#t_ADD_Appointment_IC_NO").val("");
            $("#t_ADD_Appointment_ID_NO").val("");
            $("#t_ADD_Appointment_Patient_Name").val("");
        }
    });
}

function getAppointmentDetail(data) {
    $.ajax({
        url: "calender/AppointmentViewData.jsp",
        type: "post",
        data: data,
        timeout: 10000,
        success: function (result) {

            $('#Appointment_Detail_Div').html(result);

        }
    });
}



function initilizeAppointmentCalendarPatient(_hfc_cd_CODE, _discipline_CODE, _subdiscipline_CODE, start_time, end_time, slot_duration) {

    $('#AppointmentCalender').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        slotDuration: slot_duration,
        minTime: start_time,
        maxTime: end_time,
        eventAfterAllRender: function (view) {
            console.log('All Items Rendered!');
        },
        dayClick: function (date, allDay, jsEvent, view) {
            console.log();
            var dateArray = date._i;
            var view = $('#AppointmentCalender').fullCalendar('getView');
            console.log(view.name);
            if (view.name === 'month') {
                $('#AppointmentCalender').fullCalendar('changeView', 'agendaDay');
                $('#AppointmentCalender').fullCalendar('gotoDate', date);
            } else {

                $("#AppointmentAdd").modal("show");
                var hour = dateArray[3];
                var minutes = dateArray[4];
                if (hour < 10) {
                    hour = "0" + hour
                }
                if (minutes < 10) {
                    minutes = "0" + minutes
                }

                var selectedTime = hour + ":" + minutes + ":00"
                var date2 = date.format().substr(0, 10);
                var datAR = date2.split("-");
                var newDate = datAR[2] + "-" + datAR[1] + "-" + datAR[0];
                console.log(selectedTime);
                $("#t_ADD_Appoinment_Date").val(newDate);
                $("#t_ADD_Appoinment_Time").val(selectedTime);
            }
        },
        eventClick: function (calEvent, jsEvent, view) {
            var id = calEvent.id;
            var idAry = id.split("[-|-]");
            var appointment_date = idAry[0];
            var pmi_no = idAry[1];

            if (appointment_date === "-" || pmi_no === "-") {
                alert("You not authorize to view this appointment");
            } else {
                var detail_data = {
                    pmi_no: pmi_no,
                    appointment_date: appointment_date
                }
                console.log(detail_data);
                getAppointmentDetail(detail_data);
                $("#AppointmentViewModal").modal("show");
            }



        },

        events: "calender/AppointmentDataPatient.jsp?h=" + _hfc_cd_CODE + "&d=" + _discipline_CODE + "&s=" + _subdiscipline_CODE,
    });
    

}


    function compareDate(year,month,date){
        var CurrentDate = new Date();
        var SelectedDate = new Date(year,month,date);

//As quite rightly mentioned, January = 0, so if your inputs have the literal number for each month (1 for January) replace the line above with the following, to take a month off:
//var SelectedDate = new Date($('[id$=txtYear]').val(), $('[id$=drpMonth]').val()-1, $('[id$=spDate]').val());

        if (CurrentDate > SelectedDate) {
            //CurrentDate is more than SelectedDate
            return true;
        } else {
            //SelectedDate is more than CurrentDate
            return false;
        }
    }