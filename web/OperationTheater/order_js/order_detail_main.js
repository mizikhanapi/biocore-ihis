/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * 
 * Creator: Ardhi Surya; rdsurya147@gmail.com; insta:@rdcfc
 */


//global variable for picture
var OT_gambarURI = "";


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
    $('#RNO_cat_match').html('');
    $('#RNO_consul_match').html('');
    $('#RNO_room_match').html('');
    $('#RNO_div_schedule').html('');
    init_procedure_flex_search();
    
    $('#RNO_proName').prop('disabled', false);

    $('#RNO_div_btnAdd_or_update').html('<button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="RNO_btnAdd">Add Order</button>');
});
//=============================================================================

//-------------- search procedure category ----------------------------
$('#RNO_categoryName').flexdatalist({
        minLength: 1,
        searchIn: 'name', 
        searchDelay: 2000,
        selectionRequired: true,
        url: "order_control/ResultPOSSurgicalCategorySearch.jsp",
        visibleProperties: 'name',
        cache: true,
        valueProperty: 'value',
        params: {
            timeout: 3000,
            success: function (result) {
                console.log(result);
                if (result == null) {
                    $('#RNO_cat_match').html('No Record');
                }
            }
        }
    });
    
    $("#RNO_categoryName").on('before:flexdatalist.data', function (response) {
        $('#RNO_cat_match').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#RNO_categoryName").on('after:flexdatalist.data', function (response) {
        $('#RNO_cat_match').html('');
    });
    $("#RNO_categoryName").on('select:flexdatalist', function (response) {
        $('#RNO_cat_match').html('');
        init_procedure_flex_search();
    });

//=========== end category search =================================

//-------------------search procedure of new order --------------------------------------------------------
function init_procedure_flex_search(){
    $('#RNO_proName').flexdatalist({
        minLength: 1,
        searchIn: 'name', 
        searchDelay: 2000,
        selectionRequired: true,
        url: "order_control/ResultPOSSurgicalSearch.jsp?cat_cd="+$('#RNO_categoryName').val(),
        visibleProperties: 'name',
        cache: true,
        valueProperty: 'value',
        params: {
            timeout: 3000,
            success: function (result) {
                console.log(result);
                if (result == null) {
                    $('#RNO_pro_match').html('No Record');
                }
            }
        }
    });
    
    $("#RNO_proName").on('before:flexdatalist.data', function (response) {
        $('#RNO_pro_match').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#RNO_proName").on('after:flexdatalist.data', function (response) {
        $('#RNO_pro_match').html('');
    });
   
}

init_procedure_flex_search();

//================= search procedure end =================================================

//------------- search consultant ----------------------------
$('#RNO_consultant').flexdatalist({
        minLength: 1,
        searchIn: 'name', 
        searchDelay: 2000,
        selectionRequired: true,
        url: "order_control/ResultDOCTORSurgicalSearch.jsp",
        visibleProperties: 'name',
        cache: true,
        valueProperty: 'value',
        params: {
            timeout: 3000,
            success: function (result) {
                console.log(result);
                if (result == null) {
                    $('#RNO_consul_match').html('No Record');
                }
            }
        }
    });
    
    $("#RNO_consultant").on('before:flexdatalist.data', function (response) {
        $('#RNO_consul_match').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#RNO_consultant").on('after:flexdatalist.data', function (response) {
        $('#RNO_consul_match').html('');
    });
    $("#RNO_consultant").on('select:flexdatalist', function (response) {
        $('#RNO_consul_match').html('');
    });

//============= end search consultant ===============================================

//---------- search room ----------------------
$('#RNO_room').flexdatalist({
        minLength: 1,
        searchIn: 'name', 
        searchDelay: 2000,
        selectionRequired: true,
        url: "order_control/ResultOTRoomSearch.jsp",
        visibleProperties: 'name',
        cache: true,
        valueProperty: 'value',
        params: {
            timeout: 3000,
            success: function (result) {
                console.log(result);
                if (result == null) {
                    $('#RNO_room_match').html('No Record');
                }
            }
        }
    });
    
    $("#RNO_room").on('before:flexdatalist.data', function (response) {
        $('#RNO_room_match').html('<img src="img/LoaderIcon.gif" />');
    });
    $("#RNO_room").on('after:flexdatalist.data', function (response) {
        $('#RNO_room_match').html('');
    });
    $("#RNO_room").on('select:flexdatalist', function (response) {
        $('#RNO_room_match').html('');
    });
//========== end search room =====================

//--------- view doctor schedule ---------------
$('#RNO_btnConsul').on('click', function(){
    var consulID = $('#RNO_consultant').val();
    
    if(consulID.trim() === ""){
        $("#RNO_err").html("Select a consultant first!!!").show().fadeOut("slow");
        $('#RNO_consultant').focus();
        return false;
    }
    
     var data ={
            type : '6',
            consul: consulID
          };
        
        $('#RNO_div_schedule').html('<img src="img/LoaderIcon.gif" />');
        
        $.ajax({
            type: 'POST',
            url: "schedule/searchPatient_RoomSchedule.jsp",
            data: data,
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        $('#RNO_div_schedule').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        $("#RNO_err").html("Oopps! "+errorThrown).show().fadeOut("slow");
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }        
                    
        });
    
});
//======== view doctor schedule end ===========

//--------- view room schedule ---------------
$('#RNO_btnRoom').on('click', function(){
    var roomNo = $('#RNO_room').val();
    
    if(roomNo.trim() === ""){
        $("#RNO_err").html("Select a room first!!!").show().fadeOut("slow");
        $('#RNO_room').focus();
        return false;
    }
    
     var data ={
            type : '7',
            roomNo: roomNo
          };
        
        $('#RNO_div_schedule').html('<img src="img/LoaderIcon.gif" />');
        
        $.ajax({
            type: 'POST',
            url: "schedule/searchPatient_RoomSchedule.jsp",
            data: data,
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        $('#RNO_div_schedule').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        $("#RNO_err").html("Oopps! "+errorThrown).show().fadeOut("slow");
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }        
                    
        });
    
});
//========== view room schedule end ============

//------------ view patient schedule -------------
$('#RNO_btnPatient').on('click', function(){
    var pmiNo = $('#rispatientpmino').val();
    
     var data ={
            type : '8',
            pmiNo: pmiNo
          };
        
        $('#RNO_div_schedule').html('<img src="img/LoaderIcon.gif" />');
        
        $.ajax({
            type: 'POST',
            url: "schedule/searchPatient_RoomSchedule.jsp",
            data: data,
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        $('#RNO_div_schedule').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        $("#RNO_err").html("Oopps! "+errorThrown).show().fadeOut("slow");
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }        
                    
        });
    
});
//============ view patient schedule end ==============

//------------------------- add new order start --------------------------------

//set up date picker
    $('#RNO_start').datetimepicker({
        format: 'd/m/Y H:i',
        step: 5
    });
    
    $('#RNO_end').datetimepicker({
        format: 'd/m/Y H:i',
        step: 5
    });

$('#RNO_div_btnAdd_or_update').on('click', '#RNO_btnAdd', function () {
    $('#modal_requestNewOrder').css('overflow', 'auto');
    
    var orderNo = $('#risOrderNo').val();
    var proCode = $('#RNO_proName').val();
    var start = $('#RNO_start').val();
    var end = $('#RNO_end').val();
    var consul = $('#RNO_consultant').val();
    var roomNo = $('#RNO_room').val();
    var comment = $('#RNO_comment').val();
    
    var objStart = $('#RNO_start').datetimepicker('getValue');
    var objEnd = $('#RNO_end').datetimepicker('getValue');
    

    if (proCode.trim() === "") {
        bootbox.alert('Please choose existing procedure.');

    }
    else if(start.trim()===""){
        bootbox.alert("Please pick a start date and time");
    }
    else if(end.trim()===""){
        bootbox.alert("Please pick an end date and time");
    }
    else if(consul.trim()===""){
        bootbox.alert("Please choose existing consultant.");
    }
    else if(roomNo.trim()===""){
        bootbox.alert("Please choose existing operation theater.");
    }
    else if(comment.trim()===""){
        bootbox.alert("Please write some meaningful comment.");
    }
    else if(objStart >= objEnd){
        bootbox.alert("End time must be later than start time.");
        $('#RNO_end').val('');
    }
    else {
        
        comment = comment.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
        
        
        var epDate = $('#posEpDate').val();
        

        var data = {
            orderNo: orderNo,
            proCode: proCode,
            epDate: epDate,
            consul: consul,
            roomNo: roomNo,
            start: start,
            end: end,
            comment: comment
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
                    $('#modal_requestNewOrder').modal('hide');

                } else if (data.trim() === 'duplicate') {
                    bootbox.alert('Duplicate order. Please order different item');
                    

                } else if (data.trim() === 'fail') {

                    bootbox.alert('Fail to add new order.');
                    
                }
                else{
                    bootbox.alert(data.trim());
                }

            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert('Opps! ' + errorThrown);
               
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
               
                //$('#modal_requestNewOrder').modal('hide');
            }
        });
    }
});

function loadOrderDetailList(orderNo) {
    createScreenLoading();
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
    var proCode = arrData[2], proName = arrData[3], orderNo = arrData[10];

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
                            bootbox.alert("Failed to cancel order!");
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

//--------------- perform procedure -------------------------------------
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnPerform', function () {
    
    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    var proCode = arrData[2], proName = arrData[3], orderNo = arrData[10];
    
     bootbox.confirm({
        message: "Confirm perform this order? " + proCode + "-" + proName,
        title: "Perform Order?",
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
                    proCode: proCode
                };

                createScreenLoading();

                $.ajax({
                    url: "order_control/order_update.jsp",
                    type: "post",
                    data: data,
                    success: function (datas) {

                        if (datas.trim() === 'success') {
                            bootbox.alert('Order is performed.');
                            loadOrderDetailList(orderNo);


                        } else if (datas.trim() === 'fail') {
                            bootbox.alert("Failed to perform order!");
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
//=============== perform procedure end ================================




//-------------------------prepare exam result --------------------------------------

//creating modal
$('#risManageOrderDetailsListTableDiv').on('click', '#risManageOrderDetailsListTable #MOD_btnReport', function () {
    $('#PR_form')[0].reset();
    console.log("Btn report is clicked.");
    OT_gambarURI = "";
    $('#PR_gamba').attr('src', OT_gambarURI);

    var row = $(this).closest("tr");
    var arrData = row.find('td').eq(0).text().split('|');
    var startTime = arrData[0], endTime = arrData[1], proCode=arrData[2], proName=arrData[3], roomNo=arrData[4], consulID=arrData[6], consulName=arrData[7], comment=arrData[9], orderNo=arrData[10];

    $('#PR_procedureName').val("("+proCode+") "+proName);
    $('#PR_procedureCode').val(proCode);
    
    $('#PR_startTime').val(startTime);
    $('#PR_endTime').val(endTime);
    
    $('#PR_consulName').val("("+consulID+") "+consulName);
    $('#PR_consulID').val(consulID);
    
    $('#PR_comment').val(comment);
    
    $('#PR_roomNo').val(roomNo);
    $('#PR_orderNo').val(orderNo);

    $('#PR_fileToLoad').val('');
    

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
        OT_gambarURI = "";
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

                OT_gambarURI = fileLoadedEvent.target.result;


                //document.getElementById("dym").innerHTML = '<img id="myImage">';

                //document.getElementById("myImage").src = OT_gambarURI;
                $('#PR_gamba').attr('src', OT_gambarURI);
            };

            fileReader.readAsDataURL(fileToLoad);
        }

    } else {

        bootbox.alert("File size must not exceed 650Kb");
        $('#PR_fileToLoad').val("");
        OT_gambarURI = "";
        $('#PR_gamba').attr('src', OT_gambarURI);
        //$('#dym').html("");
    }


}

//...... submit exam result ............
$('#PR_btnSubmit').on('click', function () {

    var proCode = $('#PR_procedureCode').val();
    var startTime = $('#PR_startTime').val();
    var endTime = $('#PR_endTime').val();
    var consulID = $('#PR_consulID').val();
    var comment = $('#PR_comment').val();
    var roomNo = $('#PR_roomNo').val();
    var orderNo = $('#PR_orderNo').val();
    var duration = $('#PR_duration').val();
    var epDate = $('#posEpDate').val();
    var pmiNo = $('#rispatientpmino').val();

    if (comment === '') {
        bootbox.alert('Please write some meaningful comment.',
                function () {
                    $('#PR_comment').focus();
                }
        );
    }
    else if(duration === ""){
         bootbox.alert('Please fill in the duration in minutes.',
                function () {
                    $('#PR_duration').focus();
                }
        );
    }
    else{
        comment = comment.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
        var data = {
            process: 'report',
            orderNo: orderNo,
            proCode: proCode,
            epDate: epDate,
            pmiNo: pmiNo,
            comment: comment,
            start: startTime,
            end: endTime,
            duration: duration,
            consulID: consulID,
            roomNo: roomNo,
            gambar: OT_gambarURI
        };
        console.log(data);
        
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

//------------ validation on keypress for duration ----------

$('#PR_duration').on('keypress', function (e) {

        //if the letter is not digit then display error and don't type anything
        if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            $("#PR_duration_err").html("Whole Number Only!!!").show().fadeOut("slow");
            return false;
        }
    });



