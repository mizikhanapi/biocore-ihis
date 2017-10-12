/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    var hfc_name = $("#t_SEARCH_Appointment_HFC_NAME").val();
//    $("#t_SEARCH_Appointment_SUBDIS_NAME").prop('disabled', true);
//    searchHFCDefault("t_SEARCH_Appointment_HFC_NAME", "t_SEARCH_Appointment_HFC_NAME_LOADING", hfc_name);
//    searchDisciplineOnly("t_SEARCH_Appointment_DIS_NAME", "t_SEARCH_Appointment_DIS_NAME_LOADING", $("#t_SEARCH_Appointment_HFC_CD").val());
//
//    $("#t_SEARCH_Appointment_HFC_NAME").on('select:flexdatalist', function () {
//        var current_hfc_name = $(this).val();
//
//        getHFCCode(current_hfc_name, "t_SEARCH_Appointment_HFC_CD", "-", "t_SEARCH_Appointment_DIS_NAME", "t_SEARCH_Appointment_DIS_NAME_LOADING");
//
//    });
//
//    $("#t_SEARCH_Appointment_DIS_NAME").on('select:flexdatalist', function () {
//        var discipline_name = $(this).val();
//        var hfc_cd = $("#t_SEARCH_Appointment_HFC_CD").val();
//
//        $("#t_SEARCH_Appointment_SUBDIS_NAME").prop('disabled', false);
//        getDisciplineCode(hfc_cd, discipline_name, "t_SEARCH_Appointment_DIS_CODE", "t_SEARCH_Appointment_SUBDIS_NAME", "t_SEARCH_Appointment_SUBDIS_NAME_LOADING");
//    });
//
//    $("#t_SEARCH_Appointment_SUBDIS_NAME").on('select:flexdatalist', function () {
//        var sub_discipline_name = $(this).val();
//        var hfc_cd = $("#t_SEARCH_Appointment_HFC_CD").val();
//        var discipline_code = $("#t_SEARCH_Appointment_DIS_CODE").val();
//        getSubDisciplineCode(hfc_cd, discipline_code, sub_discipline_name, "t_SEARCH_Appointment_SUBDIS_CODE");
//    });

    $('#t_SEARCH_HFC_VIEW_Appointment').click(function (e) {
        e.preventDefault();
        var search_hfc_cd = $('#t_SEARCH_Appointment_HFC_CD').val();
        var search_dis_cd = $('#t_SEARCH_Appointment_DIS_CODE').val();
        var search_subdis_cd = $('#t_SEARCH_Appointment_SUBDIS_CODE').val();

        $.ajax({
            url: 'calender/getPatientAppointmentDuration.jsp',
            method: 'POST',
            timeout: 3000,
            data: {
                hfc_cd: search_hfc_cd,
                discipline_cd: search_dis_cd,
                subdiscipline_cd: search_subdis_cd
            },
            success: function (r) {
                console.log(r);
                var duration_array;
                if (r.trim() === "NO-DATA") {
                    duration_array = ["07:00", "18:00:00", "00:15:00"];
                } else {
                    duration_array = r.trim().split("|");

                }
                console.log(duration_array);
                $('#AppointmentCalender').fullCalendar('destroy');
                initilizeAppointmentCalendar(search_hfc_cd, search_dis_cd, search_subdis_cd, duration_array[0], duration_array[1], duration_array[2]);
                $('#AppointmentCalender').fullCalendar('render');
            }
        })

        //initilizeAppointmentCalendar(search_hfc_cd,search_dis_cd,search_subdis_cd);
        //$('#AppointmentCalender').fullCalendar('render');
    })

    $("#AppointmentAddPatient").on('shown.bs.modal', function () {
        $.ajax({
            url: 'calender/SelectDoctorAvailability.jsp',
            method: 'POST',
            timeout: 3000,
            data: {
                hfc_cd: $("#t_ADD_Appointment_PATIENT_HFC_CD").val()
            },
            success: function (result) {
                $("#div_ADD_Appoinment_Patient_Doctor").html(result);
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

        var _discipline = $("#t_ADD_Appointment_PATIENT_DIS_CODE").val();
        var _subdiscipline = $("#t_ADD_Appointment_PATIENT_SUBDIS_CODE").val();
        var _hfc_cd = $("#t_ADD_Appointment_PATIENT_HFC_CD").val();

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

        console.log(data);

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
    });

});

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


function insertAppointment(data) {
    $.ajax({
        url: "patientInsertAppointmentAjax.jsp",
        type: "post",
        data: data,
        timeout: 10000,
        success: function (result) {

            alert("Your Appointment is success added");
            location.reload();
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