<%-- 
    Document   : orderStockDetailTable
    Created on : Dec 13, 2017, 3:44:04 PM
    Author     : Shammugam
--%>

<br><br>

<table class="table table-filter table-striped table-bordered" id="orderNewStockOrderItemDetailsTable">
    <thead>
    <th>Item Code</th>
    <th>Item Name</th>
    <th>Item Price</th>
    <th>Stock Quantity</th>
    <th>Item Quantity</th>
    <th>Total Price</th>
    <th>Comment</th>
</thead>
<tbody style="height: 120px;overflow-y: auto;">

</tbody>
</table>

<hr/>


<div class="row">
    <!-- content goes here -->
    <form class="form-horizontal" id="orderNewStockOrderItemDetailsForm">

        <div class="col-md-4">

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Quantity :</label>
                <div class="col-md-5">
                    <input id="orderNewStockOrderItemDetailsFormTotalQuantity" name="orderNewStockOrderItemDetailsFormTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>


        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM) :</label>
                <div class="col-md-5">
                    <input id="orderNewStockOrderItemDetailsFormGrandTotal" name="orderNewStockOrderItemDetailsFormGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

        </div>

    </form>
</div>

<hr/>

<div class="text-right">
    <button class="btn btn-default" type="button" id="orderNewStockOrderItemCancelBtn"><i class="fa fa-times fa-lg" aria-hidden="true"></i>&nbsp;&nbsp; Cancel Order &nbsp;</button>
    <button type="button" class="btn btn-success" id="orderNewStockOrderItemSubmitOrderBtn"><i class="fa fa-shopping-cart fa-lg" aria-hidden="true"></i>&nbsp;&nbsp; Submit Order &nbsp;</button>
</div>

<script>


    $(document).ready(function () {


        datatableTableDestroy();
        datatableTableCreate();

//-------------------------------------------------------------------------------  DataTable Start  --------------------------------------------------------------------------------//

        // Datatable Function Start
        function datatableTableDestroy() {

            $("#orderNewStockOrderItemDetailsTable").DataTable().destroy();
        }

        function datatableTableCreate() {

            $('#orderNewStockOrderItemDetailsTable').DataTable({
                "paging": true,
                "lengthChange": false,
                "pageLength": 5,
                "language": {
                    "emptyTable": "No Data Available To Display"
                }
            });

        }
        // Datatable Function End

//-------------------------------------------------------------------------------  DataTable End  --------------------------------------------------------------------------------//



//-------------------------------------------------------------------------------  Add Part Start  --------------------------------------------------------------------------------//


        // Add Add Modal Function Start
        // Add Item Function Start
        $('#orderStockContentAddMaster').on('click', '#addNewOrderStockItemButton', function () {

            $('#orderNewStockOrderModalTitle').text("Add New Item");
            $('#orderNewStockOrderSearchItemInput').prop('disabled', false);
            $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').html('<button type="submit" id="orderNewStockOrderItemAddNewItemBtn" class="btn btn-success btn-block btn-lg" role="button">Add Items</button>');
            $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').html('<button type="button" id="orderNewStockOrderItemReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Clear</button>');

            $('#orderNewStockOrderModalFrom')[0].reset();

        });
        // Add Add Modal Function Start


        // Search Item Code Function Start
        //JS Search in Add Item Start
        $(function () {

            $("#orderNewStockOrderSearchItemInput").on('keyup', function () { // everytime keyup event

                var input = $(this).val(); // We take the input value

                if (input.length >= 1) { // Minimum characters = 2 (you can change)

                    $('#orderNewStockOrderSearchItemInputDisplayResult').html('<img src="libraries/LoaderIcon.gif"/>');

                    var dataFields = {'input': input}; // We pass input argument in Ajax

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

            id = arrayData[0];

            var data = {
                id: id
            };


            $.ajax({
                type: 'post',
                url: '../GNL/StockOrder/controllerProcess/orderStockSearchItemResult.jsp',
                data: data,
                success: function (reply_data) {

                    var array_data = String(reply_data.trim()).split("|");

                    var itemCode = array_data[0];
                    var itemCate = array_data[1];
                    var itemName = array_data[2];
                    var itemPrice = array_data[3];
                    var itemStock = array_data[4];


                    $('#orderNewStockOrderItemDisplayItemCode').val(itemCode);
                    $('#orderNewStockOrderItemDisplayItemName').val(itemName);
                    $('#orderNewStockOrderItemDisplayItemStockQuantity').val(itemStock);
                    $('#orderNewStockOrderItemDisplayItemPrice').val(itemPrice);

                    $('#orderNewStockOrderSearchItemInput').val('');

                    $('.loading').hide();

                }
            });
        });
        //JS Get Add Item End
        // Search Item Code Function End

        // Cate Reset Button Start
        $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').on('click', '#orderNewStockOrderItemReset', function (e) {
            $('#orderNewStockOrderModalFrom')[0].reset();
            $('#orderNewStockOrderSearchItemInputDisplayResult').html('');
        });
        // Cate Reset Button End


        // Add Item Function Start
        $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').on('click', '#orderNewStockOrderItemAddNewItemBtn', function () {


            var table = $("#orderNewStockOrderItemDetailsTable tbody");

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
            var itemComment = $('#orderNewStockOrderItemInputComment').val();
            var itemStock = $('#orderNewStockOrderItemDisplayItemStockQuantity').val();



            if (itemCode === "" || itemCode === null) {

                bootbox.alert("Please Search An Item To Continue !!!");

            } else if (itemQuantity === "" || itemQuantity === null) {

                bootbox.alert("Please Insert Order Quantity !!!");

            } else if (itemComment === "" || itemComment === null) {

                bootbox.alert("Please Insert Order Comment !!!");

            } else if (parseInt(itemQuantity) > parseInt(itemStock)) {

                bootbox.alert("Please Insert Order Quantity Less Than Stock Quantity That Is Available !!!");

            } else {


                datatableTableDestroy();

                var arrayItemCodeCheck = arrayItemCode.indexOf(itemCode);


                if (arrayItemCodeCheck === -1) {

                    var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);

                    $('#orderNewStockOrderItemDetailsTable').append('<tr id="addNewStockOrderDetailsUpdateDeleteBtn">\n\
                        <td>' + itemCode + '</td>\n\
                        <td>' + itemName + '</td>\n\
                        <td>' + itemPrice + '</td>\n\
                        <td>' + itemStock + '</td>\n\
                        <td>' + itemQuantity + '</td>\n\
                        <td>' + newTotal + '</td>\n\
                        <td>' + itemComment + '</td>\n\
                    </tr>');

                    // datatableTable();

                    $('#orderNewStockOrder').modal('hide');

                    bootbox.alert({
                        message: "Item is Added Successful",
                        title: "Process Result",
                        backdrop: true
                    });

                    datatableTableCreate();

                } else {

                    bootbox.alert("Item Code Duplicated!! Please Choose Different Code!!");

                    datatableTableCreate();

                }

            }
        });
        // Add Item Function End


//-------------------------------------------------------------------------------  Add Part End  --------------------------------------------------------------------------------//






//-------------------------------------------------------------------------------  Update And Delete Part Start  --------------------------------------------------------------------------------//



        // global variable declaration
        var row;

        // Fetch Data For Update And Delete Function Start
        $('#orderStockContentAddDetail').off('click', '#orderNewStockOrderItemDetailsTable #addNewStockOrderDetailsUpdateDeleteBtn').on('click', '#orderNewStockOrderItemDetailsTable #addNewStockOrderDetailsUpdateDeleteBtn', function (e) {

            row = $(this).closest("tr");

            $('#orderNewStockOrder').modal('show');

            $('#orderNewStockOrderModalTitle').text("Update Or Delete Item");
            $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').html('<button type="submit" id="orderNewStockOrderItemUpdateNewItemBtn" class="btn btn-success btn-block btn-lg" role="button">Update</button>');
            $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').html('<button type="submit" id="orderNewStockOrderItemDeleteNewItemBtn" class="btn btn-danger btn-block btn-lg" role="button">Delete</button>');

            $('#orderNewStockOrderSearchItemInput').prop('disabled', true);

            var itemCode = row.find('td').eq(0).text();
            var itemName = row.find('td').eq(1).text();
            var itemPrice = row.find('td').eq(2).text();
            var itemStock = row.find('td').eq(3).text();
            var itemQuantity = row.find('td').eq(4).text();
            var itemComment = row.find('td').eq(6).text();

            $('#orderNewStockOrderItemDisplayItemCode').val(itemCode);
            $('#orderNewStockOrderItemDisplayItemName').val(itemName);
            $('#orderNewStockOrderItemDisplayItemPrice').val(itemPrice);
            $('#orderNewStockOrderItemDisplayItemStockQuantity').val(itemStock);
            $('#orderNewStockOrderItemInputQuantity').val(itemQuantity);
            $('#orderNewStockOrderItemInputComment').val(itemComment);


        });
        // Fetch Data For Update And Delete Function End


        // Delivery Update Function Start
        $('#orderNewStockOrderItem_btnAdd_or_btnUpdate_div').on('click', '#orderNewStockOrderItemUpdateNewItemBtn', function (e) {

            datatableTableDestroy();

            var itemCode = $('#orderNewStockOrderItemDisplayItemCode').val();
            var itemName = $('#orderNewStockOrderItemDisplayItemName').val();
            var itemPrice = $('#orderNewStockOrderItemDisplayItemPrice').val();
            var itemQuantity = $('#orderNewStockOrderItemInputQuantity').val();
            var itemComment = $('#orderNewStockOrderItemInputComment').val();
            var itemStock = $('#orderNewStockOrderItemDisplayItemStockQuantity').val();

            var newTotal = (parseFloat(itemPrice) * parseInt(itemQuantity)).toFixed(2);

            row.find('td').eq(0).text(itemCode);
            row.find('td').eq(1).text(itemName);
            row.find('td').eq(2).text(itemPrice);
            row.find('td').eq(3).text(itemStock);
            row.find('td').eq(4).text(itemQuantity);
            row.find('td').eq(5).text(newTotal);
            row.find('td').eq(6).text(itemComment);

            $('#orderNewStockOrder').modal('hide');

            datatableTableCreate();

            bootbox.alert({
                message: "Item is Updated Successfully",
                title: "Process Result",
                backdrop: true
            });

        });
        // Delivery Update Function End


        // Delivery Delete Function Start
        $('#orderNewStockOrderItem_btnCancel_or_btnDelete_div').on('click', '#orderNewStockOrderItemDeleteNewItemBtn', function (e) {

            datatableTableDestroy();

            row.remove();

            $('#orderNewStockOrder').modal('hide');

            datatableTableCreate();

            bootbox.alert({
                message: "Item is Deleted Successfully",
                title: "Process Result",
                backdrop: true
            });

        });
        // Delivery Delete Function End



//-------------------------------------------------------------------------------  Update And Delete Part End  --------------------------------------------------------------------------------//




//-------------------------------------------------------------------------------  Update Stock Part Start  --------------------------------------------------------------------------------//


        // Update Stock Button Function Start
        $('#orderStockContentAddDetail').off('click', '#orderNewStockOrderItemSubmitOrderBtn').on('click', '#orderNewStockOrderItemSubmitOrderBtn', function (e) {


            var itemCheck = $('#orderNewStockOrderItemDetailsFormGrandTotal').val();


            if (itemCheck === "" || itemCheck === null || itemCheck === "0.00") {

                bootbox.alert("Please Add at Least An Item To Make A Stock Order !!!");

            } else {

                // Getting Table
                var table = $("#orderNewStockOrderItemDetailsTable tbody");

                // Setting Variable For Overall Dispense
                var itemCode, itemName, itemComment, stringDetail = "";
                var itemPrice, itemQty, product;

                var stockOrderList = [];

                // Calculating Data For Overall Dispense
                table.find('tr').each(function (i) {

                    var $tds = $(this).find('td');

                    itemCode = $tds.eq(0).text();
                    itemName = $tds.eq(1).text();
                    itemPrice = parseFloat($tds.eq(2).text());
                    itemQty = parseFloat($tds.eq(4).text());
                    itemComment = $tds.eq(6).text();
                    product = itemPrice * itemQty;


                    if (isNaN(itemPrice) === true || isNaN(itemQty) === true || isNaN(product) === true) {

                        console.log("NaN");

                    } else {

                        stockOrderList.push(itemCode + "^" + itemName + "^" + itemPrice + "^" + product + "^" + itemQty + "^" + itemComment);
                        stringDetail = stockOrderList.join("|");

                    }

                });


                $.ajax({
                    url: '../GNL/StockOrder/controllerProcess/orderStockGetSeqNo.jsp',
                    type: "get",
                    timeout: 3000,
                    success: function (returnSeqNo) {

                        bootbox.confirm({
                            message: "Are you sure want to add stock order for this items ?",
                            title: "Add Stock Order ?",
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

                                    $('.loading').show();

                                    var total_amt = $('#orderNewStockOrderItemDetailsFormGrandTotal').val();
                                    var quantity = $('#orderNewStockOrderItemDetailsFormTotalQuantity').val();

                                    var data = {
                                        order_no: returnSeqNo.trim(),
                                        total_amt: total_amt,
                                        quantity: quantity,
                                        stringDetail: stringDetail
                                    };

                                    console.log(data);

                                    $.ajax({
                                        url: "../GNL/StockOrder/controllerProcess/orderStockOverall.jsp",
                                        type: "post",
                                        data: data,
                                        timeout: 3000,
                                        success: function (returnMessage) {

                                            $('.loading').hide();

                                            console.log(returnMessage);

                                            if (returnMessage.trim() === 'Success') {

                                                bootbox.alert({
                                                    message: "Adding Stock Order Is Successfully",
                                                    title: "Process Result",
                                                    backdrop: true
                                                });

                                                $("#orderStockContentAddMaster").load("../GNL/StockOrder/orderStockBasicInfo.jsp");
                                                $("#orderStockContentAddDetail").load("../GNL/StockOrder/orderStockDetailTable.jsp");

                                                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                                            } else if (returnMessage.trim() === 'Failed') {

                                                bootbox.alert({
                                                    message: "Adding Stock Order Failed",
                                                    title: "Process Result",
                                                    backdrop: true
                                                });

                                            }
                                        }
                                    });

                                } else {
                                    console.log("Process Is Canceled");
                                }

                            }
                        });


                    }
                });




            }


        });
        // Search Reset Button Function End


//-------------------------------------------------------------------------------  Update Stock Part End  --------------------------------------------------------------------------------//




//-------------------------------------------------------------------------------  Calculator Part Start  --------------------------------------------------------------------------------//


        // Grand Total Calculator Start
        !function calculateAllTotal() {

            // Getting Table
            var table = $("#orderNewStockOrderItemDetailsTable tbody");

            // Setting Variable For Overall Dispense
            var itemPrice, itemQty, product;
            var grandTotal = 0.0;
            var itemQtyTotal = 0;

            // Calculating Data For Overall Dispense
            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');

                itemPrice = parseFloat($tds.eq(2).text());
                itemQty = parseFloat($tds.eq(4).text());
                product = itemPrice * itemQty;

                if (isNaN(itemPrice) === true || isNaN(itemQty) === true || isNaN(product) === true) {

                    console.log("NaN");

                } else {

                    grandTotal = grandTotal + product;
                    itemQtyTotal = itemQtyTotal + itemQty;

                }

            });

            // Assigining Value For Overall Dispense
            $("#orderNewStockOrderItemDetailsFormTotalQuantity").val(itemQtyTotal);
            $("#orderNewStockOrderItemDetailsFormGrandTotal").val(grandTotal.toFixed(2));

            setTimeout(calculateAllTotal, 800);

        }();
        // Grand Total Calculator End


//-------------------------------------------------------------------------------  Calculator Part End  --------------------------------------------------------------------------------//






//-------------------------------------------------------------------------------  Cancel Part Start  --------------------------------------------------------------------------------//


        // Cancel Button Function Start
        $('#orderStockContentAddDetail').off('click', '#orderNewStockOrderItemCancelBtn').on('click', '#orderNewStockOrderItemCancelBtn', function (e) {

            $("#orderStockContentAddMaster").load("../GNL/StockOrder/orderStockBasicInfo.jsp");
            $("#orderStockContentAddDetail").load("../GNL/StockOrder/orderStockDetailTable.jsp");

        });
        // Cancel Button Function End


//-------------------------------------------------------------------------------  Cancel Part End  --------------------------------------------------------------------------------//



    });


</script>