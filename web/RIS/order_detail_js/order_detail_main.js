/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



//------------------on document ready to create datepicker --------------------------------
$(function () {
    //console.log('hai');
    //creating datepicker.........
    $('#SED_date').datepicker({
        changeMonth: true,
        changeYear: true,
        minDate: 0,
        dateFormat: 'dd/mm/yy'
    });
});
//==========================================================================================

//global variable for procedure search
var selectedPro = "";
var isProSelected = false;

//global variable for picture
var RIS_gambarURI = "";

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


// Move to Order Details Fetch Details Start
$('#risOrderListContent').off('click', '#risManageOrderListTable #moveToRISOrderDetailsTButton').on('click', '#risManageOrderListTable #moveToRISOrderDetailsTButton', function (e) {

    e.preventDefault();

    var row = $(this).closest("tr");
    var rowData = row.find("#dataRISOrderListhidden").val();
    var arrayData = rowData.split("|");
    //console.log(arrayData);

    //Assign Array into seprated val
    var rispmino = arrayData[0];
    var risName = arrayData[13];
    var risnic = arrayData[14];
    var risGender = arrayData[18];
    var risBdate = arrayData[15];
    var risBtype = arrayData[19];
    var risOrderNo = arrayData[1];
    var risOrderDate = arrayData[5];
    var risOrderLocationCode = arrayData[2];


    //Set value to the Second Tab 
    $("#rispatientpmino").val(rispmino);
    $("#rispatientName").val(risName);
    $("#rispatientnic").val(risnic);
    $("#rispatientGender").val(risGender);
    $("#rispatientBdate").val(risBdate);
    $("#rispatientBtype").val(risBtype);
    $("#risOrderNo").val(risOrderNo);
    $("#risOrderDate").val(risOrderDate);
    $("#risOrderLocationCode").val(risOrderLocationCode);

    loadAllergyDiagnosisOrder(risOrderNo, rispmino);
    $('#btnRISCall').prop('disabled', false);
    $('#btnRISCancelCall').prop('disabled', true);
    cancelCallPatient(false);

});
// Move to Order Details Fetch Details End

// Move to Order Details And Load All Table Data Start
function loadAllergyDiagnosisOrder(orderNo, pmino) {

    var dataDiagnosis = {
        pmino: pmino
    };

    var dataAllergy = {
        pmino: pmino
    };

    var dataOrder = {
        orderNo: orderNo
    };


    $.ajax({
        url: "risManageOrderListAllergyTable.jsp",
        type: "post",
        data: dataAllergy,
        timeout: 3000,
        success: function (returnAllergyTableHTML) {
            //console.log(returnAllergyTableHTML);
            $('#risManageAllergyListTableDiv').html(returnAllergyTableHTML);

            $.ajax({
                url: "risManageOrderListDiagnosisTable.jsp",
                type: "post",
                data: dataDiagnosis,
                timeout: 3000,
                success: function (returnDiagnosisTableHTML) {
                    //console.log(returnDiagnosisTableHTML);
                    $('#risManageDiagnosisListTableDiv').html(returnDiagnosisTableHTML);

                    $.ajax({
                        url: "risManageOrderListDetails.jsp",
                        type: "post",
                        data: dataOrder,
                        timeout: 3000,
                        success: function (returnOrderDetailsTableHTML) {
                            $('#risManageOrderDetailsListTableDiv').html(returnOrderDetailsTableHTML);
                            //$('#risManageOrderDetailsListTable').trigger('contentchanged');
                            $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                        }
                    });

                }
            });

        }
    });

}
// Move to Order Details And Load All Table Data End


// Load Datatable To Tables Start
//    $(document).on('contentchanged', '#risManageOrderDetailsListTableDiv', function () {
//
//        $('#risManageOrderDetailsListTable').DataTable().destroy();
//
//        // do something after the div content has changed
//        $('#risManageOrderDetailsListTable').DataTable({
//            "paging": false,
//            "searching": false,
//            "info": false,
//            "language": {
//                "emptyTable": "No Request Available To Display"
//            }
//        });
//
//        console.log('Table is changed');
//
//    });
// Load Datatable To Tables End 


//======================================================================================================================================================================================//

//------------------- refresh order detail ------------------------------------------
$('#risOrderDetailRefreshBtn').on('click', function () {
    var orderNo = $('#risOrderNo').val();
    if (orderNo === "") {

        bootbox.alert('Please select an order first');
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');

    } else {
        createScreenLoading();
        loadOrderDetailList(orderNo);
    }
});

//=================== refersh order detail =======================

//---------------------- create modal for request new order --------------------------------
$('#risOrderNewRequestButton').on('click', function () {
    var orderNo = $('#risOrderNo').val();
    if (orderNo === "") {

        bootbox.alert('Please select an order first');
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');
        return false;
    }

    $('#modal_requestNewOrder').modal('show');

    $('#RNO_modalTitle').text('Request New Order');

    $('#RNO_addForm')[0].reset(); //reset the form

    $('#RNO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="RNO_btnAdd">Add</button>');
});
//=============================================================================

//-------------------search procedure of new order --------------------------------------------------------


$('#RNO_proName').on('keyup', function () {
    var BScode = "dummy";//$('#RNO_bodySystem').val();
    var MODcode = "dummy";//$('#RNO_modality').val();
    
    /*
     * New update 15/8/2017
     * Set dummy to BScode and MODcode to a value other than "" 
     */
    
    var input = $(this).val();

    if (input.length > 0) {

        if (BScode === "" || MODcode === "") {
            bootbox.alert('Please select body system and modality first.');
            $(this).val('');

        } else {
            $('#RNO_pro_match').html('<img src="img/ajax-loader.gif">');
            var data = {
                BScode: BScode,
                MODcode: MODcode,
                key: input
            };

            $.ajax({
                type: 'POST',
                url: "order_control/searchProcedure.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    $('#RNO_pro_match').html(data);
                    $('#RNO_pro_matchlist li').on('click', function () {

                        $('#RNO_proName').val($(this).text());
                                                
                        $('#RNO_bodySystem').val($(this).data('bscode'));
                        $('#RNO_modality').val($(this).data('modcode'));
                        
                        console.log($(this).data('bscode'));
                        
                        isProSelected = true;
                        selectedPro = $('#RNO_proName').val();
                        
                        $('#RNO_pro_match').html('');//clear division
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $('#RNO_pro_match').text("Opps! " + errorThrown);

                }


            });//end ajax
        }

    } else {
        $('#RNO_pro_match').html('');
    }
});

//--------------------------- reset procedure name on bs and mod change ----------------------------------------

function resetProcedureName() {
    $('#RNO_proName').val('');
    isProSelected = false;
    selectedPro = '';
}

$('#RNO_bodySystem').on('change', function () {
    resetProcedureName();
});

$('#RNO_modality').on('change', function () {
    resetProcedureName();
});

//==============================================================================

//------------------------- add new order start --------------------------------
$('#RNO_div_btnAdd_or_update').on('click', '#RNO_btnAdd', function () {

    var orderNo = $('#risOrderNo').val();

    var bsCode = $('#RNO_bodySystem').val();
    var modCode = $('#RNO_modality').val();
    var procedure = $('#RNO_proName').val();
    var instruction = $('#RNO_instruction').val();
    
    if (isProSelected === false || selectedPro !== procedure || procedure === "") {
        bootbox.alert('Please choose existing procedure.', function () {
            $('#RNO_proName').focus();
        });

    }
    else if (bsCode === "") {
        bootbox.alert('Select body system.', function () {
            $('#RNO_bodySystem').focus();
        });

    } else if (modCode === "") {
        bootbox.alert('Select body system.', function () {
            $('#RNO_modality').focus();
        });

    }  else {
        instruction = instruction.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
        var arrData = procedure.split('|');
        procedure = arrData[0].trim();



        var data = {
            orderNo: orderNo,
            modCode: modCode,
            bsCode: bsCode,
            proCode: procedure,
            instruction: instruction
        };
        $('#risManageOrderDetailsListTableDiv').append('<div class="loading">Loading</div>');
        $.ajax({
            type: 'POST',
            url: "order_control/requestNewOrder_insert.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    bootbox.alert('New order is added.');
                    loadOrderDetailList(orderNo);

                } else if (data.trim() === 'duplicate') {
                    bootbox.alert('Duplicate order. Please order different item');
                    $('.loading').hide();

                } else if (data.trim() === 'fail') {

                    bootbox.alert('Fail to add new order.');
                    $('.loading').hide();
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert('Opps! ' + errorThrown);
                $('.loading').hide();
            },
            complete: function (jqXHR, textStatus) {
                //$('.loading').hide();
                $('.modal-backdrop').hide();
                $('#modal_requestNewOrder').modal('hide');
            }
        });
    }
});

function loadOrderDetailList(orderNo) {

    var dataOrder = {orderNo: orderNo};

    $.ajax({
        url: "risManageOrderListDetails.jsp",
        type: "post",
        data: dataOrder,
        success: function (returnOrderDetailsTableHTML) {
            $('#risManageOrderDetailsListTableDiv').html(returnOrderDetailsTableHTML);
            //$('#risManageOrderDetailsListTable').trigger('contentchanged');
            //$('.nav-tabs a[href="#tab_default_2"]').tab('show');
        },
        complete: function (jqXHR, textStatus) {
            destroyScreenLoading();
        }
    });
}
//===============================================================================

//------------------- set exam date -------------------------------------------------
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnModalDate', function () {

    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    //var button = row.find('#MOD_btnModalDate');

    var status = arrData[8].trim();

    //creating modal..........

    if (status === "0") {
        var bsCode = arrData[2], bsName = arrData[11], modCode = arrData[1], modName = arrData[12], proCode = arrData[3], proName = arrData[9], exDate = arrData[10];

        $('#SED_bodySystem').val(bsName);
        $('#SED_bodySystem_cd').val(bsCode);
        $('#SED_modality').val(modName);
        $('#SED_modality_cd').val(modCode);
        $('#SED_proName').val(proName);
        $('#SED_pro_cd').val(proCode);
        $('#SED_date').val(exDate);


        $('#modal_setExamDate').modal('show');

    } else {
        $(this).prop('disabled', true);
    }
    //console.log(data);
});


//---------- confirm exam date-------------------
$('#SED_btnAdd').on('click', function () {

    var exDate = $('#SED_date').val();
    var orderNo = $('#risOrderNo').val();
    var bsCode = $('#SED_bodySystem_cd').val();
    var modCode = $('#SED_modality_cd').val();
    var proCode = $('#SED_pro_cd').val();

    if (exDate === '') {
        bootbox.alert('Please pick a date first.', function () {
            $('#SED_date').focus();
        });

    } else {
        $('#modal_setExamDate').modal('hide');

        var data = {
            process: 'setDate',
            orderNo: orderNo,
            bsCode: bsCode,
            modCode: modCode,
            proCode: proCode,
            exDate: exDate
        };

        createScreenLoading();

        $.ajax({
            type: 'POST',
            url: "order_control/order_update.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                if (data.trim() === 'success') {
                    loadOrderDetailList(orderNo);

                } else if (data.trim() === 'fail') {
                    bootbox.alert('Failed to set exam date. Try again.');
                    destroyScreenLoading();
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert('Opps! ' + errorThrown);
                destroyScreenLoading();
            }

        });
    }

});

//===================================== exam date ===================================================



//------------------- perform exam on click --------------------------------------
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnPerform', function () {

    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    var bsCode = arrData[2], modCode = arrData[1], proCode = arrData[3], proName = arrData[9], orderNo = arrData[0];

    bootbox.confirm({
        message: "Are you sure want to perform this exam? " + proCode + "-" + proName,
        title: "Perform Exam?",
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

            if (result === true) {

                var data = {
                    process: 'perform',
                    orderNo: orderNo,
                    bsCode: bsCode,
                    modCode: modCode,
                    proCode: proCode
                };

                createScreenLoading();

                $.ajax({
                    url: "order_control/order_update.jsp",
                    type: "post",
                    data: data,
                    success: function (datas) {

                        if (datas.trim() === 'success') {
                            bootbox.alert('Exam is performed.');
                            loadOrderDetailList(orderNo);


                        } else if (datas.trim() === 'fail') {
                            bootbox.alert("Fail to perform exam!");
                            destroyScreenLoading();

                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Opps! " + errorThrown);
                        destroyScreenLoading();
                    }

                });

            } else {
                console.log("Process Is Canceled");
            }

        }
    });

});
//=========================== perform the exam ============================================




//------------------------------- cancel order --------------------------------------------
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnDelete', function () {

    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    var bsCode = arrData[2], modCode = arrData[1], proCode = arrData[3], proName = arrData[9], orderNo = arrData[0];

    bootbox.confirm({
        message: "Are you sure want to delete(cancel) this order? " + proCode + "-" + proName,
        title: "Cancel Order?",
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

            if (result === true) {

                var data = {
                    process: 'cancel',
                    orderNo: orderNo,
                    bsCode: bsCode,
                    modCode: modCode,
                    proCode: proCode
                };

                createScreenLoading();

                $.ajax({
                    url: "order_control/order_update.jsp",
                    type: "post",
                    data: data,
                    success: function (datas) {

                        if (datas.trim() === 'success') {
                            bootbox.alert('Order is cancelled.');
                            loadOrderDetailList(orderNo);


                        } else if (datas.trim() === 'fail') {
                            bootbox.alert("Fail to cancel order!");
                            destroyScreenLoading();

                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Opps! " + errorThrown);
                        destroyScreenLoading();
                    }

                });

            } else {
                console.log("Process Is Canceled");
            }

        }
    });

});

//=========================== cancel order ==========================================

//-------------------------prepare exam result --------------------------------------

//creating modal
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnPrepare', function () {
    RIS_gambarURI = "";
    $('#PR_gamba').attr('src', RIS_gambarURI);

    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    var bsCode = arrData[2], modCode = arrData[1], proCode = arrData[3], proName = arrData[9], orderNo = arrData[0], bsName = arrData[11], modName = arrData[12], proName = arrData[9];

    $('#PR_bodySystem').val(bsName);
    $('#PR_bodySystem_cd').val(bsCode);
    $('#PR_modality').val(modName);
    $('#PR_modality_cd').val(modCode);
    $('#PR_proName').val(proName);
    $('#PR_pro_cd').val(proCode);

    $('#PR_fileToLoad').val('');
    $('#PR_comment').val('');

    $('#modal_prepareResult').css('overflow', 'auto');

    $('#modal_prepareResult').modal('show');
});

$('#PR_fileToLoad').checkFileType({
    allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
    success: function () {
        loadImageFileAsURL();
    },
    error: function () {
        bootbox.alert('Incompatible file type');
        $('#PR_fileToLoad').val("");
        //$('#dym').html("");
        RIS_gambarURI = "";
    }
});

function loadImageFileAsURL()
{

    var iSize = 0;

    iSize = ($("#PR_fileToLoad")[0].files[0].size / 1024);

    var sizeSmall = false;

    if (iSize / 1024 > 1) {
        if (((iSize / 1024) / 1024) > 1)

        {
            //iSize = (Math.round(((iSize / 1024) / 1024) * 100) / 100);
            //$("#lblSize").html(iSize + "Gb");
            sizeSmall = false;

        } else

        {

            iSize = (Math.round((iSize / 1024) * 100) / 100);
            sizeSmall = iSize <= 0.7;
            //$("#lblSize").html(iSize + "Mb");

        }


    } else {

        iSize = (Math.round(iSize * 100) / 100);

        sizeSmall = iSize <= 700;

    }


    if (sizeSmall) {
        //document.getElementById("dym").innerHTML = '<div class="loader"></div>';
        var filesSelected = document.getElementById("PR_fileToLoad").files;
        if (filesSelected.length > 0)
        {
            var fileToLoad = filesSelected[0];

            var fileReader = new FileReader();

            fileReader.onload = function (fileLoadedEvent)
            {

                RIS_gambarURI = fileLoadedEvent.target.result;


                //document.getElementById("dym").innerHTML = '<img id="myImage">';

                //document.getElementById("myImage").src = RIS_gambarURI;
                $('#PR_gamba').attr('src', RIS_gambarURI);
            };

            fileReader.readAsDataURL(fileToLoad);
        }

    } else {

        bootbox.alert("File size must not exceed 650Kb");
        $('#PR_fileToLoad').val("");
        RIS_gambarURI = "";
        $('#PR_gamba').attr('src', RIS_gambarURI);
        //$('#dym').html("");
    }


}

//...... submit exam result ............
$('#PR_btnSubmit').on('click', function () {

    var orderNo = $('#risOrderNo').val();
    var bsCode = $('#PR_bodySystem_cd').val();
    var modCode = $('#PR_modality_cd').val();
    var proCode = $('#PR_pro_cd').val();
    var comment = $('#PR_comment').val();

    if (comment === '') {
        bootbox.alert('Please write a meaningful comment.',
                function () {
                    $('#PR_comment').focus();
                }
        );
    }
    else{
        comment = comment.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
        var data = {
            process: 'report',
            orderNo: orderNo,
            bsCode: bsCode,
            modCode: modCode,
            proCode: proCode,
            comment: comment,
            gambar: RIS_gambarURI
        };
        
        $('#modal_prepareResult').modal('hide');
        createScreenLoading();
        
        $.ajax({
            type: 'POST',
            url: "order_control/order_update.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                if(data.trim() === 'success'){
                    bootbox.alert('Report is submitted.');
                    loadOrderDetailList(orderNo);
                    
                }else if(data.trim() === 'fail'){
                    bootbox.alert('Fail to submit report.');
                    destroyScreenLoading();
                }else{
                    console.log(data);
                    destroyScreenLoading();
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Opps! " + errorThrown);
                        destroyScreenLoading();
                    }
        });
    }

});


//======================== prepare exam result ====================================

// Save Button Function Start
$('#patientOrderDispenseButtonDiv').on('click', '#btnRISOrderSave', function (e) {
    alert("In Save");
});
// Save Button Function End


// Send Button Function Start
$('#patientOrderDispenseButtonDiv').on('click', '#btnRISOrderSendResults', function (e) {
    alert("In Send");
});
// Send Button Function End



// Clear Button Function Start
$('#patientOrderDispenseButtonDiv').on('click', '#btnRISClearOrderDetail', function (e) {
    reloadOrderMasterListTable();
    document.getElementById("risManageOrderDetailContentBasicInfoForm").reset();
    document.getElementById("risManageOrderDetailContentOrderInfoForm").reset();
    $("#risOrderDetailContent #risManageAllergyListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageAllergyListTableDiv");
    $("#risOrderDetailContent #risManageDiagnosisListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageDiagnosisListTableDiv");
    $("#risOrderDetailContent #risManageOrderDetailsListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageOrderDetailsListTableDiv");
    $('.nav-tabs a[href="#tab_default_1"]').tab('show');
    cancelCallPatient(false);
});
// Clear Button Function End

//------------------ call function ----------
function callPatient() {

    var input = {
        pat_name: $('#rispatientName').val().trim(),
        pmi_no: $('#rispatientpmino').val().trim()
    };
    console.log(input);
    $.ajax({
        url: "../general/calling/callingInsert.jsp",
        type: "post",
        data: input,
        dataType: 'json',
        timeout: 30000,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.isValid) {
                bootbox.alert("Success to call patient.");
                $('#RIS_callingID').val(data.call_ID);
                $('#btnRISCall').prop('disabled', true);
                $('#btnRISCancelCall').prop('disabled', false);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }

    });
}
//================ end call =================


$('#btnRISCall').on('click', function () {
    var specimenSpecimenNo = $("#risOrderNo").val();


    if (specimenSpecimenNo === "" || specimenSpecimenNo === null) {

        $('.nav-tabs a[href="#tab_default_1"]').tab('show');

        bootbox.alert("Please Select An Order First !!!");

        return;

    }

    bootbox.confirm({
        message: "Are You Sure ?",
        title: "Call Patient ?",
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
                callPatient();
            }
        }
    });

});


//--------------- cancel call -----------------
function cancelCallPatient(show) {
    var input = {
        callDeclineNo: $('#RIS_callingID').val().trim()
    };
    $.ajax({
        url: "../general/calling/callingDelete.jsp",
        type: "post",
        data: input,
        dataType: 'json',
        timeout: 30000,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.isValid) {
                if (show) {
                    bootbox.alert("Success to cancel call patient.");
                }

                $('#btnRISCall').prop('disabled', false);
                $('#btnRISCancelCall').prop('disabled', true);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }

    });
}
//==============================================
$('#btnRISCancelCall').on('click', function () {
    var specimenSpecimenNo = $("#risOrderNo").val();


    if (specimenSpecimenNo === "" || specimenSpecimenNo === null) {

        $('.nav-tabs a[href="#tab_default_1"]').tab('show');

        bootbox.alert("Please Select An Order First !!!");

        return;

    }

    bootbox.confirm({
        message: "Are You Sure ?",
        title: "Cancel Call Patient ?",
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
                cancelCallPatient(true);
            }
        }
    });

});

