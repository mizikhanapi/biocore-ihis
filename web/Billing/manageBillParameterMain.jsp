<%-- 
    Document   : manageBillParameterMain
    Created on : Nov 29, 2017, 11:42:54 AM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    BILL PARAMETER MANAGEMENT
    <span class="pull-right">
        <button id="addNewBillParameterButton" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#billParameterModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD BILL PARAMETER</button>
        <button id="BILLPARAMClone_btnClone" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#billParameterCloneModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>CLONE BILL PARAMETER</button>
    </span>
</h4>

<script>

    $(document).ready(function () {

        $('.decimalNumbersOnly').keyup(function () {
            if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
                this.value = this.value.replace(/[^0-9\.]/g, '');
            }
        });


        $('.singleNumbersOnly').keyup(function () {
            if (this.value !== this.value.replace(/[^0-9]/g, '')) {
                this.value = this.value.replace(/[^0-9]/g, '');
            }
        });



        // Param Add Modal Button Function Start
        $('#addNewBillParameterButton').on('click', function () {

            $('#billParameterModalTitle').text("Add New Bill Parameter");
            $('#billParameterCode').prop('disabled', false);
            $('#billParameter_btnAdd_or_btnUpdate_div').html('<button type="submit" id="addBillParameterButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>');

            $('#billParameterModalForm')[0].reset();

        });
        // Param Add Modal Button Function End



        // Param Reset Button Start
        $('#billParameterReset').on('click', function () {
            $('#billParameterModalForm')[0].reset();
        });
        // Param Reset Button End



        // Add Param Function Start
        $('#billParameter_btnAdd_or_btnUpdate_div').on('click', '#addBillParameterButton', function (e) {

            e.preventDefault();


            var billParameterCode = $('#billParameterCode').val();
            var billParameterName = $('#billParameterName').val();
            var billParameterValue = $('#billParameterValue').val();
            var billParameterEnable = $('#billParameterEnable').val();
            var billParameterStatus = $('#billParameterStatus').val();


            if (billParameterCode === "" || billParameterCode === null) {

                bootbox.alert("Please Insert The Parameter Item Code");

            } else if (billParameterName === "" || billParameterName === null) {

                bootbox.alert("Please Insert The Parameter Item Name");

            } else if (billParameterValue === "" || billParameterValue === null) {

                bootbox.alert("Please Insert The Parameter Item Value");

            } else if (billParameterCode.toLowerCase() === "bp001" || billParameterName.toLowerCase() === "gst") {

                bootbox.alert("The Parameter Code Choose In alredey used as standard billing code.. Please Choose Different Parameter Code !!!");

            } else if (billParameterCode.toLowerCase() === "bp002" || billParameterName.toLowerCase() === "service charge") {

                bootbox.alert("The Parameter Code Choose In alredey used as standard billing code.. Please Choose Different Parameter Code !!!");

            } else if (billParameterCode.toLowerCase() === "bp003" || billParameterName.toLowerCase() === "discount") {

                bootbox.alert("The Parameter Code Choose In alredey used as standard billing code.. Please Choose Different Parameter Code !!!");

            } else {

                var newBuyPrice = parseFloat(billParameterValue).toFixed(2);

                billParameterValue = newBuyPrice;


                var data = {
                    billParameterCode: billParameterCode,
                    billParameterName: billParameterName,
                    billParameterValue: billParameterValue,
                    billParameterEnable: billParameterEnable,
                    billParameterStatus: billParameterStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessParam/manageBillParameterInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        console.log(datas);

                        if (datas.trim() === 'Success') {

                            $("#manageBillParameterTableDIV").load("manageBillParameterTable.jsp");

                            $('#billParameterModal').modal('hide');

                            bootbox.alert({
                                message: "Parameter Item is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#billParameterModalForm')[0].reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Parameter Item Code Duplication Detected. Please use diffrerent Parameter Item Code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Parameter Item Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#billParameterModal').modal('hide');

                            $('#billParameterModalForm')[0].reset();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                        console.log(err);
                    }

                });


            }
        });
        // Add Param Function End



        // Param Update Function Start
        $('#manageBillParameterTableDIV').off('click', '#billParameterTable #billParameterUpdateTButton').on('click', '#billParameterTable #billParameterUpdateTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataBillParameterhidden").val();
            var arrayData = rowData.split("|");

            $('#billParameterModalTitle').text("Update Parameter Item");
            $('#billParameterCode').prop('disabled', true);
            $('#billParameter_btnAdd_or_btnUpdate_div').html('<button type="submit" id="updateBillParameterButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>');


            $('#billParameterCode').val(arrayData[0]);
            $('#billParameterName').val(arrayData[2]);
            $('#billParameterValue').val(arrayData[3]);
            $('#billParameterEnables').val(arrayData[6]);
            $('#billParameterStatus').val(arrayData[7]);


        });
        // Param Update Function End



        // Param Update Function Start
        $('#billParameter_btnAdd_or_btnUpdate_div').on('click', '#updateBillParameterButton', function (e) {

            e.preventDefault();


            var billParameterCode = $('#billParameterCode').val();
            var billParameterName = $('#billParameterName').val();
            var billParameterValue = $('#billParameterValue').val();
            var billParameterEnable = $('#billParameterEnable').val();
            var billParameterStatus = $('#billParameterStatus').val();


            if (billParameterCode === "" || billParameterCode === null) {

                bootbox.alert("Please Insert The Parameter Item Code");

            } else if (billParameterName === "" || billParameterName === null) {

                bootbox.alert("Please Insert The Parameter Item Name");

            } else if (billParameterValue === "" || billParameterValue === null) {

                bootbox.alert("Please Insert The Parameter Item Value");

            } else {

                var newBuyPrice = parseFloat(billParameterValue).toFixed(2);

                billParameterValue = newBuyPrice;


                var data = {
                    billParameterCode: billParameterCode,
                    billParameterName: billParameterName,
                    billParameterValue: billParameterValue,
                    billParameterEnable: billParameterEnable,
                    billParameterStatus: billParameterStatus
                };

                console.log(data);

                $.ajax({
                    url: "controllerProcessParam/manageBillParameterUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#manageBillParameterTableDIV").load("manageBillParameterTable.jsp");

                            $('#billParameterModal').modal('hide');

                            bootbox.alert({
                                message: "Parameter Item is Updated Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#billParameterModalForm')[0].reset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Parameter Item Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#billParameterModal').modal('hide');

                            $('#billParameterModalForm')[0].reset();


                        }

                    },
                    error: function (err) {
                        alert("Error Ajax Update!");
                    }

                });

            }
        });
        // Param Update Function End


        // 
        // Param Delete Function Start
        $('#manageBillParameterTableDIV').off('click', '#billParameterTable #billParameterDeleteTButton').on('click', '#billParameterTable #billParameterDeleteTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataBillParameterhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //assign into seprated val
            var iditem = arrayData[0];

            bootbox.confirm({
                message: "Are you sure want to delete this item ?",
                title: "Delete Item?",
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
                            iditem: iditem
                        };

                        $.ajax({
                            url: "controllerProcessParam/manageBillParameterDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $("#manageBillParameterTableDIV").load("manageBillParameterTable.jsp");

                                    bootbox.alert({
                                        message: "Bill Parameter is Deleted Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Bill Parameter Delete Failed",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                }

                            },
                            error: function (err) {
                                alert("Error! Deletion Ajax failed!!");
                            }

                        });
                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

        });
        // Param Delete Function End



        // Clone Param Function Start

        // Clone Param Button Click Function Start
        $('#BILLPARAMClone_btnClone').on('click', function () {
            BILLPARAMCloneReset();
            createBILLPARAMCodeList();
        });
        // Clone Param Button Click Function End


        // Clone Param Reset Function Start
        function BILLPARAMCloneReset() {
            document.getElementById("BILLPARAMETERClone_Form").reset();
        }
        // Clone Cate Reset Function End


        // Clone Param Create List Function Start
        function createBILLPARAMCodeList() {

            $('#BILLPARAMETER_Code').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#billParameterCloneModal');

            $.ajax({
                type: 'POST',
                url: "controllerProcessParam/manageBillParameterCloneCodeList.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#BILLPARAMETER_Code').html(data);
                    $('#BILLPARAMETER_Code').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Selectable Parameter Code</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Parameter Code</div>",
                        keepOrder: true
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });

        }
        // Clone Param Create List Function End


        // Clone Param Clone Function Start
        $('#BILLPARAMETER_btnClone').on('click', function () {

            var arraySelect = [];
            $("#BILLPARAMETER_Code option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strBILLPARAMETERClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strBILLPARAMETERClone);

            if (strBILLPARAMETERClone === "") {

                bootbox.alert("Select at least one category to be cloned");

            } else {

                $('<div class="loading">Loading</div>').appendTo('#billParameterCloneModal');

                var data = {
                    strBILLPARAMETERClone: strBILLPARAMETERClone
                };

                $.ajax({
                    url: "controllerProcessParam/manageBillParameterCloneListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {

                        console.log(datas.trim());

                        if (datas.trim() === 'Success') {

                            $("#manageBillParameterTableDIV").load("manageBillParameterTable.jsp");
                            $('#billParameterCloneModal').modal('hide');

                            bootbox.alert({
                                message: "Bill Parameter is successfully cloned",
                                title: "Process Result",
                                backdrop: true
                            });

                            BILLPARAMCloneReset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");

                            BILLPARAMCloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#BILLPARAMETER_Code').val("");

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    },
                    complete: function (jqXHR, textStatus) {
                        $('.loading').hide();
                    }

                });
            }

        });
        // Clone Param Clone Function End


        // Clone Param Select All Function Start
        $('#BILLPARAMETER_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#BILLPARAMETER_Code').multiSelect('select_all');
            return false;
        });
        // Clone Param Select All Function End


        // Clone Param Un-Select All Function Start
        $('#BILLPARAMETER_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#BILLPARAMETER_Code').multiSelect('deselect_all');
            return false;
        });
        // Clone Param Un-Select All Function End

        // Clone Param Function End


    });


</script>