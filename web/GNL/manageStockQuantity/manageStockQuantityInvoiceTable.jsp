<%-- 
    Document   : manageStockQuantityInvoiceTable
    Created on : Dec 11, 2017, 11:52:59 AM
    Author     : Shammugam
--%>


<div class="pull-right">
    <button id="invoiceOrderAddNewBtn" class="btn btn-primary" ><i class=" fa fa-plus" ></i>&nbsp;&nbsp;Add line</button>
</div>

<br><br><br><br><br><br><br><br>

<table class="table table-filter table-striped table-bordered" id="invoiceAddOrderDetailTable" style="width: 100%;">
    <thead>
    <th>Item code</th>
    <th>Item name</th>
    <th>Item Amount</th>
    <th>Item Stock Quantity</th>
    <th>Item Quantity To Be Added</th>
    <th>New Item Quantity</th>
</thead>
<tbody style="height: 120px;overflow-y: auto;">

</tbody>
</table>

<hr/>


<div class="row">
    <!-- content goes here -->
    <form class="form-horizontal" id="invoiceAddForm">

        <div class="col-md-4">

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Quantity :</label>
                <div class="col-md-5">
                    <input id="invoiceAddOrderTotalOrder" name="deleveryOrderTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>


        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM) :</label>
                <div class="col-md-5">
                    <input id="invoiceAddOrderGrandTotal" name="deleveryOrderGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

        </div>

    </form>
</div>

<hr/>

<div class="text-right">
    <button class="btn btn-default" type="button" id="invoiceAddOrderCancelBtn"><i class="fa fa-times" aria-hidden="true"></i>&nbsp;&nbsp;Cancel</button>
    <button type="button" class="btn btn-success" id="invoiceAddOrderUpdateStockBtn"><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;&nbsp;Update Stock</button>
</div>

<script>

    $(document).ready(function () {


        datatableTableDestroy();
        datatableTableCreate();


//-------------------------------------------------------------------------------  DataTable Start  --------------------------------------------------------------------------------//

        // Datatable Function Start
        function datatableTableDestroy() {

            $("#invoiceAddOrderDetailTable").DataTable().destroy();

        }
        // Datatable Function End

        // Datatable Function Start
        function datatableTableCreate() {

            $('#invoiceAddOrderDetailTable').DataTable({
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
        $('#invoiceOrderAddNewBtn').on('click', function () {

            var deleveryOrderFor = $('#deleveryOrderFor').val();
            var invoiceDate = $('#invoiceDate').val();
            var deliveryDate = $('#deliveryDate').val();
            var invoiceNumber = $('#invoiceNumber').val();
            var orderNumber = $('#orderNumber').val();
            var supplierDetails = $('#supplierDetails').val();
            var invoiceDescription = $('#invoiceDescription').val();

            if (deleveryOrderFor === "" || deleveryOrderFor === null) {

                bootbox.alert("Please Select Delevery Order Location");

            } else if (invoiceDate === "" || invoiceDate === null) {

                bootbox.alert("Please Select Invoice Date");

            } else if (deliveryDate === "" || deliveryDate === null) {

                bootbox.alert("Please Select Delivery Date");

            } else if (invoiceNumber === "" || invoiceNumber === null) {

                bootbox.alert("Please Insert Invoice Number");

            } else if (orderNumber === "" || orderNumber === null) {

                bootbox.alert("Please Insert Order Number");

            } else if (supplierDetails === "" || supplierDetails === null) {

                bootbox.alert("Please Select Supplier");

            } else {

                var data = {
                    invoiceNumber: invoiceNumber
                };

                $.ajax({
                    type: "POST",
                    url: "../GNL/manageStockQuantity/controllerProcess/manageStockQuantityInvoiceNoCheck.jsp", // call the jsp file ajax/auto-autocomplete.php
                    data: data, // 
                    timeout: 3000,
                    success: function (dataBack) { // If success

                        if (dataBack.trim() === "Duplicate") {

                            bootbox.alert({
                                message: "Invoice No Duplicated !! Please Choose Diffrent Invoice No !!",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else {


                            // Disable Master Inputs
                            $('#deleveryOrderFor').prop('disabled', true);
                            $('#invoiceDate').prop('disabled', true);
                            $('#deliveryDate').prop('disabled', true);
                            $('#invoiceNumber').prop('disabled', true);
                            $('#orderNumber').prop('disabled', true);
                            $('#supplierDetails').prop('disabled', true);
                            $('#invoiceDescription').prop('disabled', true);

                            // Disable Detail Inputs Except Qty And Search
                            $('#invoiceAddItemSearchInput').prop('disabled', false);
                            $('#drug_Name').prop('disabled', false);
                            $('#drug_Code').prop('disabled', true);
                            $('#drug_Price').prop('disabled', true);
                            $('#drug_Stock').prop('disabled', true);
                            $('#drug_Quantity').prop('disabled', false);


                            $('#invoiceAddOrderModal').modal('show');

                            $('#invoiceAddOrderDetailTitle').text("Add New Invoice Item");
                            $('#invoiceAddOrderDetail_btnAdd_or_btnUpdate_div').html('<button type="submit" id="invoiceAddOrderAddNewItemBtn" class="btn btn-success btn-block btn-lg" role="button">Add Items</button>');
                            $('#invoiceAddOrderDetail_btnClear_or_btnDelete_div').html('<button type="submit" id="invoiceAddOrderDetailReset" data-dismiss="modal" class="btn btn-default btn-block btn-lg" role="button">Clear</button>');

                            $('#invoiceAddOrderDetailForm')[0].reset();


                        }
                    },
                    error: function () { // if error

                    }
                });


            }

        });
        // Add Add Modal Function Start


        // Search Item Code Function Start
        //JS Search in Add Item Start
        $(function () {

            $("#invoiceAddItemSearchInput").on('keyup', function () { // everytime keyup event

                var input = $(this).val(); // We take the input value

                if (input.length >= 1) { // Minimum characters = 2 (you can change)

                    $('#invoiceAddItemSearchResult').html('<img src="libraries/LoaderIcon.gif"/>');

                    var dataFields = {
                        input: input,
                        moduleCode: $("#mainModuleCodeForGeberalPagesUsage").val()
                    }; // We pass input argument in Ajax


                    $.ajax({
                        type: "POST",
                        url: "../GNL/manageStockQuantity/controllerProcess/manageStockQuantitySearchCommon.jsp", // call the jsp file ajax/auto-autocomplete.php
                        data: dataFields, // Send dataFields var
                        timeout: 3000,
                        success: function (dataBack) { // If success

                            $('#invoiceAddItemSearchResult').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>

                            $('#invoiceAddItemSearchResult li').on('click', function () { // When click on an element in the list

                                $('#invoiceAddItemSearchInput').val($(this).text()); // Update the field with the new element
                                $('#invoiceAddItemSearchResult').text(''); // Clear the <div id="match"></div>


                            });

                        },
                        error: function () { // if error

                            $('#invoiceAddItemSearchResult').text('No Record Found !');

                        }
                    });



                } else {

                    $('#invoiceAddItemSearchResult').text('Search For More Than Two Characters !!'); // If less than 2 characters, clear the <div id="match"></div>

                }
            });
        });
        //JS Search in Add Item End


        //JS Get Add Item Start
        $('#invoiceAddItemSearchResult').on('click', function () {

            $('<div class="loading">Loading</div>').appendTo('body');

            var id = $('#invoiceAddItemSearchInput').val();

            var arrayData = $('#invoiceAddItemSearchInput').val().split("|");

            id = arrayData[0];

            var data = {
                id: id,
                moduleCode: $("#mainModuleCodeForGeberalPagesUsage").val()
            };


            $.ajax({
                type: 'post',
                url: '../GNL/manageStockQuantity/controllerProcess/manageStockQuantitySearchCommonResult.jsp',
                data: data,
                success: function (reply_data) {

                    var array_data = String(reply_data.trim()).split("|");

                    var itemCode = array_data[0];
                    var itemCate = array_data[1];
                    var itemName = array_data[2];
                    var itemPrice = array_data[3];
                    var itemStock = array_data[4];


                    $('#invoiceAddCode').val(itemCode);
                    $('#invoiceAddName').val(itemName);
                    $('#invoiceAddPriceStockQty').val(itemStock);
                    $('#invoiceAddPrice').val(itemPrice);

                    $('#invoiceAddItemSearchInput').val('');

                    $('.loading').hide();

                }
            });




        });
        //JS Get Add Item End
        // Search Item Code Function End



        // Add Item Function Start
        $('#invoiceAddOrderDetail_btnAdd_or_btnUpdate_div').off('click', '#invoiceAddOrderAddNewItemBtn').on('click', '#invoiceAddOrderAddNewItemBtn', function () {


            datatableTableDestroy();

            var table = $("#invoiceAddOrderDetailTable tbody");

            var arrayItemCode = [];

            // Calculating Data For Overall Dispense
            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');
                var drugCode = $tds.eq(0).text();
                arrayItemCode.push(drugCode);

            });

            var itemCode = $('#invoiceAddCode').val();
            var itemName = $('#invoiceAddName').val();
            var itemPrice = $('#invoiceAddPrice').val();
            var itemStock = $('#invoiceAddPriceStockQty').val();
            var itemQuantity = $('#invoiceAddPriceNewQty').val();



            if (itemCode === "" || itemCode === null) {

                bootbox.alert("Please Search An Item To Continue !!");

            } else if (itemQuantity === "" || itemQuantity === null) {

                bootbox.alert("Please Insert Item Quantity !!");

            } else {

                var arrayDrugCodeCheck = arrayItemCode.indexOf(itemCode);


                if (arrayDrugCodeCheck === -1) {

                    var newQuantity = parseInt(itemStock) + parseInt(itemQuantity);

                    $('#invoiceAddOrderDetailTable').append('<tr id="invoiceAddOrderDetailsUpdateDeleteBtn">\n\
                        <td>' + itemCode + '</td>\n\
                        <td>' + itemName + '</td>\n\
                        <td>' + itemPrice + '</td>\n\
                        <td>' + itemStock + '</td>\n\
                        <td>' + itemQuantity + '</td>\n\
                        <td>' + newQuantity + '</td>\n\
                    </tr>');

                    datatableTableCreate();

                    $('#invoiceAddOrderModal').modal('hide');

                    bootbox.alert({
                        message: "Item is Added Successful",
                        title: "Process Result",
                        backdrop: true
                    });

                } else {

                    bootbox.alert("Item Code Duplicated!! Please Choose Different Code!!");

                    $('#invoiceAddOrderDetailTable').DataTable({
                        "paging": true,
                        "lengthChange": false,
                        "pageLength": 5,
                        "language": {
                            "emptyTable": "No Data Available To Display"
                        }
                    });

                }

            }
        });
        // Add Item Function End




//-------------------------------------------------------------------------------  Add Part End  --------------------------------------------------------------------------------//





//-------------------------------------------------------------------------------  Update And Delete Part Start  --------------------------------------------------------------------------------//



        // global variable declaration
        var row;

        // Fetch Data For Update And Delete Function Start
        $('#invoiceContentAddDetail').off('click', '#invoiceAddOrderDetailTable #invoiceAddOrderDetailsUpdateDeleteBtn').on('click', '#invoiceAddOrderDetailTable #invoiceAddOrderDetailsUpdateDeleteBtn', function (e) {

            row = $(this).closest("tr");

            $('#invoiceAddOrderModal').modal('show');

            $('#invoiceAddOrderDetailTitle').text("Update Or Delete Item");
            $('#invoiceAddOrderDetail_btnAdd_or_btnUpdate_div').html('<button type="submit" id="invoiceAddOrderDetailUpdateItemBtn" class="btn btn-success btn-block btn-lg" role="button">Update</button>');
            $('#invoiceAddOrderDetail_btnClear_or_btnDelete_div').html('<button type="submit" id="invoiceAddOrderDetailDeleteItemBtn" class="btn btn-danger btn-block btn-lg" role="button">Delete</button>');


            var itemCode = row.find('td').eq(0).text();
            var itemName = row.find('td').eq(1).text();
            var itemPrice = row.find('td').eq(2).text();
            var itemStock = row.find('td').eq(3).text();
            var itemQuantity = row.find('td').eq(4).text();


            $('#invoiceAddCode').val(itemCode);
            $('#invoiceAddName').val(itemName);
            $('#invoiceAddPrice').val(itemPrice);
            $('#invoiceAddPriceStockQty').val(itemStock);
            $('#invoiceAddPriceNewQty').val(itemQuantity);

            $('#invoiceAddItemSearchInput').prop('disabled', true);
            $('#invoiceAddCode').prop('disabled', true);
            $('#invoiceAddName').prop('disabled', true);
            $('#invoiceAddPrice').prop('disabled', true);
            $('#invoiceAddPriceStockQty').prop('disabled', true);
            $('#invoiceAddPriceNewQty').prop('disabled', false);


        });
        // Fetch Data For Update And Delete Function End


        // Delivery Update Function Start
        $('#invoiceAddOrderDetail_btnAdd_or_btnUpdate_div').on('click', '#invoiceAddOrderDetailUpdateItemBtn', function (e) {

            datatableTableDestroy();

            var itemCode = $('#invoiceAddCode').val();
            var itemName = $('#invoiceAddName').val();
            var itemPrice = $('#invoiceAddPrice').val();
            var itemStock = $('#invoiceAddPriceStockQty').val();
            var itemQuantity = $('#invoiceAddPriceNewQty').val();
            var newQuan = parseInt(itemStock) + parseInt(itemQuantity);

            row.find('td').eq(0).text(itemCode);
            row.find('td').eq(1).text(itemName);
            row.find('td').eq(2).text(itemPrice);
            row.find('td').eq(3).text(itemStock);
            row.find('td').eq(4).text(itemQuantity);
            row.find('td').eq(5).text(newQuan);

            $('#invoiceAddOrderModal').modal('hide');

            datatableTableCreate();

            bootbox.alert({
                message: "Item is Updated Successfully",
                title: "Process Result",
                backdrop: true
            });

        });
        // Delivery Update Function End


        // Delivery Delete Function Start
        $('#invoiceAddOrderDetail_btnClear_or_btnDelete_div').on('click', '#invoiceAddOrderDetailDeleteItemBtn', function (e) {

            datatableTableDestroy();

            row.remove();

            $('#invoiceAddOrderModal').modal('hide');

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
        $('#invoiceAddOrderUpdateStockBtn').on('click', function () {


            var invoice_noCheck = $('#invoiceNumber').val();
            var itemCheck = $('#invoiceAddOrderGrandTotal').val();


            if (invoice_noCheck === "") {

                bootbox.alert("Invoice Detail is not Complete !!!");

            } else if (itemCheck === "" || itemCheck === null || itemCheck === "0.00") {

                bootbox.alert("Please add at least an item to update the stock !!!");

            } else {

                // Getting Table
                var table = $("#invoiceAddOrderDetailTable tbody");

                // Setting Variable For Overall Dispense
                var itemCode, itemName, stringDetail = "";
                var itemPrice, itemNewQty, itemNewQtyOver, product;
                var grandTotal = 0.0;
                var itemQtyTotal = 0;

                var releaseOrderList = [];

                // Calculating Data For Overall Dispense
                table.find('tr').each(function (i) {

                    var $tds = $(this).find('td');

                    itemCode = $tds.eq(0).text();
                    itemName = $tds.eq(1).text();
                    itemPrice = parseFloat($tds.eq(2).text());
                    itemNewQty = parseFloat($tds.eq(4).text());
                    itemNewQtyOver = parseFloat($tds.eq(5).text());
                    product = itemPrice * itemNewQty;


                    if (isNaN(itemPrice) === true || isNaN(itemNewQty) === true || isNaN(product) === true) {

                        console.log("NaN");

                    } else {

                        releaseOrderList.push(itemCode + "^" + itemName + "^" + itemPrice + "^" + product + "^" + itemNewQty + "^" + itemNewQtyOver);
                        stringDetail = releaseOrderList.join("|");
                        grandTotal = grandTotal + product;
                        itemQtyTotal = itemQtyTotal + itemNewQty;

                    }

                });


                bootbox.confirm({
                    message: "Are you sure want to update stock quantity for this items ?",
                    title: "Update Item Stock Quantty ?",
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

                            var invoiceOrderFor = $('#invoiceOrderFor').val();
                            var invoice_no = $('#invoiceNumber').val();
                            var order_no = $('#orderNumber').val();
                            var vendor_id = $('#supplierDetails').val();
                            var invoice_date = $('#invoiceDate').val();
                            var delivery_date = $('#deliveryDate').val();
                            var description = $('#invoiceDescription').val();
                            var total_amt = $('#invoiceAddOrderGrandTotal').val();
                            var quantity = $('#invoiceAddOrderTotalOrder').val();

                            var data = {
                                invoiceOrderFor: invoiceOrderFor,
                                invoice_no: invoice_no,
                                order_no: order_no,
                                vendor_id: vendor_id,
                                invoice_date: invoice_date + " 00:00:00",
                                delivery_date: delivery_date + " 00:00:00",
                                description: description,
                                total_amt: total_amt,
                                quantity: quantity,
                                stringDetail: stringDetail
                            };

                            console.log(data);

                            $.ajax({
                                url: "../GNL/manageStockQuantity/controllerProcess/manageStockQuantityUpdateItemStock.jsp",
                                type: "post",
                                data: data,
                                timeout: 3000,
                                success: function (returnDate) {

                                    if (returnDate.trim() === 'Success') {

                                        var data = {
                                            moduleCode: $("#mainModuleCodeForGeberalPagesUsage").val()
                                        };

                                        $.ajax({
                                            type: "POST",
                                            url: "../GNL/manageStockQuantity/manageStockQuantityMasterTable.jsp", // call the jsp file ajax/auto-autocomplete.php
                                            data: data, // 
                                            timeout: 3000,
                                            success: function (dataBack) { // If success

                                                $("#invoiceContentMaster").html(dataBack);
                                                $("#invoiceContentAddMaster").load("../GNL/manageStockQuantity/manageStockQuantityBasicInfo.jsp");
                                                $("#invoiceContentAddDetail").load("../GNL/manageStockQuantity/manageStockQuantityInvoiceTable.jsp");

                                                bootbox.alert({
                                                    message: "Item Stock Is Updated Successfully",
                                                    title: "Process Result",
                                                    backdrop: true
                                                });

                                                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                                            },
                                            error: function () { // if error

                                            }
                                        });


                                    } else if (returnDate.trim() === 'Failed') {

                                        bootbox.alert({
                                            message: "Item Stock Update Failed",
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
        // Search Reset Button Function End


//-------------------------------------------------------------------------------  Update Stock Part End  --------------------------------------------------------------------------------//





//-------------------------------------------------------------------------------  Calculator Part Start  --------------------------------------------------------------------------------//


        // Grand Total Calculator Start
        !function calculateAllTotal() {

            // Getting Table
            var table = $("#invoiceAddOrderDetailTable tbody");

            // Setting Variable For Overall Dispense
            var itemPrice, itemNewQty, product;
            var grandTotal = 0.0;
            var itemQtyTotal = 0;

            // Calculating Data For Overall Dispense
            table.find('tr').each(function (i) {

                var $tds = $(this).find('td');

                itemPrice = parseFloat($tds.eq(2).text());
                itemNewQty = parseFloat($tds.eq(4).text());
                product = itemPrice * itemNewQty;


                if (isNaN(itemPrice) === true || isNaN(itemNewQty) === true || isNaN(product) === true) {

                    console.log("NaN");

                } else {

                    grandTotal = grandTotal + product;
                    itemQtyTotal = itemQtyTotal + itemNewQty;

                }

            });

            // Assigining Value For Overall Dispense
            $("#invoiceAddOrderTotalOrder").val(itemQtyTotal);
            $("#invoiceAddOrderGrandTotal").val(grandTotal.toFixed(2));

            setTimeout(calculateAllTotal, 800);

        }();
        // Grand Total Calculator End


//-------------------------------------------------------------------------------  Calculator Part End  --------------------------------------------------------------------------------//






//-------------------------------------------------------------------------------  Cancel Part Start  --------------------------------------------------------------------------------//


        // Cancel Button Function Start
        $('#invoiceContentAddDetail').off('click', '#invoiceAddOrderCancelBtn').on('click', '#invoiceAddOrderCancelBtn', function (e) {

            var data = {
                moduleCode: $("#mainModuleCodeForGeberalPagesUsage").val()
            };

            $.ajax({
                type: "POST",
                url: "../GNL/manageStockQuantity/manageStockQuantityMasterTable.jsp", // call the jsp file ajax/auto-autocomplete.php
                data: data, // 
                timeout: 3000,
                success: function (dataBack) { // If success

                    $("#invoiceContentMaster").html(dataBack);
                    
                    $("#invoiceContentAddMaster").load("../GNL/manageStockQuantity/manageStockQuantityBasicInfo.jsp");
                    $("#invoiceContentAddDetail").load("../GNL/manageStockQuantity/manageStockQuantityInvoiceTable.jsp");

                    $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                },
                error: function () { // if error

                }
            });


        });
        // Cancel Button Function End


//-------------------------------------------------------------------------------  Cancel Part End  --------------------------------------------------------------------------------//



    });

</script>