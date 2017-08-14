<%-- 
    Document   : patientOrderListBasicInfo
    Created on : Feb 7, 2017, 2:44:32 PM
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

<h4>Basic Info</h4>
<form class="form-horizontal" name="patientOrderDetailContentBasicInfoForm" id="patientOrderDetailContentBasicInfoForm">
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
                <label class="col-md-3 control-label" for="textinput">New IC No.</label>
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

<div id="patientAllergyListTableDiv" class="form-group">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left;" id="patientAllergyListTable">
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

<div id="patientDiagnosisListTableDiv" class="form-group">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientDiagnosisListTable">
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
        <button id="patientOrderNewDrugButton" name="patientOrderNewDrugButton" class="btn btn-primary" data-toggle="modal" ><i class="fa fa-plus fa-lg"></i>&nbsp; New Order</button>
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
                    <input id="patientOrderDate" name="patientOrderDate" type="text" readonly placeholder="" class="form-control input-md">
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

<div id="patientOrderDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientOrderDetailsListTable">
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
        <!--    <th>Total Price (RM)</th>-->
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
            <input id="dispenseTotalQuantity" name="dispenseTotalQuantity" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
            <input id="dispenseTotalQuantityChecked" name="dispenseTotalQuantityChecked" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
            <input id="dataMSHPDIORCBLI" name="dataMSHPDIORCBLI" type="hidden" placeholder="" readonly class="form-control input-md">  
            <input id="dataMSHPDIORCDDR" name="dataMSHPDIORCDDR" type="hidden" placeholder="" readonly class="form-control input-md">  
            <input id="dataBILBLI" name="dataBILBLI" type="hidden" placeholder="" readonly class="form-control input-md">  
            <input id="dataBILDDR" name="dataBILDDR" type="hidden" placeholder="" readonly class="form-control input-md">  
            <input id="dataCallingID" name="dataCallingID" type="hidden" placeholder="" readonly class="form-control input-md">  
        </div>

        <div class="col-md-3">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Order</label>
                <div class="col-md-4">
                    <input id="dispenseTotalOrder" name="dispenseTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Order Final</label>
                <div class="col-md-4">
                    <input id="dispenseTotalOrderChecked" name="dispenseTotalOrderChecked" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="dispenseGrandTotal" name="dispenseGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total Final (RM)</label>
                <div class="col-md-4">
                    <input id="dispenseGrandTotalChecked" name="dispenseGrandTotalChecked" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

        </div>

    </form>
</div>

<hr/>

<div style="float: left;" id="patientOrderDispenseButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnClearOrderDetailDispense" name="btnClearOrderDetailDispense" >&nbsp; Back &nbsp;</button>
</div>

<div class="text-right" id="patientOrderDispenseButtonDiv" > 
    <button class="btn btn-primary " type="button" id="btnOrderDispensePrescribe" name="btnOrderDispensePrescribe" > <i class="fa fa-print fa-lg" ></i>&nbsp; Generate Label &nbsp;</button>
    <button class="btn btn-warning " type="button" id="btnOrderDispenseCallPatient" name="btnOrderDispenseCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Call Patient &nbsp;</button>
    <button class="btn btn-danger " type="button" id="btnOrderDispenseDeclineCallPatient" name="btnOrderDispenseDeclineCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Decline Call Patient &nbsp;</button>
    <button class="btn btn-success " type="button" id="btnOrderDispense" name="btnOrderDispense" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Dispense &nbsp;</button>
</div>


<script>


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


    var episodeDate;

    // Move to Order Details Fetch Details Start
    $('#patientOrderListContent').off('click', '#patientOrderListTable #moveToOrderDetailsTButton').on('click', '#patientOrderListTable #moveToOrderDetailsTButton', function (e) {

        $('<div class="loading">Loading</div>').appendTo('body');

        // Disable And Enable Button
        document.getElementById("btnOrderDispensePrescribe").disabled = false;
        document.getElementById("btnOrderDispense").disabled = true;
        document.getElementById("btnOrderDispenseCallPatient").disabled = true;
        document.getElementById("btnOrderDispenseDeclineCallPatient").disabled = true;

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataPatientOrderListhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //Assign Array into seprated val
        var patientpmino = arrayData[1];
        var patientName = arrayData[15];
        var patientnic = arrayData[16];
        var patientGender = arrayData[21];
        var patientBdate = arrayData[17];
        var patientBtype = arrayData[22];
        var patientOrderNo = arrayData[0];
        var patientOrderDate = arrayData[5];
        var patientOrderLocationCode = arrayData[2];
        var patientOrderEpisodeDate = arrayData[3];
        var patientOrderLocationCodeName = arrayData[23];


        var pmiNo = patientpmino;
        var orderNo = patientOrderNo;
        var orderDate = patientOrderDate;
        episodeDate = patientOrderEpisodeDate;

        var data = {
            pmiNo: pmiNo,
            orderNo: orderNo,
            orderDate: orderDate,
            episodeDate:episodeDate
        };

        $.ajax({
            url: "patientOrderListDetailDispenseEHRCentralGetMSH.jsp",
            type: "post",
            timeout: 3000,
            data: data,
            success: function (returnDataMSHFull) {


                var arrayReturnDataMSHFull = String(returnDataMSHFull.trim()).split("#");
                var MSHFORBLI = arrayReturnDataMSHFull[0];
                var MSHFORDDR = arrayReturnDataMSHFull[1];

                $.ajax({
                    url: "patientOrderListDetailDispenseEHRCentralGetPDIFinal.jsp",
                    type: "post",
                    timeout: 3000,
                    data: data,
                    success: function (returnDataPDIFull) {

                        var PDIFORALL = returnDataPDIFull.trim();

                        $.ajax({
                            url: "patientOrderListDetailDispenseEHRCentralGetORC.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnDataORCFull) {

                                var arrayReturnDataORCFull = String(returnDataORCFull.trim()).split("#");
                                var ORCFORBLI = arrayReturnDataORCFull[0];
                                var ORCFORDDR = arrayReturnDataORCFull[1];

                                //Set value to the Second Tab 
                                $("#patientpmino").val(patientpmino);
                                $("#patientName").val(patientName);
                                $("#patientnic").val(patientnic);
                                $("#patientGender").val(patientGender);
                                $("#patientBdate").val(patientBdate);
                                $("#patientBtype").val(patientBtype);
                                $("#patientOrderNo").val(patientOrderNo);
                                $("#patientOrderDate").val(patientOrderDate);
                                $("#patientOrderLocationCode").val(patientOrderLocationCodeName);
                                $("#dataMSHPDIORCBLI").val(MSHFORBLI + "\n" + PDIFORALL + "\n" + ORCFORBLI + "\n");
                                $("#dataMSHPDIORCDDR").val(MSHFORDDR + "\n" + PDIFORALL + "\n" + ORCFORDDR + "\n");

                                console.log($("#dataMSHPDIORCBLI").val());
                                console.log($("#dataMSHPDIORCDDR").val());

                                loadAllergyDiagnosisOrder(patientOrderNo, patientpmino);

                            }
                        });

                    }
                });

            }
        });


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
            url: "patientOrderListAllergyTable.jsp",
            type: "post",
            data: dataAllergy,
            timeout: 3000,
            success: function (returnAllergyTableHTML) {

                $('#patientAllergyListTable').html(returnAllergyTableHTML);

                $.ajax({
                    url: "patientOrderListDiagnosisTable.jsp",
                    type: "post",
                    data: dataDiagnosis,
                    timeout: 3000,
                    success: function (returnDiagnosisTableHTML) {

                        $('#patientDiagnosisListTable').html(returnDiagnosisTableHTML);
                        $('#patientDiagnosisListTable').DataTable();

                        $.ajax({
                            url: "patientOrderListDetailsNew.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {
                                //console.log(returnOrderDetailsTableHTML);
                                $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#patientOrderDetailsListTable').trigger('contentchanged');
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
    $(document).on('contentchanged', '#patientOrderDetailsListTableDiv', function () {

        $('#patientOrderDetailsListTable').DataTable().destroy();
        $('#patientDiagnosisListTable').DataTable().destroy();
        $('#patientAllergyListTable').DataTable().destroy();

        // do something after the div content has changed
        $('#patientOrderDetailsListTable').DataTable({
            "paging": true,
            "searching": false,
            "info": false,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Order Available To Display"
            }
        });

        // do something after the div content has changed
        $('#patientDiagnosisListTable').DataTable({
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
        $('#patientAllergyListTable').DataTable({
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



//======================================================================================================================================================================================//





//------------------------------------------------------------------------------  Add Part Start  -------------------------------------------------------------------------------------//



    // Getting Order Id And Date Start
    $('#patientOrderDetailContent').off('click', '#patientOrderNewDrugButton').on('click', '#patientOrderNewDrugButton', function (e) {

        e.preventDefault();

        var patientOrderNo = $("#patientOrderNo").val();
        var patientOrderDate = $("#patientOrderDate").val();

        if (patientOrderNo === "" || patientOrderNo === null) {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            bootbox.alert("Please Select A Order First");

        } else {

            $('#addOrderDrug').modal('show');

            console.log(patientOrderDate);
            console.log(patientOrderNo);

            $("#orderDrugDetailsID").val(patientOrderNo);
            $("#orderDrugDetailsDate").val(patientOrderDate);

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
                    url: "patientOrderListNewOrderSearch.jsp", // call the jsp file ajax/auto-autocomplete.php
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
            url: 'patientOrderListNewOrderSearchResult.jsp',
            data: {'id': id},
            success: function (reply_data) {
                console.log(reply_data);
                var array_data = String(reply_data).split("|");
                var dtoCode = array_data[0];
                var dtoGnr = array_data[1];
                var dtoQty = array_data[2];
                var dtoPackage = array_data[8];
                var dtoRoute = array_data[3];
                var dtoForm = array_data[4];
                var dtoStrength = array_data[5];
                var dtoInstruction = array_data[6];
                var dtoCaution = array_data[7];

                console.log(dtoCode);

                $('#orderDrugDisplayDrugCode').val(dtoCode);
                $('#orderDrugDisplayTradeName').val(dtoGnr);
                $('#orderDrugDisplayStockQuantity').val(dtoQty);
                $('#orderDrugDisplayForm').val(dtoForm);
                $('#orderDrugDisplayRoute').val(dtoRoute);
                $('#orderDrugDisplayStrength').val(dtoStrength);
                $('#orderDrugDisplayInstruction').val(dtoInstruction);
                $('#orderDrugDisplayCautionary').val(dtoCaution);

                $('.loading').hide();

            }
        });
    });
    //End js Search Select drug


    // Add Order Start
    $('#orderDrugAddButton').on('click', function (e) {

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

        if (drugTradeName === "" || drugTradeName === null) {
            bootbox.alert("Please Search The Drug Before Continue");
        } else if (drugQty === "" || drugQty === null) {
            bootbox.alert("Please Insert Drug Order Quantity");
        } else if (drugDose === "" || drugDose === null) {
            bootbox.alert("Please Insert Drug Order Dose");
        } else if (drugDoseT === "No Dose" || drugDoseT === null) {
            bootbox.alert("Please Select Drug Dose Type");
        } else if (drugFrequency === "No Frequency" || drugFrequency === null) {
            bootbox.alert("Please Select Drug Frequency");
        } else if (drugDuration === "" || drugDuration === null) {
            bootbox.alert("Please Insert Drug Duration");
        } else if (drugDurationT === "No Duration" || drugDurationT === null) {
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
                drugDurationT: drugDurationT
            };

            console.log(datas);

            $.ajax({
                url: "patientOrderListNewOrderInsert.jsp",
                type: "post",
                data: datas,
                timeout: 10000,
                success: function (datas) {

                    if (datas.trim() === 'Success') {

                        $('#addOrderDrug').modal('hide');
                        bootbox.alert({
                            message: "Order is Added Successful",
                            title: "Process Result",
                            backdrop: true
                        });
                        resetAddOrder();

                        $.ajax({
                            url: "patientOrderListDetailsNew.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {

                                $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#patientOrderDetailsListTable').trigger('contentchanged');

                                resetButton();

                            }
                        });

                    } else if (datas.trim() === 'Duplicate') {

                        bootbox.alert({
                            message: "Order Product Code Duplication Detected. Please Order diffrent drug as the data already there",
                            title: "Process Result",
                            backdrop: true
                        });

                        resetButton();

                    } else if (datas.trim() === 'Failed') {

                        bootbox.alert({
                            message: "Order Add Failed",
                            title: "Process Result",
                            backdrop: true
                        });

                        $('#addOrderDrug').modal('hide');
                        resetAddOrder();
                        resetButton();

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
    $('#orderDrugResetButton').on('click', function (e) {
        resetAddOrder();
    });
    // Reset Order Button End


    // Reset Order Function Start
    function resetAddOrder() {
        document.getElementById("addDrugOrderForm").reset();
        document.getElementById("orderDrugSearchInputDisplayResult").innerHTML = "";
    }
    // Reset Order Function End



//================================================================================  Add Part End  =====================================================================================//





//-------------------------------------------------------------------------  Update And Delete Part Start  ----------------------------------------------------------------------------//


    // global variable declaration
    var row;

    // Get Data For Delete And Update To Load On the Modal
    $('#patientOrderDetailContent').off('click', '#patientOrderDetailsListTable #updateOrderDetailsTButton').on('click', '#patientOrderDetailsListTable #updateOrderDetailsTButton', function (e) {

        e.preventDefault();

        row = $(this).closest("tr");
        var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
        var arrayData = rowData.split("|");
        console.log(row);
        console.log(arrayData);

        var updateOrderNo = arrayData[0];
        var updateOrderDrugCode = arrayData[1];
        var updateOrderDrugOrdered = parseInt(arrayData[11]);
        var updateOrderDrugSupplied = arrayData[12];
        var updateOrderDrugStockQty = arrayData[18];
        var updateOrderDrugDispensed = row.find('td').eq(11).text();
        var updateOrderDrugStatus = row.find('td').eq(14).text();

        $("#updateOrderNo").val(updateOrderNo);
        $("#updateStockQuantity").val(updateOrderDrugStockQty);
        $("#updateDrugCode").val(updateOrderDrugCode);
        $("#updateOrderedDrugQuantity").val(updateOrderDrugOrdered);
        $("#updateSuppliedDrugQuantity").val(updateOrderDrugSupplied);
        $("#updatestatus").val(updateOrderDrugStatus);

        if (updateOrderDrugDispensed === "0") {
            $("#updateDispensedDrugQuantity").val("");
        } else {
            $("#updateDispensedDrugQuantity").val(updateOrderDrugDispensed);
        }

    });
    // Get Data For Delete And Update To Load On the Modal End

    // Update Order Data
    $('#updateOrder').off('click', '#updateOrderMButton').on('click', '#updateOrderMButton', function (e) {

        e.preventDefault();

        var validDispense = document.getElementById("updateDispensedDrugQuantity");


        var updateStockQty = $("#updateStockQuantity").val();
        var updateOrderedQty = $("#updateOrderedDrugQuantity").val();
        var updateSuppliedQty = $("#updateSuppliedDrugQuantity").val();
        var updateDispensedQuantity = $("#updateDispensedDrugQuantity").val();
        var updateOrderStatusStatic = $("#updatestatus").val();
        var updateOrderPrice = row.find('td').eq(12).text();


        var orderTotal = parseFloat(updateOrderPrice) * parseFloat(updateDispensedQuantity);
        var orderTotalFloat = parseFloat(orderTotal).toFixed(2);



        if (updateDispensedQuantity === "" || updateDispensedQuantity === null || parseInt(updateDispensedQuantity) < 1) {
            bootbox.alert("Please Insert The Dispense Quantity Than Is More That 0 !!!");
        } else if (updateOrderStatusStatic === "New" || updateOrderStatusStatic === null) {
            bootbox.alert("Please Select The Order Status");
        } else if (validDispense.checkValidity() === false) {
            bootbox.alert("The Dispense Quantity Should Not Be Decimal Number. Please Choose Valid Number !!!");
            $("#updateDispensedDrugQuantity").val("");
        } else if ((parseInt(updateDispensedQuantity) > parseInt(updateStockQty))) {
            bootbox.alert("The Dispense Quantity Is More Than Stock Quantity. Please Choose Valid Number !!!");
            $("#updateDispensedDrugQuantity").val("");
        } else {

            var updateOrderDrugDispensed = row.find('td').eq(11).text(updateDispensedQuantity);
            var updateOrderTotalPrice = row.find('td').eq(13).text(orderTotalFloat);
            var updateOrderDrugStatus = row.find('td').eq(14).text(updateOrderStatusStatic);


            $('#updateOrder').modal('hide');

            bootbox.alert({
                message: "Drug Order Detail is Updated Successfully",
                title: "Process Result",
                backdrop: true
            });

            resetButton();

        }
    });
    // Update Order Data End

    // Delete Order Data 
    $('#updateOrder').on('click', '#deleteOrderMButton', function (e) {

        var orderNo = $("#updateOrderNo").val();
        var drugCode = $("#updateDrugCode").val();

        var data = {
            orderNo: orderNo,
            drugCode: drugCode
        };

        console.log(data);

        $('#updateOrder').modal('hide');

        bootbox.confirm({
            message: "Are you sure want to delete this order ?",
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

                    $.ajax({
                        url: "patientOrderListNewOrderDelete.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000, // 10 seconds
                        success: function (datas) {

                            if (datas.trim() === 'Success') {

                                $.ajax({
                                    url: "patientOrderListDetailsNew.jsp",
                                    type: "post",
                                    data: data,
                                    timeout: 3000,
                                    success: function (returnOrderDetailsTableHTML) {

                                        $('#patientOrderDetailsListTable').html(returnOrderDetailsTableHTML);

                                        bootbox.alert({
                                            message: "Drug Order is Deleted Successfully",
                                            title: "Process Result",
                                            backdrop: true
                                        });

                                        $('#patientOrderDetailsListTable').trigger('contentchanged');

                                        resetButton();

                                    }
                                });

                            } else if (datas.trim() === 'Failed') {

                                bootbox.alert({
                                    message: "Drug Order Delete Failed",
                                    title: "Process Result",
                                    backdrop: true
                                });

                                resetButton();

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
    // Delete Order Data End


//============================================================================  Update And Delete Part End  ===========================================================================//





//-------------------------------------------------------------------------------  Dispense Part Start  -------------------------------------------------------------------------------//


    // Get date function End
    function getDate() {
        var d = new Date();
        var dates = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
        return dates;
    }
    // Get date function End

    // Dispense Order Data
    $('#patientOrderDetailContent').off('click', '#patientOrderDispenseButtonDiv #btnOrderDispense').on('click', '#patientOrderDispenseButtonDiv #btnOrderDispense', function (e) {

        e.preventDefault();

        var table = $("#patientOrderDetailsListTable tbody");

        var orderNo, drugCode, drugDesc, drugStrength, drugFrequency, drugDuration, drugDose,
                drugStockQty, drugOrderedQty, drugSuppliedQty, drugDispensedQty, drugPrice, drugTotalPrice, drugStatus, drugChecked;

        var cars = [];

        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            // Get The Data
            drugChecked = $(this).find("#drugDispenseChecked").is(':checked');
            orderNo = $tds.eq(1).text();
            drugCode = $tds.eq(2).text();
            drugDesc = $tds.eq(3).text();
            drugStrength = $tds.eq(4).text();
            drugFrequency = $tds.eq(5).text();
            drugDuration = $tds.eq(6).text();
            drugDose = $tds.eq(7).text();
            drugStockQty = $tds.eq(8).text();
            drugOrderedQty = $tds.eq(9).text();
            drugSuppliedQty = $tds.eq(10).text();
            drugDispensedQty = $tds.eq(11).text();
            drugPrice = $tds.eq(12).text();
            drugTotalPrice = $tds.eq(13).text();
            drugStatus = $tds.eq(14).text();

            cars.push(drugChecked);

        });
        var checkedDispense = cars.indexOf(true);
        console.log(cars);
        console.log(checkedDispense);

        if (checkedDispense === -1) {
            bootbox.alert("Please Select A Order To Be Dispense");
        } else {

            bootbox.confirm({
                message: "Are you sure that you want to dispense this order ?",
                title: "Dispense Item ?",
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

                        fullDispense();

                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });

        }

    });
    // Dispense Order Data End


    var ehrCentralBillBLI;
    var ehrCentralBillDDR;

    // Dispense Order Function Start
    function fullDispense() {

        var table = $("#patientOrderDetailsListTable tbody");

        var orderNo, drugCode, drugDesc, drugStrength, drugFrequency, drugDuration, drugDose,
                drugStockQty, drugOrderedQty, drugSuppliedQty, drugDispensedQty, drugPrice, drugTotalPrice, drugStatus, drugChecked;

        var orderDate, locationCode, arrivalDate, pmino, pname, dispenseFarMasterQuantity, dispenseFarMasterTotal, dispenseFarMasterQuantityChecked, dispenseFarMasterTotalChecked;

        var drugATCCode, drugATCDesc, drugMDCDesc, drugMDCStrength, drugMDCFromMCode, drugMDCFromRCode, drugMDCFromDesc, drugMDCRouteMCode, drugMDCRouteRCode, drugMDCRouteDesc,
                drugMDCFrequencyMCode, drugMDCFrequencyRCode, drugMDCFrequencyDesc, drugMDCFrequencyUnitCode, drugMDCDosage, drugMDCOUM,
                drugMDCDuration, drugMDCDispenseLocation, drugMDCDispenseNotes, drugMDCDispenseProvider, drugMDCIndicator;

        var dateBill = getDate();
        var userIDBill = $("#dataPatientOrderListUserIDhidden").val();

        ehrCentralBillBLI = "";
        ehrCentralBillDDR = "";

        pmino = $("#patientpmino").val();
        pname = $("#patientName").val();
        orderDate = $("#patientOrderDate").val();
        locationCode = $("#patientOrderLocationCode").val();
        arrivalDate = $("#patientOrderDate").val();
        dispenseFarMasterQuantity = $("#dispenseTotalQuantity").val();
        dispenseFarMasterTotal = $("#dispenseGrandTotal").val();
        dispenseFarMasterQuantityChecked = $("#dispenseTotalQuantityChecked").val();
        dispenseFarMasterTotalChecked = $("#dispenseGrandTotalChecked").val();


        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            // Get The Data
            drugChecked = $(this).find("#drugDispenseChecked").is(':checked');
            orderNo = $tds.eq(1).text();
            drugCode = $tds.eq(2).text();
            drugDesc = $tds.eq(3).text();
            drugStrength = $tds.eq(4).text();
            drugFrequency = $tds.eq(5).text();
            drugDuration = $tds.eq(6).text();
            drugDose = $tds.eq(7).text();
            drugStockQty = $tds.eq(8).text();
            drugOrderedQty = $tds.eq(9).text();
            drugSuppliedQty = $tds.eq(10).text();
            drugDispensedQty = $tds.eq(11).text();
            drugPrice = $tds.eq(12).text();
            drugTotalPrice = $tds.eq(13).text();
            drugStatus = $tds.eq(14).text();


            drugATCCode = $tds.eq(15).text();
            drugATCDesc = $tds.eq(16).text();
            drugMDCDesc = $tds.eq(17).text();
            drugMDCStrength = $tds.eq(18).text();
            drugMDCFromMCode = $tds.eq(19).text();
            drugMDCFromRCode = $tds.eq(20).text();
            drugMDCFromDesc = $tds.eq(21).text();
            drugMDCRouteMCode = $tds.eq(22).text();
            drugMDCRouteRCode = $tds.eq(23).text();
            drugMDCRouteDesc = $tds.eq(24).text();
            drugMDCFrequencyMCode = $tds.eq(25).text();
            drugMDCFrequencyRCode = $tds.eq(26).text();
            drugMDCFrequencyDesc = $tds.eq(27).text();
            drugMDCFrequencyUnitCode = "-";
            drugMDCDosage = $tds.eq(28).text();
            drugMDCOUM = "-^-^-";
            drugMDCDuration = $tds.eq(29).text();
            drugMDCDispenseLocation = "-^-^-";
            drugMDCDispenseNotes = "-";
            drugMDCDispenseProvider = "-^-^-";
            drugMDCIndicator = "-";


            if (drugChecked === true && drugDispensedQty !== "0") {

                //                              0           1       2                3               4                  5                   6                    7                   8     
                var dataOneRowBLI = "BLI|T^" + dateBill + "|CH|" + pmino + "|" + drugCode + "|" + drugDesc + "|" + drugPrice + "|" + drugDispensedQty + "|" + userIDBill + "|" + dateBill + "<cr>\n";


                //                    0                         1                                       2                               3                                                       4    
                var dataOneRowDDR = "DDR|" + drugATCCode + "^" + drugATCDesc + "^ATC|" + drugCode + "^" + drugMDCDesc + "^MDC|" + drugMDCStrength + "|" + drugMDCFromMCode + "^" + drugMDCFromRCode + "^" + drugMDCFromDesc +
                        //                                  5                                                                                   6
                        "|" + drugMDCRouteMCode + "^" + drugMDCRouteRCode + "^" + drugMDCRouteDesc + "|" + drugMDCFrequencyMCode + "^" + drugMDCFrequencyRCode + "^" + drugMDCFrequencyDesc + "|" +
                        //          7                          8                 9                   10        
                        drugMDCFrequencyUnitCode + "|" + drugMDCDosage + "|" + drugMDCOUM + "|" + drugMDCDuration +
                        //          11                          12                              13                      14                      15        
                        "|" + drugDispensedQty + "|" + drugMDCDispenseLocation + "|" + drugMDCDispenseNotes + "|" + getDate() + "|" + drugMDCDispenseProvider + "|" +
                        //  16                  17
                        orderDate + "|" + drugMDCIndicator + "<cr>\n";


                ehrCentralBillBLI = ehrCentralBillBLI + dataOneRowBLI;
                ehrCentralBillDDR = ehrCentralBillDDR + dataOneRowDDR;


                console.log("Ok : " + drugCode);

                if (drugStatus === "New") {

                    if (parseInt(drugDispensedQty) >= parseInt(drugOrderedQty)) {
                        drugStatus = "4";
                    } else if (parseInt(drugDispensedQty) < parseInt(drugOrderedQty)) {
                        drugStatus = "1";
                    }

                } else if (drugStatus === "Partial") {

                    if ((parseInt(drugDispensedQty) + parseInt(drugSuppliedQty)) === parseInt(drugOrderedQty)) {
                        drugStatus = "4";
                    } else if ((parseInt(drugDispensedQty) + parseInt(drugSuppliedQty)) < parseInt(drugOrderedQty)) {
                        drugStatus = "1";
                    }

                } else if (drugStatus === "Complete Partial") {
                    drugStatus = "2";
                } else if (drugStatus === "Full Complete") {
                    drugStatus = "3";
                } else if (drugStatus === "Full") {
                    drugStatus = "4";
                }

                var updatedQtySupplied = String(parseInt(drugDispensedQty) + parseInt(drugSuppliedQty));
                var updateQtyStock = parseInt(drugStockQty) - parseInt(drugDispensedQty);


                var dataAjax = {
                    orderNo: orderNo,
                    drugCode: drugCode,
                    drugDesc: drugDesc,
                    drugPrice: drugPrice,
                    drugStockQty: updateQtyStock,
                    drugOrderedQty: drugOrderedQty,
                    drugSuppliedQty: updatedQtySupplied,
                    drugDispensedQty: drugDispensedQty,
                    drugStatus: drugStatus,
                    orderDate: orderDate,
                    locationCode: locationCode,
                    arrivalDate: arrivalDate,
                    pmino: pmino,
                    pname: pname,
                    drugTotalPrice: drugTotalPrice,
                    dispenseDrugMasterQuantity: dispenseFarMasterQuantity,
                    dispenseDrugMasterTotal: dispenseFarMasterTotal,
                    dispenseDrugMasterQuantityChecked: dispenseFarMasterQuantityChecked,
                    dispenseDrugMasterTotalChecked: dispenseFarMasterTotalChecked,
                    drugChecked: drugChecked
                };

                console.log(dataAjax);

                $.ajax({
                    url: "patientOrderListDetailsDispenceOverall.jsp",
                    type: "post",
                    data: dataAjax,
                    timeout: 3000,
                    success: function (datas) {
                        console.log(datas.trim());

                    },
                    error: function (err) {
                        console.log("Error Dispense!" + err);
                    }
                });

            } else {

                console.log("Not Ok : " + drugCode);

            }

        });


        $("#dataBILBLI").val(ehrCentralBillBLI);
        $("#dataBILDDR").val(ehrCentralBillDDR);

        var EHRFirstHeaderBLI = $("#dataMSHPDIORCBLI").val();
        var EHRSecondHeaderBLI = $("#dataBILBLI").val();

        var EHRFirstHeaderDDR = $("#dataMSHPDIORCDDR").val();
        var EHRSecondHeaderDDR = $("#dataBILDDR").val();

        var callingNo = $("#dataCallingID").val();

        var dataEHRcentralFull = {
            pmino: pmino,
            EHRFirstHeaderBLI: EHRFirstHeaderBLI,
            EHRFirstHeaderDDR: EHRFirstHeaderDDR,
            EHRSecondHeaderBLI: EHRSecondHeaderBLI,
            EHRSecondHeaderDDR: EHRSecondHeaderDDR,
            callingNo: callingNo
        };

        $.ajax({
            url: "patientOrderListDetailsDispenceEHRCentralInsertCallingDelete.jsp",
            type: "post",
            data: dataEHRcentralFull,
            timeout: 3000,
            success: function (datas) {
                console.log(datas.trim());

                resetDispense();

            },
            error: function (err) {
                console.log("Error Dispense!" + err);
            }
        });


    }
    // Dispense Order Function End


    // Grand Total Calculator Start
    !function calculateAllTotal() {

        // Getting Table
        var table = $("#patientOrderDetailsListTable tbody");

        // Setting Variable For Overall Dispense
        var drugPrice, drugDispensedQty, product;
        var drugTotalOrder = 0;
        var grandTotal = 0.0;
        var drugDispensedQtyTotal = 0.0;

        // Setting Variable For Selected Dispense
        var drugPriceChecked, drugDispensedQtyChecked, productChecked;
        var drugTotalOrderChecked = 0;
        var grandTotalDispenseChecked = 0.0;
        var drugDispensedQtyTotalChecked = 0.0;


        // Calculating Data For Overall Dispense
        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');
            drugTotalOrder = drugTotalOrder + 1;
            drugPrice = parseFloat($tds.eq(12).text());
            drugDispensedQty = parseFloat($tds.eq(11).text());
            product = drugDispensedQty * drugPrice;

            if (isNaN(drugTotalOrder) === true || isNaN(drugPrice) === true || isNaN(drugDispensedQty) === true || isNaN(product) === true) {
                console.log("NaN");
            } else {
                grandTotal = grandTotal + product;
                drugDispensedQtyTotal = drugDispensedQtyTotal + drugDispensedQty;
            }
        });

        // Calculating Data For Selected Dispense
        table.find('tr').each(function (i) {

            var drugChecked = $(this).find("#drugDispenseChecked").is(':checked');

            if (drugChecked === true) {

                var $tds = $(this).find('td');
                drugTotalOrderChecked = drugTotalOrderChecked + 1;
                drugPriceChecked = parseFloat($tds.eq(12).text());
                drugDispensedQtyChecked = parseFloat($tds.eq(11).text());
                productChecked = drugDispensedQtyChecked * drugPriceChecked;

                if (isNaN(drugTotalOrderChecked) === true || isNaN(drugPriceChecked) === true || isNaN(drugDispensedQtyChecked) === true || isNaN(productChecked) === true) {
                    console.log("NaN Checked");
                } else {
                    grandTotalDispenseChecked = grandTotalDispenseChecked + productChecked;
                    drugDispensedQtyTotalChecked = drugDispensedQtyTotalChecked + drugDispensedQtyChecked;
                }
            }
        });


        // Assigining Value For Overall Dispense
        $("#dispenseTotalOrder").val(drugTotalOrder);
        $("#dispenseTotalQuantity").val(drugDispensedQtyTotal);
        $("#dispenseGrandTotal").val(grandTotal.toFixed(2));

        // Assigining Value For Selected Dispense
        $("#dispenseTotalOrderChecked").val(drugTotalOrderChecked);
        $("#dispenseTotalQuantityChecked").val(drugDispensedQtyTotalChecked);
        $("#dispenseGrandTotalChecked").val(grandTotalDispenseChecked.toFixed(2));

        setTimeout(calculateAllTotal, 800);

    }();
    // Grand Total Calculator End


    //===============================================================================  Dispense Part End  ================================================================================//






    //------------------------------------------------------------------------------  Prescribe Part Start  -------------------------------------------------------------------------------//


    // Priscribe Part Start
    // Priscribe Button Start
    $('#patientOrderDetailContent').off('click', '#patientOrderDispenseButtonDiv #btnOrderDispensePrescribe').on('click', '#patientOrderDispenseButtonDiv #btnOrderDispensePrescribe', function (e) {


        var table = $("#patientOrderDetailsListTable tbody");

        var orderNo = $("#patientOrderNo").val();
        var patientPMI = $("#patientpmino").val();
        var patientName = $("#patientName").val();

        var drugChecked;
        var drugStock;
        var drugOrderNo, drugCode, prescribeLongString = "";
        var checked = [];
        var stock = [];

        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            drugChecked = $(this).find("#drugDispenseChecked").is(':checked');
            drugStock = $tds.eq(8).text();

            if (drugChecked === true) {

                drugOrderNo = $tds.eq(1).text();
                drugCode = $tds.eq(2).text();

                prescribeLongString = prescribeLongString + drugOrderNo + "|" + drugCode + "#";
                stock.push(drugStock);

            }

            checked.push(drugChecked);

        });

        var checkedDispense = checked.indexOf(true);
        var stockDispense = stock.indexOf("0");

        console.log(checked);
        console.log(checkedDispense);
        console.log(stock);
        console.log(stockDispense);
        console.log(prescribeLongString);

        if (checkedDispense === -1) {

            bootbox.alert("Please At least Select A Order To Generate Label");

        } else {

            if (stockDispense === -1) {

                bootbox.confirm({
                    message: "Are you sure that you want to Generate Label For this Drugs ?",
                    title: "Generate Label ?",
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

                            $('#myModal').modal('show');

                            var data = {
                                orderNo: orderNo,
                                longString: prescribeLongString,
                                patientPMI: patientPMI,
                                patientName: patientName
                            };

                            $.ajax({
                                url: "patientOrderListDetailsPrescribeResetStatus.jsp",
                                type: "post",
                                data: data,
                                timeout: 5000,
                                success: function (datas) {

                                    console.log(datas.trim());

                                    $.ajax({
                                        url: "patientOrderListDetailsPrescribeUpdateStatus.jsp",
                                        type: "post",
                                        data: data,
                                        timeout: 6000,
                                        success: function (datas) {

                                            $.ajax({
                                                type: "post",
                                                url: "patientOrderListDetailsPrescribePDF.jsp",
                                                timeout: 5000,
                                                data: data,
                                                success: function (result) {

                                                    var labelStringDetails = result.trim();

                                                    $("#patientOrderDetailsListTable").find("input,button,textarea,select").attr("disabled", "disabled");
                                                    document.getElementById("btnOrderDispenseCallPatient").disabled = false;
                                                    document.getElementById("btnOrderDispensePrescribe").disabled = true;

                                                    $('#myModal').modal('hide');

                                                    var contextPath = '<%=request.getContextPath()%>';

                                                    var url = contextPath + "/generatePharmacyLabel?";
                                                    url += "&labelData=" + labelStringDetails;

                                                    var win = window.open(url, '_blank');
                                                    win.focus();

                                                    bootbox.alert({
                                                        message: "Please Call The Patient Before Dispensing The Drug !!!",
                                                        title: "Information",
                                                        backdrop: true
                                                    });

                                                },
                                                error: function (err) {

                                                }
                                            });

                                        }
                                    });

                                }
                            });


                        } else {

                            console.log("Process Is Canceled");

                        }

                    }
                });

            } else {

                bootbox.alert("Please check the stock quantity of drug that is going to be dispensed! Some of the drug are not available.");

            }

        }

    });
    // Priscribe Button End
    // Prescibe Part End


    //==============================================================================  Prescribe Part End  ================================================================================//





    //------------------------------------------------------------------------------  Call patient Part Start  -------------------------------------------------------------------------------//


    // Call or Decline Part Start
    // 
    // 
    // Call Button Start
    $('#patientOrderDetailContent').off('click', '#patientOrderDispenseButtonDiv #btnOrderDispenseCallPatient').on('click', '#patientOrderDispenseButtonDiv #btnOrderDispenseCallPatient', function (e) {


        var patientOrderNo = $("#patientOrderNo").val();


        if (patientOrderNo === "" || patientOrderNo === null) {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            bootbox.alert("Please Select A Order First");

        } else {

            var patientOrderLocationCodeFull = $("#patientOrderLocationCodeFull").val();
            var patientpmino = $("#patientpmino").val();
            var patientName = $("#patientName").val();
            var dataCallPatientFull = patientOrderLocationCodeFull + "|" + patientpmino + "|" + patientName + "|" + patientOrderNo;


            bootbox.confirm({
                message: "Are You Sure ?",
                title: "Call Patient ?",
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
                            dataCallPatientFull: dataCallPatientFull
                        };

                        $.ajax({
                            url: "patientOrderListDetailsDispenseCallPatientInsert.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (result) {

                                var insertResult = result.trim();

                                console.log(insertResult);

                                var arrayData = insertResult.split("|");

                                var message = arrayData[0];
                                var callingNo = arrayData[1];

                                $("#dataCallingID").val(callingNo);

                                if (message === 'Success') {

                                    bootbox.alert({
                                        message: "Patient Call Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                }

                                document.getElementById("btnOrderDispense").disabled = false;
                                document.getElementById("btnOrderDispenseDeclineCallPatient").disabled = false;
                                document.getElementById("btnOrderDispenseCallPatient").disabled = true;

                            }
                        });


                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });


        }


    });
    // Call Button End




    // Call Button Start
    $('#patientOrderDetailContent').off('click', '#patientOrderDispenseButtonDiv #btnOrderDispenseDeclineCallPatient').on('click', '#patientOrderDispenseButtonDiv #btnOrderDispenseDeclineCallPatient', function (e) {


        var patientOrderNo = $("#patientOrderNo").val();


        if (patientOrderNo === "" || patientOrderNo === null) {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            bootbox.alert("Please Select A Order First");

        } else {

            var callDeclineNo = $("#dataCallingID").val();


            bootbox.confirm({
                message: "Are You Sure ?",
                title: "Decline Call Patient ?",
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
                            callDeclineNo: callDeclineNo
                        };

                        $.ajax({
                            url: "patientOrderListDetailsDispenseCallPatientDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (result) {

                                var insertResult = result.trim();

                                console.log(insertResult);

                                if (insertResult === 'Success') {

                                    bootbox.alert({
                                        message: "Decline Call Patient Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                }

                                document.getElementById("btnOrderDispense").disabled = true;
                                document.getElementById("btnOrderDispenseDeclineCallPatient").disabled = true;
                                document.getElementById("btnOrderDispenseCallPatient").disabled = false;

                            }
                        });


                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });


        }


    });
    // Call Button End
    // 
    // 
    // Call or Decline Part End


    //==============================================================================  Call Patient Part End  ================================================================================//






    //-------------------------------------------------------------------------------  Reset Part Start  --------------------------------------------------------------------------------//



    // Dispense Loading Part 
    var inProgess = false;


    // Dispense Loading Function Start
    function loading() {

        inProgess = true;
        $('#myModal').modal('show');

        setTimeout(function () {

            inProgess = false;
            $('#myModal').modal('hide');

            bootbox.alert({
                message: "Dispense Order is Successfully",
                title: "Dispense Result",
                backdrop: true
            });

        }, 3000);
    }
    // Dispense Loading Part End


    // Dispense Reset Function Start
    function resetDispense() {
        console.log("Ok Clean");

        loading();

        setTimeout(
                function () {
                    console.log("Inclean");

                    $.ajax({
                        url: "patientOrderListTable.jsp",
                        type: 'POST',
                        timeout: 3000,
                        success: function (data) {

                            console.log(data);
                            $("#patientOrderListContent").html(data);

                        }
                    });

                    resetPage();

                }, 2000);

    }
    // Dispense Reset Function End


    // Clear Button Function Start
    $('#patientOrderDetailContent').on('click', '#btnClearOrderDetailDispense', function (e) {
        resetPage();
    });
    // Clear Button Function End


    // Reset The Page Start
    function resetPage() {

        document.getElementById("patientOrderDetailContentBasicInfoForm").reset();
        document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
        $("#patientOrderDetailContent #patientAllergyListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientAllergyListTableDiv");
        $("#patientOrderDetailContent #patientDiagnosisListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientDiagnosisListTableDiv");
        $("#patientOrderDetailContent #patientOrderDetailsListTableDiv").load("patientOrderListBasicInfoNew.jsp #patientOrderDetailsListTableDiv");
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');

    }
    // Reset The Page End


    // Reset The Buttons Start
    function resetButton() {

        // Disable And Enable Button Start
        $("#patientOrderDetailsListTable").find("input,button,textarea,select").attr("disabled", false);
        document.getElementById("btnOrderDispensePrescribe").disabled = false;
        document.getElementById("btnOrderDispense").disabled = true;
        document.getElementById("btnOrderDispenseCallPatient").disabled = true;
        document.getElementById("btnOrderDispenseDeclineCallPatient").disabled = true;
        // Disable And Enable Button End

    }
    // Reset The Buttons End



//=================================================================================  Reset Part End  ==================================================================================//


</script>


