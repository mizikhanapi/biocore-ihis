<%-- 
    Document   : patientOrderListBasicInfo
    Created on : Feb 7, 2017, 2:44:32 PM
    Author     : Shammugam
--%>

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

<h5 style="font-weight: 500;">
    Allergy List
</h5>

<div id="patientAllergyListTableDiv" class="form-group" style="margin-bottom: 40px;">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientAllergyListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th>HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>ALLERGY CODE</th>
        <th style="text-align: left; width: 40%;">ALLERGY DESCRIPTION</th>
        <th style="text-align: left; width: 20%;">COMMENT</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr/>
<h4>Diagnosis Info</h4>
<div id="patientDiagnosisListTableDiv" class="form-group" style="margin-bottom: 40px;">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientDiagnosisListTable">
        <thead>
        <th style="display: none">PMI NO</th>
        <th >HFC CODE</th>
        <th>EPISODE DATE</th>
        <th>ENCOUNTER DATE</th>
        <th>DIAGNOSIS CODE</th>
        <th style="text-align: left; width: 40%;">DIAGNOSIS DESCRIPTION</th>
        <th style="text-align: left; width: 20%;">COMMENT</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr/>
<h4>Order Info
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
                </div>
            </div>

        </div>

    </div>
</form>


<div id="patientOrderDetailsListTableDiv" class="form-group" style="margin-bottom: 40px;">
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

<div>
    <!-- content goes here -->
    <form class="form-horizontal" id="addForm">
        <div class="row">
            <div class="col-md-2">
                <input id="dispenseFarBillNo" name="dispenseFarBillNo" type="hidden" class="form-control input-md" maxlength="50" readonly>
            </div>

            <div class="col-md-4">
                <input id="dispenseTotalQuantity" name="dispenseTotalQuantity" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                <input id="dispenseTotalQuantityChecked" name="dispenseTotalQuantityChecked" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="margin-bottom: 20px;">
                <div class="col-md-6">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-7 control-label" for="textinput">Total Order</label>
                        <div class="col-md-5">
                            <input id="dispenseTotalOrder" name="dispenseTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-7 control-label" for="textinput">Total Order Final</label>
                        <div class="col-md-5">
                            <input id="dispenseTotalOrderChecked" name="dispenseTotalOrderChecked" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                        </div>
                    </div>

                </div>

                <div class="col-md-6">

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-7 control-label" for="textinput">Grand Total (RM)</label>
                        <div class="col-md-5">
                            <input id="dispenseGrandTotal" name="dispenseGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-7 control-label" for="textinput">Grand Total Final (RM)</label>
                        <div class="col-md-5">
                            <input id="dispenseGrandTotalChecked" name="dispenseGrandTotalChecked" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</div>

<div class="text-center" id="patientOrderDispenseButtonDiv" > 
    <button class="btn btn-success " type="button" id="btnOrderDispense" name="btnOrderDispense" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Dispense &nbsp;</button>
    <button class="btn btn-primary " type="button" id="btnOrderDispensePrescribe" name="btnOrderDispensePrescribe" > <i class="fa fa-print fa-lg" ></i>&nbsp; Generate Label &nbsp;</button>
    <button class="btn btn-default " type="button" id="btnClearOrderDetailDispense" name="btnClearOrderDetailDispense" > <i class="fa fa-ban fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>


<script>


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


    // Move to Order Details Fetch Details Start
    $('#OrderMaster').off('click', '#risManageOrderListTable #moveToRISOrderDetailsTButton').on('click', '#risManageOrderListTable #moveToRISOrderDetailsTButton', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataRISOrderListhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //Assign Array into seprated val
        var rispmino = arrayData[0];
        var risName = arrayData[13];
        var risnic = arrayData[14];
        var risGender = arrayData[16];
        var risBdate = arrayData[15];
        var risBtype = arrayData[17];
        var risOrderNo = arrayData[1];
        var risOrderDate = arrayData[5];
        var risOrderLocationCode = arrayData[2];


        //Set value to the Second Tab 
        $("#rispatientpmino").val(rispmino);
        $("#rispatientName").val(risName);
        $("#rispatientnic").val(risnic);
        $("#rispatientGender").val(risGender);
        $("#rispatientBdate").val(risBdate);
        $("#rispatientBtype").val(risBtype);
        $("#risOrderNo").val(risOrderNo);
        $("#risOrderDate").val(risOrderDate);
        $("#risOrderLocationCode").val(risOrderLocationCode);

        loadAllergyDiagnosisOrder(risOrderNo, rispmino);

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
            url: "risManageOrderListAllergyTable.jsp",
            type: "post",
            data: dataAllergy,
            timeout: 3000,
            success: function (returnAllergyTableHTML) {
                console.log(returnAllergyTableHTML);
                $('#risManageAllergyListTable').html(returnAllergyTableHTML);

                $.ajax({
                    url: "risManageOrderListDiagnosisTable.jsp",
                    type: "post",
                    data: dataDiagnosis,
                    timeout: 3000,
                    success: function (returnDiagnosisTableHTML) {
                        console.log(returnDiagnosisTableHTML);
                        $('#risManageDiagnosisListTable').html(returnDiagnosisTableHTML);

                        $.ajax({
                            url: "risManageOrderListDetails.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {
                                $('#risManageOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#risManageOrderDetailsListTable').trigger('contentchanged');
                                $('.nav-tabs a[href="#tab_default_2"]').tab('show');
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

        $('#risManageOrderDetailsListTable').DataTable().destroy();

        // do something after the div content has changed
        $('#risManageOrderDetailsListTable').DataTable({
            "paging": false,
            "searching": false,
            "info": false,
            "language": {
                "emptyTable": "No Request Available To Display"
            }
        });

    });
    // Load Datatable To Tables End 


//======================================================================================================================================================================================//


    // Save Button Function Start
    $('#patientOrderDispenseButtonDiv').on('click', '#btnRISOrderSave', function (e) {
        alert("In Save");
    });
    // Save Button Function End


    // Send Button Function Start
    $('#patientOrderDispenseButtonDiv').on('click', '#btnRISOrderSendResults', function (e) {
        alert("In Send");
    });
    // Send Button Function End



    // Clear Button Function Start
    $('#patientOrderDispenseButtonDiv').on('click', '#btnRISClearOrderDetail', function (e) {
        document.getElementById("risManageOrderDetailContentBasicInfoForm").reset();
        document.getElementById("risManageOrderDetailContentOrderInfoForm").reset();
        $("#OrderDetail #risManageAllergyListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageAllergyListTableDiv");
        $("#OrderDetail #risManageDiagnosisListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageDiagnosisListTableDiv");
        $("#OrderDetail #risManageOrderDetailsListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageOrderDetailsListTableDiv");
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');
    });
    // Clear Button Function End


</script>


