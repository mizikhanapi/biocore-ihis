<%-- 
    Document   : distributeStockOrderDetaillBasicInfo
    Created on : Nov 16, 2017, 4:09:36 PM
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

<h4>Requester Info</h4>
<form class="form-horizontal" name="distributeStockOrderDetaillBasicInfoForm" id="distributeStockOrderDetaillBasicInfoForm">
    <div class="row">

        <div class="col-md-6">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">User ID.</label>
                <div class="col-md-7">
                    <input id="requestorUserID" name="patientpmino" type="text" placeholder="" readonly class="form-control input-md">
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Name</label>
                <div class="col-md-7">
                    <input id="requestorName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">New IC No.</label>
                <div class="col-md-7">
                    <input id="requestorIC" name="patientnic" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Gender</label>
                <div class="col-md-7">
                    <input id="requestorGender" name="patientGender" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">D.O.B</label>
                <div class="col-md-7">
                    <input id="requestorBDate" name="patientBdate" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>
            <!--Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Occupation Type</label>
                <div class="col-md-7">
                    <input id="requestorOType" name="patientBtype" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

    </div>
</form>

<br>

<hr/>

<br>

<h4>
    Order Info
    <div class="pull-right">
        <button id="distributeStockOrderDetaillNewStockButton" name="distributeStockOrderDetaillNewStockButton" class="btn btn-primary" data-toggle="modal" ><i class="fa fa-plus fa-lg"></i>&nbsp; New Item</button>
    </div>

</h4>

<form class="form-horizontal" name="distributeStockOrderDetaillNewContentOrderInfoForm" id="distributeStockOrderDetaillNewContentOrderInfoForm">
    <div class="row">

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order No.</label>
                <div class="col-md-7">
                    <input id="distributeStockOrderNo" name="distributeStockOrderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                </div>
            </div>

        </div>


        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order Date</label>
                <div class="col-md-7">
                    <input id="distributeStockOrderDate" name="distributeStockOrderDate" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>


        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Location</label>
                <div class="col-md-7">
                    <input id="distributeStockOrderLocationCode" name="distributeStockOrderLocationCode" type="text" readonly placeholder="" class="form-control input-md">
                    <input id="distributeStockOrderLocationCodeFull" name="distributeStockOrderLocationCodeFull" type="hidden" readonly placeholder="" class="form-control input-md" value="<%= locationcode%>">
                </div>
            </div>

        </div>

    </div>
</form>



<div id="distributeStockOrderDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%" id="distributeStockOrderDetailsListTable">
        <thead>
        <th>Order No</th>
        <th>Code</th>
        <th>Description</th>
        <th>Price/Pack</th>
        <th>Stock Qty</th>
        <th>Ordered Qty</th>
        <th>Released Qty</th>
        <th>Qty To Release</th>
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
            <input id="releaseTotalQuantity" name="releaseTotalQuantity" type="hidden" class="form-control input-md" readonly>
            <input id="releaseTotalQuantityChecked" name="releaseTotalQuantityChecked" type="hidden" class="form-control input-md" readonly>
            <input id="distributeStockEncounterDate" name="releaseAllDate" type="hidden" class="form-control input-md" readonly>
            <input id="distributeStockEpisodeDate" name="releaseAllDate" type="hidden" class="form-control input-md" readonly>
        </div>

        <div class="col-md-3">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Order</label>
                <div class="col-md-4">
                    <input id="releaseTotalOrder" name="releaseTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Order Final</label>
                <div class="col-md-4">
                    <input id="releaseTotalOrderChecked" name="releaseTotalOrderChecked" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="releaseGrandTotal" name="releaseGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total Final (RM)</label>
                <div class="col-md-4">
                    <input id="releaseGrandTotalChecked" name="releaseGrandTotalChecked" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

        </div>

    </form>
</div>

<hr/>

<div style="float: left;" id="distributeStockOrderDetailsReleaseButtonDiv" > 
    <button class="btn btn-default " type="button" id="btnClearOrderDetailRelease" name="btnClearOrderDetailRelease" >&nbsp; Back &nbsp;</button>
</div>

<div class="text-right" id="distributeStockOrderDetailsReleaseButtonDiv" > 
    <button class="btn btn-success " type="button" id="btnStockOrderRelease" name="btnOrderDispense" > <i class="fa fa-paper-plane-o fa-lg"></i>&nbsp; Release Stock &nbsp;</button>
</div>



<script>

    $(document).ready(function () {


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


        var episodeDate;
        var encounterDate;

        // Move to Order Details Fetch Details Start
        $('#distributeStockOrderMasterContent').off('click', '#distributeStockOrderMasterTable #moveToOrderDetailsTButton').on('click', '#distributeStockOrderMasterTable #moveToOrderDetailsTButton', function (e) {

            $('<div class="loading">Loading</div>').appendTo('body');

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataDistributeStockOrderMasterListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //Assign Array into seprated val
            var requestorUserID = arrayData[0];
            var requestorName = arrayData[13];
            var requestorIC = arrayData[14];
            var requestorGender = arrayData[18];
            var requestorBDate = arrayData[15];
            var requestorOType = arrayData[19];

            var stockOrderNo = arrayData[1];
            var stockOrderDate = arrayData[2];
            var stockEncounterDate = arrayData[2];
            var stockEpisodeDate = arrayData[2];
            var stockOrderLocationCodeName = arrayData[20];


            // Set value to the Second Tab 
            $("#requestorUserID").val(requestorUserID);
            $("#requestorName").val(requestorName);
            $("#requestorIC").val(requestorIC);
            $("#requestorGender").val(requestorGender);
            $("#requestorBDate").val(requestorBDate);
            $("#requestorOType").val(requestorOType);

            $("#distributeStockOrderNo").val(stockOrderNo);
            $("#distributeStockOrderDate").val(stockOrderDate);
            $("#distributeStockEpisodeDate").val(stockEncounterDate);
            $("#distributeStockEncounterDate").val(stockEpisodeDate);
            $("#distributeStockOrderLocationCode").val(stockOrderLocationCodeName);


            // Load Table
            loadAllergyDiagnosisOrder(stockOrderNo);


        });
        // Move to Order Details Fetch Details End



        // Move to Order Details And Load All Table Data Start
        function loadAllergyDiagnosisOrder(orderNo, pmino) {


            var dataOrder = {
                orderNo: orderNo
            };


            $.ajax({
                url: "distributeStockOrderDetailsTable.jsp",
                type: "post",
                data: dataOrder,
                timeout: 3000,
                success: function (returnOrderDetailsTableHTML) {

                    $('#distributeStockOrderDetailsListTable').html(returnOrderDetailsTableHTML);
                    datatablesDestroyAndRecreate();
                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                    $('.loading').hide();

                }
            });


        }
        // Move to Order Details And Load All Table Data End



        // Destroy And Create Datatable Start
        function datatablesDestroyAndRecreate() {


            console.log("Destroying Datatable");

            $('#distributeStockOrderDetailsListTable').DataTable().destroy();



            console.log("Creating Datatable");

            // do something after the div content has changed
            $('#distributeStockOrderDetailsListTable').DataTable({
                "paging": true,
                "searching": false,
                "info": false,
                "lengthChange": false,
                "pageLength": 5,
                "language": {
                    "emptyTable": "No Order Available To Display"
                }
            });
            

        }
        // Destroy And Create Datatable End




//======================================================================================================================================================================================//







//-------------------------------------------------------------------------------  Calculation Part Start  --------------------------------------------------------------------------------//


        // Grand Total Calculator Start
        !function calculateAllTotal() {

            // Getting Table
            var table = $("#distributeStockOrderDetailsListTable tbody");

            // Setting Variable For Overall Dispense
            var stockPrice, stockReleaseQty, product;
            var totalOrder = 0;
            var grandTotal = 0.0;
            var stockReleaseQtyTotal = 0.0;

            // Setting Variable For Selected Dispense
            var stockPriceChecked, stockReleaseQtyChecked, productChecked;
            var totalOrderChecked = 0;
            var grandTotalChecked = 0.0;
            var stockReleaseQtyTotalChecked = 0.0;


            // Calculating Data For Overall Dispense
            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');
                totalOrder = totalOrder + 1;
                stockPrice = parseFloat($tds.eq(8).text());
                stockReleaseQty = parseFloat($tds.eq(7).text());
                product = stockReleaseQty * stockPrice;


                if (isNaN(totalOrder) === true || isNaN(stockPrice) === true || isNaN(stockReleaseQty) === true || isNaN(product) === true) {
                    console.log("NaN");
                } else {
                    grandTotal = grandTotal + product;


                    stockReleaseQtyTotal = stockReleaseQtyTotal + stockReleaseQty;
                }
            });

            // Calculating Data For Selected Dispense
            table.find('tr').each(function (i) {

                var stockChecked = $(this).find("#drugDistributeChecked").is(':checked');

                if (stockChecked === true) {

                    var $tds = $(this).find('td');
                    totalOrderChecked = totalOrderChecked + 1;
                    stockPriceChecked = parseFloat($tds.eq(8).text());
                    stockReleaseQtyChecked = parseFloat($tds.eq(7).text());
                    productChecked = stockReleaseQtyChecked * stockPriceChecked;


                    if (isNaN(totalOrderChecked) === true || isNaN(stockPriceChecked) === true || isNaN(stockReleaseQtyChecked) === true || isNaN(productChecked) === true) {
                        console.log("NaN Checked");
                    } else {
                        grandTotalChecked = grandTotalChecked + productChecked;
                        stockReleaseQtyTotalChecked = stockReleaseQtyTotalChecked + stockReleaseQtyChecked;
                    }
                }
            });


            // Assigining Value For Overall Dispense
            $("#releaseTotalOrder").val(totalOrder);
            $("#releaseTotalQuantity").val(stockReleaseQtyTotal);
            $("#releaseGrandTotal").val(grandTotal.toFixed(2));

            // Assigining Value For Selected Dispense
            $("#releaseTotalOrderChecked").val(totalOrderChecked);
            $("#releaseTotalQuantityChecked").val(stockReleaseQtyTotalChecked);
            $("#releaseGrandTotalChecked").val(grandTotalChecked.toFixed(2));

            setTimeout(calculateAllTotal, 800);

        }();
        // Grand Total Calculator End


//-------------------------------------------------------------------------------  Calculation Part End  --------------------------------------------------------------------------------//





//-------------------------------------------------------------------------------  Add Stock Item Start  --------------------------------------------------------------------------------//



        // Getting Order Id And Date Start
        $('#distributeStockOrderDetailContent').off('click', '#distributeStockOrderDetaillNewStockButton').on('click', '#distributeStockOrderDetaillNewStockButton', function (e) {

            e.preventDefault();


            var distributeStockOrderNo = $("#distributeStockOrderNo").val();
            var distributeStockOrderDate = $("#distributeStockOrderDate").val();

            if (distributeStockOrderNo === "" || distributeStockOrderNo === null) {

                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                bootbox.alert("Please Select A Order First");

            } else {

                $("#orderStockDetailsID").val(distributeStockOrderNo);
                $("#orderStockDetailsDate").val(distributeStockOrderDate);

                $('#addStockOrder').modal('show');

            }

        });
        // Getting Order Id And Date End


        //JS Search in Add Stock Item Start
        $(function () {

            $("#orderStockDetailsSearchItemInput").on('keyup', function () { // everytime keyup event

                var input = $(this).val(); // We take the input value

                if (input.length >= 1) { // Minimum characters = 2 (you can change)

                    $('#orderStockDetailsSearchItemInputDisplayResult').html('<img src="libraries/LoaderIcon.gif"/>');

                    var dataFields = {'input': input}; // We pass input argument in Ajax

                    console.log(dataFields);

                    $.ajax({
                        type: "POST",
                        url: "controllerProcessDistributeStockOrder/distributeStockOrderNewOrderSearchItem.jsp", // call the jsp file ajax/auto-autocomplete.php
                        data: dataFields, // Send dataFields var
                        timeout: 3000,
                        success: function (dataBack) { // If success

                            $('#orderStockDetailsSearchItemInputDisplayResult').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>

                            $('#orderStockDetailsSearchItemInputDisplayResult li').on('click', function () { // When click on an element in the list

                                $('#orderStockDetailsSearchItemInput').val($(this).text()); // Update the field with the new element
                                $('#orderStockDetailsSearchItemInputDisplayResult').text(''); // Clear the <div id="match"></div>


                            });

                        },
                        error: function () { // if error

                            $('#orderStockDetailsSearchItemInputDisplayResult').text('No Eecord Found !');

                        }
                    });
                } else {

                    $('#orderStockDetailsSearchItemInputDisplayResult').text('Search For More Than Two Characters !!'); // If less than 2 characters, clear the <div id="match"></div>

                }
            });
        });
        //JS Search in Add Stock Item End


        //JS Get Add Stock Item Start
        $('#orderStockDetailsSearchItemInputDisplayResult').on('click', function () {

            $('<div class="loading">Loading</div>').appendTo('body');

            var id = $('#orderStockDetailsSearchItemInput').val();

            var arrayData = $('#orderStockDetailsSearchItemInput').val().split("|");

            id = arrayData[0];

            var data = {
                id: id
            };


            $.ajax({
                type: 'post',
                url: 'controllerProcessDistributeStockOrder/distributeStockOrderNewOrderSearchItemResult.jsp',
                data: data,
                success: function (reply_data) {

                    console.log(reply_data.trim());

                    var array_data = String(reply_data.trim()).split("|");

                    var itemCode = array_data[0];
                    var itemCate = array_data[1];
                    var itemName = array_data[2];
                    var itemPrice = array_data[3];
                    var itemStock = array_data[4];


                    $('#orderStockItemDisplayItemCode').val(itemCode);
                    $('#orderStockItemDisplayItemName').val(itemName);
                    $('#orderStockItemDisplayItemStockQuantity').val(itemStock);
                    $('#orderStockItemDisplayItemPrice').val(itemPrice);

                    $('#orderStockDetailsSearchItemInput').val('');

                    $('.loading').hide();

                }
            });
        });
        //JS Get Add Stock Item End


        // Add Order Start
        $('#orderStockAddButton').on('click', function (e) {

            e.preventDefault();

            var order_no = $('#orderStockDetailsID').val();
            var txn_date = $('#orderStockDetailsDate').val();

            var item_cd = $('#orderStockItemDisplayItemCode').val();
            var item_desc = $('#orderStockItemDisplayItemName').val();
            var ordered_quantity = $('#orderStockItemInputQuantity').val();
            var itemPrice = $('#orderStockItemDisplayItemPrice').val();
            var comment = $('#orderStockItemInputComment').val();

            var customer_id = $('#patientpmino').val();

            var qtyCheck = document.getElementById("orderStockItemInputQuantity").checkValidity();

            if (item_cd === "" || item_cd === null) {
                bootbox.alert("Please Search The Drug Before Continue");
            } else if (ordered_quantity === "" || ordered_quantity === null || qtyCheck === false) {
                bootbox.alert("Please Insert Drug Order Quantity In Whole Number Form");
            } else {

                var item_amt = (parseFloat(itemPrice) * parseFloat(ordered_quantity)).toFixed(2);


                var datas = {
                    order_no: order_no,
                    txn_date: txn_date,
                    item_cd: item_cd,
                    item_desc: item_desc,
                    item_amt: item_amt,
                    ordered_quantity: ordered_quantity,
                    customer_id: customer_id,
                    comment: comment
                };

                console.log(datas);

                $.ajax({
                    url: "controllerProcessDistributeStockOrder/distributeStockOrderAddItem.jsp",
                    type: "post",
                    data: datas,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $('#addStockOrder').modal('hide');

                            var dataRefres = {
                                orderNo: order_no
                            };

                            $.ajax({
                                url: "distributeStockOrderDetailsTable.jsp",
                                type: "post",
                                data: dataRefres,
                                timeout: 3000,
                                success: function (returnOrderDetailsTableHTML) {

                                    $('#distributeStockOrderDetailsListTable').html(returnOrderDetailsTableHTML);


                                    bootbox.alert({
                                        message: "Order is Added Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                    resetAddOrder();

                                    datatablesDestroyAndRecreate();


                                }
                            });



                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Order Stock Code Duplication Detected. Please Order diffrent stock item as the data already there",
                                title: "Process Result",
                                backdrop: true
                            });


                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Order Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#addStockOrder').modal('hide');
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
        $('#orderStockResetButton').on('click', function (e) {
            resetAddOrder();
        });
        // Reset Order Button End

        // Reset Order Function Start
        function resetAddOrder() {
            document.getElementById("addStockOrderForm").reset();
            document.getElementById("orderStockDetailsSearchItemInputDisplayResult").innerHTML = "";
        }
        // Reset Order Function End



//-------------------------------------------------------------------------------  Add Stock Item End  --------------------------------------------------------------------------------//






//-------------------------------------------------------------------------  Update And Delete Part Start  ----------------------------------------------------------------------------//



        // global variable declaration
        var row;


        // Get Data For Delete And Update To Load On the Modal
        $('#distributeStockOrderDetailContent').off('click', '#distributeStockOrderDetailsListTable #updateOrderDetailsTButton').on('click', '#distributeStockOrderDetailsListTable #updateOrderDetailsTButton', function (e) {

            e.preventDefault();

            row = $(this).closest("tr");
            var rowData = row.find("#dataPatientOrderDetailsListhidden").val();
            var arrayData = rowData.split("|");

            var updateStockOrderNo = arrayData[0];
            var updateStockOrderCode = arrayData[2];
            var updateStockOrderStockQuantity = parseInt(arrayData[14]);
            var updateStockOrderOrderedQuantity = arrayData[5];
            var updateStockOrderReleasedQuantity = arrayData[6];
            var updateStockOrderQtyToRelease = row.find('td').eq(7).text();
            var updateStockOrderComment = row.find('td').eq(10).text();
            var updateStockOrderStatus = row.find('td').eq(11).text();

            $("#updateStockOrderNo").val(updateStockOrderNo);
            $("#updateStockOrderCode").val(updateStockOrderCode);
            $("#updateStockOrderStockQuantity").val(updateStockOrderStockQuantity);
            $("#updateStockOrderOrderedQuantity").val(updateStockOrderOrderedQuantity);
            $("#updateStockOrderReleasedQuantity").val(updateStockOrderReleasedQuantity);
            $("#updateStockOrderComment").val(updateStockOrderComment);
            $("#updateStockOrderStatus").val(updateStockOrderStatus);


            if (updateStockOrderQtyToRelease === "0") {

                $("#updateStockOrderQtyToReleaseQuantity").val("");

            } else {

                $("#updateStockOrderQtyToReleaseQuantity").val(updateStockOrderQtyToRelease);

            }

        });
        // Get Data For Delete And Update To Load On the Modal End



        // Update Order Data
        $('#updateStockOrder').off('click', '#updateOrderMButton').on('click', '#updateStockOrderMButton', function (e) {

            e.preventDefault();

            var validRelease = document.getElementById("updateStockOrderQtyToReleaseQuantity");

            var updateStockOrderStockQuantity = $("#updateStockOrderStockQuantity").val();
            var updateStockOrderOrderedQuantity = $("#updateStockOrderOrderedQuantity").val();
            var updateStockOrderReleasedQuantity = $("#updateStockOrderReleasedQuantity").val();
            var updateStockOrderQtyToRelease = $("#updateStockOrderQtyToReleaseQuantity").val();
            var updateStockOrderComment = $("#updateStockOrderComment").val();
            var updateStockOrderStatus = $("#updateStockOrderStatus").val();

            var updateStockOrderPrice = row.find('td').eq(8).text();


            var orderTotal = parseFloat(updateStockOrderPrice) * parseFloat(updateStockOrderQtyToRelease);
            var orderStockTotalFloat = parseFloat(orderTotal).toFixed(2);


            if (updateStockOrderQtyToRelease === "" || updateStockOrderQtyToRelease === null || parseInt(updateStockOrderQtyToRelease) < 1) {

                bootbox.alert("Please Insert The Value For Quantity To Be Released That Is More That 0 !!!");

            } else if (updateStockOrderStatus === "New" || updateStockOrderStatus === null) {

                bootbox.alert("Please Select The Correct Order Status");

            } else if (validRelease.checkValidity() === false) {

                bootbox.alert("The Release Quantity Should Not Be Decimal Number. Please Choose Valid Number !!!");
                $("#updateStockOrderQtyToReleaseQuantity").val("");

            } else if ((parseInt(updateStockOrderQtyToRelease) > parseInt(updateStockOrderStockQuantity))) {

                bootbox.alert("The Dispense Quantity Is More Than Stock Quantity. Please Choose Valid Number !!!");
                $("#updateStockOrderQtyToReleaseQuantity").val("");

            } else {

                var updateStockOrderNewReleaseQuantity = row.find('td').eq(7).text(updateStockOrderQtyToRelease);
                var updateStockOrderNewTotalPrice = row.find('td').eq(9).text(orderStockTotalFloat);
                var updateStockOrderNewStatus = row.find('td').eq(11).text(updateStockOrderStatus);
                var updateStockOrderNewComment = row.find('td').eq(10).text(updateStockOrderComment);


                $('#updateStockOrder').modal('hide');

                bootbox.alert({
                    message: "Stock Order Detail is Updated Successfully",
                    title: "Process Result",
                    backdrop: true
                });

            }
        });
        // Update Order Data End



        // Delete Order Data 
        $('#updateStockOrder').on('click', '#deleteStockOrderMButton', function (e) {

            var orderNo = $("#updateStockOrderNo").val();
            var itemCode = $("#updateStockOrderCode").val();

            var data = {
                orderNo: orderNo,
                itemCode: itemCode
            };

            console.log(data);

            $('#updateStockOrder').modal('hide');

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
                            url: "controllerProcessDistributeStockOrder/distributeStockOrderDeleteItem.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $.ajax({
                                        url: "distributeStockOrderDetailsTable.jsp",
                                        type: "post",
                                        data: data,
                                        timeout: 3000,
                                        success: function (returnOrderDetailsTableHTML) {

                                            $('#distributeStockOrderDetailsListTable').html(returnOrderDetailsTableHTML);

                                            bootbox.alert({
                                                message: "Stock Order is Deleted Successfully",
                                                title: "Process Result",
                                                backdrop: true
                                            });

                                            datatablesDestroyAndRecreate();


                                        }
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Stock Order Delete Failed",
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



//-------------------------------------------------------------------------------  Update And Delete Part End  --------------------------------------------------------------------------------//





//-------------------------------------------------------------------------------  Release Stock Start  --------------------------------------------------------------------------------//



        $('#distributeStockOrderDetailContent').off('click', '#distributeStockOrderDetailsReleaseButtonDiv #btnStockOrderRelease').on('click', '#distributeStockOrderDetailsReleaseButtonDiv #btnStockOrderRelease', function (e) {

            var customer_id = $("#requestorUserID").val();
            var order_no = $("#distributeStockOrderNo").val();
            var txt_date = $("#distributeStockOrderDate").val();
            var item_amt = $("#releaseGrandTotalChecked").val();
            var quantity = $("#releaseTotalQuantityChecked").val();

            var stringMaster = customer_id + "|" + order_no + "|" + txt_date + "|" + item_amt + "|" + quantity;
            var stringDetail = "";

            var table = $("#distributeStockOrderDetailsListTable tbody");

            var drugChecked, item_cd, item_desc, item_amt, item_quantity, orderQuantity, releasedQuantity, drugStockQty, comment, status;

            var releaseOrderList = [];

            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');

                // Get The Data
                drugChecked = $(this).find("#drugDistributeChecked").is(':checked');
                item_cd = $tds.eq(2).text();
                item_desc = $tds.eq(3).text();
                item_amt = $tds.eq(9).text();
                item_quantity = $tds.eq(7).text();
                orderQuantity = $tds.eq(5).text();
                releasedQuantity = $tds.eq(6).text();
                drugStockQty = $tds.eq(4).text();
                comment = $tds.eq(10).text();
                status = $tds.eq(11).text();

                if (drugChecked === true) {


                    if (status === "New") {

                        if (parseInt(item_quantity) >= parseInt(orderQuantity)) {
                            status = "4";
                        } else if (parseInt(item_quantity) < parseInt(orderQuantity)) {
                            status = "1";
                        }

                    } else if (status === "Partial") {

                        if ((parseInt(item_quantity) + parseInt(releasedQuantity)) === parseInt(orderQuantity)) {
                            status = "4";
                        } else if ((parseInt(item_quantity) + parseInt(releasedQuantity)) < parseInt(orderQuantity)) {
                            status = "1";
                        }

                    } else if (status === "Complete Partial") {

                        status = "2";

                    } else if (status === "Full Complete") {

                        status = "3";

                    } else if (status === "Full") {

                        status = "4";

                    }

                    var updatedQtyReleased = String(parseInt(item_quantity) + parseInt(releasedQuantity));
                    var updateQtyStock = parseInt(drugStockQty) - parseInt(item_quantity);

                    releaseOrderList.push(item_cd + "^" + item_desc + "^" + updateQtyStock + "^" + orderQuantity + "^" + releasedQuantity + "^" + updatedQtyReleased + "^"
                            + item_amt + "^" + item_quantity + "^" + comment + "^" + status);
                    stringDetail = releaseOrderList.join("|");

                }

            });

            if (stringDetail === "") {

                bootbox.alert("Please Select A Stock Order Item To Be Released !!!");

            } else {


                var data = {
                    stringMaster: stringMaster,
                    stringDetail: stringDetail
                };

                console.log(data);

                bootbox.confirm({
                    message: "Are you sure want to release this order ?",
                    title: "Release Item?",
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

                            $('#myLoadingModal').modal('show');

                            $.ajax({
                                url: "controllerProcessDistributeStockOrder/distrubuteStockOrderReleaseItems.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000, // 10 seconds
                                success: function (datas) {

                                    $('#myLoadingModal').modal('hide');

                                    if (datas.trim() === "Success") {

                                        bootbox.alert("Order Release Is Successfull !!!");

                                    } else if (datas.trim() === "Failed") {

                                        bootbox.alert("Order Release Failed !!!");

                                    }

                                    resetPage();

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
            }
        });



//-------------------------------------------------------------------------------  Release Stock End  --------------------------------------------------------------------------------//




//-------------------------------------------------------------------------------  Reset Part Start  --------------------------------------------------------------------------------//



        // Clear Button Function Start
        $('#distributeStockOrderDetailContent').on('click', '#btnClearOrderDetailRelease', function (e) {
            resetPage();
        });
        // Clear Button Function End



        // Reset The Page Start
        function resetPage() {

            $("#distributeStockOrderMasterContent").load("distributeStockOrderMasterTable.jsp");

            $('#STOCK_DistributeOrderTime').prop('selectedIndex', 0);

            document.getElementById("distributeStockOrderDetaillNewContentOrderInfoForm").reset();
            document.getElementById("distributeStockOrderDetaillBasicInfoForm").reset();
            $("#distributeStockOrderDetailContent #distributeStockOrderDetailsListTableDiv").load("distributeStockOrderDetaillBasicInfo.jsp #distributeStockOrderDetailsListTableDiv");
            $('.nav-tabs a[href="#tab_default_1"]').tab('show');

        }
        // Reset The Page End




//=================================================================================  Reset Part End  ==================================================================================//



    });




//            var pmiNo = patientpmino;
//            var orderNo = patientOrderNo;
//            var orderDate = patientOrderDate;
//            episodeDate = patientEpisodeDate;
//            encounterDate = patientEncounterDate;
//
//
//        var data = {
//            pmiNo: pmiNo,
//            orderNo: orderNo,
//            orderDate: orderDate,
//            episodeDate: episodeDate,
//            encounterDate: encounterDate
//        };
//
//        $.ajax({
//            url: "controllerProcess/distributeStockOrderGetMSH_PDI_ORC_Single_File.jsp",
//            type: "post",
//            timeout: 3000,
//            data: data,
//            success: function (returnDataMSH_PDI_ORCFull) {
//
//
//                console.log(returnDataMSH_PDI_ORCFull.trim());
//
//                //Set value to the Second Tab 
//                $("#patientpmino").val(patientpmino);
//                $("#patientName").val(patientName);
//                $("#patientnic").val(patientnic);
//                $("#patientGender").val(patientGender);
//                $("#patientBdate").val(patientBdate);
//                $("#patientBtype").val(patientBtype);
//                $("#distributeStockOrderNo").val(patientOrderNo);
//                $("#distributeStockOrderDate").val(patientOrderDate);
//                $("#distributeStockOrderLocationCode").val(patientOrderLocationCodeName);
//
//
//                loadAllergyDiagnosisOrder(patientOrderNo, patientpmino);
//
//
//            }
//        });

</script>