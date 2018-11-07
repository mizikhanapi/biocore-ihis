<%-- 
    Document   : manageLabVerifyDetaillBasicInfo
    Created on : Jan 16, 2018, 1:44:36 AM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdis = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String hfcori = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disori = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdisori = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String locationcode = hfc + "|" + dis + "|" + subdis;
    String user = session.getAttribute("USER_ID").toString();

    

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

<hr/>

<h4>
    Specimen Details
</h4>

<form class="form-horizontal" name="patientOrderDetailContentOrderInfoForm" id="patientOrderDetailContentOrderInfoForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Specimen No.</label>
                <div class="col-md-7">
                    <input id="specimenSpecimenNo" name="patientOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order No.</label>
                <div class="col-md-7">
                    <input id="specimenOrderNo" name="patientOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order Date</label>
                <div class="col-md-7">
                    <input id="specimenOrderDate" name="patientOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                    <input id="specimenEpisodeDate" name="patientOrderDate" type="hidden" readonly placeholder="" class="form-control input-md">
                    <input id="specimenEncounterDate" name="patientOrderDate" type="hidden" readonly placeholder="" class="form-control input-md">
                    <input id="patientOrderLocationCodeFull" name="patientOrderLocationCodeFull" type="hidden" readonly placeholder="" class="form-control input-md" value="<%= locationcode%>">
                    <input id="dataCallingID" name="dataCallingID" type="hidden" placeholder="" readonly class="form-control input-md">  
                </div>
            </div>

        </div>


    </div>
</form>

<div id="patientSpecimenDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="patientSpecimenDetailsListTable">
        <thead>
        <th>Code</th>
        <th>Name</th>			 
        <th>Specimen Container</th>
        <th>Volume</th>
        <th>Specimen Source</th>
        <th>Requestor Comments</th>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>

<hr/>
<h4>
    Item Preparation
</h4>
<div id="posItemPreparation" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="tablepositemprepare">
        <thead>
        <th style="width: 5%">Item Code</th>
        <th style="width: 20%">Item Name</th>
        <th style="width: 5%">Current Value</th>
        <th style="width: 20%">Quantity On hand</th>
        <th style="width: 5%">Request Quantity</th>
        <th style="width: 5%">Total Value</th>

        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<hr/>

<div style="float: left;" id="patientOrderSpecimenLeftButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnVerifyBackSpecimen" ><i class="fa fa-backward fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>


<div class="text-right" id="patientOrderSpecimenRightButtonDiv" > 
    <button class="btn btn-warning" type="button" id="btnVerifySpecimenCallPatient" name="btnVerifySpecimenCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Call Patient &nbsp;</button>
    <button class="btn btn-danger" type="button" id="btnVerifySpecimenDeclineCallPatient" name="btnVerifySpecimenDeclineCallPatient" > <i class="fa fa-phone fa-lg" ></i>&nbsp; Decline Call Patient &nbsp;</button>
</div>


<script>


    $(document).ready(function () {


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


        var episodeDate;
        var encounterDate;

        // Move to Order Details Fetch Details Start
        $('#lisLabRequestVerifyMasterContent').off('click', '#verifyLabOrderMasterTable #moveToOrderDetailsTButton').on('click', '#verifyLabOrderMasterTable #moveToOrderDetailsTButton', function (e) {

            $('<div class="loading">Loading</div>').appendTo('body');

            // Disable And Enable Button
            document.getElementById("btnVerifySpecimenCallPatient").disabled = false;
            document.getElementById("btnVerifySpecimenDeclineCallPatient").disabled = true;

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataVerifyLabOrderMasterListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //Assign Array into seprated val
            var patientpmino = arrayData[0];
            var patientName = arrayData[16];
            var patientnic = arrayData[17];
            var patientGender = arrayData[21];
            var patientBdate = arrayData[18];
            var patientBtype = arrayData[22];

            var patientOrderNo = arrayData[1];
            var patientOrderDate = arrayData[7];
            var patientOrderEpisodeDate = arrayData[5];
            var patientOrderEncounterDate = arrayData[6];

            var patientSpecimenNo = arrayData[25];


            var pmiNo = patientpmino;
            var orderNo = patientOrderNo;
            var orderDate = patientOrderDate;
            episodeDate = patientOrderEpisodeDate;
            encounterDate = patientOrderEncounterDate;


            // Set value to the Second Tab 
            $("#patientpmino").val(patientpmino);
            $("#patientName").val(patientName);
            $("#patientnic").val(patientnic);
            $("#patientGender").val(patientGender);
            $("#patientBdate").val(patientBdate);
            $("#patientBtype").val(patientBtype);

            $("#specimenSpecimenNo").val(patientSpecimenNo);
            $("#specimenOrderNo").val(patientOrderNo);
            $("#specimenOrderDate").val(patientOrderDate);
            $("#specimenEpisodeDate").val(patientOrderEpisodeDate);
            $("#specimenEncounterDate").val(patientOrderEncounterDate);


            // Load Table
            loadOrder(patientSpecimenNo);

        });
        // Move to Order Details Fetch Details End



        // Move to Order Details And Load All Table Data Start
        function loadOrder(specimenNo) {


            var dataOrder = {
                specimenNo: specimenNo
            };
            var order_no = $("#specimenOrderNo").val();
            var dataOrderNo = {
                orderNo: order_no
            };


            $.ajax({
                url: "manageLabVerifyDetailsTable.jsp",
                type: "post",
                data: dataOrder,
                timeout: 3000,
                success: function (returnOrderDetailsTableHTML) {

                    $('#patientSpecimenDetailsListTable').html(returnOrderDetailsTableHTML);
                    datatablesDestroyAndRecreate();
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                    $('.loading').hide();

                }
            });
            
            $.ajax({
                        url: "../POM/procedure_controller/procedure_select.jsp",
                        type: "post",
                        data: dataOrderNo,
                        success: function (databack) {
                            $('#tablepositemprepare tbody').empty();
                            if (databack.trim() !== "NO") {

                                $('#tablepositemprepare').append(databack.trim());

                                //datatableTableCreate();
                            }
                            

                        }
                    });



        }
        // Move to Order Details And Load All Table Data End



        // Destroy And Create Datatable Start
        function datatablesDestroyAndRecreate() {


            console.log("Destroying Datatable");

            $('#patientSpecimenDetailsListTable').DataTable().destroy();




            console.log("Creating Datatable");

            // do something after the div content has changed
            $('#patientSpecimenDetailsListTable').DataTable({
                "paging": false,
                "searching": false,
                "info": false,
                "lengthChange": false,
                "pageLength": 5,
                "language": {
                    "emptyTable": "No Specimen Available To Display"
                }
            });


        }
        // Destroy And Create Datatable End




//======================================================================================================================================================================================//







//-------------------------------------------------------------------------------  Enter Specimen Start  --------------------------------------------------------------------------------//



        $('#lisLabRequestVerifyDetailContent').off('click', '#patientSpecimenDetailsListTable #btnVerifySpecimenEnterResult').on('click', '#patientSpecimenDetailsListTable #btnVerifySpecimenEnterResult', function (e) {


            var customer_id = $("#patientpmino").val();
            var txt_date = $("#specimenOrderDate").val();
            var specimen_no = $("#specimenSpecimenNo").val();
            var order_no = $("#specimenOrderNo").val();
            var order_date = $("#specimenOrderDate").val();
            var episode_date = $("#specimenEpisodeDate").val();
            var encounter_date = $("#specimenEncounterDate").val();


            var row = $(this).closest("tr");
            var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            var item_cd = arrayData[2];
            var item_name = arrayData[8];

            $("#addSpecimenResultSpecimenNo").val(specimen_no);
            $("#addSpecimenResultOrderNo").val(order_no);
            $("#addSpecimenResultItemCode").val(item_cd);
            $("#addSpecimenResultItemName").val(item_name);

            $("#addSpecimenResultResult").val('');
            $("#addSpecimenResultRemark").val('');

            $('#inputFileToLoad').val("");
            $('#dym').html("");
            gambarURI = "";




        });



//-------------------------------------------------------------------------------  Insert Specimen End  --------------------------------------------------------------------------------//



//-------------------------------------------------------------------------------  Verify Specimen Start  --------------------------------------------------------------------------------//



        $('#lisLabRequestVerifyDetailContent').off('click', '#patientSpecimenDetailsListTable #btnVerifySpecimenVerifyResult').on('click', '#patientSpecimenDetailsListTable #btnVerifySpecimenVerifyResult', function (e) {


            var customer_id = $("#patientpmino").val();
            var txt_date = $("#specimenOrderDate").val();
            var specimen_no = $("#specimenSpecimenNo").val();
            var order_no = $("#specimenOrderNo").val();
            var order_date = $("#specimenOrderDate").val();
            var episode_date = $("#specimenEpisodeDate").val();
            var encounter_date = $("#specimenEncounterDate").val();


            var row = $(this).closest("tr");
            var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            var result_no = arrayData[12];
            var item_cd = arrayData[2];
            var item_name = arrayData[8];

            $("#verifySpecimenResultSpecimenNo").val(specimen_no);
            $("#verifySpecimenResultOrderNo").val(order_no);
            $("#verifySpecimenResultResultNo").val(result_no);
            $("#verifySpecimenResultItemCode").val(item_cd);
            $("#verifySpecimenResultItemName").val(item_name);




        });



//-------------------------------------------------------------------------------  Verify Specimen End  --------------------------------------------------------------------------------//






        //------------------------------------------------------------------------------  Call patient Part Start  -------------------------------------------------------------------------------//


        // Call or Decline Part Start
        // 
        // 
        // Call Button Start
        $('#lisLabRequestVerifyDetailContent').off('click', '#patientOrderSpecimenRightButtonDiv #btnVerifySpecimenCallPatient').on('click', '#patientOrderSpecimenRightButtonDiv #btnVerifySpecimenCallPatient', function (e) {


            var specimenSpecimenNo = $("#specimenSpecimenNo").val();


            if (specimenSpecimenNo === "" || specimenSpecimenNo === null) {

                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                bootbox.alert("Please Select A Order First !!!");

            } else {


                var patientOrderLocationCodeFull = $("#patientOrderLocationCodeFull").val();
                var patientpmino = $("#patientpmino").val();
                var patientName = $("#patientName").val();
                var dataCallPatientFull = patientOrderLocationCodeFull + "|" + patientpmino + "|" + patientName + "|" + specimenSpecimenNo;


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
                                url: "controllerProcessVerifySpecimen/verifySpecimenOrderCallPatientInsert.jsp",
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

                                    document.getElementById("btnVerifySpecimenDeclineCallPatient").disabled = false;
                                    document.getElementById("btnVerifySpecimenCallPatient").disabled = true;

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




        // Decline Call Button Start
        $('#lisLabRequestVerifyDetailContent').off('click', '#patientOrderSpecimenRightButtonDiv #btnVerifySpecimenDeclineCallPatient').on('click', '#patientOrderSpecimenRightButtonDiv #btnVerifySpecimenDeclineCallPatient', function (e) {


            var specimenSpecimenNo = $("#specimenSpecimenNo").val();


            if (specimenSpecimenNo === "" || specimenSpecimenNo === null) {

                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                bootbox.alert("Please Select A Order First !!!");

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
                                url: "controllerProcessVerifySpecimen/verifySpecimenOrderCallPatientDelete.jsp",
                                type: "post",
                                data: data,
                                timeout: 3000,
                                success: function (result) {

                                    var deleteResult = result.trim();

                                    console.log(deleteResult);

                                    if (deleteResult === 'Success') {

                                        bootbox.alert({
                                            message: "Decline Call Patient Successful",
                                            title: "Process Result",
                                            backdrop: true
                                        });

                                    }

                                    document.getElementById("btnVerifySpecimenDeclineCallPatient").disabled = true;
                                    document.getElementById("btnVerifySpecimenCallPatient").disabled = false;

                                }
                            });


                        } else {
                            console.log("Process Is Canceled");
                        }

                    }
                });


            }


        });
        // Decline Call Button End
        // 
        // 
        // Call or Decline Part End


        //==============================================================================  Call Patient Part End  ================================================================================//




//-------------------------------------------------------------------------------  Reset Part Start  --------------------------------------------------------------------------------//



        // Clear Button Function Start
        $('#lisLabRequestVerifyDetailContent').on('click', '#btnVerifyBackSpecimen', function (e) {
            resetPage();
        });
        // Clear Button Function End



        // Reset The Page Start
        function resetPage() {

            $("#lisLabRequestVerifyMasterContent").load("manageLabVerifyMasterTable.jsp");

            $('#LAB_VerifyTime').prop('selectedIndex', 0);

            document.getElementById("patientOrderDetailContentOrderInfoForm").reset();
            document.getElementById("patientOrderDetailContentBasicInfoForm").reset();

            $("#lisLabRequestVerifyDetailContent #patientSpecimenDetailsListTableDiv").load("manageLabVerifyDetaillBasicInfo.jsp #patientSpecimenDetailsListTableDiv");

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');

        }
        // Reset The Page End




//=================================================================================  Reset Part End  ==================================================================================//



    });

</script>

<script>

    
    $('#btnVerifySpecimenEnterResult').prop('disabled', false);
    $('#patientSpecimenDetailsListTable').on('click', '#MOD_btnPrepare', function () {

        $('#orderNewStockOrderModalTitle').text("Add New Item");
        $('#orderNewStockOrderSearchItemInput').prop('disabled', false);
        $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').html('<button type="submit" id="orderNewStockOrderItemAddNewItemBtn" class="btn btn-success btn-block btn-lg" role="button">Add Items</button>');
        $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').html('<button type="button" id="orderNewStockOrderItemReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>');

        $('#orderNewStockOrderModalFrom')[0].reset();

    });

    $(function () {

        $("#orderNewStockOrderSearchItemInput").on('keyup', function () { // everytime keyup event
            var itemType = $('#orderNewStockOrderItemType').val();
            var input = $(this).val(); // We take the input value
            var dataCS;


            dataCS = "nope";


            if (input.length >= 1) { // Minimum characters = 2 (you can change)

                $('#orderNewStockOrderSearchItemInputDisplayResult').html('<img src="libraries/LoaderIcon.gif"/>');

                var dataFields = {'input': input, 'itemtype': itemType, 'dataCS': dataCS}; // We pass input argument in Ajax

                console.log(dataFields);

                $.ajax({
                    type: "POST",
                    url: "../GNL/StockOrder/controllerProcess/orderStockSearchItem.jsp", // call the jsp file ajax/auto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success

                        $('#orderNewStockOrderSearchItemInputDisplayResult').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>

                        $('#orderNewStockOrderSearchItemInputDisplayResult li').on('click', function () { // When click on an element in the list

                            $('#orderNewStockOrderSearchItemInput').val($(this).text()); // Update the field with the new element
                            $('#orderNewStockOrderSearchItemInputDisplayResult').text(''); // Clear the <div id="match"></div>


                        });

                    },
                    error: function () { // if error

                        $('#orderNewStockOrderSearchItemInputDisplayResult').text('No Record Found !');

                    }
                });

            } else {

                $('#orderNewStockOrderSearchItemInputDisplayResult').text('Search For More Than One Characters !!'); // If less than 2 characters, clear the <div id="match"></div>

            }
        });
    });
    //JS Search in Add Item End


    //JS Get Add Item Start
    $('#orderNewStockOrderSearchItemInputDisplayResult').on('click', function () {

        $('<div class="loading">Loading</div>').appendTo('body');

        var id = $('#orderNewStockOrderSearchItemInput').val();

        var arrayData = $('#orderNewStockOrderSearchItemInput').val().split("|");
        var itemType = $('#orderNewStockOrderItemType').val();
        id = arrayData[0];
        var dataCS;


        dataCS = "nope";

        var data = {
            id: id, itemType: itemType, 'dataCS': dataCS
        };


        $.ajax({
            type: 'post',
            url: '../GNL/StockOrder/controllerProcess/orderStockSearchItemResult.jsp',
            data: data,
            success: function (reply_data) {
                console.log(reply_data);
                var array_data = String(reply_data.trim()).split("|");

                var itemCode = array_data[0];
                var itemCate = array_data[1];
                var itemName = array_data[2];
                var itemPrice = array_data[3];
                var itemStock = array_data[4];
                var hfc = array_data[5];
                var dis = array_data[6];
                var orderhfc = "<%=hfcori%>";
                var orderdis = "<%=disori%>";
                var temtype = array_data[7];


                $('#orderNewStockOrderItemDisplayItemCode').val(itemCode);
                $('#orderNewStockOrderItemDisplayItemName').val(itemName);
                $('#orderNewStockOrderItemDisplayItemStockQuantity').val(itemStock);
                $('#orderNewStockOrderItemDisplayItemPrice').val(itemPrice);

                $('#disciplineStock').val(dis);
                $('#subdisciplineStock').val(dis);
                $('#disciplineStockOrdering').val(orderdis);
                $('#subdisciplineStockOrdering').val("<%=subdisori%>");
                $('#stockitemtype').val(temtype);

                $('#orderNewStockOrderSearchItemInput').val('');

                $('.loading').hide();

            }
        });
    });

    $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').on('click', '#orderNewStockOrderItemReset', function (e) {
        $('#orderNewStockOrderModalFrom')[0].reset();
        $('#orderNewStockOrderSearchItemInputDisplayResult').html('');
    });

    // Add Item Function Start
    $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').on('click', '#orderNewStockOrderItemAddNewItemBtn', function () {


        var table = $("#tablepositemprepare tbody");

        var arrayItemCode = [];

        // Calculating Data For Overall Dispense
        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');
            var itemCode = $tds.eq(0).text();
            arrayItemCode.push(itemCode);

        });

        var itemCode = $('#orderNewStockOrderItemDisplayItemCode').val();
        var itemName = $('#orderNewStockOrderItemDisplayItemName').val();
        var itemPrice = $('#orderNewStockOrderItemDisplayItemPrice').val();
        var itemQuantity = $('#orderNewStockOrderItemInputQuantity').val();
        var itemComment = "-";
        var itemStock = $('#orderNewStockOrderItemDisplayItemStockQuantity').val();
        var disrec = $('#disciplineStock').val();
        var subdusrec = $('#subdisciplineStock').val();
        var disorder = $('#disciplineStockOrdering').val();
        var subdisorder = $('#subdisciplineStockOrdering').val();
        var temtype = $('#stockitemtype').val();



        if (itemCode === "" || itemCode === null) {

            bootbox.alert("Please Search An Item To Continue !!!");

        } else if (itemQuantity === "" || itemQuantity === null) {

            bootbox.alert("Please Insert Order Quantity !!!");

        } else if (parseInt(itemQuantity) > parseInt(itemStock)) {

            bootbox.alert("Please Insert Order Quantity Less Than Stock Quantity That Is Available !!!");

        } else {


            datatableTableDestroy();

            var arrayItemCodeCheck = arrayItemCode.indexOf(itemCode);


            if (arrayItemCodeCheck === -1) {

                var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);



                // datatableTable();

                $('#orderNewStockOrder').modal('hide');

                var customer_id = "<%=user%>";
                var order_no = $("#specimenOrderNo").val();
                var txt_date = $("#specimenOrderDate").val();
                
                var dt = new Date(txt_date);
                var newdt = dt.getDate()+"/"+dt.getMonth()+"/"+dt.getFullYear()+" "+dt.getHours()+":"+dt.getMinutes()+":"+dt.getSeconds();
                console.log(newdt);
                var item_amt = newTotal;
                var quantity = itemQuantity;
                var typebutton = "release";
                var stockOrderListorder = [];
                var stringMaster = customer_id + "|" + order_no + "|" + newdt + "|" + item_amt + "|" + quantity;
                var stringDetail = "";
                var grandTotalpriceorder = 0;
                var grandTotalqtyorder = 0, stringDetailorder;



                var releaseOrderList = [];
                var updateQtyStock = parseInt(itemStock) - parseInt(itemQuantity);
                var status = "4";
                var location = "<%=hfcori%>";
                releaseOrderList.push(itemCode + "^" + itemName + "^" + updateQtyStock + "^" + itemQuantity + "^" + itemQuantity + "^" + itemQuantity + "^"
                        + item_amt + "^" + itemQuantity + "^" + itemComment + "^" + status + "^" + itemQuantity + "^" + temtype + "^" + location + "^" + customer_id + "^" + disorder + "^" + subdisorder);
                stringDetail = releaseOrderList.join("|");

                var data = {
                    stringMaster: stringMaster,
                    stringDetail: stringDetail,
                    button: typebutton
                };

                var product = parseFloat(newTotal);


                stockOrderListorder.push(itemCode + "^" + itemName + "^" + itemPrice + "^" + product + "^" + quantity + "^" + itemComment + "^" + disrec + "^" + subdusrec + "^" + disorder + "^" + subdisorder + "^" + temtype);
                stringDetailorder = stockOrderListorder.join("|");
                grandTotalpriceorder += parseFloat(product);
                grandTotalqtyorder += parseFloat(quantity);

                var dataorder = {
                    order_no: order_no,
                    total_amt: grandTotalpriceorder,
                    quantity: grandTotalqtyorder,
                    stringDetail: stringDetailorder
                };
                $.ajax({
                    url: "../GNL/StockOrder/controllerProcess/orderStockOverall.jsp",
                    type: "post",
                    data: dataorder,
                    timeout: 3000,
                    success: function (returnMessage) {

                        //$('.loading').hide();
                        //console.log(dataorder);
                        //console.log(returnMessage);

                        if (returnMessage.trim() === 'Success') {
                            console.log(data);
                            $.ajax({
                                url: "../SMS/controllerProcessDistributeStockOrder/distrubuteStockOrderReleaseItems.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (datas) {
                                    console.log(datas);
                                    //$('#myLoadingModal').modal('hide');

                                    if (datas.trim() === "Success") {

                                        bootbox.alert({
                                            message: "Item is Added Successful",
                                            title: "Process Result",
                                            backdrop: true
                                        });
                                        $('#tablepositemprepare').append('<tr id="addNewStockOrderDetailsUpdateDeleteBtn">\n\
                                            <td>' + itemCode + '</td>\n\
                                            <td>' + itemName + '</td>\n\
                                            <td>' + itemPrice + '</td>\n\
                                            <td>' + itemStock + '</td>\n\
                                            <td>' + itemQuantity + '</td>\n\
                                            <td>' + newTotal + '<input type="hidden" id="disciplineStockA" value="' + disrec + '"><input type="hidden" id="subdisciplineStockA" value="' + subdusrec + '">\n\
                                            <input type="hidden" id="disciplineStockOrderingA" value="' + disorder + '">\n\
                                            <input type="hidden" id="subdisciplineStockOrderingA" value="' + subdisorder + '"><input type="hidden" id="stockitemtypeA" value="' + temtype + '"></td>\n\
                                        </tr>');
                                        datatableTableCreate();
                                        
                                    } else if (datas.trim() === "Failed") {

                                        bootbox.alert("Item failed to add!");

                                    }
                                    //resetPage();

                                },
                                error: function (err) {
                                    alert("Error! Deletion Ajax failed!!");
                                }
                            });
                        } else if (returnMessage.trim() === 'Failed') {
                            bootbox.alert("Item failed to add!");
                        }
                    }
                });
                

            } else {

                bootbox.alert("Item Code Duplicated!! Please Choose Different Code!!");

                datatableTableCreate();

            }

        }
    });

//-------------------------------------------------------------------------------  Update And Delete Part Start  --------------------------------------------------------------------------------//



    // global variable declaration
    var row;

    // Fetch Data For Update And Delete Function Start
    $('#posItemPreparation').off('click', '#tablepositemprepare #addNewStockOrderDetailsUpdateDeleteBtn').on('click', '#tablepositemprepare #addNewStockOrderDetailsUpdateDeleteBtn', function (e) {

        row = $(this).closest("tr");

        $('#POSorderNewStockOrder').modal('show');

        $('#orderNewStockOrderModalTitle').text("Update Or Delete Item");
        $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').html('<button type="submit" id="orderNewStockOrderItemUpdateNewItemBtn" class="btn btn-success btn-block btn-lg" role="button">Update</button>');
        $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').html('<button type="submit" id="orderNewStockOrderItemDeleteNewItemBtn" class="btn btn-danger btn-block btn-lg" role="button">Delete</button>');

        $('#orderNewStockOrderSearchItemInput').prop('disabled', true);
        
        var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);
        var orivaluqty = parseInt(row.find('td').eq(4).text());
        var changedqty = parseInt(itemQuantity) - orivaluqty;
        
        var itemCode = row.find('td').eq(0).text();
        var itemName = row.find('td').eq(1).text();
        var itemPrice = row.find('td').eq(2).text();
        var itemStock = row.find('td').eq(3).text();
        var itemQuantity = row.find('td').eq(4).text();
        //var itemComment = row.find('td').eq(6).text();

        var disrec = $('#disciplineStockA').val();
        var subdusrec = $('#subdisciplineStockA').val();
        var disorder = $('#disciplineStockOrderingA').val();
        var subdisorder = $('#subdisciplineStockOrderingA').val();
        var temtype = row.find('td').eq(5).find('#stockitemtypeA').val();;
        
        $('#orderNewStockOrderItemDisplayItemCode').val(itemCode);
        $('#orderNewStockOrderItemDisplayItemName').val(itemName);
        $('#orderNewStockOrderItemDisplayItemPrice').val(itemPrice);
        $('#orderNewStockOrderItemDisplayItemStockQuantity').val(itemStock);
        $('#orderNewStockOrderItemInputQuantity').val(itemQuantity);
        //$('#orderNewStockOrderItemInputComment').val(itemComment);

        $('#disciplineStock').val(disrec);
        $('#subdisciplineStock').val(subdusrec);
        $('#disciplineStockOrdering').val(disorder);
        $('#subdisciplineStockOrdering').val(subdisorder);
        $('#stockitemtype').val(temtype);
        
        

    });
    // Fetch Data For Update And Delete Function End


    // Delivery Update Function Start
    $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').on('click', '#orderNewStockOrderItemUpdateNewItemBtn', function (e) {

        //datatableTableDestroy();

        var itemCode = $('#orderNewStockOrderItemDisplayItemCode').val();
        var itemName = $('#orderNewStockOrderItemDisplayItemName').val();
        var itemPrice = $('#orderNewStockOrderItemDisplayItemPrice').val();
        var itemQuantity = $('#orderNewStockOrderItemInputQuantity').val();
        //var itemComment = $('#orderNewStockOrderItemInputComment').val();
        var itemStock = $('#orderNewStockOrderItemDisplayItemStockQuantity').val();
        var order_no = $("#specimenOrderNo").val();
        var disrec = $('#disciplineStock').val();
        var subdusrec = $('#subdisciplineStock').val();
        var disorder = $('#disciplineStockOrdering').val();
        var subdisorder = $('#subdisciplineStockOrdering').val();
        var temtype = $('#stockitemtype').val();

        var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);
        var orivaluqty = parseInt(row.find('td').eq(4).text());
        var changedqty = parseInt(itemQuantity) - orivaluqty;
//        row.find('td').eq(0).text(itemCode);
//        row.find('td').eq(1).text(itemName);
//        row.find('td').eq(2).text(itemPrice);
//        row.find('td').eq(3).text(itemStock);
//        row.find('td').eq(4).text(itemQuantity);
//        row.find('td').eq(5).text(newTotal);
//        //row.find('td').eq(6).text(itemComment);
//        row.find('#disciplineStockA').val(disrec);
//        row.find('#subdisciplineStockA').val(subdusrec);
//        row.find('#disciplineStockOrderingA').val(disorder);
//        row.find('#subdisciplineStockOrderingA').val(subdisorder);
//        row.find('#stockitemtypeA').val(temtype);

        $('#POSorderNewStockOrder').modal('hide');

        //datatableTableCreate();
        var dataOrder = {
            orderNo: order_no
        };
        var datasupdate = {orderno:order_no,
            changeqty:changedqty,
            amount:newTotal,
            totalqty:itemQuantity,
            itemcode:itemCode,
            itemtype:temtype            
        };
        console.log(datasupdate);
        $.ajax({
           type: "post",
           url: "../POM/procedure_controller/item_update.jsp",
           data :datasupdate ,
           success:function(databack){
               console.log(databack);
               if(databack.trim()==="OK"){
                   $.ajax({
                        url: "../POM/procedure_controller/procedure_select.jsp",
                        type: "post",
                        data: dataOrder,
                        success: function (databack) {
                            datatableTableDestroy();
                            $('#tablepositemprepare tbody').empty();
                            if (databack.trim() !== "NO") {

                                $('#tablepositemprepare').append(databack.trim());
                                bootbox.alert({
                                    message: "Item is Updated Successfully",
                                    title: "Process Result",
                                    backdrop: true
                                });
                                datatableTableCreate();
                            }

                        }
                    });
                }else{
                    bootbox.alert({
                        message: "Item is Fail to update",
                        title: "Process Result",
                        backdrop: true
                    });
                }
           }
        });

    });
    // Delivery Update Function End        

        // Delete Order Data 
        $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').on('click', '#orderNewStockOrderItemDeleteNewItemBtn', function (e) {

            var itemCode = $('#orderNewStockOrderItemDisplayItemCode').val();
            var itemName = $('#orderNewStockOrderItemDisplayItemName').val();
            var itemPrice = $('#orderNewStockOrderItemDisplayItemPrice').val();
            var itemQuantity = $('#orderNewStockOrderItemInputQuantity').val();
            //var itemComment = $('#orderNewStockOrderItemInputComment').val();
            var itemStock = $('#orderNewStockOrderItemDisplayItemStockQuantity').val();
            var order_no = $("#specimenOrderNo").val();
            var disrec = $('#disciplineStock').val();
            var subdusrec = $('#subdisciplineStock').val();
            var disorder = $('#disciplineStockOrdering').val();
            var subdisorder = $('#subdisciplineStockOrdering').val();
            var temtype = $('#stockitemtype').val();

            var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);
            var orivaluqty = parseInt(row.find('td').eq(4).text());
            var changedqty = parseInt(itemQuantity) - orivaluqty;
            
            var datasdelete = {orderno:order_no,
                changeqty:changedqty,
                amount:newTotal,
                totalqty:itemQuantity,
                itemcode:itemCode,
                itemtype:temtype            
            };
        
                var dataOrder = {
                orderNo: order_no
            };

            console.log(datasdelete);

            $('#updateStockOrder').modal('hide');

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

                        $.ajax({
                            url: "../POM/procedure_controller/item_delete.jsp",
                            type: "post",
                            data: datasdelete,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'OK') {
                                  
                                    $.ajax({
                                    url: "../POM/procedure_controller/procedure_select.jsp",
                                    type: "post",
                                    data: dataOrder,
                                    success:function(databack){
                                        $('#tablepositemprepare tbody').empty();
                                        if(databack.trim()!== "NO"){

                                            $('#tablepositemprepare').append(databack.trim());
                                            bootbox.alert({
                                                message: "Item is Deleted Successfully",
                                                title: "Process Result",
                                                backdrop: true
                                            });
                                            datatableTableCreate();
                                            
                                        }

                                    }
                                });

                                } else {

                                    bootbox.alert({
                                        message: "Item Delete Failed",
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
        // Delete Order Data End

    function datatableTableDestroy() {

        $("#tablepositemprepare").DataTable().destroy();
    }

    function datatableTableCreate() {

        $('#tablepositemprepare').DataTable({
            "paging": true,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Data Available To Display"
            }
        });

    }
</script>


