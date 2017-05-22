<%-- 
    Document   : deleveryOrderTable
    Created on : May 10, 2017, 1:23:40 AM
    Author     : Shammugam
--%>



<div class="pull-right">
    <button id="deleveryOrderAddNewBtn" class="btn btn-primary" ><i class=" fa fa-plus" ></i>&nbsp;&nbsp;Add line</button>
</div>

<br><br><br><br><br><br><br><br>

<table class="table table-filter table-striped table-bordered" id="deliveryOrderDetailTable">
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
    <form class="form-horizontal" id="addForm">

        <div class="col-md-4">

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Total Quantity :</label>
                <div class="col-md-6">
                    <input id="deleveryOrderTotalOrder" name="deleveryOrderTotalOrder" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>


        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput">Grand Total (RM) :</label>
                <div class="col-md-6">
                    <input id="deleveryOrderGrandTotal" name="deleveryOrderGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" readonly>
                </div>
            </div>

        </div>

    </form>
</div>

<hr/>

<div class="text-right">
    <button class="btn btn-default" type="button" id="deleveryOrderCancelBtn"><i class="fa fa-times" aria-hidden="true"></i>&nbsp;&nbsp;Cancel</button>
    <button type="button" class="btn btn-success" id="deleveryOrderUpdateStockBtn"><i class="fa fa-refresh" aria-hidden="true"></i>&nbsp;&nbsp;Update Stock</button>
</div>



<script>

    //
    function datatableTable() {
        $("#deliveryOrderDetailTable").DataTable().destroy();

        $('#deliveryOrderDetailTable').DataTable({
            "paging": true,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Data Available To Display"
            }
        });
    }
    //

    // Add Add Modal Function Start
    $('#deleveryOrderAddNewBtn').on('click', function () {

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

            $('#deleveryOrderFor').prop('disabled', true);
            $('#invoiceDate').prop('disabled', true);
            $('#deliveryDate').prop('disabled', true);
            $('#invoiceNumber').prop('disabled', true);
            $('#orderNumber').prop('disabled', true);
            $('#supplierDetails').prop('disabled', true);
            $('#invoiceDescription').prop('disabled', true);


            $('#drug_Name').prop('disabled', false);
            $('#drug_Code').prop('disabled', true);
            $('#drug_Price').prop('disabled', true);
            $('#drug_Stock').prop('disabled', true);
            $('#drug_Quantity').prop('disabled', false);



            $('#deleveryOrderModal').modal('show');

            $('#deleveryOrderDetailTitle').text("Add New Item");
            $('#deleveryOrderDetail_btnAdd_or_btnUpdate_div').html('<button type="submit" id="deleveryOrderAddNewItemBtn" class="btn btn-success btn-block btn-lg" role="button">Add</button>');
            $('#deleveryOrderDetail_btnClear_or_btnDelete_div').html('<button type="submit" id="deleveryOrderDetailReset" data-dismiss="modal" class="btn btn-default btn-block btn-lg" role="button">Clear</button>');

            $('#deleveryOrderDetailForm')[0].reset();
        }

    });
    // Add Add Modal Function Start


    // Search Reset Button Function Start
    $('#deleveryOrderCancelBtn').on('click', function () {
        $("#deleveryOrderTopContent").load("deleveryOrderBasic.jsp");
        $("#deleveryOrderBottomContent").load("deleveryOrderTable.jsp");
    });
    // Search Reset Button Function End


    // Search Drug Code Function Start
    $("#drug_Name").on('keyup', function () { // everytime keyup event
        var input = $(this).val(); // We take the input value

        if (input.length >= 1) { // Minimum characters = 2 (you can change)
            $('#drug_Name_Search').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
            var dataFields = {input: input}; // We pass input argument in Ajax
            $.ajax({
                type: "POST",
                url: "deleveryOrderSearchDrugCode.jsp", // call the php file ajax/tuto-autocomplete.php
                data: dataFields, // Send dataFields var
                timeout: 3000,
                success: function (dataBack) { // If success

                    $('#drug_Name_Search').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                    $('#matchListDrugCode li').on('click', function () { // When click on an element in the list
                        //$('#masterCode2').text($(this).text()); // Update the field with the new element
                        $('#drug_Name').val($(this).text());
                        $('#drug_Name_Search').text(''); // Clear the <div id="match"></div>

                        var id = $('#drug_Name').val();
                        $.ajax({
                            type: 'post',
                            url: 'deleveryOrderSearchDrugCodeResult.jsp',
                            data: {'id': id},
                            success: function (reply_data) {

                                var array_data = String(reply_data.trim()).split("|");

                                var dtoCode = array_data[0];
                                var dtoPrice = array_data[1];
                                var dtoStock = array_data[2];

                                $('#drug_Code').val(dtoCode);
                                $('#drug_Price').val(dtoPrice);
                                $('#drug_Stock').val(dtoStock);

                                $('.loading').hide();

                            }
                        });
                    });

                },
                error: function () { // if error
                    $('#drug_Name_Search').text('Problem!');
                }
            });
        } else {
            $('#drug_Name_Search').text(''); // If less than 2 characters, clear the <div id="match"></div>
        }

    });
    // Search Drug Code Function End


    // Add Drug Code Function Start
    $('#deleveryOrderDetail_btnAdd_or_btnUpdate_div').on('click', '#deleveryOrderAddNewItemBtn', function () {

        $("#deliveryOrderDetailTable").DataTable().destroy();

        var table = $("#deliveryOrderDetailTable tbody");

        var arrayDrugCode = [];

        // Calculating Data For Overall Dispense
        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');
            var drugCode = $tds.eq(0).text();
            arrayDrugCode.push(drugCode);
            console.log(drugCode);
        });


        var drug_Name = $('#drug_Name').val();
        var drug_Code = $('#drug_Code').val();
        var drug_Price = $('#drug_Price').val();
        var drug_Stock = $('#drug_Stock').val();
        var drug_Quantity = $('#drug_Quantity').val();



        if (drug_Name === "" || drug_Name === null) {
            bootbox.alert("Please Search Drug Name");
        } else if (drug_Code === "" || drug_Code === null) {
            bootbox.alert("Please Search Drug Name");
        } else if (drug_Price === "" || drug_Price === null) {
            bootbox.alert("Please Search Drug Name");
        } else if (drug_Quantity === "" || drug_Quantity === null) {
            bootbox.alert("Please Insert Drug Quantity");
        } else {


            console.log(arrayDrugCode);
            var arrayDrugCodeCheck = arrayDrugCode.indexOf(drug_Code);


            if (arrayDrugCodeCheck === -1) {

                var newQuantity = parseInt(drug_Stock) + parseInt(drug_Quantity);

                $('#deliveryOrderDetailTable').append('<tr id="deleveryOrderUpdateDeleteBtn">\n\
            <td>' + drug_Code + '</td>\n\
            <td>' + drug_Name + '</td>\n\
            <td>' + drug_Price + '</td>\n\
            <td>' + drug_Stock + '</td>\n\
            <td>' + drug_Quantity + '</td>\n\
            <td>' + newQuantity + '</td>\n\
        </tr>');

                $('#deleveryOrderModal').modal('hide');

                $('#deliveryOrderDetailTable').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "pageLength": 5,
                    "language": {
                        "emptyTable": "No Data Available To Display"
                    }
                });

            } else {
                bootbox.alert("Drug Code Duplicated!! Please Choose Different Code!!");

                $('#deliveryOrderDetailTable').DataTable({
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
    // Add Drug Code Function End


    // global variable declaration
    var row;

    // Fetch Data For Update And Delete Function Start
    $('#deleveryOrderBottomContent').off('click', '#deliveryOrderDetailTable #deleveryOrderUpdateDeleteBtn').on('click', '#deliveryOrderDetailTable #deleveryOrderUpdateDeleteBtn', function (e) {

        row = $(this).closest("tr");

        $('#deleveryOrderModal').modal('show');

        $('#deleveryOrderDetailTitle').text("Update Or Delete Item");
        $('#deleveryOrderDetail_btnAdd_or_btnUpdate_div').html('<button type="submit" id="deleveryOrderDetailUpdateItemBtn" class="btn btn-success btn-block btn-lg" role="button">Update</button>');
        $('#deleveryOrderDetail_btnClear_or_btnDelete_div').html('<button type="submit" id="deleveryOrderDetailDeleteItemBtn" class="btn btn-danger btn-block btn-lg" role="button">Delete</button>');


        var drug_Code = row.find('td').eq(0).text();
        var drug_Name = row.find('td').eq(1).text();
        var drug_Price = row.find('td').eq(2).text();
        var drug_Stock = row.find('td').eq(3).text();
        var drug_Quantity = row.find('td').eq(4).text();

        $('#drug_Name').val(drug_Name);
        $('#drug_Code').val(drug_Code);
        $('#drug_Price').val(drug_Price);
        $('#drug_Stock').val(drug_Stock);
        $('#drug_Quantity').val(drug_Quantity);


        $('#drug_Name').prop('disabled', true);
        $('#drug_Code').prop('disabled', true);
        $('#drug_Price').prop('disabled', true);
        $('#drug_Stock').prop('disabled', true);
        $('#drug_Quantity').prop('disabled', false);

    });
    // Fetch Data For Update And Delete Function End


    // Delivery Update Function Start
    $('#deleveryOrderDetail_btnAdd_or_btnUpdate_div').on('click', '#deleveryOrderDetailUpdateItemBtn', function (e) {

        $("#deliveryOrderDetailTable").DataTable().destroy();

        var drug_Name = $('#drug_Name').val();
        var drug_Code = $('#drug_Code').val();
        var drug_Price = $('#drug_Price').val();
        var drug_Stock = $('#drug_Stock').val();
        var drug_Quantity = $('#drug_Quantity').val();
        var newQuan = parseInt(drug_Stock) + parseInt(drug_Quantity);

        row.find('td').eq(0).text(drug_Code);
        row.find('td').eq(1).text(drug_Name);
        row.find('td').eq(2).text(drug_Price);
        row.find('td').eq(3).text(drug_Stock);
        row.find('td').eq(4).text(drug_Quantity);
        row.find('td').eq(5).text(newQuan);

        $('#deleveryOrderModal').modal('hide');

        $('#deliveryOrderDetailTable').DataTable({
            "paging": true,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Data Available To Display"
            }
        });

    });
    // Delivery Update Function End


    // Delivery Delete Function Start
    $('#deleveryOrderDetail_btnClear_or_btnDelete_div').on('click', '#deleveryOrderDetailDeleteItemBtn', function (e) {
        $("#deliveryOrderDetailTable").DataTable().destroy();

        row.remove();

        $('#deleveryOrderModal').modal('hide');

        $('#deliveryOrderDetailTable').DataTable({
            "paging": true,
            "lengthChange": false,
            "pageLength": 5,
            "language": {
                "emptyTable": "No Data Available To Display"
            }
        });

    });
    // Delivery Delete Function End


    // Grand Total Calculator Start
    !function calculateAllTotal() {

        // Getting Table
        var table = $("#deliveryOrderDetailTable tbody");

        // Setting Variable For Overall Dispense
        var drugCode, drugName, drugDataS, drugDataL = "";
        var drugPrice, drugNewQty, product, drugNewQtyOverall;
        var grandTotal = 0.0;
        var drugQtyTotal = 0;

        // Calculating Data For Overall Dispense
        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            drugPrice = parseFloat($tds.eq(2).text());
            drugNewQty = parseFloat($tds.eq(4).text());
            product = drugNewQty * drugPrice;


            if (isNaN(drugPrice) === true || isNaN(drugNewQty) === true || isNaN(product) === true) {
                console.log("NaN");
            } else {
                drugCode = $tds.eq(0).text();
                drugName = $tds.eq(1).text();
                drugNewQtyOverall = $tds.eq(5).text();
                drugDataS = drugCode + "|" + drugName + "|" + drugPrice + "|" + drugNewQty + "|" + drugNewQtyOverall + "#";
                grandTotal = grandTotal + product;
                drugQtyTotal = drugQtyTotal + drugNewQty;
                drugDataL = drugDataL + drugDataS;
            }
        });

        // Assigining Value For Overall Dispense
        $("#drug_Total_Quantity").val(drugQtyTotal);
        $("#drug_Total_Ammount").val(grandTotal.toFixed(2));
        $("#drug_Detail_Data").val(drugDataL);
        $("#deleveryOrderTotalOrder").val(drugQtyTotal);
        $("#deleveryOrderGrandTotal").val(grandTotal.toFixed(2));

        setTimeout(calculateAllTotal, 800);

    }();
    // Grand Total Calculator End


    // Update Stock Button Function Start
    $('#deleveryOrderUpdateStockBtn').on('click', function () {


        var invoice_noCheck = $('#invoiceNumber').val();


        if (invoice_noCheck === "") {
            bootbox.alert("Invoice Detail is not Complete !!!");
        } else {

            bootbox.confirm({
                message: "Are you sure want to update stock for this items?",
                title: "Update Item Stock?",
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

                        var invoice_no = $('#invoiceNumber').val();
                        var order_no = $('#orderNumber').val();
                        var vendor_id = $('#supplierDetails').val();
                        var total_amt = $('#drug_Total_Ammount').val();
                        var quantity = $('#drug_Total_Quantity').val();
                        var vendorDetail = $('#drug_Detail_Data').val();

                        var data = {
                            invoice_no: invoice_no,
                            order_no: order_no,
                            vendor_id: vendor_id,
                            total_amt: total_amt,
                            quantity: quantity,
                            vendorDetail: vendorDetail
                        };

                        console.log(data);

                        $.ajax({
                            url: "deleveryOrderInsert.jsp",
                            type: "post",
                            data: data,
                            timeout: 3000,
                            success: function (returnDate) {
                                if (returnDate.trim() === 'Success') {

                                    bootbox.alert({
                                        message: "MDC Code Stock Is Updated Successfully",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                    $("#deleveryOrderTopContent").load("deleveryOrderBasic.jsp");
                                    $("#deleveryOrderBottomContent").load("deleveryOrderTable.jsp");
                                    $("#InvoiceTopContentMaster").load("deleveryInvoiceMasterTable.jsp");
                                    $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                                } else if (returnDate.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "MDC Code Stock Update Failed",
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

</script>