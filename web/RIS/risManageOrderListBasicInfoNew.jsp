<%-- 
    Document   : risManageOrderListBasicInfoNew
    Created on : Mar 28, 2017, 4:43:19 PM
    Author     : Shammugam
--%>

<div class="thumbnail">
    <h4>Basic Info</h4>
    <hr/>
    <form class="form-horizontal" name="risManageOrderDetailContentBasicInfoForm" id="risManageOrderDetailContentBasicInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">PMI No.</label>
                    <div class="col-md-8">
                        <input id="rispatientpmino" name="rispatientpmino" type="text" placeholder="" readonly class="form-control input-md">   
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Name</label>
                    <div class="col-md-8">
                        <input id="rispatientName" name="rispatientName" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">New IC No.</label>
                    <div class="col-md-8">
                        <input id="rispatientnic" name="rispatientnic" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Gender</label>
                    <div class="col-md-8">
                        <input id="rispatientGender" name="rispatientGender" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

            <div class="col-md-4">

                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">D.O.B</label>
                    <div class="col-md-8">
                        <input id="rispatientBdate" name="rispatientBdate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>
                <!--Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Blood Type</label>
                    <div class="col-md-8">
                        <input id="rispatientBtype" name="rispatientBtype" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>

        </div>
    </form>



    <hr/>
    <h5 style="padding-bottom: 1%;font-weight: bolder">
        Allergy List
    </h5>

    <div id="risManageAllergyListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageAllergyListTable">
            <thead>
            <th style="display: none">PMI NO</th>
            <th>HFC CODE</th>
            <th>EPISODE DATE</th>
            <th>ENCOUNTER DATE</th>
            <th>ALLERGY CODE</th>
            <th>ALLERGY DESCRIPTION</th>
            <th>COMMENT</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>




<div class="thumbnail">
    <h4>Diagnosis Info</h4>
    <hr/>
    <div id="risManageDiagnosisListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageDiagnosisListTable">
            <thead>
            <th style="display: none">PMI NO</th>
            <th >HFC CODE</th>
            <th>EPISODE DATE</th>
            <th>ENCOUNTER DATE</th>
            <th>DIAGNOSIS CODE</th>
            <th>DIAGNOSIS DESCRIPTION</th>
            <th>COMMENT</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>




<div class="thumbnail">
    <h4>Request Info</h4>
    <hr/>
    <form class="form-horizontal" name="risManageOrderDetailContentOrderInfoForm" id="risManageOrderDetailContentOrderInfoForm">
        <div class="row">

            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order No.</label>
                    <div class="col-md-8">
                        <input id="risOrderNo" name="risOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Order Date</label>
                    <div class="col-md-8">
                        <input id="risOrderDate" name="risOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


            <div class="col-md-4">

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Location</label>
                    <div class="col-md-8">
                        <input id="risOrderLocationCode" name="risOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                    </div>
                </div>

            </div>


        </div>
    </form>
    <hr/>
    <h4 style="padding-bottom: 2%">
        <div class="pull-right">
            <button id="risOrderNewRequestButton" name="risOrderNewRequestButton" class="btn btn-primary" data-toggle="modal" ><i class="fa fa-plus fa-lg"></i>&nbsp; New Request</button>
        </div>
        <br>
    </h4>


    <div id="risManageOrderDetailsListTableDiv" class="form-group">
        <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="risManageOrderDetailsListTable">
            <thead>
            <th>Order No</th>
            <th>Name</th>
            <th>Modality</th>
            <th>Body System</th>
            <th>Requestor Instruction</th>
            <th>Result</th>
            <th>Status</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>


    <div class="text-center" id="patientOrderDispenseButtonDiv" > 
        <button class="btn btn-success " type="button" id="btnRISOrderSave" name="btnRISOrderSave" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp; Save &nbsp;</button>
        <button class="btn btn-primary " type="button" id="btnRISOrderSendResults" name="btnRISOrderSendResults" > <i class="fa fa-print fa-lg" ></i>&nbsp; Send Result &nbsp;</button>
        <button class="btn btn-default " type="button" id="btnRISClearOrderDetail" name="btnRISClearOrderDetail" > <i class="fa fa-ban fa-lg"></i>&nbsp; Back &nbsp;</button>
    </div>
</div>

<script>


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


    // Move to Order Details Fetch Details Start
    $('#risOrderListContent').off('click', '#risManageOrderListTable #moveToRISOrderDetailsTButton').on('click', '#risManageOrderListTable #moveToRISOrderDetailsTButton', function (e) {

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
        $("#risOrderDetailContent #risManageAllergyListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageAllergyListTableDiv");
        $("#risOrderDetailContent #risManageDiagnosisListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageDiagnosisListTableDiv");
        $("#risOrderDetailContent #risManageOrderDetailsListTableDiv").load("risManageOrderListBasicInfoNew.jsp #risManageOrderDetailsListTableDiv");
        $('.nav-tabs a[href="#tab_default_1"]').tab('show');
    });
    // Clear Button Function End


</script>