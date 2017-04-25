<%-- 
    Document   : risManageOrderListBasicInfoNew
    Created on : Mar 28, 2017, 4:43:19 PM
    Author     : Shammugam
--%>

<div class="thumbnail">
    <h4><u>Basic Info</u></h4>
    <!--    <hr/>-->
    <form class="form-horizontal" name="risManageOrderDetailContentBasicInfoForm" id="risManageOrderDetailContentBasicInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                    <div class="col-md-8">
                        <input id="rispatientpmino" name="rispatientpmino" type="text" placeholder="" readonly class="form-control input-md">   
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Name</label>
                    <div class="col-md-8">
                        <input id="rispatientName" name="rispatientName" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                    <div class="col-md-8">
                        <input id="rispatientnic" name="rispatientnic" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Gender</label>
                    <div class="col-md-8">
                        <input id="rispatientGender" name="rispatientGender" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">D.O.B</label>
                    <div class="col-md-8">
                        <input id="rispatientBdate" name="rispatientBdate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Blood Type</label>
                    <div class="col-md-8">
                        <input id="rispatientBtype" name="rispatientBtype" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

        </div>
    </form>



    <hr/>
    <h5 style="padding-bottom: 1%;font-weight: bolder">
        <u>Allergy List</u>
    </h5>

    <div id="risManageAllergyListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageAllergyListTable">
            <thead>
            <th style="display: none">PMI NO</th>
            <th>HFC CODE</th>
            <th>EPISODE DATE</th>
            <th>ENCOUNTER DATE</th>
            <th>ALLERGY CODE</th>
            <th>ALLERGY DESCRIPTION</th>
            <th>COMMENT</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>




<div class="thumbnail">
    <h4><u>Diagnosis Info</u></h4>
    <!--<hr/>-->
    <div id="risManageDiagnosisListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageDiagnosisListTable">
            <thead>
            <th style="display: none">PMI NO</th>
            <th >HFC CODE</th>
            <th>EPISODE DATE</th>
            <th>ENCOUNTER DATE</th>
            <th>DIAGNOSIS CODE</th>
            <th>DIAGNOSIS DESCRIPTION</th>
            <th>COMMENT</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>




<div class="thumbnail">
    <h4><u>Request Info</u></h4>
    <!--<hr/>-->
    <form class="form-horizontal" name="risManageOrderDetailContentOrderInfoForm" id="risManageOrderDetailContentOrderInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order No.</label>
                    <div class="col-md-8">
                        <input id="risOrderNo" name="risOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order Date</label>
                    <div class="col-md-8">
                        <input id="risOrderDate" name="risOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Location</label>
                    <div class="col-md-8">
                        <input id="risOrderLocationCode" name="risOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


        </div>
    </form>
    <!--<hr/>-->
    <h4 style="padding-bottom: 2%">
        <u>Order Detail</u>
        <span class="pull-right">
            <button id="risOrderNewRequestButton" class="btn btn-primary" >
                <i class="fa fa-plus fa-lg"></i>&nbsp; New Request
            </button>
        </span>
        <br>
    </h4>


    <div id="risManageOrderDetailsListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageOrderDetailsListTable">
            <thead>
            <th style="width: 15%">Body System</th>
            <th style="width: 5%">Modality</th>
            <th style="width: 5%">Procedure Code</th>
            <th style="width: 15%">Procedure Name</th>
            <th style="width: 25%">Requestor Instruction</th>
            <th style="width: 5%">Exam Date</th>
            <th style="width: 5%">Status</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>


    <div class="text-center" id="patientOrderDispenseButtonDiv" > 
        <button class="btn btn-success " type="button" id="btnRISOrderSave" name="btnRISOrderSave" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Save &nbsp;</button>
        <button class="btn btn-primary " type="button" id="btnRISOrderSendResults" name="btnRISOrderSendResults" > <i class="fa fa-print fa-lg" ></i>&nbsp; Send Result &nbsp;</button>
        <button class="btn btn-default " type="button" id="btnRISClearOrderDetail" name="btnRISClearOrderDetail" > <i class="fa fa-ban fa-lg"></i>&nbsp; Back &nbsp;</button>
    </div>
</div>

<script>
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

    //global variable for procedure search
    var selectedPro = "";
    var isProSelected = false;

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
                            bootbox.alert("Opps! "+errorThrown);
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



</script>