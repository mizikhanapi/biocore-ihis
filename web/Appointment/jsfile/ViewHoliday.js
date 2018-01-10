/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function initDateStartEnd(startID,endID,format){
    $("#"+startID).datepicker({
            dateFormat: format,
            minDate: 0,
            onSelect: function (date) {
                var dt2 = $('#'+endID);
                var startDate = $(this).datepicker('getDate');
                var minDate = $(this).datepicker('getDate');
                dt2.datepicker('setDate', minDate);
                startDate.setDate(startDate.getDate() + 30);
               // dt2.datepicker('option', 'maxDate', startDate);
                dt2.datepicker('option', 'minDate', minDate);
             
                $(this).datepicker('option', 'minDate', minDate);
                dt2.prop("disabled", false);
            }
    });
    $('#'+endID).datepicker({
        dateFormat:format
    }); 
}

$(document).ready(function(e){
            $('#stateMenu').on('click','.viewHoliday',function(e){
            e.preventDefault();
            var id = $(this).get(0).id;
            dataId = {
                id:id
            };
            $.ajax({
               url:'adminAppointmentViewAjax.jsp',
               method: 'post',
               data: dataId,
               timeout: 10000,
               success: function(result){                            
                   response = result.trim();
                  // console.log(response);
                   $('#viewHoliday').remove();
                   $('#viewAllHoliday').append(response);
               },
               error: function(err){
                   console.log("err");
               }
            });   
        });
})