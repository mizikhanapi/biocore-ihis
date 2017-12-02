<%-- 
    Document   : dischargeTab
    Created on : Dec 1, 2017, 3:38:28 AM
    Author     : user
--%>

<div id="noPatDIv" class="text-center">
    <h3>Please select a patient first!</h3>
</div>
<div id="patientInfoDiv"></div>

<script>
    $('#patientInfoDiv').on('click', '#d_btnBack', function () {
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');
        $('#patientInfoDiv').html('');
        $('#noPatDIv').show();
    });

    $('#patientInfoDiv').on('click', '#d_btnDischarge', function () {

        bootbox.confirm({
            message: "Are you sure to discharge the patient?",
            title: "Discharge?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {
                if (result) {
                    var data = {
                        arrDay: $('#hidArrDays').val(),
                        arrCharge: $('#hidArrCharges').val(),
                        arrCode: $('#hidArrCode').val(),
                        arrName: $('#hidArrName').val(),
                        orderNo: $('#hidOrderNo').val(),
                        orderDate: $('#hidOrderDate').val(),
                        pmiNo: $('#hidPmiNo').val(),
                        epiDate: $('#hidEpiDate').val(),
                        discipline: $('#hidDiscipline').val(),
                        bedID: $('#hidBedId').val(),
                        wardID: $('#hidWardId').val()
                    };
                    console.log(data);
                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        url: "discharge/dischargeProcess.jsp",
                        data: data,
                        timeout: 60000,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === "success") {
                                $('.nav-tabs a[href="#tab_default_1"]').tab('show');
                                $('#patientInfoDiv').html('');
                                $('#noPatDIv').show();
                                $('#WardOccuTable').html('');
                                bootbox.alert('Patient is successfully discharged.');
                            } else {
                                console.log(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("Oops " + errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            destroyScreenLoading();
                        }
                    });
                }
            }
        });



    });
</script>