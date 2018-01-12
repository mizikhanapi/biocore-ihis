<%-- 
    Document   : manageTestDetailMain
    Created on : Jan 12, 2018, 3:16:56 PM
    Author     : Shammugam
--%>


<div id="testDetailTableContainer" class="table-guling clear-patient">

    <h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
        TEST DETAILS MANAGEMENT
    </h4>

    <div id="testDetailTableDiv" class="table-guling clear-patient">

        <table class="table table-bordered" id="testDetailTable" style="width: 100%">
            <thead>
            <th>Code</th>
            <th>Name</th>
            <th>Spe Source</th>
            <th>Spe Container</th>
            <th>Volume</th>
            <th>Special Instruction</th>
            <th>Sell Price</th>
            <th>Status</th>
            <th>Action</th>
            </thead>
            <tbody>
                <tr>
                    <td colspan="9" align="center">No Record To Show<br>Please Select A Test Category</td>
                </tr>
            </tbody>
        </table>

    </div>

</div>


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



        // Cate Add Modal Button Function Start
        $('#contentTestDetailContainer').off('click', '#addNewTestDetailsButton').on('click', '#addNewTestDetailsButton', function (e) {

            $('#testDetailsModalTitle').text("Add New Test Detail");
            $('#testDetailsCode').prop('readonly', false);
            $('#testDetails_btnAdd_or_btnUpdate_div').html('<button type="submit" id="addTestDetailButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>');

            $('#testDetailsForm')[0].reset();

            $('#testDetailsCateCode').val($('#dataTestDetailsCategoryCodeForHidden').val());

        });
        // Cate Add Modal Button Function End


        // Cate Reset Button Start
        $('#testDetailsReset').on('click', function () {
            $('#testDetailsForm')[0].reset();
        });
        // Cate Reset Button End



        // Add Cate Function Start
        $('#testDetails_btnAdd_or_btnUpdate_div').on('click', '#addTestDetailButton', function (e) {


            var cateCode = $('#testDetailsCateCode').val();
            var detailCode = $('#testDetailsCode').val();
            var detailName = $('#testDetailsName').val();
            var detailSpeSource = $('#testDetailsSpeSource').val();
            var detailSpeContainer = $('#testDetailsSpeContainer').val();
            var detailVolume = $('#testDetailsVolume').val();
            var detailSpeInst = $('#testDetailsSpeInstruc').val();
            var detailBuyPrice = $('#testDetailsBuyPrice').val();
            var detailSellPrice = $('#testDetailsSellPrice').val();
            var detailStatus = $('#testDetailsStatus').val();

            var newBuyPrice = parseFloat(detailBuyPrice).toFixed(2);
            detailBuyPrice = newBuyPrice;

            var newSellPrice = parseFloat(detailSellPrice).toFixed(2);
            detailSellPrice = newSellPrice;

            if (cateCode === "" || cateCode === null) {

                bootbox.alert("Please Insert The Category Code");

            } else if (detailCode === "" || detailCode === null) {

                bootbox.alert("Please Insert The Detail Code");

            } else if (detailName === "" || detailName === null) {

                bootbox.alert("Please Insert The Detail Name");

            } else if (detailSpeSource === "" || detailSpeSource === null) {

                bootbox.alert("Please Insert The Detail Specimen Source");

            } else if (detailSpeContainer === "" || detailSpeContainer === null) {

                bootbox.alert("Please Insert The Detail Specimen Container");

            } else if (detailVolume === "" || detailVolume === null) {

                bootbox.alert("Please Insert The Detail Volume");

            } else if (detailSpeInst === "" || detailSpeInst === null) {

                bootbox.alert("Please Insert The Detail Special Instruction");

            } else if (detailBuyPrice === "" || detailBuyPrice === null) {

                bootbox.alert("Please Insert The Detail Buy Price");

            } else if (detailSellPrice === "" || detailSellPrice === null) {

                bootbox.alert("Please Insert The Detail Sell Price");

            } else if (detailStatus === "" || detailStatus === null) {

                bootbox.alert("Please Select A Status");

            } else {

                var data = {
                    cateCode: cateCode,
                    detailCode: detailCode,
                    detailName: detailName,
                    detailSpeSource: detailSpeSource,
                    detailSpeContainer: detailSpeContainer,
                    detailVolume: detailVolume,
                    detailSpeInst: detailSpeInst,
                    detailBuyPrice: detailBuyPrice,
                    detailSellPrice: detailSellPrice,
                    detailStatus: detailStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessTestDetail/manageTestCodeDetailInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            var data = {
                                iditem: cateCode
                            };

                            $.ajax({
                                url: "manageTestDetailContainer.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (dataDetailReturn) {

                                    $("#testDetailTableContainer").html(dataDetailReturn);

                                    $('#testDetailsModal').modal('hide');

                                    bootbox.alert({
                                        message: "Test Detail is Added Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                    $('#testDetailsForm')[0].reset();

                                },
                                error: function (err) {
                                    alert("Error! Deletion Ajax failed!!");
                                }

                            });

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Test Detail Code Duplication Detected. Please use diffrerent Test Detail Code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Test Detail Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#testDetailsModal').modal('hide');

                            $('#testDetailsForm')[0].reset();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                        console.log(err);
                    }

                });


            }
        });
        // Add Cate Function End



        // Cate Update Function Start
        $('#contentTestDetailContainer').off('click', '#testDetailsTable #testDetailsUpdateTButton').on('click', '#testDetailsTable #testDetailsUpdateTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataTestDetailshidden").val();
            var arrayData = rowData.split("|");

            $('#testDetailsModalTitle').text("Update Test Detail");
            $('#testDetailsCode').prop('readonly', true);
            $('#testDetails_btnAdd_or_btnUpdate_div').html('<button type="submit" id="updateTestDetailButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>');

            $('#testDetailsCateCode').val(arrayData[2]);
            $('#testDetailsCode').val(arrayData[0]);
            $('#testDetailsName').val(arrayData[3]);
            $('#testDetailsSpeSource').val(arrayData[4]);
            $('#testDetailsSpeContainer').val(arrayData[5]);
            $('#testDetailsVolume').val(arrayData[6]);
            $('#testDetailsSpeInstruc').val(arrayData[7]);
            $('#testDetailsBuyPrice').val(arrayData[9]);
            $('#testDetailsSellPrice').val(arrayData[10]);
            $('#testDetailsStatus').val(arrayData[8]);


        });
        // Cate Update Function End


        // Cate Update Function Start
        $('#testDetails_btnAdd_or_btnUpdate_div').on('click', '#updateTestDetailButton', function (e) {

            e.preventDefault();

            var cateCode = $('#testDetailsCateCode').val();
            var detailCode = $('#testDetailsCode').val();
            var detailName = $('#testDetailsName').val();
            var detailSpeSource = $('#testDetailsSpeSource').val();
            var detailSpeContainer = $('#testDetailsSpeContainer').val();
            var detailVolume = $('#testDetailsVolume').val();
            var detailSpeInst = $('#testDetailsSpeInstruc').val();
            var detailBuyPrice = $('#testDetailsBuyPrice').val();
            var detailSellPrice = $('#testDetailsSellPrice').val();
            var detailStatus = $('#testDetailsStatus').val();

            var newBuyPrice = parseFloat(detailBuyPrice).toFixed(2);
            detailBuyPrice = newBuyPrice;

            var newSellPrice = parseFloat(detailSellPrice).toFixed(2);
            detailSellPrice = newSellPrice;

            if (cateCode === "" || cateCode === null) {

                bootbox.alert("Please Insert The Category Code");

            } else if (detailCode === "" || detailCode === null) {

                bootbox.alert("Please Insert The Detail Code");

            } else if (detailName === "" || detailName === null) {

                bootbox.alert("Please Insert The Detail Name");

            } else if (detailSpeSource === "" || detailSpeSource === null) {

                bootbox.alert("Please Insert The Detail Specimen Source");

            } else if (detailSpeContainer === "" || detailSpeContainer === null) {

                bootbox.alert("Please Insert The Detail Specimen Container");

            } else if (detailVolume === "" || detailVolume === null) {

                bootbox.alert("Please Insert The Detail Volume");

            } else if (detailSpeInst === "" || detailSpeInst === null) {

                bootbox.alert("Please Insert The Detail Special Instruction");

            } else if (detailBuyPrice === "" || detailBuyPrice === null) {

                bootbox.alert("Please Insert The Detail Buy Price");

            } else if (detailSellPrice === "" || detailSellPrice === null) {

                bootbox.alert("Please Insert The Detail Sell Price");

            } else if (detailStatus === "" || detailStatus === null) {

                bootbox.alert("Please Select A Status");

            } else {

                var data = {
                    cateCode: cateCode,
                    detailCode: detailCode,
                    detailName: detailName,
                    detailSpeSource: detailSpeSource,
                    detailSpeContainer: detailSpeContainer,
                    detailVolume: detailVolume,
                    detailSpeInst: detailSpeInst,
                    detailBuyPrice: detailBuyPrice,
                    detailSellPrice: detailSellPrice,
                    detailStatus: detailStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessTestDetail/manageTestCodeDetailUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            var data = {
                                iditem: cateCode
                            };

                            $.ajax({
                                url: "manageTestDetailContainer.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (dataDetailReturn) {

                                    $("#testDetailTableContainer").html(dataDetailReturn);

                                    $('#testDetailsModal').modal('hide');

                                    bootbox.alert({
                                        message: "Test Detail is Updated Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                    $('#testDetailsForm')[0].reset();

                                },
                                error: function (err) {
                                    alert("Error! Deletion Ajax failed!!");
                                }

                            });


                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Test Detail Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#testDetailsModal').modal('hide');

                            $('#testDetailsForm')[0].reset();

                        }

                    },
                    error: function (err) {
                        alert("Error Ajax Update!");
                    }

                });

            }
        });
        // Cate Update Function End



        // Cate Delete Function Start
        $('#contentTestDetailContainer').off('click', '#testDetailsTable #testDetailsDeleteTButton').on('click', '#testDetailsTable #testDetailsDeleteTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataTestDetailshidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //assign into seprated val
            var test_itm = arrayData[0];
            var test_cat = arrayData[2];

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
                            test_itm: test_itm,
                            test_cat: test_cat
                        };

                        console.log(data);

                        $.ajax({
                            url: "controllerProcessTestDetail/manageTestCodeDetailDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    var data = {
                                        iditem: test_cat
                                    };

                                    $.ajax({
                                        url: "manageTestDetailContainer.jsp",
                                        type: "post",
                                        data: data,
                                        timeout: 10000, // 10 seconds
                                        success: function (dataDetailReturn) {

                                            $("#testDetailTableContainer").html(dataDetailReturn);

                                            bootbox.alert({
                                                message: "Test Detail is Deleted Successful",
                                                title: "Process Result",
                                                backdrop: true
                                            });


                                        },
                                        error: function (err) {
                                            alert("Error! Deletion Ajax failed!!");
                                        }

                                    });


                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Test Detail Delete Failed",
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
        // Cate Delete Function End


        // Clone Cate Function Start

        // Clone Cate Button Click Function Start
        $('#contentTestDetailContainer').off('click', '#TESTDETAILSClone_btnClone').on('click', '#TESTDETAILSClone_btnClone', function (e) {
            TESTDETAILCloneReset();
            createTESTDETAILCodeList();
        });
        // Clone Cate Button Click Function End


        // Clone Cate Reset Function Start
        function TESTDETAILCloneReset() {
            document.getElementById("TESTDETAILSClone_Form").reset();
        }
        // Clone Cate Reset Function End


        // Clone Cate Create List Function Start
        function createTESTDETAILCodeList() {

            var code = $('#dataTestDetailsCategoryCodeForHidden').val();

            var data = {
                code: code
            };

            console.log(data);

            $('#TESTDETAILS_Code').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#testDetailsCloneModal');

            $.ajax({
                type: 'POST',
                data: data,
                url: "controllerProcessTestDetail/manageTestCodeDetailCloneDrugList.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#TESTDETAILS_Code').html(data);
                    $('#TESTDETAILS_Code').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Selectable Details Code</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Details Code</div>",
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
        // Clone Cate Create List Function End


        // Clone Cate Clone Function Start
        $('#TESTDETAILS_btnClone').on('click', function () {

            var arraySelect = [];
            $("#TESTDETAILS_Code option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strTESTDETAILSClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strTESTDETAILSClone);

            if (strTESTDETAILSClone === "") {

                bootbox.alert("Select at least one detail to be cloned");

            } else {

                $('<div class="loading">Loading</div>').appendTo('#testDetailsCloneModal');

                var code = $('#dataTestDetailsCategoryCodeForHidden').val();

                var data = {
                    strTESTDETAILSClone: strTESTDETAILSClone,
                    code: code
                };

                $.ajax({
                    url: "controllerProcessTestDetail/manageTestCodeDetailCloneDrugListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {

                        console.log(datas.trim());

                        if (datas.trim() === 'Success') {


                            var data = {
                                iditem: code
                            };


                            $.ajax({
                                url: "manageTestDetailContainer.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (dataDetailReturn) {


                                    $("#testDetailTableContainer").html(dataDetailReturn);

                                    bootbox.alert({
                                        message: "Test Detail is successfully cloned",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                    $('#testDetailsCloneModal').modal('hide');

                                    TESTDETAILCloneReset();


                                },
                                error: function (err) {
                                    alert("Error! Deletion Ajax failed!!");
                                }

                            });


                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");

                            TESTDETAILCloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#TESTDETAILS_Code').val("");

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
        // Clone Cate Clone Function End


        // Clone Cate Select All Function Start
        $('#TESTDETAILS_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#TESTDETAILS_Code').multiSelect('select_all');
            return false;
        });
        // Clone Cate Select All Function End


        // Clone Cate Un-Select All Function Start
        $('#TESTDETAILS_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#TESTDETAILS_Code').multiSelect('deselect_all');
            return false;
        });
        // Clone Cate Un-Select All Function End

        // Clone Cate Function End

    });

</script>


