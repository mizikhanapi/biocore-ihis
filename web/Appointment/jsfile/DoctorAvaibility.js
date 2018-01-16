/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    $(function () {
        $('#dateDoctorA').datepicker({dateFormat: 'dd-mm-yy'});
    });
    
    $("#dateDoctorA").on('change',function(){
        var dateChange = $(this).val().split("-");
        var date = dateChange[2]+"-"+dateChange[1]+"-"+dateChange[0];
        var data = {
            date:date
        }
        $.ajax({
            method:"POST",
            url:"search/DoctorAvailabilitySelect.jsp",
            data:data,
            success:function(r){
                $("#searchDoctorAvailibilitySelectDiv").html(r.trim());
            }
        })
    })


    
    $('#todaySearch').click(function (e) {
        e.preventDefault();
        $('#doctorAvailabilityTable').load('main/DoctorAvailability.jsp #doctorAvailabilityTable');
    });

    $('#searchDoctor').click(function (e) {
        e.preventDefault();
        var doc_name = $("#selectDoctorAvailibility").val();
        var date =  $("#dateDoctorA").val();
        if(doc_name === ""){
            alert("Please select doctor name");
        }else if(date === ""){
            alert("Please select date");
        }else{
            var dateAppointment = date.split('-');
            dateAppointment = dateAppointment[2] + "-" + dateAppointment[1] + "-" + dateAppointment[0];

            var data = {
                doc_name: doc_name,
                date: dateAppointment
            }
            searchDoctorAvailibility(data)
        }


    });
});


    function searchDoctorAvailibility(data) {




        $.ajax({
            url: 'search/DoctorAvailibilityResult.jsp',
            method: 'post',
            data: data,
            timeout: 1000,
            success: function (result) {
                console.log(result.trim())
                $('#doctorAvailabilityTableDiv').html(result.trim());
             


            },
            error: function (e) {
                console.log(e);
            }
        });
    }