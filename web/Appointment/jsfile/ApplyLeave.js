/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    initDateStartEnd("startDateLeave","endDateLeave","dd/mm/yy");
        $('#applyLeave').click(function(e){
            e.preventDefault(e);
            
            var startDateLeave = changeDateFormat($('#startDateLeave').val());
            var endDateLeave  =changeDateFormat($('#endDateLeave').val());
            if ($('#startDateLeave').val() === "") {
                alert("Please enter the start date");
            } else if($('#endDateLeave').val() === ""){
                alert("Please enter the end date");
            }else if($('#descLeave').val() === ""){
                alert("Please enter the leave description");
            } else {
                
                var dataLeave = {
                    hfcName: $('#hfcNameL').val(),
                    staffName: $('#staffNameL').val(),
                    startDate: startDateLeave,
                    endDate: endDateLeave,
                    desc: $('#descLeave').val()
                };

                $.ajax({
                    url: 'addLeaveAdminAjax.jsp',
                    method: 'post',
                    data: dataLeave,
                    timeout: 10000,
                    success: function (result) {
                        if (result.trim() === 'success') {
                            alert('Successfully apply for the leave, your leave apply in process');
                            $('#leaveTable').load('index.jsp #leaveTable');
                        } else if (result.trim() === 'process') {
                            alert('Leave request is disallow due to previous request still in processing');
                        } else {
                            alert('ajax Error');
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            }

        });
});