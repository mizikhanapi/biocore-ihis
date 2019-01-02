<%-- 
    Document   : patientScreenListBasicInfo
    Created on : Oct 29, 2018, 10:54:33 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdis = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String locationcode = hfc + "|" + dis + "|" + subdis;
%>

<h4>
    Basic Info
    <div class="pull-right">
        <button id="patientShowVitalSign" name="patientShowVitalSign" class="btn btn-link" data-toggle="modal" ><i class="fa fa-info-circle fa-lg"></i> &nbsp; Show Vital Signs </button>
    </div>
</h4>


<form class="form-horizontal" name="patientOrderDetailBasicInfoForm" id="patientOrderDetailBasicInfoForm">
    <div class="row">

        <div class="col-md-4">
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">PMI No.</label>
                <div class="col-md-7">
                    <input id="patientpmino" name="patientpmino" type="text" placeholder="" readonly class="form-control input-md">
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Name</label>
                <div class="col-md-7">
                    <input id="patientName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">IC/ID No.</label>
                <div class="col-md-7">
                    <input id="patientnic" name="patientnic" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Gender</label>
                <div class="col-md-7">
                    <input id="patientGender" name="patientGender" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">D.O.B</label>
                <div class="col-md-7">
                    <input id="patientBdate" name="patientBdate" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Blood Type</label>
                <div class="col-md-7">
                    <input id="patientBtype" name="patientBtype" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
        </div>

    </div>
</form>


<h5>
    ALLERGY LIST
</h5>


<div id="patientScreenAllergyListTableDiv" class="form-group">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left;" id="patientScreenAllergyListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th>HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>ALLERGY CODE</th>
        <th style="text-align: left; width: 50%;">ALLERGY DESCRIPTION</th>
        <th style="text-align: left; width: 20%;">COMMENT</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>


<hr/>


<h4>Diagnosis Info</h4>


<div id="patientScreenDiagnosisListTableDiv" class="form-group">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientScreenDiagnosisListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th >HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>DIAGNOSIS CODE</th>
        <th style="text-align: left; width: 50%;">DIAGNOSIS DESCRIPTION</th>
        <th style="text-align: left; width: 20%;">COMMENT</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>


<hr/>


<h4>
    Order Info
    <div class="pull-right">
        <button id="patientScreenAddDrugButton" name="patientScreenAddDrugButton" class="btn btn-primary" data-toggle="modal" ><i class="fa fa-plus fa-lg"></i>&nbsp; Add Order</button>
    </div>
</h4>


<form class="form-horizontal" name="patientOrderDetailContentOrderInfoForm" id="patientOrderDetailContentOrderInfoForm">
    <div class="row">

        <div class="col-md-4">
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order No.</label>
                <div class="col-md-7">
                    <input id="patientOrderNo" name="patientOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order Date</label>
                <div class="col-md-7">
                    <input id="patientOrderDate" name="patientOrderDate" type="hidden" readonly placeholder="" class="form-control input-md">
                    <input id="patientOrderDateShow" name="patientOrderDateShow" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Location</label>
                <div class="col-md-7">
                    <input id="patientOrderLocationCode" name="patientOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                    <input id="patientOrderLocationCodeFull" name="patientOrderLocationCodeFull" type="hidden" readonly placeholder="" class="form-control input-md" value="<%= locationcode%>">
                </div>
            </div>
        </div>

    </div>
</form>


<div id="patientScreenDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientScreenDetailsListTable">
        <thead>
        <th>Order No</th>
        <th>Code</th>
        <th>Description</th>
        <th>Strength</th>
        <th>Frequency</th>
        <th>Duration</th>
        <th>Dose</th>
        <th>Price/Pack</th>
        <th>Stock Qty</th>
        <th>Ordered Qty</th>
        <th>Supplied Qty</th>
        <th>Dispensed Qty</th>
        <th>Status</th>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>


<div class="row">
    <!-- content goes here -->
    <form class="form-horizontal" id="addForm">

        <div class="col-md-3">
        </div>

        <div class="col-md-3">
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Order</label>
                <div class="col-md-4">
                    <input id="screenTotalOrder" name="screenTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="screenGrandTotal" name="screenGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>
        </div>

    </form>
</div>


<hr/>


<div style="float: left;" id="patientScreenProcessButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnScreenClear" name="btnScreenClear" > <i class="fa fa-angle-left fa-lg"></i> &nbsp; Back &nbsp;</button>
</div>


<div class="text-right" id="patientScreenProcessButtonDiv" > 
    <button class="btn btn-primary " type="button" id="btnScreenScreening" name="btnScreenScreening" > <i class="fa fa-tasks fa-lg"></i>&nbsp; Screening Complete &nbsp;</button>
</div>


<script>


    var episodeDate;
    var encounterDate;

    // ================================================================ Show Master Patient Order Detail ================================================================ //


    // Move to Order Details Fetch Details Start
    $('#patientScreenListContent').off('click', '#patientScreenListTable #moveToScreenDetailsTButton').on('click', '#patientScreenListTable #moveToScreenDetailsTButton', function (e) {

        $('<div class="loading">Loading</div>').appendTo('body');

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataPatientScreenListhidden").val();
        var arrayData = rowData.split("|");

        //Assign Array into seprated val
        var patientpmino = arrayData[1];
        var patientName = arrayData[15];
        var patientnic = arrayData[16];
        var patientGender = arrayData[21];
        var patientBdate = arrayData[17];
        var patientBtype = arrayData[22];
        var patientOrderNo = arrayData[0];
        var patientOrderDate = arrayData[5];
        var patientOrderDateShow = arrayData[25];
        var patientOrderLocationCode = arrayData[2];
        var patientOrderEpisodeDate = arrayData[3];
        var patientOrderEncounterDate = arrayData[4];
        var patientOrderLocationCodeName = arrayData[23];


        var pmiNo = patientpmino;
        var orderNo = patientOrderNo;
        var orderDate = patientOrderDate;
        episodeDate = patientOrderEpisodeDate;
        encounterDate = patientOrderEncounterDate;

        //Set value to the Second Tab 
        $("#patientpmino").val(patientpmino);
        $("#patientName").val(patientName);
        $("#patientnic").val(patientnic);
        $("#patientGender").val(patientGender);
        $("#patientBdate").val(patientBdate);
        $("#patientBtype").val(patientBtype);
        $("#patientOrderNo").val(patientOrderNo);
        $("#patientOrderDate").val(patientOrderDate);
        $("#patientOrderDateShow").val(patientOrderDateShow);
        $("#patientOrderLocationCode").val(patientOrderLocationCodeName);

        loadAllergyDiagnosisOrder(patientOrderNo, patientpmino);

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
            url: "controllerProcessScreenOrder/patientScreenListAllergyTable.jsp",
            type: "post",
            data: dataAllergy,
            timeout: 3000,
            success: function (returnAllergyTableHTML) {

                $('#patientScreenAllergyListTable').html(returnAllergyTableHTML);

                $.ajax({
                    url: "controllerProcessScreenOrder/patientScreenListDiagnosisTable.jsp",
                    type: "post",
                    data: dataDiagnosis,
                    timeout: 3000,
                    success: function (returnDiagnosisTableHTML) {

                        $('#patientScreenDiagnosisListTable').html(returnDiagnosisTableHTML);

                        $.ajax({
                            url: "controllerProcessScreenOrder/patientScreenListDetails.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {

                                $('#patientScreenDetailsListTable').html(returnOrderDetailsTableHTML);

                                $('#patientScreenDetailsListTable').trigger('contentchanged');

                                $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                                $('.loading').hide();

                            }
                        });

                    }
                });

            }
        });

    }
    // Move to Order Details And Load All Table Data End


    // Load Datatable To Tables Start
    $(document).on('contentchanged', '#patientScreenDetailsListTableDiv', function () {

        $('#patientScreenDetailsListTable').DataTable().destroy();
        $('#patientScreenDiagnosisListTable').DataTable().destroy();
        $('#patientScreenAllergyListTable').DataTable().destroy();

        // do something after the div content has changed
        $('#patientScreenDetailsListTable').DataTable({
            "paging": false,
            "searching": false,
            "info": false,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Order Available To Display"
            }
        });

        // do something after the div content has changed
        $('#patientScreenDiagnosisListTable').DataTable({
            "paging": true,
            "searching": false,
            "info": false,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Record Available To Display"
            }
        });

        // do something after the div content has changed
        $('#patientScreenAllergyListTable').DataTable({
            "paging": true,
            "searching": false,
            "info": false,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Record Available To Display"
            }
        });

    });
    // Load Datatable To Tables End 



    // ================================================================ Show Master Patient Order Detail ================================================================ //





    // =====================================================================  Add Part End  ===================================================================== //


    // Getting Order Id And Date Start
    $('#patientScreenDetailContent').off('click', '#patientScreenAddDrugButton').on('click', '#patientScreenAddDrugButton', function (e) {

        e.preventDefault();

        var patientOrderNo = $("#patientOrderNo").val();
        var patientOrderDate = $("#patientOrderDate").val();
        var patientOrderDateShow = $("#patientOrderDateShow").val();

        if (patientOrderNo === "" || patientOrderNo === null) {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            bootbox.alert("Please Select A Order First");

        } else {

            $('#addScreenItem').modal('show');

            $("#orderDrugDetailsID").val(patientOrderNo);
            $("#orderDrugDetailsDate").val(patientOrderDate);
            $("#orderDrugDetailsDateShow").val(patientOrderDateShow);

        }

    });
    // Getting Order Id And Date End


    //js Search in add drug Start
    $(function () {

        $("#orderDrugSearchInput").on('keyup', function () { // everytime keyup event

            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)

                $('#orderDrugSearchInputDisplayResult').html('<img src="libraries/LoaderIcon.gif"/>'); // Loader icon apprears in the <div id="match"></div>

                var dataFields = {'input': input}; // We pass input argument in Ajax

                $.ajax({
                    type: "POST",
                    url: "controllerProcessScreenOrder/patientScreenListAddItemSearch.jsp", // call the jsp file ajax/auto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success

                        $('#orderDrugSearchInputDisplayResult').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#orderDrugSearchInputDisplayResult li').on('click', function () { // When click on an element in the list
                            $('#orderDrugSearchInput').val($(this).text()); // Update the field with the new element
                            $('#orderDrugSearchInputDisplayResult').text(''); // Clear the <div id="match"></div>
                        });

                    },
                    error: function () { // if error
                        $('#orderDrugSearchInputDisplayResult').text('No Eecord Found !');
                    }
                });

            } else {

                $('#orderDrugSearchInputDisplayResult').text('Problem!'); // If less than 2 characters, clear the <div id="match"></div>

            }
        });

    });
    //js Search in add drug End


    //Start js Search Select drug
    $('#orderDrugSearchInputDisplayResult').on('click', function () {

        $('<div class="loading">Loading</div>').appendTo('body');

        var id = $('#orderDrugSearchInput').val();

        $.ajax({
            type: 'post',
            url: 'controllerProcessScreenOrder/patientScreenListAddItemSearchResult.jsp',
            data: {'id': id},
            success: function (reply_data) {

                console.log(reply_data.trim());

                var array_data = String(reply_data.trim()).split("|");
                var dtoCode = array_data[0];
                var dtoGnr = array_data[1];
                var dtoQty = array_data[2];
                var dtoPackage = array_data[8];
                var dtoRoute = array_data[3];
                var dtoForm = array_data[4];
                var dtoStrength = array_data[5];
                var dtoInstruction = array_data[6];
                var dtoCaution = array_data[7];
                var dtoD_Qty = array_data[9];
                var dtoDQtyT = array_data[10];
                var dtoDuration = array_data[11];
                var dtoDurationT = array_data[12];
                var dtoFreq = array_data[13];

                console.log(dtoCode);

                $('#orderDrugDisplayDrugCode').val(dtoCode);
                $('#orderDrugDisplayTradeName').val(dtoGnr);
                $('#orderDrugDisplayStockQuantity').val(dtoQty);
                $('#orderDrugDisplayForm').val(dtoForm);
                $('#orderDrugDisplayRoute').val(dtoRoute);
                $('#orderDrugDisplayStrength').val(dtoStrength);
                $('#orderDrugDisplayInstruction').val(dtoInstruction);
                $('#orderDrugDisplayCautionary').val(dtoCaution);
                $('#orderDrugInputDose').val(dtoD_Qty);
                $('#orderDrugInputDoseT').val(dtoDQtyT);
                $('#orderDrugInputDuration').val(dtoDuration);
                $('#orderDrugInputDurationT').val(dtoDurationT);
                $('#orderDrugInputFrequency').val(dtoFreq);

                $('.loading').hide();

            }
        });
    });
    //End js Search Select drug


    // Add Order Start
    $('#screenDrugAddButton').on('click', function (e) {

        e.preventDefault();

        var orderNo = $('#orderDrugDetailsID').val();
        var orderDate = $('#orderDrugDetailsDate').val();

        var drugTradeName = $('#orderDrugSearchInput').val();
        var drugCode = $('#orderDrugDisplayDrugCode').val();
        var drugGName = $('#orderDrugDisplayTradeName').val();
        var drugRoute = $('#orderDrugDisplayRoute').val();
        var drugForm = $('#orderDrugDisplayForm').val();

        var drugStrength = $('#orderDrugDisplayStrength').val();
        var drugInstruction = $('#orderDrugDisplayInstruction').val();
        var drugCaution = $('#orderDrugDisplayCautionary').val();
        var drugTotalQty = $('#orderDrugDisplayStockQuantity').val();

        var drugQty = $('#orderDrugInputQuantity').val();
        var drugDose = $('#orderDrugInputDose').val();
        var drugDoseT = $('#orderDrugInputDoseT').val();
        var drugFrequency = $('#orderDrugInputFrequency').val();
        var drugDuration = $('#orderDrugInputDuration').val();
        var drugDurationT = $('#orderDrugInputDurationT').val();
        var drugComment = $('#orderComment').val();

        if (drugTradeName === "" || drugTradeName === null) {
            bootbox.alert("Please Search The Drug Before Continue");
        } else if (drugQty === "" || drugQty === null) {
            bootbox.alert("Please Insert Drug Order Quantity");
        } else if (drugDose === "" || drugDose === null) {
            bootbox.alert("Please Insert Drug Order Dose");
        } else if (drugDoseT === "-" || drugDoseT === null) {
            bootbox.alert("Please Select Drug Dose Type");
        } else if (drugFrequency === "-" || drugFrequency === null) {
            bootbox.alert("Please Select Drug Frequency");
        } else if (drugDuration === "" || drugDuration === null) {
            bootbox.alert("Please Insert Drug Duration");
        } else if (drugDurationT === "-" || drugDurationT === null) {
            bootbox.alert("Please Select Drug Frequency");
        } else {

            var ItemDesc = (drugTradeName + " - " + drugGName);
            var dosage = (drugDose + drugDoseT);

            var data = {
                orderNo: orderNo
            };

            var datas = {
                orderNo: orderNo,
                drugCode: drugCode,
                drugDesc: ItemDesc,
                drugFrequency: drugFrequency,
                drugRoute: drugRoute,
                drugFrom: drugForm,
                drugStrength: drugStrength,
                dosage: dosage,
                orderOUM: "-",
                drugDuration: drugDuration,
                orderStatus: "0",
                drugQty: drugQty,
                qtySupplied: "0",
                suppliedOUM: "-",
                qtyDispensed: "0",
                dispensedOUM: "-",
                drugDurationT: drugDurationT,
                drugComment: drugComment
            };

            console.log(datas);

            $.ajax({
                url: "controllerProcessScreenOrder/patientScreenListAddItem.jsp",
                type: "post",
                data: datas,
                timeout: 10000,
                success: function (datas) {

                    if (datas.trim() === 'Success') {

                        $('#addScreenItem').modal('hide');
                        bootbox.alert({
                            message: "Item is Added Successfully",
                            title: "Information",
                            backdrop: true
                        });
                        resetAddOrder();

                        $.ajax({
                            url: "controllerProcessScreenOrder/patientScreenListDetails.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {

                                $('#patientScreenDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#patientScreenDetailsListTable').trigger('contentchanged');

                            }
                        });

                    } else if (datas.trim() === 'Duplicate') {

                        bootbox.alert({
                            message: "Item Product Code Duplication Detected. Please Order diffrent drug as the data already there",
                            title: "Information",
                            backdrop: true
                        });

                    } else if (datas.trim() === 'Failed') {

                        bootbox.alert({
                            message: "Item Add Failed",
                            title: "Information",
                            backdrop: true
                        });
                        $('#addScreenItem').modal('hide');
                        resetAddOrder();

                    }

                },
                error: function (err) {
                    console.log("Ajax Is Not Success");
                }

            });
        }

    });
    // Add Order End


    // Reset Order Button Start
    $('#screenDrugResetButton').on('click', function (e) {
        resetAddOrder();
    });
    // Reset Order Button End


    // Reset Order Function Start
    function resetAddOrder() {
        document.getElementById("addScreenItemForm").reset();
        document.getElementById("orderDrugSearchInputDisplayResult").innerHTML = "";
    }
    // Reset Order Function End



    // =====================================================================  Add Part End  ===================================================================== //






    // =====================================================================  Delete Part Start  ===================================================================== //



    // global variable declaration
    var row;


    // Get Data For Delete To Load On the Modal
    $('#patientScreenDetailContent').off('click', '#patientScreenDetailsListTable #deleteScreenDetailsTButton').on('click', '#patientScreenDetailsListTable #deleteScreenDetailsTButton', function (e) {

        e.preventDefault();

        row = $(this).closest("tr");
        var rowData = row.find("#dataPatientScreenDetailsListhidden").val();
        var arrayData = rowData.split("|");

        var deleteOrderNo = arrayData[0];
        var deleteDrugCode = arrayData[1];
        var deleteDrugName = arrayData[2];
        var deleteDrugOrdered = parseInt(arrayData[11]);
        var deleteDrugStockQty = arrayData[18];
        var deleteDrugComment = arrayData[38];
        var updateOrderDrugDispensed = row.find('td').eq(9).text();

        $("#deleteScreenOrderNo").val(deleteOrderNo);
        $("#deleteScreenDrugCode").val(deleteDrugCode);
        $("#deleteScreenDrugName").val(deleteDrugName);
        $("#deleteScreenStockQuantity").val(deleteDrugStockQty);
        $("#deleteScreenOrderedQuantity").val(deleteDrugOrdered);
        $("#deleteScreenComment").val(deleteDrugComment);
        $("#deleteScreenDispenseQuantity").val(updateOrderDrugDispensed);


    });
    // Get Data For Delete To Load On the Modal End


    // Delete Order Data 
    $('#deleteScreenItem').on('click', '#deleteScreenMButton', function (e) {

        var orderNo = $("#deleteScreenOrderNo").val();
        var drugCode = $("#deleteScreenDrugCode").val();

        var data = {
            orderNo: orderNo,
            drugCode: drugCode
        };

        $('#deleteScreenItem').modal('hide');

        bootbox.confirm({
            message: "Are you sure want to delete this order item ?",
            title: "Please Confirm ?",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-primary'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-default'
                }
            },
            callback: function (result) {

                if (result === true) {

                    $.ajax({
                        url: "controllerProcessScreenOrder/patientScreenListDeleteItem.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $.ajax({
                                    url: "controllerProcessScreenOrder/patientScreenListDetails.jsp",
                                    type: "post",
                                    data: data,
                                    timeout: 3000,
                                    success: function (returnOrderDetailsTableHTML) {

                                        $('#patientScreenDetailsListTable').html(returnOrderDetailsTableHTML);
                                        bootbox.alert({
                                            message: "Drug Order is Deleted Successfully",
                                            title: "Information",
                                            backdrop: true
                                        });
                                        $('#patientScreenDetailsListTable').trigger('contentchanged');

                                    }
                                });

                            } else if (datas.trim() === 'Failed') {

                                bootbox.alert({
                                    message: "Drug Item Delete Failed",
                                    title: "Information",
                                    backdrop: true
                                });

                            }

                        },
                        error: function (err) {
                            alert("Error: Deletion Ajax failed");
                        }

                    });


                } else {
                    console.log("Process Is Canceled");
                }

            }
        });

    });
    // Delete Order Data End


    // Update Order Data 
    $('#deleteScreenItem').on('click', '#updateScreenMButton', function (e) {

        var updateStockQty = $("#deleteScreenStockQuantity").val();
        var updateOrderedQty = $("#deleteScreenOrderedQuantity").val();
        var updateDispensedQuantity = $("#deleteScreenDispenseQuantity").val();
        var updateOrderPrice = row.find('td').eq(10).text();

        var orderTotal = parseFloat(updateOrderPrice) * parseFloat(updateDispensedQuantity);
        var orderTotalFloat = parseFloat(orderTotal).toFixed(2);


        if (updateDispensedQuantity === "" || updateDispensedQuantity === null || parseInt(updateDispensedQuantity) < 1) {

            bootbox.alert("Please Insert The Dispense Quantity Than Is More That 0");

        } else if ((parseInt(updateDispensedQuantity) > parseInt(updateStockQty))) {

            bootbox.alert("The Dispense Quantity Is More Than Stock Quantity. Please Choose Valid Number");
            $("#updateDispensedDrugQuantity").val("");

        } else {

            var updateOrderDrugDispensed = row.find('td').eq(9).text(updateDispensedQuantity);
            var updateOrderTotalPrice = row.find('td').eq(11).text(orderTotalFloat);


            $('#deleteScreenItem').modal('hide');

            bootbox.alert({
                message: "Drug Order Detail is Updated Successfully",
                title: "Information",
                backdrop: true
            });

        }

    });
    // Update Order Data End



    // =====================================================================  Delete Part End  ===================================================================== //





    // =====================================================================  Screening Part Start ===================================================================== //



    $('#patientScreenDetailContent').off('click', '#patientScreenProcessButtonDiv #btnScreenScreening').on('click', '#patientScreenProcessButtonDiv #btnScreenScreening', function (e) {

        var pmino = $("#patientpmino").val();
        var pname = $("#patientName").val();

        var orderNo = $("#patientOrderNo").val();
        var orderDate = $("#patientOrderDate").val();
        var arrivalDate = $("#patientOrderDate").val();
        var totalQuantity = $("#screenTotalOrder").val();
        var totalPrice = $("#screenGrandTotal").val();


        var tableItem;
        tableItem = new Array();

        $('#patientScreenDetailsListTable tr').each(function (row, tr) {
            tableItem[row] = {
                "drugCode": $(tr).find('td:eq(1)').text(),
                "drugDesc": $(tr).find('td:eq(2)').text(),
                "drugOrderedQty": $(tr).find('td:eq(8)').text(),
                "drugDispenseQty": $(tr).find('td:eq(9)').text(),
                "comment": $(tr).find('td:eq(12)').text()
            };
        });

        tableItem.shift();  // first row will be empty - so remove
        tableItem = JSON.stringify(tableItem);


        if (pmino === "" || pmino === null || orderNo === "" || orderNo === null) {

            bootbox.alert("Please choose a patient record to continue");
            $('.nav-tabs a[href="#tab_default_1"]').tab('show');

        } else {

            bootbox.confirm({
                message: "Please make sure all the order are correct. Are you sure that you want to complete screening for this order ?",
                title: "Please Confirm ?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-primary'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-default'
                    }
                },
                callback: function (result) {

                    if (result === true) {

                        var dataAjax = {
                            orderNo: orderNo,
                            orderDate: orderDate,
                            arrivalDate: arrivalDate,
                            totalQuantity: totalQuantity,
                            totalPrice: totalPrice,
                            pmino: pmino,
                            pname: pname,
                            tableItem: tableItem
                        };

                        $.ajax({
                            url: "controllerProcessScreenOrder/patientScreenListScreeningProcess.jsp",
                            type: "post",
                            data: dataAjax,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Screening Complete') {

                                    bootbox.alert({
                                        message: "Screening Order is Successfully",
                                        title: "Information",
                                        backdrop: true
                                    });
                                    resetScreenPage();

                                    $('#patientScreenListContent').html('<div class="loading">Loading</div>');

                                    var process = $('#PIS_ScreenTime').val();
                                    var dateFrom, dateTo;

                                    if (process === "custom") {
                                        dateFrom = $("#OM_DateFrom").val();
                                        dateTo = $("#OM_DateTo").val();
                                    } else {
                                        dateFrom = "";
                                        dateTo = "";
                                    }

                                    var data = {
                                        process: process,
                                        dateFrom: dateFrom,
                                        dateTo: dateTo
                                    };

                                    $.ajax({
                                        type: 'POST',
                                        url: "patientScreenListTable.jsp",
                                        data: data,
                                        success: function (data, textStatus, jqXHR) {
                                            $('#patientScreenListContent').html(data);
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            bootbox.alert('Opps! ' + errorThrown);
                                        },
                                        complete: function (jqXHR, textStatus) {
                                            $('.loading').hide();
                                        }

                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Drug Item Screening Failed",
                                        title: "Information",
                                        backdrop: true
                                    });

                                }

                            },
                            error: function (err) {
                                alert("Error: Screening Ajax failed");
                            }

                        });

                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

        }

    });



    // =====================================================================  Screening Part End ===================================================================== //






    // =====================================================================  Calculation Part Start  ===================================================================== //


    // Grand Total Calculator Start
    !function calculateAllTotal() {

        // Getting Table
        var table = $("#patientScreenDetailsListTable tbody");

        // Setting Variable For Overall Dispense
        var drugPrice, drugDispensedQty, product;
        var drugTotalOrder = 0;
        var grandTotal = 0.0;
        var drugDispensedQtyTotal = 0.0;

        // Calculating Data For Overall
        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');
            drugTotalOrder = drugTotalOrder + 1;
            drugPrice = parseFloat($tds.eq(10).text());
            drugDispensedQty = parseFloat($tds.eq(9).text());
            product = drugDispensedQty * drugPrice;

            if (isNaN(drugTotalOrder) === true || isNaN(drugPrice) === true || isNaN(drugDispensedQty) === true || isNaN(product) === true) {
                //console.log("NaN");
            } else {
                grandTotal = grandTotal + product;
                drugDispensedQtyTotal = drugDispensedQtyTotal + drugDispensedQty;
            }
        });


        // Assigining Value For Overall Dispense
        $("#screenTotalOrder").val(drugTotalOrder);
        $("#screenGrandTotal").val(grandTotal.toFixed(2));

        setTimeout(calculateAllTotal, 800);

    }();
    // Grand Total Calculator End


    // =====================================================================  Calculation Part End  ===================================================================== //




    // =====================================================================  Reset Part Start  ===================================================================== //



    // Clear Button Function Start
    $('#patientScreenDetailContent').on('click', '#patientScreenProcessButtonDiv #btnScreenClear', function (e) {
        resetScreenPage();
    });
    // Clear Button Function End


    // Reset The Page Start
    function resetScreenPage() {

        document.getElementById("patientOrderDetailBasicInfoForm").reset();
        document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
        $("#patientScreenDetailContent #patientScreenAllergyListTableDiv").load("patientScreenListBasicInfo.jsp #patientScreenAllergyListTableDiv");
        $("#patientScreenDetailContent #patientScreenDiagnosisListTableDiv").load("patientScreenListBasicInfo.jsp #patientScreenDiagnosisListTableDiv");
        $("#patientScreenDetailContent #patientScreenDetailsListTableDiv").load("patientScreenListBasicInfo.jsp #patientScreenDetailsListTableDiv");
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');

    }
    // Reset The Page End



    // =====================================================================  Reset Part End ===================================================================== //




    // =================================================================== Show Patient Vital Sign =================================================================== //


    function ANL_getRandomColor() {
        var letters = '0123456789ABCDEF'.split('');
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }


    function ANL_getUniqueColors(t)
    {
        t = parseInt(t);
        if (t < 2) {
//                throw new Error("'t' must be greater than 1.");
            var err = [];
            err.push(ANL_hsvToRgb(360, 200, 100));
            return err;
        }


        // distribute the colors evenly on
        // the hue range (the 'H' in HSV)
        var i = 360 / (t - 1);

        // hold the generated colors
        var r = [];
        var sv = 70;
        for (var x = 0; x < t; x++) {
            // alternate the s, v for more
            // contrast between the colors.
            sv = sv > 90 ? 70 : sv + 10;
            r.push(ANL_hsvToRgb(i * x, sv, sv));
        }
        return r;
    }

    function ANL_hsvToRgb(h, s, v) {
        var r, g, b;
        var i;
        var f, p, q, t;

        // Make sure our arguments stay in-range
        h = Math.max(0, Math.min(360, h));
        s = Math.max(0, Math.min(100, s));
        v = Math.max(0, Math.min(100, v));

        // We accept saturation and value arguments from 0 to 100 because that's
        // how Photoshop represents those values. Internally, however, the
        // saturation and value are calculated from a range of 0 to 1. We make
        // That conversion here.
        s /= 100;
        v /= 100;

        if (s == 0) {
            // Achromatic (grey)
            r = g = b = v;
            return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
        }

        h /= 60; // sector 0 to 5
        i = Math.floor(h);
        f = h - i; // factorial part of h
        p = v * (1 - s);
        q = v * (1 - s * f);
        t = v * (1 - s * (1 - f));

        switch (i) {
            case 0:
                r = v;
                g = t;
                b = p;
                break;

            case 1:
                r = q;
                g = v;
                b = p;
                break;

            case 2:
                r = p;
                g = v;
                b = t;
                break;

            case 3:
                r = p;
                g = q;
                b = v;
                break;

            case 4:
                r = t;
                g = p;
                b = v;
                break;

            default: // case 5:
                r = v;
                g = p;
                b = q;
        }

        return [Math.round(r * 255), Math.round(g * 255), Math.round(b * 255)];
    }


    $('#patientScreenDetailContent').off('click', '#patientShowVitalSign').on('click', '#patientShowVitalSign', function (e) {

        e.preventDefault();

        var patientPMINo = $("#patientpmino").val();

        if (patientPMINo === "" || patientPMINo === null) {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            bootbox.alert("Please Select A Order First");

        } else {

            $('<div class="loading">Loading</div>').appendTo('body');

            var data = {
                patientPMINo: patientPMINo
            };

            $.ajax({
                url: "patientGetAllVitalSigns.jsp",
                type: 'POST',
                data: data,
                timeout: 3000,
                success: function (data) {

                    $("#patientOrderDetailsVitalSignContent").html(data);
                    $('#patientOrderDetailsVitalSignModal').modal('show');
                    $('.loading').hide();

                }
            });



        }

    });


    $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphBP', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

        var dataArr = $(this).closest('td').find('.hidden');
        var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
        $('#ANL_canvas').html("");
        var canvas = $('#ANL_canvas');

        var sitSysArr = [];
        var sitDiasArr = [];
        var sitPulseArr = [];
        var standSysArr = [];
        var standDiasArr = [];
        var standPulseArr = [];
        var supSysArr = [];
        var supDiasArr = [];
        var supPulseArr = [];
        var dateArr = [];
        var lhrColour = [];


        dataArr.each(function () {
            var tempArr = $(this).text().split("|");
            sitSysArr.push(tempArr[3]);
            sitDiasArr.push(tempArr[4]);
            sitPulseArr.push(tempArr[5]);
            standSysArr.push(tempArr[6]);
            standDiasArr.push(tempArr[7]);
            standPulseArr.push(tempArr[8]);
            supSysArr.push(tempArr[9]);
            supDiasArr.push(tempArr[10]);
            supPulseArr.push(tempArr[11]);
            dateArr.push(tempArr[12]);

        });


        var lhrColourTemp = ANL_getUniqueColors(9);

        for (var tempI = 0; tempI < lhrColourTemp.length; tempI++) {
            var strRGBA = "rgba(" + lhrColourTemp[tempI][0] + ", " + lhrColourTemp[tempI][1] + ", " + lhrColourTemp[tempI][2] + ", 0.8)";
            lhrColour.push(strRGBA);
        }


        var dataSitSys = {
            label: "Sit Systol (mmHg)",
            data: sitSysArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[0],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[0],
            pointBackgroundColor: lhrColour[0],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSitDias = {
            label: "Sit Diastol (mmHg)",
            data: sitDiasArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[1],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[1],
            pointBackgroundColor: lhrColour[1],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSitPulse = {
            label: "Sit pulse (bpm)",
            data: sitPulseArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[2],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[2],
            pointBackgroundColor: lhrColour[2],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataStandSys = {
            label: "Stand Systol (mmHg)",
            data: standSysArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[3],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[3],
            pointBackgroundColor: lhrColour[3],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataStandDias = {
            label: "Stand Diastol (mmHg)",
            data: standDiasArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[4],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[4],
            pointBackgroundColor: lhrColour[4],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataStandPulse = {
            label: "Stand pulse (bpm)",
            data: standPulseArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[5],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[5],
            pointBackgroundColor: lhrColour[5],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSupSys = {
            label: "Supine Systol (mmHg)",
            data: supSysArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[6],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[6],
            pointBackgroundColor: lhrColour[6],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSupDias = {
            label: "Supine Diastol (mmHg)",
            data: supDiasArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[7],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[7],
            pointBackgroundColor: lhrColour[7],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var dataSupPulse = {
            label: "Supine pulse (bpm)",
            data: supPulseArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[8],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[8],
            pointBackgroundColor: lhrColour[8],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var chartOptions = {
            plugins: {
                valueOnGraph: false
            },
            legend: {
                display: true,
                position: 'top',
                labels: {
                    boxWidth: 40,
                    fontColor: 'black'
                }
            },
            title: {
                display: true,
                fontSize: 20,
                fontFamily: 'Arial',
                text: chartTitle
            },
            tooltips: {
                mode: 'index',
                intersect: true,
                position: 'nearest'
            },
            responsive: true,
            maintainAspectRatio: true,
            scales: {
                yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1"
                    }]
            }
        };

        var chartData = {
            labels: dateArr,
            datasets: [dataSitSys, dataSitDias, dataSitPulse, dataStandSys, dataStandDias, dataStandPulse, dataSupSys, dataSupDias, dataSupPulse]
        };


        var lineChart = new Chart(canvas, {
            type: 'line',
            data: chartData,
            options: chartOptions
        });

        $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

    });


    $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphLine', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

        var dataArr = $(this).closest('td').find('.hidden');
        var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();

        $('#ANL_canvas').html("");

        var canvas = $('#ANL_canvas');

        var lhrData = [];
        var lhrLabel = [];


        dataArr.each(function () {
            var tempArr = $(this).text().split("|");
            lhrLabel.push(tempArr[4]);
            lhrData.push(tempArr[3]);


        });


        var dataReading = {
            label: chartTitle,
            data: lhrData,
            lineTension: 0.3,
            fill: false,
            borderColor: 'purple',
            backgroundColor: 'transparent',
            pointBorderColor: 'purple',
            pointBackgroundColor: 'purple',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };

        var chartOptions = {
            legend: {
                display: false,
                position: 'top',
                labels: {
                    boxWidth: 40,
                    fontColor: 'black'
                }
            },
            title: {
                display: true,
                fontSize: 20,
                fontFamily: 'Arial',
                text: chartTitle
            },
            tooltips: {
                mode: 'index',
                intersect: true
            },
            responsive: true,
            scales: {
                yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1"
                    }]
            }
        };

        var chartData = {
            labels: lhrLabel,
            datasets: [dataReading]
        };


        var lineChart = new Chart(canvas, {
            type: 'line',
            data: chartData,
            options: chartOptions
        });

        $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

    });


    $('#patientOrderDetailsVitalSignModal').on('click', '#ANL_viewDiv #ANL_btnGraphHtWt', function () {

        Chart.helpers.each(Chart.instances, function (instance) {
            instance.destroy();
        });

        var dataArr = $(this).closest('td').find('.hidden');
        var chartTitle = $(this).closest('td').find('#ANL_chartTitle').text();
        $('#ANL_canvas').html("");
        var canvas = $('#ANL_canvas');

        var heightArr = [];
        var weightArr = [];
        var dateArr = [];
        var lhrColour = [];


        dataArr.each(function () {
            var tempArr = $(this).text().split("|");
            weightArr.push(tempArr[3]);
            heightArr.push(tempArr[4]);
            dateArr.push(tempArr[5]);

        });


        var lhrColourTemp = ANL_getUniqueColors(2);

        for (var tempI = 0; tempI < lhrColourTemp.length; tempI++) {
            var strRGBA = "rgba(" + lhrColourTemp[tempI][0] + ", " + lhrColourTemp[tempI][1] + ", " + lhrColourTemp[tempI][2] + ", 0.8)";
            lhrColour.push(strRGBA);
        }


        var dataWeight = {
            label: "Weight(kg)",
            data: weightArr,
            lineTension: 0.3,
            fill: false,
            borderColor: lhrColour[0],
            backgroundColor: 'transparent',
            pointBorderColor: lhrColour[0],
            pointBackgroundColor: lhrColour[0],
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
        };


        var chartOptions = {
            legend: {
                display: true,
                position: 'top',
                labels: {
                    boxWidth: 40,
                    fontColor: 'black'
                }
            },
            title: {
                display: true,
                fontSize: 20,
                fontFamily: 'Arial',
                text: chartTitle
            },
            tooltips: {
                mode: 'index',
                intersect: true,
                position: 'nearest'
            },
            responsive: true,
            maintainAspectRatio: true,
            scales: {
                yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1"
                    }]
            }
        };

        var chartData = {
            labels: dateArr,
            datasets: [dataWeight]
        };


        var lineChart = new Chart(canvas, {
            type: 'line',
            data: chartData,
            options: chartOptions
        });

        $('#patientOrderDetailsVitalSignGrafhModal').modal('show');

    });



    // =================================================================== Show Patient Vital Sign =================================================================== //



</script>