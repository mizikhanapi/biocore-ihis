/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */





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
    var posEpDate = arrayData[3];


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
    $('#posEpDate').val(posEpDate);

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
    
    $('#RNO_pro_match').html('');
    $('#RNO_div_redo').hide();
    
    $('#RNO_proName').prop('disabled', false);

    $('#RNO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="RNO_btnAdd">Add</button>');
});
//=============================================================================

//-------------------search procedure of new order --------------------------------------------------------


$('#RNO_proName').on('keyup', function () {
   
    var input = $(this).val();

    if (input.length > 0) {

       
        $('#RNO_pro_match').html('<img src="img/ajax-loader.gif">');
        var data = {
           key: input
        };

        $.ajax({
            type: 'POST',
            url: "order_control/search_procedure.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                $('#RNO_pro_match').html(data);
                $('#matchlist li').on('click', function () {

                    $('#RNO_proName').val($(this).text());
                    $('#RNO_pro_match').html('');
                    
                     $('#RNO_proName').prop('disabled', true);
                    $('#RNO_div_redo').show();
                    

                });

            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#RNO_pro_match').text("Opps! " + errorThrown);

            }


        });//end ajax
        

    } else {
        $('#RNO_pro_match').html('');
    }
});

//--------------------------- reset procedure name on btnRedo click ----------------------------------------

$('#RNO_btnRedo').on('click', function(e){
    e.preventDefault();
    $('#RNO_proName').val('').prop('disabled', false);
    $('#RNO_div_redo').hide();
});

//==============================================================================

//------------------------- add new order start --------------------------------
$('#RNO_div_btnAdd_or_update').on('click', '#RNO_btnAdd', function () {

    var orderNo = $('#risOrderNo').val();
    var procedure = $('#RNO_proName').val();
    var instruction = $('#RNO_instruction').val();

    if (procedure === "") {
        bootbox.alert('Please choose existing procedure.', function () {
            $('#RNO_proName').focus();
        });

    } else {
        instruction = instruction.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
        var arrData = procedure.split('|');
        procedure = arrData[0].trim();
        var pro_name = "";
        
        try{
            pro_name = arrData[1].trim();
        }catch (e){
            bootbox.alert("Please choose existing procedure!");
            $('#RNO_proName').val("");
            return false;
        }
        var epDate = $('#posEpDate').val();
        

        var data = {
            orderNo: orderNo,
            proCode: procedure,
            proName: pro_name,
            epDate: epDate,
            instruction: instruction
        };
        //$('#risManageOrderDetailsListTableDiv').append('<div class="loading">Loading</div>');
        createScreenLoading();
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

//-------------------------perform procedure and write result --------------------------------------

//.....creating modal......
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnPerform', function () {
    RIS_gambarURI = "";
    $('#PR_gamba').attr('src', RIS_gambarURI);

    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    var proCode = arrData[1], proName = arrData[8], comment = arrData[6];

    $('#PR_procedureCode').val(proCode);
    $('#PR_procedureName').val(proName);

    $('#PR_comment').val(comment);

    $('#modal_prepareResult').css('overflow', 'auto');

    $('#modal_prepareResult').modal('show');
});



//...... submit exam result ............
$('#PR_btnSubmit').on('click', function () {

    var orderNo = $('#risOrderNo').val();
    var proCode = $('#PR_procedureCode').val();
    var proName = $('#PR_procedureName').val();
    var comment = $('#PR_comment').val();
    var epDate = $('#posEpDate').val();
    var outcome = $('#PR_outcome').val();
    
    //added on 29/6/2017
    var pmiNo = $('#rispatientpmino').val() ;
    var orderDate = $('#risOrderDate').val();
    var duration = $('#PR_duration').val();
    

    if (outcome === '') {
        bootbox.alert('Please write your findings or outcome.',
                function () {
                    $('#PR_comment').focus();
                }
        );
    }
    else if(duration === '' || parseInt(duration) > 999999){
         bootbox.alert('Please key in the time taken to complete the procedure in minutes. Value must be between 0 and 999999',
                function () {
                    $('#PR_duration').focus();
                }
        );
    }
    else{
        comment = comment.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
        outcome = outcome.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
        var data = {
            process: 'report',
            orderNo: orderNo,
            proCode: proCode,
            proName: proName,
            comment: comment,
            epDate: epDate,
            pmiNo: pmiNo,
            orderDate: orderDate,
            duration: duration,
            outcome: outcome
        };
        
        //$('#modal_prepareResult').modal('hide');
        createScreenLoading();
        
        $.ajax({
            type: 'POST',
            url: "order_control/order_update.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                if(data.trim() === 'success'){
                    bootbox.alert('Report is submitted.');
                    $('#modal_prepareResult').modal('hide');
                    $('#PR_form')[0].reset();
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





// Clear Button Function Start
$('#patientOrderDispenseButtonDiv').on('click', '#btnRISClearOrderDetail', function (e) {
    reloadOrderMasterList();
    document.getElementById("risManageOrderDetailContentBasicInfoForm").reset();
    document.getElementById("risManageOrderDetailContentOrderInfoForm").reset();
    $("#risOrderDetailContent #risManageAllergyListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageAllergyListTableDiv");
    $("#risOrderDetailContent #risManageDiagnosisListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageDiagnosisListTableDiv");
    $("#risOrderDetailContent #risManageOrderDetailsListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageOrderDetailsListTableDiv");
    $('.nav-tabs a[href="#tab_default_1"]').tab('show');
});
// Clear Button Function End

//------------ validation on keypress for duratio ----------

$('#PR_duration').on('keypress', function (e) {

        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            $("#PR_duration_err").html("Whole Number Only!!!").show().fadeOut("slow");
            return false;
        }
    });



