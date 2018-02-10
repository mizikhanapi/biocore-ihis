<%-- 
    Document   : manageLabVerifyModal
    Created on : Jan 16, 2018, 3:35:04 AM
    Author     : Shammugam
--%>

<!-- Update Modal Start -->
<div class="modal fade" id="addSpecimenResult" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Add Specimen Result</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="addSpecimenResultForm" autocomplete="off">


                    <div class="row">
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Specimen No</label>
                                <div class="col-md-8">
                                    <input id="addSpecimenResultSpecimenNo" name="updateOrderNo" type="text" placeholder="Order No" class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order No</label>
                                <div class="col-md-8">
                                    <input id="addSpecimenResultOrderNo" name="updateOrderNo" type="text" placeholder="Order No" class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr>


                    <div class="row">
                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Code</label>
                                <div class="col-md-8">
                                    <input id="addSpecimenResultItemCode" name="updateDrugCode" type="text" placeholder="Item Code" class="form-control input-md" readonly>
                                </div>
                            </div>


                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Result</label>
                                <div class="col-md-8">
                                    <textarea id="addSpecimenResultResult" class="form-control" rows="3" placeholder="Please Insert Result" maxlength="200"></textarea>
                                </div>
                            </div>


                        </div>

                        <div class="col-md-6">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Item Name</label>
                                <div class="col-md-8">
                                    <input id="addSpecimenResultItemName" name="updateDrugCode" type="text" placeholder="Item Name" class="form-control input-md" readonly>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Remark</label>
                                <div class="col-md-8">
                                    <textarea id="addSpecimenResultRemark" class="form-control" rows="3" placeholder="Please Insert Remark" maxlength="200"></textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-4 control-label" for="textinput">Upload Result</label>
                            <div class="col-md-6">
                                <input class="form-control" id="inputFileToLoad" type="file" accept=".jpg, .png, .gif">
                            </div>

                        </div>

                        <hr/>

                        <div class="col-md-12" style="width: 100%; margin: 0 auto">
                            <div id="dym" style="text-align: center;" class=" img-responsive"  alt="Exam Result" style="height: 100%; width: 100%">
                            </div>
                        </div>

                    </div>



                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="addSpecimenResultMButton">Add Result</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-default btn-block btn-lg" role="button" data-dismiss="modal" id="addSpecimenResultMCButton" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Update Modal End -->  



<!-- Update Modal Start -->
<div class="modal fade" id="verifySpecimenResult" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:50%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                <h3 class="modal-title" id="lineModalLabel">Verify Specimen Result</h3>
            </div>
            <div class="modal-body">

                <!-- content goes here -->
                <form class="form-horizontal" id="verifySpecimenResultForm" autocomplete="off">


                    <div class="row">
                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Specimen No</label>
                                <div class="col-md-8">
                                    <input id="verifySpecimenResultSpecimenNo" name="updateOrderNo" type="text" placeholder="Specimen No" class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Order No</label>
                                <div class="col-md-8">
                                    <input id="verifySpecimenResultOrderNo" name="updateOrderNo" type="text" placeholder="Order No" class="form-control input-md" readonly>
                                </div>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Item Code</label>
                            <div class="col-md-8">
                                <input id="verifySpecimenResultItemCode" name="updateDrugCode" type="text" placeholder="Item Code" class="form-control input-md" readonly>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Item Name</label>
                            <div class="col-md-8">
                                <input id="verifySpecimenResultItemName" name="updateDrugCode" type="text" placeholder="Item Name" class="form-control input-md" readonly>
                            </div>
                        </div>


                        <div class="col-md-12">
                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Result No</label>
                                <div class="col-md-8">
                                    <input id="verifySpecimenResultResultNo" name="updateOrderNo" type="text" placeholder="Result No" class="form-control input-md" maxlength="15" readonly>
                                </div>
                            </div>
                        </div>


                        <!-- Select input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="textinput">Verification</label>
                            <div class="col-md-8">
                                <select class="form-control" name="tstatus" id="verifySpecimenResultStatus">
                                    <option value="Approved" selected>Approve</option>>
                                    <option value="Rejected" >Rejected</option>
                                </select>
                            </div>
                        </div>
                    </div>



                </form>
                <!-- content goes here -->
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="verifySpecimenResultMButton">Verify Result</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="submit" class="btn btn-default btn-block btn-lg" role="button" data-dismiss="modal" id="verifySpecimenResultMCButton" >Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Update Modal End -->  


<script>

    (function ($) {

        $.fn.checkFileType = function (options) {
            var defaults = {
                allowedExtensions: [],
                success: function () {},
                error: function () {}
            };
            options = $.extend(defaults, options);

            return this.each(function () {

                $(this).on('change', function () {
                    var value = $(this).val(),
                            file = value.toLowerCase(),
                            extension = file.substring(file.lastIndexOf('.') + 1);

                    if ($.inArray(extension, options.allowedExtensions) === -1) {
                        options.error();
                        $(this).focus();
                    } else {
                        options.success();

                    }

                });

            });
        };

    })(jQuery);

    $('#inputFileToLoad').checkFileType({
        allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
        success: function () {
            loadImageFileAsURL();
        },
        error: function () {
            bootbox.alert('Incompatible file type');
            $('#inputFileToLoad').val("");
            $('#dym').html("");
            gambarURI = "";
        }
    });


    var gambarURI = "";

    function loadImageFileAsURL()
    {

        var iSize = 0;

        iSize = ($("#inputFileToLoad")[0].files[0].size / 1024);

        var sizeSmall = false;

        if (iSize / 1024 > 1) {
            sizeSmall = false;

        } else {

            iSize = (Math.round(iSize * 100) / 100);

            sizeSmall = iSize <= 45;

        }
        if (sizeSmall) {

            document.getElementById("dym").innerHTML = '<div class="loader"></div>';
            var filesSelected = document.getElementById("inputFileToLoad").files;

            if (filesSelected.length > 0)
            {
                var fileToLoad = filesSelected[0];

                var fileReader = new FileReader();

                fileReader.onload = function (fileLoadedEvent)
                {

                    gambarURI = fileLoadedEvent.target.result;


                    document.getElementById("dym").innerHTML = '<img id="myImage">';

                    document.getElementById("myImage").src = gambarURI;

                };

                fileReader.readAsDataURL(fileToLoad);
            }

        } else {

            bootbox.alert("File size must not exceed 40kb");
            $('#inputFileToLoad').val("");
            gambarURI = "";
            $('#dym').html("");
        }


    }


    // Add Result Start
    $('#addSpecimenResultMButton').on('click', function (e) {

        e.preventDefault();

        var customer_id = $("#patientpmino").val();
        var txt_date = $("#specimenOrderDate").val();
        var specimen_no = $("#specimenSpecimenNo").val();
        var order_no = $("#specimenOrderNo").val();
        var order_date = $("#specimenOrderDate").val();
        var episode_date = $("#specimenEpisodeDate").val();
        var encounter_date = $("#specimenEncounterDate").val();
        var item_cd = $("#addSpecimenResultItemCode").val();
        var item_name = $("#addSpecimenResultItemName").val();
        var result = $("#addSpecimenResultResult").val();
        var remark = $("#addSpecimenResultRemark").val();
        var item_name = $("#addSpecimenResultItemName").val();

        if (result === "" || result === null) {

            bootbox.alert("Please Insert Result");

        } else if (remark === "" || remark === null) {

            bootbox.alert("Please Insert Remark");

        } else if (gambarURI === "") {

            bootbox.alert("Please Choose a picture");

        } else {


            $.ajax({
                url: "controllerProcessVerifySpecimen/verifySpecimenOrderGetSeqNo.jsp",
                type: "post",
                timeout: 10000,
                success: function (seq) {


                    var datas = {
                        result_no: seq.trim(),
                        result: result,
                        remark: remark,
                        item_cd: item_cd,
                        test_name: item_name,
                        pmi_no: customer_id,
                        specimen_no: specimen_no,
                        order_no: order_no,
                        picture: gambarURI
                    };

                    console.log(datas);

                    $.ajax({
                        url: "controllerProcessVerifySpecimen/verifySpecimenOrderInsertResult.jsp",
                        type: "post",
                        data: datas,
                        timeout: 10000,
                        success: function (datasR) {

                            console.log(datasR);

                            if (datasR.trim() === "Success") {

                                bootbox.alert("Result Is Added !!!");

                                var dataOrder = {
                                    specimenNo: specimen_no
                                };


                                $.ajax({
                                    url: "manageLabVerifyDetailsTable.jsp",
                                    type: "post",
                                    data: dataOrder,
                                    timeout: 3000,
                                    success: function (returnOrderDetailsTableHTML) {

                                        $('#patientSpecimenDetailsListTable').html(returnOrderDetailsTableHTML);

                                        $('#patientSpecimenDetailsListTable').DataTable().destroy();

                                        // do something after the div content has changed
                                        $('#patientSpecimenDetailsListTable').DataTable({
                                            "paging": true,
                                            "searching": false,
                                            "info": false,
                                            "lengthChange": false,
                                            "pageLength": 5,
                                            "language": {
                                                "emptyTable": "No Specimen Available To Display"
                                            }
                                        });

                                        $('#addSpecimenResult').modal('hide');

                                    }
                                });

                            } else if (datasR.trim() === "Failed") {

                                // resetPage();

                                bootbox.alert("Result Add Failed !!!");

                            }

                        },
                        error: function (err) {
                            console.log("Ajax Is Not Success");
                        }

                    });

                },
                error: function (err) {
                    console.log("Ajax Is Not Success");
                }

            });

        }

    });
    // Add Result End



    // Verify Result Start
    $('#verifySpecimenResultMButton').on('click', function (e) {

        e.preventDefault();

        var specimen_no = $("#verifySpecimenResultSpecimenNo").val();
        var result_no = $("#verifySpecimenResultResultNo").val();
        var order_no = $("#verifySpecimenResultOrderNo").val();
        var item_cd = $("#verifySpecimenResultItemCode").val();
        var item_name = $("#verifySpecimenResultItemName").val();
        var status = $("#verifySpecimenResultStatus").val();


        if (result_no === "" || result_no === null) {

            bootbox.alert("Please Enter The Result First");

        } else {



            var datas = {
                result_no: result_no,
                specimen_no: specimen_no,
                order_no: order_no,
                item_cd: item_cd,
                item_name: item_name,
                status: status
            };

            console.log(datas);

            $.ajax({
                url: "controllerProcessVerifySpecimen/verifySpecimenOrderVerifyResult.jsp",
                type: "post",
                data: datas,
                timeout: 10000,
                success: function (datasR) {

                    console.log(datasR);

                    if (datasR.trim() === "Success") {

                        bootbox.alert("Result Is Verified Succesfully !!!");

                        var dataOrder = {
                            specimenNo: specimen_no
                        };


                        $.ajax({
                            url: "manageLabVerifyDetailsTable.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {

                                $('#patientSpecimenDetailsListTable').html(returnOrderDetailsTableHTML);

                                $('#patientSpecimenDetailsListTable').DataTable().destroy();

                                // do something after the div content has changed
                                $('#patientSpecimenDetailsListTable').DataTable({
                                    "paging": true,
                                    "searching": false,
                                    "info": false,
                                    "lengthChange": false,
                                    "pageLength": 5,
                                    "language": {
                                        "emptyTable": "No Specimen Available To Display"
                                    }
                                });

                                $('#verifySpecimenResult').modal('hide');

                                verifyResetPageDisabledNumber();

                            }
                        });

                    } else if (datasR.trim() === "Failed") {

                        // resetPage();

                        bootbox.alert("Result Verify Failed !!!");

                    }

                },
                error: function (err) {
                    console.log("Ajax Is Not Success");
                }

            });



        }

    });
    // Verify Result End



    function verifyResetPageDisabledNumber() {

        // Getting Table
        var table = $("#patientSpecimenDetailsListTable tbody");

        // Setting Variable For Counter
        var resetCounter = 0;


        // Calculating Data For Selected Dispense
        table.find('tr').each(function (i) {

            var isAddDisabled = $(this).find("#btnVerifySpecimenEnterResult").is(':disabled');
            var isVerifyDisabled = $(this).find("#btnVerifySpecimenVerifyResult").is(':disabled');

            console.log(isAddDisabled);
            console.log(isVerifyDisabled);

            if (isAddDisabled === false || isVerifyDisabled === false) {

                resetCounter = resetCounter + 1;

            }
        });


        verifyResetPage(resetCounter);

    }



    function verifyResetPage(resetCounter) {


        var totalNumber = resetCounter;


        if (totalNumber === 0) {


            $('<div class="loading">Loading</div>').appendTo('body');

            // Load LIST Page
            $("#lisLabRequestVerifyMasterMain").load("manageLabVerifyMasterMain.jsp");
            $("#lisLabRequestVerifyMasterContent").load("manageLabVerifyMasterTable.jsp");

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');

            // Load Detail Page
            $("#lisLabRequestVerifyDetailContent").load("manageLabVerifyDetaillBasicInfo.jsp");


        }


    }



</script>