<%-- 
    Document   : manageMiscMain
    Created on : Nov 29, 2017, 12:19:59 PM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MISCELLANEOUS MANAGEMENT
    <span class="pull-right">
        <button id="addNewMiscButton" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#miscModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD MISCELLANEOUS</button>
        <button id="MISCClone_btnClone" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#miscCloneModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>CLONE MISCELLANEOUS</button>
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



        // Misc Add Modal Button Function Start
        $('#addNewMiscButton').on('click', function () {

            $('#miscModalTitle').text("Add New Miscellaneous Item");
            $('#miscCode').prop('readonly', false);
            $('#misc_btnAdd_or_btnUpdate_div').html('<button type="submit" id="addMiscButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>');

            $('#miscModalForm')[0].reset();

        });
        // Misc Add Modal Button Function End



        // Misc Reset Button Start
        $('#miscReset').on('click', function () {
            $('#miscModalForm')[0].reset();
        });
        // Misc Reset Button End



        // Add Misc Function Start
        $('#misc_btnAdd_or_btnUpdate_div').on('click', '#addMiscButton', function (e) {


            var miscCode = $('#miscCode').val();
            var miscName = $('#miscName').val();
            var miscBuyPrice = $('#miscBuyPrice').val();
            var miscSellPrice = $('#miscSellPrice').val();
            var miscStatus = $('#miscStatus').val();

            var newBuyPrice = parseFloat(miscBuyPrice).toFixed(2);
            var newSellPrice = parseFloat(miscSellPrice).toFixed(2);

            miscBuyPrice = newBuyPrice;
            miscSellPrice = newSellPrice;

            if (miscCode === "" || miscCode === null) {

                bootbox.alert("Please Insert The Miscellaneous Item Code");

            } else if (miscName === "" || miscName === null) {

                bootbox.alert("Please Insert The Miscellaneous Item Name");

            } else if (miscBuyPrice === "" || miscBuyPrice === null) {

                bootbox.alert("Please Insert The Buying Price");

            } else if (miscSellPrice === "" || miscSellPrice === null) {

                bootbox.alert("Please Insert The Selling Price");

            } else if (miscCode.toLowerCase() === "rg00001" || miscName.toLowerCase() === "consultation fee (student)") {

                bootbox.alert("The Miscellaneous Code Choose In alredey used as standard billing code.. Please Choose Different Miscellaneous Code !!!");

            } else if (miscCode.toLowerCase() === "rg00002" || miscName.toLowerCase() === "consultation fee (staff)") {

                bootbox.alert("The Miscellaneous Code Choose In alredey used as standard billing code.. Please Choose Different Miscellaneous Code !!!");

            } else if (miscCode.toLowerCase() === "rg00003" || miscName.toLowerCase() === "consultation fee (other)") {

                bootbox.alert("The Miscellaneous Code Choose In alredey used as standard billing code.. Please Choose Different Miscellaneous Code !!!");

            } else if (miscCode.toLowerCase() === "rg00004" || miscName.toLowerCase() === "special theraphy") {

                bootbox.alert("The Miscellaneous Code Choose In alredey used as standard billing code.. Please Choose Different Miscellaneous Code !!!");

            } else if (miscCode.toLowerCase() === "rg00005" || miscName.toLowerCase() === "paed consultation") {

                bootbox.alert("The Miscellaneous Code Choose In alredey used as standard billing code.. Please Choose Different Miscellaneous Code !!!");

            } else {

                var data = {
                    miscCode: miscCode,
                    miscName: miscName,
                    miscBuyPrice: miscBuyPrice,
                    miscSellPrice: miscSellPrice,
                    miscStatus: miscStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessMisc/manageMiscInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#manageMiscTableDIV").load("manageMiscTable.jsp");

                            $('#miscModal').modal('hide');

                            bootbox.alert({
                                message: "Miscellaneous Item is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#miscModalForm')[0].reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Miscellaneous Item Code Duplication Detected. Please use diffrerentMiscellaneous Item Code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Miscellaneous Item Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#miscModal').modal('hide');

                            $('#miscModalForm')[0].reset();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                        console.log(err);
                    }

                });



            }
        });
        // Add Misc Function End



        // Misc Update Function Start
        $('#manageMiscTableDIV').off('click', '#miscTable #miscUpdateTButton').on('click', '#miscTable #miscUpdateTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataMischidden").val();
            var arrayData = rowData.split("|");

            $('#miscModalTitle').text("Update Miscellaneous Item");
            $('#miscCode').prop('disabled', true);
            $('#misc_btnAdd_or_btnUpdate_div').html('<button type="submit" id="updateMiscButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>');


            $('#miscCode').val(arrayData[0]);
            $('#miscName').val(arrayData[2]);
            $('#miscBuyPrice').val(arrayData[3]);
            $('#miscSellPrice').val(arrayData[4]);
            $('#miscStatus').val(arrayData[6]);



        });
        // Misc Update Function End



        // Item Update Function Start
        $('#misc_btnAdd_or_btnUpdate_div').on('click', '#updateMiscButton', function (e) {

            e.preventDefault();

            var miscCode = $('#miscCode').val();
            var miscName = $('#miscName').val();
            var miscBuyPrice = $('#miscBuyPrice').val();
            var miscSellPrice = $('#miscSellPrice').val();
            var miscStatus = $('#miscStatus').val();

            var newBuyPrice = parseFloat(miscBuyPrice).toFixed(2);
            var newSellPrice = parseFloat(miscSellPrice).toFixed(2);

            miscBuyPrice = newBuyPrice;
            miscSellPrice = newSellPrice;

            if (miscCode === "" || miscCode === null) {

                bootbox.alert("Please Insert The Miscellaneous Item Code");

            } else if (miscName === "" || miscName === null) {

                bootbox.alert("Please Insert The Miscellaneous Item Name");

            } else if (miscBuyPrice === "" || miscBuyPrice === null) {

                bootbox.alert("Please Insert The Buying Price");

            } else if (miscSellPrice === "" || miscSellPrice === null) {

                bootbox.alert("Please Insert The Selling Price");

            } else {

                var data = {
                    miscCode: miscCode,
                    miscName: miscName,
                    miscBuyPrice: miscBuyPrice,
                    miscSellPrice: miscSellPrice,
                    miscStatus: miscStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessMisc/manageMiscUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#manageMiscTableDIV").load("manageMiscTable.jsp");

                            $('#miscModal').modal('hide');

                            bootbox.alert({
                                message: "Miscellaneous Item is Updated Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#miscModalForm')[0].reset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Miscellaneous Item Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#miscModal').modal('hide');

                            $('#miscModalForm')[0].reset();


                        }

                    },
                    error: function (err) {
                        alert("Error Ajax Update!");
                    }

                });

            }
        });
        // Item Update Function End



        // Misc Delete Function Start
        $('#manageMiscTableDIV').off('click', '#miscTable #miscDeleteTButton').on('click', '#miscTable #miscDeleteTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataMischidden").val();
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
                            url: "controllerProcessMisc/manageMiscDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $("#manageMiscTableDIV").load("manageMiscTable.jsp");

                                    bootbox.alert({
                                        message: "Miscellaneous Item is Deleted Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Miscellaneous Item Delete Failed",
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
        // Misc Delete Function End




        // Clone Misc Function Start

        // Clone Misc Button Click Function Start
        $('#MISCClone_btnClone').on('click', function () {
            MISCCloneReset();
            createMISCCodeList();
        });
        // Clone Misc Button Click Function End


        // Clone Misc Reset Function Start
        function MISCCloneReset() {
            document.getElementById("MISCClone_Form").reset();
        }
        // Clone Misc Reset Function End


        // Clone Misc Create List Function Start
        function createMISCCodeList() {

            $('#MISC_Code').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#miscCloneModal');

            $.ajax({
                type: 'POST',
                url: "controllerProcessMisc/manageMiscCloneCodeList.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#MISC_Code').html(data);
                    $('#MISC_Code').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Selectable Miscellaneous Code</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Miscellaneous Code</div>",
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
        // Clone Misc Create List Function End


        // Clone Misc Clone Function Start
        $('#MISC_btnClone').on('click', function () {

            var arraySelect = [];
            $("#MISC_Code option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strMISCClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strMISCClone);

            if (strMISCClone === "") {

                bootbox.alert("Select at least one miscellaneous code to be cloned");

            } else {

                $('<div class="loading">Loading</div>').appendTo('#miscCloneModal');

                var data = {
                    strMISCClone: strMISCClone
                };

                $.ajax({
                    url: "controllerProcessMisc/manageMiscCloneListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {

                        console.log(datas.trim());

                        if (datas.trim() === 'Success') {

                            $("#manageMiscTableDIV").load("manageMiscTable.jsp");
                            $('#miscCloneModal').modal('hide');

                            bootbox.alert({
                                message: "Miscellaneous is successfully cloned",
                                title: "Process Result",
                                backdrop: true
                            });

                            MISCCloneReset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");

                            MISCCloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#MISC_Code').val("");

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
        // Clone Misc Clone Function End


        // Clone Misc Select All Function Start
        $('#MISC_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#MISC_Code').multiSelect('select_all');
            return false;
        });
        // Clone Misc Select All Function End


        // Clone Misc Un-Select All Function Start
        $('#MISC_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#MISC_Code').multiSelect('deselect_all');
            return false;
        });
        // Clone Misc Un-Select All Function End

        // Clone Misc Function End

    });


</script>