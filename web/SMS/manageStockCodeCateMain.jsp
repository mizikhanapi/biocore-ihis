<%-- 
    Document   : manageStockCodeCateMain
    Created on : Nov 14, 2017, 10:05:06 AM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    STOCK CATEGORY MANAGEMENT
    <span class="pull-right">
        <button id="addNewStockCateButton" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#stockCateModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD STOCK CATEGORY</button>
        <button id="STOCKCATEClone_btnClone" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#stockCateCloneModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>CLONE STOCK CATEGORY</button>
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



        // Cate Add Modal Button Function Start
        $('#addNewStockCateButton').on('click', function () {

            $('#stockCateModalTitle').text("Add New Stock Category");
            $('#stockCateCode').prop('readonly', false);
            $('#stockCate_btnAdd_or_btnUpdate_div').html('<button type="submit" id="addStockCateButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>');

            $('#stockCateForm')[0].reset();

        });
        // Cate Add Modal Button Function End


        // Cate Reset Button Start
        $('#stockCateReset').on('click', function () {
            $('#stockCateForm')[0].reset();
        });
        // Cate Reset Button End



        // Add Cate Function Start
        $('#stockCate_btnAdd_or_btnUpdate_div').on('click', '#addStockCateButton', function (e) {


            var cateCode = $('#stockCateCode').val();
            var cateName = $('#stockCateName').val();
            var cateGLCode = $('#stockCateGLCode').val();
            var cateStatus = $('#stockCateStatus').val();


            if (cateCode === "" || cateCode === null) {

                bootbox.alert("Please Insert The Category Code");

            } else if (cateName === "" || cateName === null) {

                bootbox.alert("Please Insert The Category Name");

            } else if (cateGLCode === "" || cateGLCode === null) {

                bootbox.alert("Please Insert The Category GL Code");

            } else if (cateStatus === "" || cateStatus === null) {

                bootbox.alert("Please Select A Status");

            } else {

                var data = {
                    cateCode: cateCode,
                    cateName: cateName,
                    cateGLCode: cateGLCode,
                    cateStatus: cateStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessStockCategory/manageStockCodeCateInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#contentStockCategoryTable").load("manageStockCodeCateTable.jsp");

                            $('#stockCateModal').modal('hide');

                            bootbox.alert({
                                message: "Stock Category is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#stockCateForm')[0].reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Stock Category Code Duplication Detected. Please use diffrerent Stock Category Code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Stock Category Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#stockCateModal').modal('hide');

                            $('#stockCateForm')[0].reset();

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
        $('#contentStockCategoryTable').off('click', '#stockCateTable #stockCateUpdateTButton').on('click', '#stockCateTable #stockCateUpdateTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataStockCatehidden").val();
            var arrayData = rowData.split("|");

            $('#stockCateModalTitle').text("Update Stock Category");
            $('#stockCateCode').prop('readonly', true);
            $('#stockCate_btnAdd_or_btnUpdate_div').html('<button type="submit" id="updateStockCateButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>');

            $('#stockCateCode').val(arrayData[0]);
            $('#stockCateName').val(arrayData[1]);
            $('#stockCateGLCode').val(arrayData[5]);
            $('#stockCateStatus').val(arrayData[6]);



        });
        // Cate Update Function End


        // Cate Update Function Start
        $('#stockCate_btnAdd_or_btnUpdate_div').on('click', '#updateStockCateButton', function (e) {

            e.preventDefault();

            var cateCode = $('#stockCateCode').val();
            var cateName = $('#stockCateName').val();
            var cateGLCode = $('#stockCateGLCode').val();
            var cateStatus = $('#stockCateStatus').val();


            if (cateCode === "" || cateCode === null) {

                bootbox.alert("Please Insert The Category Code");

            } else if (cateName === "" || cateName === null) {

                bootbox.alert("Please Insert The Category Name");

            } else if (cateGLCode === "" || cateGLCode === null) {

                bootbox.alert("Please Insert The Category GL Code");

            } else if (cateStatus === "" || cateStatus === null) {

                bootbox.alert("Please Select A Status");

            } else {

                var data = {
                    cateCode: cateCode,
                    cateName: cateName,
                    cateGLCode: cateGLCode,
                    cateStatus: cateStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessStockCategory/manageStockCodeCateUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#contentStockCategoryTable").load("manageStockCodeCateTable.jsp");

                            $('#stockCateModal').modal('hide');

                            bootbox.alert({
                                message: "Stock Category is Updated Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#stockCateForm')[0].reset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Stock Category Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#stockCateModal').modal('hide');

                            $('#stockCateForm')[0].reset();

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
        $('#contentStockCategoryTable').off('click', '#stockCateTable #stockCateDeleteTButton').on('click', '#stockCateTable #stockCateDeleteTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataStockCatehidden").val();
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
                            url: "controllerProcessStockCategory/manageStockCodeCateDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $("#contentStockCategoryTable").load("manageStockCodeCateTable.jsp");

                                    bootbox.alert({
                                        message: "Stock Category is Deleted Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Stock Category Delete Failed",
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
        $('#STOCKCATEClone_btnClone').on('click', function () {
            STOCKCATECloneReset();
            createSTOCKCATECodeList();
        });
        // Clone Cate Button Click Function End


        // Clone Cate Reset Function Start
        function STOCKCATECloneReset() {
            document.getElementById("STOCKCATEClone_Form").reset();
        }
        // Clone Cate Reset Function End


        // Clone Cate Create List Function Start
        function createSTOCKCATECodeList() {

            $('#STOCKCATE_Code').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#stockCateCloneModal');

            $.ajax({
                type: 'GET',
                url: "controllerProcessStockCategory/manageStockCodeCateCloneDrugList.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#STOCKCATE_Code').html(data);
                    $('#STOCKCATE_Code').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Selectable Category Code</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Category Code</div>",
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
        $('#STOCKCATE_btnClone').on('click', function () {

            var arraySelect = [];
            $("#STOCKCATE_Code option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strSTOCKCATEClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strSTOCKCATEClone);

            if (strSTOCKCATEClone === "") {

                bootbox.alert("Select at least one category to be cloned");

            } else {

                $('<div class="loading">Loading</div>').appendTo('#stockCateCloneModal');

                var data = {
                    strSTOCKCATEClone: strSTOCKCATEClone
                };

                $.ajax({
                    url: "controllerProcessStockCategory/manageStockCodeCateCloneDrugListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {

                        console.log(datas.trim());

                        if (datas.trim() === 'Success') {

                            $("#contentStockCategoryTable").load("manageStockCodeCateTable.jsp");
                            $('#stockCateCloneModal').modal('hide');

                            bootbox.alert({
                                message: "Stock Category is successfully cloned",
                                title: "Process Result",
                                backdrop: true
                            });

                            STOCKCATECloneReset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");

                            STOCKCATECloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#STOCKCATE_Code').val("");

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
        $('#STOCKCATE_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#STOCKCATE_Code').multiSelect('select_all');
            return false;
        });
        // Clone Cate Select All Function End


        // Clone Cate Un-Select All Function Start
        $('#STOCKCATE_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#STOCKCATE_Code').multiSelect('deselect_all');
            return false;
        });
        // Clone Cate Un-Select All Function End

        // Clone MDC Function End



    });

</script>

