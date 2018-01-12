<%-- 
    Document   : manageTestCateMain
    Created on : Jan 12, 2018, 10:49:57 AM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    TEST CATEGORY MANAGEMENT
    <span class="pull-right">
        <button id="addNewTestCateButton" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#testCateModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD TEST CATEGORY</button>
        <button id="TESTCATEClone_btnClone" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#testCateCloneModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>CLONE TEST CATEGORY</button>
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
        $('#addNewTestCateButton').on('click', function () {

            $('#testCateModalTitle').text("Add New Test Category");
            $('#testCateCode').prop('readonly', false);
            $('#testCate_btnAdd_or_btnUpdate_div').html('<button type="submit" id="addTestCateButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>');

            $('#testCateForm')[0].reset();

        });
        // Cate Add Modal Button Function End


        // Cate Reset Button Start
        $('#testCateReset').on('click', function () {
            $('#testCateForm')[0].reset();
        });
        // Cate Reset Button End



        // Add Cate Function Start
        $('#testCate_btnAdd_or_btnUpdate_div').on('click', '#addTestCateButton', function (e) {


            var cateCode = $('#testCateCode').val();
            var cateName = $('#testCateName').val();
            var cateStatus = $('#testCateStatus').val();


            if (cateCode === "" || cateCode === null) {

                bootbox.alert("Please Insert The Category Code");

            } else if (cateName === "" || cateName === null) {

                bootbox.alert("Please Insert The Category Name");

            } else if (cateStatus === "" || cateStatus === null) {

                bootbox.alert("Please Select A Status");

            } else {

                var data = {
                    cateCode: cateCode,
                    cateName: cateName,
                    cateStatus: cateStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessTestCategory/manageTestCodeCateInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#contentTestCateTable").load("manageTestCateTable.jsp");

                            $('#testCateModal').modal('hide');

                            bootbox.alert({
                                message: "Test Category is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#testCateForm')[0].reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Test Category Code Duplication Detected. Please use diffrerent Test Category Code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Test Category Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#testCateModal').modal('hide');

                            $('#testCateForm')[0].reset();

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
        $('#contentTestCateTable').off('click', '#testCateTable #testCateUpdateTButton').on('click', '#testCateTable #testCateUpdateTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataTestCatehidden").val();
            var arrayData = rowData.split("|");

            $('#testCateModalTitle').text("Update Test Category");
            $('#testCateCode').prop('readonly', true);
            $('#testCate_btnAdd_or_btnUpdate_div').html('<button type="submit" id="updateTestCateButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>');

            $('#testCateCode').val(arrayData[0]);
            $('#testCateName').val(arrayData[2]);
            $('#testCateStatus').val(arrayData[3]);



        });
        // Cate Update Function End


        // Cate Update Function Start
        $('#testCate_btnAdd_or_btnUpdate_div').on('click', '#updateTestCateButton', function (e) {

            e.preventDefault();

            var cateCode = $('#testCateCode').val();
            var cateName = $('#testCateName').val();
            var cateStatus = $('#testCateStatus').val();


            if (cateCode === "" || cateCode === null) {

                bootbox.alert("Please Insert The Category Code");

            } else if (cateName === "" || cateName === null) {

                bootbox.alert("Please Insert The Category Name");

            } else if (cateStatus === "" || cateStatus === null) {

                bootbox.alert("Please Select A Status");

            } else {

                var data = {
                    cateCode: cateCode,
                    cateName: cateName,
                    cateStatus: cateStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessTestCategory/manageTestCodeCateUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#contentTestCateTable").load("manageTestCateTable.jsp");

                            $('#testCateModal').modal('hide');

                            bootbox.alert({
                                message: "Test Category is Updated Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#testCateForm')[0].reset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Test Category Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#testCateModal').modal('hide');

                            $('#testCateForm')[0].reset();

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
        $('#contentTestCateTable').off('click', '#testCateTable #testCateDeleteTButton').on('click', '#testCateTable #testCateDeleteTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataTestCatehidden").val();
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
                            url: "controllerProcessTestCategory/manageTestCodeCateDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $("#contentTestCateTable").load("manageTestCateTable.jsp");

                                    bootbox.alert({
                                        message: "Test Category is Deleted Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Test Category Delete Failed",
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
        $('#TESTCATEClone_btnClone').on('click', function () {
            TESTCATECloneReset();
            createTESTCATECodeList();
        });
        // Clone Cate Button Click Function End


        // Clone Cate Reset Function Start
        function TESTCATECloneReset() {
            document.getElementById("TESTCATEClone_Form").reset();
        }
        // Clone Cate Reset Function End


        // Clone Cate Create List Function Start
        function createTESTCATECodeList() {

            $('#TESTCATE_Code').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#testCateCloneModal');

            $.ajax({
                type: 'POST',
                url: "controllerProcessTestCategory/manageTestCodeCateCloneDrugList.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#TESTCATE_Code').html(data);
                    $('#TESTCATE_Code').multiSelect({
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
        $('#TESTCATE_btnClone').on('click', function () {

            var arraySelect = [];
            $("#TESTCATE_Code option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strTESTCATEClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strTESTCATEClone);

            if (strTESTCATEClone === "") {

                bootbox.alert("Select at least one category to be cloned");

            } else {

                $('<div class="loading">Loading</div>').appendTo('#testCateCloneModal');

                var data = {
                    strTESTCATEClone: strTESTCATEClone
                };

                $.ajax({
                    url: "controllerProcessTestCategory/manageTestCodeCateCloneDrugListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {

                        console.log(datas.trim());

                        if (datas.trim() === 'Success') {

                            $("#contentTestCateTable").load("manageTestCateTable.jsp");
                            $('#testCateCloneModal').modal('hide');

                            bootbox.alert({
                                message: "Test Category is successfully cloned",
                                title: "Process Result",
                                backdrop: true
                            });

                            TESTCATECloneReset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");

                            TESTCATECloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#TESTCATE_Code').val("");

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
        $('#TESTCATE_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#TESTCATE_Code').multiSelect('select_all');
            return false;
        });
        // Clone Cate Select All Function End


        // Clone Cate Un-Select All Function Start
        $('#TESTCATE_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#TESTCATE_Code').multiSelect('deselect_all');
            return false;
        });
        // Clone Cate Un-Select All Function End

        // Clone Cate Function End


        // Cate View Detail Function Start
        $('#contentTestCateTable').off('click', '#testCateTable #testCateViewDetailTButton').on('click', '#testCateTable #testCateViewDetailTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataTestCatehidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            $('<div class="loading">Loading</div>').appendTo('body');

            //assign into seprated val
            var iditem = arrayData[0];

            var data = {
                iditem: iditem
            };

            $.ajax({
                url: "manageTestDetailContainer.jsp",
                type: "post",
                data: data,
                timeout: 10000, // 10 seconds
                success: function (dataDetailReturn) {

                    $("#testDetailTableContainer").html(dataDetailReturn);
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                    $('#dataTestDetailsCategoryCodeForHidden').val(iditem);

                },
                error: function (err) {
                    alert("Error! Deletion Ajax failed!!");
                }

            });


        });
        // Cate Delete Function End

    });

</script>

