<%-- 
    Document   : patientDispenseListBasicInfo
    Created on : Oct 30, 2018, 11:10:23 PM
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


<h5> ALLERGY LIST </h5>


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


<h4> Order Info </h4>


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


<div style="float: left;" id="patientDispenseProcessButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnClearOrderDetailDispense" name="btnScreenClear" > <i class="fa fa-angle-left fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>


<div class="text-right" id="patientDispenseProcessButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnOrderDispensePrescribe" name="btnOrderDispensePrescribe" > <i class="fa fa-print fa-lg" ></i>&nbsp; Generate Label &nbsp;</button>
    <button class="btn btn-default " type="button" id="btnOrderDispenseCallPatient" name="btnOrderDispenseCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Call Patient &nbsp;</button>
    <button class="btn btn-default " type="button" id="btnOrderDispenseDeclineCallPatient" name="btnOrderDispenseDeclineCallPatient" > <i class="fa fa-phone fa-lg f-decline" style="-webkit-transform: rotate(135deg);" ></i>&nbsp; Decline Call Patient &nbsp;</button>
    <button class="btn btn-primary " type="button" id="btnOrderDispense" name="btnOrderDispense" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Dispense &nbsp;</button>
</div>




<script>

    var episodeDate;
    var encounterDate;


    // ================================================================ Show Master Patient Order Detail ================================================================ //



    // Move to Order Details Fetch Details Start
    $('#patientDispenseListContent').off('click', '#patientDispenseListTable #moveToDispenseDetailsTButton').on('click', '#patientDispenseListTable #moveToDispenseDetailsTButton', function (e) {

        $('<div class="loading">Loading</div>').appendTo('body');

        // Disable And Enable Button
        document.getElementById("btnOrderDispensePrescribe").disabled = false;
        document.getElementById("btnOrderDispense").disabled = true;
        document.getElementById("btnOrderDispenseCallPatient").disabled = true;
        document.getElementById("btnOrderDispenseDeclineCallPatient").disabled = true;

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataPatientDispenseListhidden").val();
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
        var patientOrderLocationCode = arrayData[2];
        var patientOrderEpisodeDate = arrayData[3];
        var patientOrderEncounterDate = arrayData[4];
        var patientOrderLocationCodeName = arrayData[23];


        var pmiNo = patientpmino;
        var orderNo = patientOrderNo;
        var orderDate = patientOrderDate;
        episodeDate = patientOrderEpisodeDate;
        encounterDate = patientOrderEncounterDate;

        var data = {
            pmiNo: pmiNo,
            orderNo: orderNo,
            orderDate: orderDate,
            episodeDate: episodeDate,
            encounterDate: encounterDate
        };

        $.ajax({
            url: "controllerProcessDispenseOrder/patientOrderListDetailDispenseEHRCentralGetMSH.jsp",
            type: "post",
            timeout: 3000,
            data: data,
            success: function (returnDataMSHFull) {


                var arrayReturnDataMSHFull = String(returnDataMSHFull.trim()).split("#");
                var MSHFORBLI = arrayReturnDataMSHFull[0];
                var MSHFORDDR = arrayReturnDataMSHFull[1];

                $.ajax({
                    url: "controllerProcessDispenseOrder/patientOrderListDetailDispenseEHRCentralGetPDIFinal.jsp",
                    type: "post",
                    timeout: 3000,
                    data: data,
                    success: function (returnDataPDIFull) {

                        var PDIFORALL = returnDataPDIFull.trim();

                        $.ajax({
                            url: "controllerProcessDispenseOrder/patientOrderListDetailDispenseEHRCentralGetORC.jsp",
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
            url: "controllerProcessDispenseOrder/patientOrderListAllergyTable.jsp",
            type: "post",
            data: dataAllergy,
            timeout: 3000,
            success: function (returnAllergyTableHTML) {

                $('#patientAllergyListTable').html(returnAllergyTableHTML);

                $.ajax({
                    url: "controllerProcessDispenseOrder/patientOrderListDiagnosisTable.jsp",
                    type: "post",
                    data: dataDiagnosis,
                    timeout: 3000,
                    success: function (returnDiagnosisTableHTML) {

                        $('#patientDiagnosisListTable').html(returnDiagnosisTableHTML);
                        $('#patientDiagnosisListTable').DataTable();

                        $.ajax({
                            url: "controllerProcessDispenseOrder/patientOrderListDetails.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {

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



    // ================================================================ Show Master Patient Order Detail ================================================================ //






    // ================================================================ Update Order Start ================================================================ //



    // global variable declaration
    var row;

    // Get Data For Delete And Update To Load On the Modal
    $('#patientDispenseDetailContent').off('click', '#patientOrderDetailsListTable #updateOrderDetailsTButton').on('click', '#patientOrderDetailsListTable #updateOrderDetailsTButton', function (e) {

        e.preventDefault();

        row = $(this).closest("tr");
        var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
        var arrayData = rowData.split("|");

        var updateOrderNo = arrayData[0];
        var updateOrderDrugCode = arrayData[1];
        var updateOrderDrugOrdered = parseInt(arrayData[11]);
        var updateOrderDrugSupplied = arrayData[12];
        var updateOrderDrugStockQty = arrayData[18];
        var updateOrderDrugDispensed = row.find('td').eq(11).text();
        var updateOrderDrugStatus = row.find('td').eq(14).text();
        var updateOrderComment = row.find('td').eq(30).text();

        $("#updateOrderNo").val(updateOrderNo);
        $("#updateStockQuantity").val(updateOrderDrugStockQty);
        $("#updateDrugCode").val(updateOrderDrugCode);
        $("#updateOrderedDrugQuantity").val(updateOrderDrugOrdered);
        $("#updateSuppliedDrugQuantity").val(updateOrderDrugSupplied);
        $("#updatestatus").val(updateOrderDrugStatus);
        $("#updateOrderComment").val(updateOrderComment);

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
        var updateOrderCommentStatic = $("#updateOrderComment").val();
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
            var updateOrderDrugComment = row.find('td').eq(30).text(updateOrderCommentStatic);


            $('#updateOrder').modal('hide');

            bootbox.alert({
                message: "Drug Order Detail is Updated Successfully",
                title: "Information",
                backdrop: true
            });

            resetButton();

        }
    });
    // Update Order Data End



    // ================================================================ Update Order End ================================================================ //







    // ================================================================ Genarate Label Part Start ================================================================ //



    // Priscribe Part Start
    $('#patientDispenseDetailContent').off('click', '#patientDispenseProcessButtonDiv #btnOrderDispensePrescribe').on('click', '#patientDispenseProcessButtonDiv #btnOrderDispensePrescribe', function (e) {


        var table = $("#patientOrderDetailsListTable tbody");

        var orderNo = $("#patientOrderNo").val();
        var patientPMI = $("#patientpmino").val();
        var patientName = $("#patientName").val();
        var screenedBy = $("#dispenseFilledOrScrennedBy").val();

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

        if (checkedDispense === -1) {

            bootbox.alert("Please At least Select A Order To Generate Label");

        } else if (screenedBy === '') {

            bootbox.alert("Please Search Screened/Filled By Person");

        } else {

            if (stockDispense === -1) {

                bootbox.confirm({
                    message: "Are you sure that you want to Generate Label For this Drugs ?",
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

                            $('#myModal').modal('show');

                            var data = {
                                orderNo: orderNo,
                                longString: prescribeLongString,
                                patientPMI: patientPMI,
                                patientName: patientName
                            };

                            $.ajax({
                                url: "controllerProcessDispenseOrder/patientOrderListDetailsPrescribeResetStatus.jsp",
                                type: "post",
                                data: data,
                                timeout: 5000,
                                success: function (datas) {

                                    $.ajax({
                                        url: "controllerProcessDispenseOrder/patientOrderListDetailsPrescribeUpdateStatus.jsp",
                                        type: "post",
                                        data: data,
                                        timeout: 6000,
                                        success: function (datas) {

                                            $.ajax({
                                                type: "post",
                                                url: "controllerProcessDispenseOrder/patientOrderListDetailsPrescribePDF.jsp",
                                                timeout: 5000,
                                                data: data,
                                                success: function (result) {

                                                    $("#patientOrderDetailsListTable").find("input,button,textarea,select").attr("disabled", "disabled");
                                                    document.getElementById("btnOrderDispenseCallPatient").disabled = false;
                                                    document.getElementById("btnOrderDispensePrescribe").disabled = true;

                                                    $('#myModal').modal('hide');

                                                    var contextPath = '<%=request.getContextPath()%>';

                                                    var url = contextPath + "/SessionReceipt";

                                                    var win = window.open(url, '_blank');
                                                    win.focus();

                                                    bootbox.alert({
                                                        message: "Please Call The Patient Before Dispensing The Drug",
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

                bootbox.alert("Please check the stock quantity of drug that is going to be dispensed. Some of the drug are not available.");

            }

        }

    });
    // Prescibe Part End



    // ================================================================ Genarate Label Part End ================================================================ //




    // ================================================================ Call Patient Start ================================================================ //




    // ================================================================ Call Patient End ================================================================ //



    $('#patientDispenseDetailContent').off('click', '#patientDispenseProcessButtonDiv #btnOrderDispenseCallPatient').on('click', '#patientDispenseProcessButtonDiv #btnOrderDispenseCallPatient', function (e) {


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
                message: "Are you sure you want to continue ?",
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


                        var data = {
                            dataCallPatientFull: dataCallPatientFull
                        };

                        $.ajax({
                            url: "controllerProcessDispenseOrder/patientOrderListDetailsDispenseCallPatientInsert.jsp",
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
                                        message: "You successfully call the patient",
                                        title: "Success",
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



    // ================================================================ De Call Patient Start ================================================================ //



    $('#patientDispenseDetailContent').off('click', '#patientDispenseProcessButtonDiv #btnOrderDispenseDeclineCallPatient').on('click', '#patientDispenseProcessButtonDiv #btnOrderDispenseDeclineCallPatient', function (e) {


        var patientOrderNo = $("#patientOrderNo").val();


        if (patientOrderNo === "" || patientOrderNo === null) {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            bootbox.alert("Please Select A Order First");

        } else {

            var callDeclineNo = $("#dataCallingID").val();


            bootbox.confirm({
                message: "Are you sure you want to continue ?",
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


                        var data = {
                            callDeclineNo: callDeclineNo
                        };

                        $.ajax({
                            url: "controllerProcessDispenseOrder/patientOrderListDetailsDispenseCallPatientDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (result) {

                                var insertResult = result.trim();

                                console.log(insertResult);

                                if (insertResult === 'Success') {

                                    bootbox.alert({
                                        message: "Decline Call Patient Successful",
                                        title: "Success",
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



    // ================================================================ De Call Patient End ================================================================ //






    // ================================================================ Dispense Part Start ================================================================ //



    // Get date function End
    function getDate() {
        var d = new Date();
        var dates = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
        return dates;
    }
    // Get date function End

    // Dispense Order Data
    $('#patientDispenseDetailContent').off('click', '#patientDispenseProcessButtonDiv #btnOrderDispense').on('click', '#patientDispenseProcessButtonDiv #btnOrderDispense', function (e) {

        e.preventDefault();

        var table = $("#patientOrderDetailsListTable tbody");

        var orderNo, drugCode, drugDesc, drugStrength, drugFrequency, drugDuration, drugDose,
                drugStockQty, drugOrderedQty, drugSuppliedQty, drugDispensedQty, drugPrice, drugTotalPrice, drugStatus, drugComment, drugChecked;

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
            drugComment = $tds.eq(30).text();

            cars.push(drugChecked);

        });
        var checkedDispense = cars.indexOf(true);

        if (checkedDispense === -1) {
            bootbox.alert("Please Select A Order To Be Dispense");
        } else {

            bootbox.confirm({
                message: "Please make sure all the order are correct before you proceed to dispense process.",
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
                drugStockQty, drugOrderedQty, drugSuppliedQty, drugDispensedQty, drugPrice, drugTotalPrice, drugStatus, drugComment, drugChecked;

        var orderDate, locationCode, arrivalDate, pmino, pname, dispenseFarMasterQuantity, dispenseFarMasterTotal, dispenseFarMasterQuantityChecked,
                dispenseFarMasterTotalChecked;

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
            drugMDCDispenseNotes = $tds.eq(30).text();
            drugMDCDispenseProvider = "-^-^-";
            drugMDCIndicator = "-";

            drugComment = $tds.eq(30).text();

            if (drugChecked === true && drugDispensedQty !== "0") {

                //                              0           1       2                3               4                  5                   6                    7                   8     
                var dataOneRowBLI = "BLI|T^" + dateBill + "|CH|" + pmino + "|" + drugCode + "|" + drugDesc + "|" + drugTotalPrice + "|" + drugDispensedQty + "|" + userIDBill + "|" + dateBill + "<cr>\n";


                //                    0                         1                                       2                               3                                                       4    
                var dataOneRowDDR = "DDR|" + drugATCCode + "^" + drugATCDesc + "^ATC|" + drugCode + "^" + drugMDCDesc + "^MDC|" + drugMDCStrength + "|" + drugMDCFromMCode + "^" + drugMDCFromRCode + "^" + drugMDCFromDesc +
                        //                                  5                                                                                   6
                        "|" + drugMDCRouteMCode + "^" + drugMDCRouteRCode + "^" + drugMDCRouteDesc + "|" + drugMDCFrequencyMCode + "^" + drugMDCFrequencyDesc + "^" + drugMDCFrequencyRCode + "|" +
                        //          7                          8                 9                   10        
                        drugMDCFrequencyUnitCode + "|" + drugMDCDosage + "|" + drugMDCOUM + "|" + drugMDCDuration +
                        //          11                          12                              13                      14                      15        
                        "|" + drugDispensedQty + "|" + drugMDCDispenseLocation + "|" + drugMDCDispenseNotes + "|" + getDate() + "|" + drugMDCDispenseProvider + "|" +
                        //  16                  17
                        orderDate + "|" + drugMDCIndicator + "<cr>\n";


                ehrCentralBillBLI = ehrCentralBillBLI + dataOneRowBLI;
                ehrCentralBillDDR = ehrCentralBillDDR + dataOneRowDDR;


                console.log("Ok : " + drugCode);
                console.log("Dosage : " + drugMDCDosage);

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
                    drugChecked: drugChecked,
                    drugComment: drugComment,
                };

                console.log(dataAjax);

                $.ajax({
                    url: "controllerProcessDispenseOrder/patientOrderListDetailsDispenceOverall.jsp",
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
            url: "controllerProcessDispenseOrder/patientOrderListDetailsDispenceEHRCentralInsertCallingDelete.jsp",
            type: "post",
            data: dataEHRcentralFull,
            timeout: 3000,
            success: function (datas) {
                console.log(datas.trim());

                resetDispense();

            },
            error: function (err) {
                console.log("Error Dispense: " + err);
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
                //console.log("NaN");
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
                    //console.log("NaN Checked");
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



    // ================================================================ Dispense Part End ================================================================ //







    // ================================================================ Reset Part Start ================================================================ //



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
                message: "The drug is dispense successfully",
                title: "Success",
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

                    var process = $('#PIS_DispenseTime').val();
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
                        url: "patientDispenseListTable.jsp",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            $('#patientDispenseListContent').html(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            bootbox.alert('Opps! ' + errorThrown);
                        },
                        complete: function (jqXHR, textStatus) {
                            $('.loading').hide();
                        }

                    });

                    resetPage();

                }, 2000);

    }
    // Dispense Reset Function End


    // Clear Button Function Start
    $('#patientDispenseDetailContent').on('click', '#btnClearOrderDetailDispense', function (e) {
        resetPage();
    });
    // Clear Button Function End


    // Reset The Page Start
    function resetPage() {

        document.getElementById("patientOrderDetailBasicInfoForm").reset();
        document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
        $("#patientDispenseDetailContent #patientAllergyListTableDiv").load("patientDispenseListBasicInfo.jsp #patientAllergyListTableDiv");
        $("#patientDispenseDetailContent #patientDiagnosisListTableDiv").load("patientDispenseListBasicInfo.jsp #patientDiagnosisListTableDiv");
        $("#patientDispenseDetailContent #patientOrderDetailsListTableDiv").load("patientDispenseListBasicInfo.jsp #patientOrderDetailsListTableDiv");
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



    // ================================================================ Reset Part End ================================================================ //


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


    $('#patientDispenseDetailContent').off('click', '#patientShowVitalSign').on('click', '#patientShowVitalSign', function (e) {

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