<%-- 
    Document   : freqMain
    Created on : Sep 6, 2017, 6:36:38 PM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    DRUG FREQUENCY MANAGEMENT
    <span class="pull-right">
        <button id="addNewFreqButton" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#freqModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD DRUG FREQUENCY</button>
        <button id="FREQClone_btnClone" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#freqCloneModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>CLONE DRUG FREQUENCY CODE</button>
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


        // Frequency Add Modal Button Function Start
        $('#addNewFreqButton').on('click', function () {

            $('#freqModalTitle').text("Add New Drug Frequency");
            $('#freqCode').prop('readonly', false);
            $('#freq_btnAdd_or_btnUpdate_div').html('<button type="submit" id="addFreqButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>');

            $('#freqForm')[0].reset();

        });
        // Frequency Add Modal Button Function End


        // Frequency Reset Button Start
        $('#freqReset').on('click', function () {
            $('#freqForm')[0].reset();
        });
        // Frequency Reset Button End



        // Add Frequency Function Start
        $('#freq_btnAdd_or_btnUpdate_div').on('click', '#addFreqButton', function (e) {


            var frequencyCode = $('#freqCode').val();
            var frequencyDesc = $('#freqDesc').val();
            var frequencyValue = $('#freqValue').val();
            var frequencyStatus = $('#freqStatus').val();


            if (frequencyCode === "" || frequencyCode === null) {
                bootbox.alert("Please Insert The Frequency Code");
            } else if (frequencyDesc === "" || frequencyDesc === null) {
                bootbox.alert("Please Insert The Frequency Description");
            } else if (frequencyValue === "" || frequencyValue === null) {
                bootbox.alert("Please Insert The Frequency Value");
            } else if (frequencyStatus === "" || frequencyStatus === null) {
                bootbox.alert("Please Select A Status");

            } else {

                var newFrequencyValue = parseFloat(frequencyValue).toFixed(2);

                frequencyValue = newFrequencyValue;

                var data = {
                    frequencyCode: frequencyCode,
                    frequencyDesc: frequencyDesc,
                    frequencyValue: frequencyValue,
                    frequencyStatus: frequencyStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcess/freqInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#contentFREQTable").load("freqTableLoop.jsp");
                            $('#freqModal').modal('hide');
                            bootbox.alert({
                                message: "Drug Frequency is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#freqForm')[0].reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Frequency Code Duplication Detected. Please use diffrerent Frequency Code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Drug Frequency Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#freqModal').modal('hide');
                            $('#freqForm')[0].reset();
                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                        console.log(err);
                    }

                });



            }
        });
        // Add Frequency Function End



        // Frequency Update Function Start
        $('#contentFREQTable').off('click', '#freqTable #freqUpdateTButton').on('click', '#freqTable #freqUpdateTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataFreqhidden").val();
            var arrayData = rowData.split("|");

            $('#freqModalTitle').text("Update Drug Frequency");
            $('#freqCode').prop('readonly', true);
            $('#freq_btnAdd_or_btnUpdate_div').html('<button type="submit" id="updateFreqButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>');

            $('#freqCode').val(arrayData[0]);
            $('#freqDesc').val(arrayData[1]);
            $('#freqValue').val(arrayData[2]);
            $('#freqStatus').val(arrayData[6]);



        });
        // Frequency Update Function End


        // Frequency Update Function Start
        $('#freq_btnAdd_or_btnUpdate_div').on('click', '#updateFreqButton', function (e) {

            e.preventDefault();

            var frequencyCode = $('#freqCode').val();
            var frequencyDesc = $('#freqDesc').val();
            var frequencyValue = $('#freqValue').val();
            var frequencyStatus = $('#freqStatus').val();

            if (frequencyCode === "" || frequencyCode === null) {
                bootbox.alert("Please Insert The Frequency Code");
            } else if (frequencyDesc === "" || frequencyDesc === null) {
                bootbox.alert("Please Insert The Frequency Description");
            } else if (frequencyValue === "" || frequencyValue === null) {
                bootbox.alert("Please Insert The Frequency Value");
            } else if (frequencyStatus === "" || frequencyStatus === null) {
                bootbox.alert("Please Select A Status");

            } else {

                var newFrequencyValue = parseFloat(frequencyValue).toFixed(2);

                frequencyValue = newFrequencyValue;

                var data = {
                    frequencyCode: frequencyCode,
                    frequencyDesc: frequencyDesc,
                    frequencyValue: frequencyValue,
                    frequencyStatus: frequencyStatus
                };


                console.log(data);

                $.ajax({
                    url: "controllerProcess/freqUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#contentFREQTable").load("freqTableLoop.jsp");
                            $('#freqModal').modal('hide');
                            bootbox.alert({
                                message: "Drug Frequency is Updated Successful",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#freqForm')[0].reset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Drug Frequency Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });
                            $('#freqModal').modal('hide');
                            $('#freqForm')[0].reset();
                        }

                    },
                    error: function (err) {
                        alert("Error Ajax Update!");
                    }

                });

            }
        });
        // Frequency Update Function End



        // Frequency Delete Function Start
        $('#contentFREQTable').off('click', '#freqTable #freqDeleteTButton').on('click', '#freqTable #freqDeleteTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataFreqhidden").val();
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
                            url: "controllerProcess/freqDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $("#contentFREQTable").load("freqTableLoop.jsp");

                                    bootbox.alert({
                                        message: "Drug Frequency is Deleted Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Drug Frequency Delete Failed",
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
        // Frequency Delete Function End



        // Clone Freq Function Start

        // Clone MDC Button Click Function Start
        $('#FREQClone_btnClone').on('click', function () {
            FREQCloneReset();
            createFREQCodeList();
        });
        // Clone MDC Button Click Function End


        // Clone MDC Reset Function Start
        function FREQCloneReset() {
            document.getElementById("freqClone_Form").reset();
        }
        // Clone MDC Reset Function End


        // Clone MDC Create List Function Start
        function createFREQCodeList() {

            $('#FREQ_Code').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#freqCloneModal');

            $.ajax({
                type: 'POST',
                url: "controllerSearch/freqCloneDrugList.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#FREQ_Code').html(data);
                    $('#FREQ_Code').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Selectable Frequency Code</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Frequency Code</div>",
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
        // Clone MDC Create List Function End


        // Clone MDC Clone Function Start
        $('#FREQ_btnClone').on('click', function () {

            var arraySelect = [];
            $("#FREQ_Code option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strFREQClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strFREQClone);

            if (strFREQClone === "") {
                bootbox.alert("Select at least one drug to be cloned");
            } else {
                $('<div class="loading">Loading</div>').appendTo('#mdcCloneModal');

                var data = {
                    strFREQClone: strFREQClone
                };

                $.ajax({
                    url: "controllerProcess/freqCloneDrugListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {
                        console.log(datas.trim());

                        if (datas.trim() === 'Success') {

                            $("#contentFREQTable").load("freqTableLoop.jsp");
                            $('#freqCloneModal').modal('hide');

                            bootbox.alert({
                                message: "Drug frequency is successfully cloned",
                                title: "Process Result",
                                backdrop: true
                            });

                            FREQCloneReset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");

                            FREQCloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#FREQ_Code').val("");

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
        // Clone MDC Clone Function End


        // Clone MDC Select All Function Start
        $('#FREQ_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#FREQ_Code').multiSelect('select_all');
            return false;
        });
        // Clone MDC Select All Function End


        // Clone MDC Un-Select All Function Start
        $('#FREQ_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#FREQ_Code').multiSelect('deselect_all');
            return false;
        });
        // Clone MDC Un-Select All Function End

        // Clone MDC Function End


    });

</script>

