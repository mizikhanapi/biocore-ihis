<%-- 
    Document   : risManageOrderListBasicInfoNew
    Created on : Mar 28, 2017, 4:43:19 PM
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
<h5>ALLERGY LIST</h5>
<div id="ManageAllergyListTable" class="form-group" style="margin-bottom: 40px;">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientAllergyListTable">
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
<div id="ManageDiagnosisListTable" class="form-group" style="margin-bottom: 40px;">
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
<h4>Order Detail</h4>
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


<div id="ManageOrderDetailsListTable" class="form-group" style="margin-bottom: 40px;">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientOrderDetailsListTable">
        <thead>
        <th class="col-sm-1">Item Code</th>
        <th class="col-sm-1">Item Name</th>			 
        <th class="col-sm-1">S. Source</th>
        <th class="col-sm-1">S. Container</th>
        <th class="col-sm-1">Volume</th>
        <th class="col-sm-1">Special Instruction</th>
        <th class="col-sm-1">Status</th>
        <th class="col-sm-1">Verification</th>
        <th class="col-sm-1">Collection Date</th>
        <th class="col-sm-1">Comments</th>
        <th class="col-sm-1">Set Collection Date</th>
        <th class="col-sm-1">Requestor Comments</th>
        <th class="col-sm-1">Assign Specimen</th>
        </thead>
        <tbody>

        </tbody>
    </table>
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
        var pmino = arrayData[1];
        var Name = arrayData[13];
        var nic = arrayData[14];
        var Gender = arrayData[19];
        var Bdate = arrayData[15];
        var Btype = arrayData[20];
        var OrderNo = arrayData[0];
        var OrderDate = arrayData[5];
        var OrderLocationCode = arrayData[2];

        //alert(pmino+" "+OrderNo);
        //Set value to the Second Tab 
        $("#patientpmino").val(pmino);
        $("#patientName").val(Name);
        $("#patientnic").val(nic);
        $("#patientGender").val(Gender);
        $("#patientBdate").val(Bdate);
        $("#patientBtype").val(Btype);
        $("#OrderNo").val(OrderNo);
        $("#OrderDate").val(OrderDate);
        $("#OrderLocationCode").val(OrderLocationCode);

        loadAllergyDiagnosisOrder(OrderNo, pmino);

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
            orderNo: orderNo,
            pmino: pmino
        };


        $.ajax({
            url: "ManageOrderListAllergyTable.jsp",
            type: "post",
            data: dataAllergy,
            timeout: 3000,
            success: function (returnAllergyTableHTML) {
                console.log(returnAllergyTableHTML);
                $('#ManageAllergyListTable').html(returnAllergyTableHTML);

                $.ajax({
                    url: "ManageOrderListDiagnosisTable.jsp",
                    type: "post",
                    data: dataDiagnosis,
                    timeout: 3000,
                    success: function (returnDiagnosisTableHTML) {
                        console.log(returnDiagnosisTableHTML);
                        $('#ManageDiagnosisListTable').html(returnDiagnosisTableHTML);

                        $.ajax({
                            url: "ManageOrderListDetails.jsp",
                            type: "post",
                            data: dataOrder,
                            timeout: 3000,
                            success: function (returnOrderDetailsTableHTML) {
                                $('#ManageOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                                $('#ManageOrderDetailsListTable').trigger('contentchanged');
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

        $('#ManageOrderDetailsListTable').DataTable().destroy();

        // do something after the div content has changed
        $('#ManageOrderDetailsListTable').DataTable({
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
        document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
        document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
        $("#OrderDetail #ManageAllergyListTableDiv").load("ManageOrderListBasicInfoNew.jsp #ManageAllergyListTableDiv");
        $("#OrderDetail #ManageDiagnosisListTableDiv").load("ManageOrderListBasicInfoNew.jsp #ManageDiagnosisListTableDiv");
        $("#OrderDetail #ManageOrderDetailsListTable").load("ManageOrderListBasicInfoNew.jsp #ManageOrderDetailsListTableDiv");
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');
    });
    // Clear Button Function End


</script>