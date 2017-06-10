/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




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
            $('#risManageAllergyListTable').html(returnAllergyTableHTML);

            $.ajax({
                url: "risManageOrderListDiagnosisTable.jsp",
                type: "post",
                data: dataDiagnosis,
                timeout: 3000,
                success: function (returnDiagnosisTableHTML) {
                    //console.log(returnDiagnosisTableHTML);
                    $('#risManageDiagnosisListTable').html(returnDiagnosisTableHTML);

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
    var BScode = $('#RNO_bodySystem').val();
    var MODcode = $('#RNO_modality').val();

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
                        $('#RNO_pro_match').html('');
                        isProSelected = true;
                        selectedPro = $('#RNO_proName').val();

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

    if (bsCode === "") {
        bootbox.alert('Select body system.', function () {
            $('#RNO_bodySystem').focus();
        });

    } else if (modCode === "") {
        bootbox.alert('Select body system.', function () {
            $('#RNO_modality').focus();
        });

    } else if (isProSelected === false || selectedPro !== procedure || procedure === "") {
        bootbox.alert('Please choose existing procedure.', function () {
            $('#RNO_proName').focus();
        });

    } else {
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




//------------------- perform exam on click --------------------------------------
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnPerform', function () {

    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    console.log(arrData);
    var bsCode = arrData[2], modCode = arrData[1], proCode = arrData[1], proName = arrData[8], orderNo = arrData[0];

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

//-------------------------- prepare exam report --------------------------------------------


//------------------------------- cancel order --------------------------------------------
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnDelete', function () {

    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    var proCode = arrData[1], proName = arrData[8], orderNo = arrData[0];

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
    document.getElementById("risManageOrderDetailContentBasicInfoForm").reset();
    document.getElementById("risManageOrderDetailContentOrderInfoForm").reset();
    $("#risOrderDetailContent #risManageAllergyListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageAllergyListTableDiv");
    $("#risOrderDetailContent #risManageDiagnosisListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageDiagnosisListTableDiv");
    $("#risOrderDetailContent #risManageOrderDetailsListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageOrderDetailsListTableDiv");
    $('.nav-tabs a[href="#tab_default_1"]').tab('show');
});
// Clear Button Function End



