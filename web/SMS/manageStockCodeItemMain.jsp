<%-- 
    Document   : manageStockCodeItemMain
    Created on : Nov 14, 2017, 10:05:47 AM
    Author     : Shammugam
--%>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    STOCK ITEM MANAGEMENT
    <span class="pull-right">
        <button id="addNewStockItemButton" class="btn btn-success" data-status="pagado" data-toggle="modal" data-id="1" data-target="#stockItemModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD STOCK ITEM</button>
        <button id="STOCKITEMClone_btnClone" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#stockItemCloneModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-copy" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>CLONE STOCK ITEM</button>
        <button id="STOCKITEM_btnSummary" class="btn btn-danger" data-status="pagado" data-toggle="modal" data-id="1" data-target="#stockItemSummaryModal" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items"><i class=" fa fa-file" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>STOCK ITEM INVENTORY SUMMARY</button>    </span>
</h4>

<script>

    $(document).ready(function () {

        $('.decimalNumbersOnly').keyup(function () {
            if (this.value !== this.value.replace(/[^0-9\.]/g, '')) {
                this.value = this.value.replace(/[^0-9\.]/g, '');
            }
        });


        $('.singleNumbersOnly').keyup(function () {
            if (this.value !== this.value.replace(/[^0-9]/g, '')) {
                this.value = this.value.replace(/[^0-9]/g, '');
            }
        });



        // Cate Add Modal Button Function Start
        $('#addNewStockItemButton').on('click', function () {

            $('#stockItemModalTitle').text("Add New Stock Item");
            $('#stockItemCode').prop('disabled', false);
            $('#stockItemCatCode').prop('disabled', false);
            $('#stockItem_btnAdd_or_btnUpdate_div').html('<button type="submit" id="addStockItemButton" class="btn btn-success btn-block btn-lg" role="button">Add</button>');

            $('#stockItemForm')[0].reset();

        });
        // Cate Add Modal Button Function End


        // Cate Reset Button Start
        $('#stockItemReset').on('click', function () {
            $('#stockItemForm')[0].reset();
        });
        // Cate Reset Button End


        // Add Item Function Start
        $('#stockItem_btnAdd_or_btnUpdate_div').on('click', '#addStockItemButton', function (e) {


            var stockItemCatCode = $('#stockItemCatCode').val();
            var stockItemCode = $('#stockItemCode').val();
            var stockItemName = $('#stockItemName').val();
            var stockItemBarcode = $('#stockItemBarcode').val();
            var stockItemOUM = $('#stockItemOUM').val();
            var stockItemsSupplierCD = $('#stockItemsSupplierCD').val();
            var stockItemSerialNo = $('#stockItemSerialNo').val();
            var stockItemBrand = $('#stockItemBrand').val();

            var stockItemLocation = $('#stockItemLocation').val();
            var stockItemCurrency = $('#stockItemCurrency').val();
            var stockItemSellingPrice = $('#stockItemSellingPrice').val();
            var stockItemPurchasePrice = $('#stockItemPurchasePrice').val();
            var stockItemWholesalePrice = $('#stockItemWholesalePrice').val();
            var stockItemTax = $('#stockItemTax').val();
            var stockItemMinStock = $('#stockItemMinStock').val();
            var stockItemFloatStock = $('#stockItemFloatStock').val();

            var stockItemPhysicalStock = $('#stockItemPhysicalStock').val();
            var stockItemReorderLevel = $('#stockItemReorderLevel').val();
            var stockItemStdMaterialCost = $('#stockItemStdMaterialCost').val();
            var stockItemStdLaborCost = $('#stockItemStdLaborCost').val();
            var stockItemStdExpenses = $('#stockItemStdExpenses').val();
            var stockItemCondition = $('#stockItemCondition').val();
            var stockItemGrade = $('#stockItemGrade').val();
            var stockItemStatus = $('#stockItemStatus').val();

            var newSellPrice = parseFloat(stockItemSellingPrice).toFixed(2);
            var newPurPrice = parseFloat(stockItemPurchasePrice).toFixed(2);
            var newWholePrice = parseFloat(stockItemWholesalePrice).toFixed(2);
            var newTaxPrice = parseFloat(stockItemTax).toFixed(2);
            var newMatCostPrice = parseFloat(stockItemStdMaterialCost).toFixed(2);
            var newLabCostPrice = parseFloat(stockItemStdLaborCost).toFixed(2);
            var newExpensesPrice = parseFloat(stockItemStdExpenses).toFixed(2);

            stockItemSellingPrice = newSellPrice;
            stockItemPurchasePrice = newPurPrice;
            stockItemWholesalePrice = newWholePrice;
            stockItemTax = newTaxPrice;
            stockItemStdMaterialCost = newMatCostPrice;
            stockItemStdLaborCost = newLabCostPrice;
            stockItemStdExpenses = newExpensesPrice;

            if (stockItemFloatStock === "") {
                stockItemFloatStock = '0';
            }

            if (isNaN(stockItemWholesalePrice) === true) {
                stockItemWholesalePrice = '0.00';
            }

            if (isNaN(stockItemTax) === true) {
                stockItemTax = '0.00';
            }

            if (isNaN(stockItemStdMaterialCost) === true) {
                stockItemStdMaterialCost = '0.00';
            }

            if (isNaN(stockItemStdLaborCost) === true) {
                stockItemStdLaborCost = '0.00';
            }

            if (isNaN(stockItemStdExpenses) === true) {
                stockItemStdExpenses = '0.00';
            }


            if (stockItemCatCode === "" || stockItemCatCode === null) {

                bootbox.alert("Please Search The Category Code");

            } else if (stockItemCode === "" || stockItemCode === null) {

                bootbox.alert("Please Insert The Item Code");

            } else if (stockItemName === "" || stockItemName === null) {

                bootbox.alert("Please Insert The Item Name");

            } else if (stockItemOUM === "" || stockItemOUM === null) {

                bootbox.alert("Please Select The Item OUM");

            } else if (stockItemSellingPrice === "" || stockItemSellingPrice === null || isNaN(stockItemSellingPrice) === true) {

                bootbox.alert("Please Insert The Item Selling Price");

            } else if (stockItemPurchasePrice === "" || stockItemPurchasePrice === null || isNaN(stockItemPurchasePrice) === true) {

                bootbox.alert("Please Insert The Item Purchase Price");

            } else if (stockItemMinStock === "" || stockItemMinStock === null) {

                bootbox.alert("Please Insert The Item Min Stock");

            } else if (stockItemPhysicalStock === "" || stockItemPhysicalStock === null) {

                bootbox.alert("Please Insert The Item Physical Stock");

            } else if (stockItemReorderLevel === "" || stockItemReorderLevel === null) {

                bootbox.alert("Please Insert The Item Reorder Level");

            } else {

                var arrayDataCate = $('#stockItemCatCode').val().split("|");
                stockItemCatCode = arrayDataCate[0].trim();

                var data = {
                    stockItemCatCode: stockItemCatCode,
                    stockItemCode: stockItemCode,
                    stockItemName: stockItemName,
                    stockItemBarcode: stockItemBarcode,
                    stockItemOUM: stockItemOUM,
                    stockItemsSupplierCD: stockItemsSupplierCD,
                    stockItemSerialNo: stockItemSerialNo,
                    stockItemBrand: stockItemBrand,
                    stockItemLocation: stockItemLocation,
                    stockItemCurrency: stockItemCurrency,
                    stockItemSellingPrice: stockItemSellingPrice,
                    stockItemPurchasePrice: stockItemPurchasePrice,
                    stockItemWholesalePrice: stockItemWholesalePrice,
                    stockItemTax: stockItemTax,
                    stockItemMinStock: stockItemMinStock,
                    stockItemFloatStock: stockItemFloatStock,
                    stockItemPhysicalStock: stockItemPhysicalStock,
                    stockItemReorderLevel: stockItemReorderLevel,
                    stockItemStdMaterialCost: stockItemStdMaterialCost,
                    stockItemStdLaborCost: stockItemStdLaborCost,
                    stockItemStdExpenses: stockItemStdExpenses,
                    stockItemCondition: stockItemCondition,
                    stockItemGrade: stockItemGrade,
                    stockItemStatus: stockItemStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessStockItem/manageStockCodeItemInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {
                        console.log(datas);

                        if (datas.trim() === 'Success') {

                            $("#contentStockItemTable").load("manageStockCodeItemTable.jsp");

                            $('#stockItemModal').modal('hide');

                            bootbox.alert({
                                message: "Stock Item is Added Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#stockItemForm')[0].reset();

                        } else if (datas.trim() === 'Duplicate') {

                            bootbox.alert({
                                message: "Stock Item Code Duplication Detected. Please use diffrerent Stock Item Code",
                                title: "Process Result",
                                backdrop: true
                            });

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Stock Item Add Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#stockItemModal').modal('hide');

                            $('#stockItemForm')[0].reset();

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                        console.log(err);
                    }

                });



            }
        });
        // Add Item Function End




        // Item Update Function Start
        $('#contentStockItemTable').off('click', '#stockItemTable #stockItemUpdateTButton').on('click', '#stockItemTable #stockItemUpdateTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataStockItemhidden").val();
            var arrayData = rowData.split("|");

            $('#stockCateModalTitle').text("Update Stock Item");
            $('#stockItemCode').prop('disabled', true);
            $('#stockItemCatCode').prop('disabled', true);
            $('#stockItem_btnAdd_or_btnUpdate_div').html('<button type="submit" id="updateStockItemButton" class="btn btn-success btn-block btn-lg" role="button">Update</button>');



            $('#stockItemCatCode').val(arrayData[1]);
            $('#stockItemCode').val(arrayData[0]);
            $('#stockItemName').val(arrayData[2]);
            $('#stockItemBarcode').val(arrayData[3]);
            $('#stockItemOUM').val(arrayData[4]);
            $('#stockItemsSupplierCD').val(arrayData[5]);
            $('#stockItemSerialNo').val(arrayData[6]);
            $('#stockItemBrand').val(arrayData[7]);

            $('#stockItemLocation').val(arrayData[8]);
            $('#stockItemCurrency').val(arrayData[9]);
            $('#stockItemSellingPrice').val(arrayData[10]);
            $('#stockItemPurchasePrice').val(arrayData[11]);
            $('#stockItemWholesalePrice').val(arrayData[12]);
            $('#stockItemTax').val(arrayData[13]);
            $('#stockItemMinStock').val(arrayData[14]);
            $('#stockItemFloatStock').val(arrayData[15]);

            $('#stockItemPhysicalStock').val(arrayData[16]);
            $('#stockItemReorderLevel').val(arrayData[17]);
            $('#stockItemStdMaterialCost').val(arrayData[18]);
            $('#stockItemStdLaborCost').val(arrayData[19]);
            $('#stockItemStdExpenses').val(arrayData[20]);
            $('#stockItemCondition').val(arrayData[21]);
            $('#stockItemGrade').val(arrayData[22]);
            $('#stockItemStatus').val(arrayData[23]);



        });
        // Item Update Function End



        // Item Update Function Start
        $('#stockItem_btnAdd_or_btnUpdate_div').on('click', '#updateStockItemButton', function (e) {

            e.preventDefault();

            var stockItemCatCode = $('#stockItemCatCode').val();
            var stockItemCode = $('#stockItemCode').val();
            var stockItemName = $('#stockItemName').val();
            var stockItemBarcode = $('#stockItemBarcode').val();
            var stockItemOUM = $('#stockItemOUM').val();
            var stockItemsSupplierCD = $('#stockItemsSupplierCD').val();
            var stockItemSerialNo = $('#stockItemSerialNo').val();
            var stockItemBrand = $('#stockItemBrand').val();

            var stockItemLocation = $('#stockItemLocation').val();
            var stockItemCurrency = $('#stockItemCurrency').val();
            var stockItemSellingPrice = $('#stockItemSellingPrice').val();
            var stockItemPurchasePrice = $('#stockItemPurchasePrice').val();
            var stockItemWholesalePrice = $('#stockItemWholesalePrice').val();
            var stockItemTax = $('#stockItemTax').val();
            var stockItemMinStock = $('#stockItemMinStock').val();
            var stockItemFloatStock = $('#stockItemFloatStock').val();

            var stockItemPhysicalStock = $('#stockItemPhysicalStock').val();
            var stockItemReorderLevel = $('#stockItemReorderLevel').val();
            var stockItemStdMaterialCost = $('#stockItemStdMaterialCost').val();
            var stockItemStdLaborCost = $('#stockItemStdLaborCost').val();
            var stockItemStdExpenses = $('#stockItemStdExpenses').val();
            var stockItemCondition = $('#stockItemCondition').val();
            var stockItemGrade = $('#stockItemGrade').val();
            var stockItemStatus = $('#stockItemStatus').val();

            var newSellPrice = parseFloat(stockItemSellingPrice).toFixed(2);
            var newPurPrice = parseFloat(stockItemPurchasePrice).toFixed(2);
            var newWholePrice = parseFloat(stockItemWholesalePrice).toFixed(2);
            var newTaxPrice = parseFloat(stockItemTax).toFixed(2);
            var newMatCostPrice = parseFloat(stockItemStdMaterialCost).toFixed(2);
            var newLabCostPrice = parseFloat(stockItemStdLaborCost).toFixed(2);
            var newExpensesPrice = parseFloat(stockItemStdExpenses).toFixed(2);

            stockItemSellingPrice = newSellPrice;
            stockItemPurchasePrice = newPurPrice;
            stockItemWholesalePrice = newWholePrice;
            stockItemTax = newTaxPrice;
            stockItemStdMaterialCost = newMatCostPrice;
            stockItemStdLaborCost = newLabCostPrice;
            stockItemStdExpenses = newExpensesPrice;


            if (stockItemFloatStock === "") {
                stockItemFloatStock = '0';
            }

            if (isNaN(stockItemWholesalePrice) === true) {
                stockItemWholesalePrice = '0.00';
            }

            if (isNaN(stockItemTax) === true) {
                stockItemTax = '0.00';
            }

            if (isNaN(stockItemStdMaterialCost) === true) {
                stockItemStdMaterialCost = '0.00';
            }

            if (isNaN(stockItemStdLaborCost) === true) {
                stockItemStdLaborCost = '0.00';
            }

            if (isNaN(stockItemStdExpenses) === true) {
                stockItemStdExpenses = '0.00';
            }


            if (stockItemCatCode === "" || stockItemCatCode === null) {

                bootbox.alert("Please Search The Category Code");

            } else if (stockItemCode === "" || stockItemCode === null) {

                bootbox.alert("Please Insert The Item Code");

            } else if (stockItemName === "" || stockItemName === null) {

                bootbox.alert("Please Insert The Item Name");

            } else if (stockItemOUM === "" || stockItemOUM === null) {

                bootbox.alert("Please Select The Item OUM");

            } else if (stockItemSellingPrice === "" || stockItemSellingPrice === null || isNaN(stockItemSellingPrice) === true) {

                bootbox.alert("Please Insert The Item Selling Price");

            } else if (stockItemPurchasePrice === "" || stockItemPurchasePrice === null || isNaN(stockItemPurchasePrice) === true) {

                bootbox.alert("Please Insert The Item Purchase Price");

            } else if (stockItemMinStock === "" || stockItemMinStock === null) {

                bootbox.alert("Please Insert The Item Min Stock");

            } else if (stockItemPhysicalStock === "" || stockItemPhysicalStock === null) {

                bootbox.alert("Please Insert The Item Physical Stock");

            } else if (stockItemReorderLevel === "" || stockItemReorderLevel === null) {

                bootbox.alert("Please Insert The Item Reorder Level");

            } else {

                var arrayDataCate = $('#stockItemCatCode').val().split("|");
                stockItemCatCode = arrayDataCate[0].trim();

                var data = {
                    stockItemCatCode: stockItemCatCode,
                    stockItemCode: stockItemCode,
                    stockItemName: stockItemName,
                    stockItemBarcode: stockItemBarcode,
                    stockItemOUM: stockItemOUM,
                    stockItemsSupplierCD: stockItemsSupplierCD,
                    stockItemSerialNo: stockItemSerialNo,
                    stockItemBrand: stockItemBrand,
                    stockItemLocation: stockItemLocation,
                    stockItemCurrency: stockItemCurrency,
                    stockItemSellingPrice: stockItemSellingPrice,
                    stockItemPurchasePrice: stockItemPurchasePrice,
                    stockItemWholesalePrice: stockItemWholesalePrice,
                    stockItemTax: stockItemTax,
                    stockItemMinStock: stockItemMinStock,
                    stockItemFloatStock: stockItemFloatStock,
                    stockItemPhysicalStock: stockItemPhysicalStock,
                    stockItemReorderLevel: stockItemReorderLevel,
                    stockItemStdMaterialCost: stockItemStdMaterialCost,
                    stockItemStdLaborCost: stockItemStdLaborCost,
                    stockItemStdExpenses: stockItemStdExpenses,
                    stockItemCondition: stockItemCondition,
                    stockItemGrade: stockItemGrade,
                    stockItemStatus: stockItemStatus
                };

                console.log(data);


                $.ajax({
                    url: "controllerProcessStockItem/manageStockCodeItemUpdate.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        if (datas.trim() === 'Success') {

                            $("#contentStockItemTable").load("manageStockCodeItemTable.jsp");

                            $('#stockItemModal').modal('hide');

                            bootbox.alert({
                                message: "Stock Item is Updated Successful",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#stockItemForm')[0].reset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert({
                                message: "Stock Item Update Failed",
                                title: "Process Result",
                                backdrop: true
                            });

                            $('#stockItemModal').modal('hide');

                            $('#stockItemForm')[0].reset();

                        }

                    },
                    error: function (err) {
                        alert("Error Ajax Update!");
                    }

                });

            }
        });
        // Item Update Function End


        // Search Category Function Start
        $("#stockItemCatCode").on('keyup', function () { // everytime keyup event
            var input = $(this).val(); // We take the input value

            if (input.length >= 1) { // Minimum characters = 2 (you can change)
                $('#stockItemCatCodeSearch').html('<img src="libraries/LoaderIcon.gif"  />'); // Loader icon apprears in the <div id="match"></div>
                var dataFields = {input: input}; // We pass input argument in Ajax
                $.ajax({
                    type: "POST",
                    url: "controllerProcessStockItem/manageStockCodeItemCategorySearch.jsp", // call the php file ajax/tuto-autocomplete.php
                    data: dataFields, // Send dataFields var
                    timeout: 3000,
                    success: function (dataBack) { // If success
                        $('#stockItemCatCodeSearch').html(dataBack); // Return data (UL list) and insert it in the <div id="match"></div>
                        $('#matchListATC li').on('click', function () { // When click on an element in the list
                            //$('#masterCode2').text($(this).text()); // Update the field with the new element
                            $('#stockItemCatCode').val($(this).text());
                            $('#stockItemCatCodeSearch').text(''); // Clear the <div id="match"></div>
                            var arrayData = $('#stockItemCatCode').val().split("|");
                            console.log(arrayData);
                            console.log(arrayData[0].trim());
                            console.log(arrayData[1].trim());
                        });
                    },
                    error: function () { // if error
                        $('#stockItemCatCodeSearch').text('Problem!');
                    }
                });
            } else {
                $('#stockItemCatCodeSearch').text(''); // If less than 2 characters, clear the <div id="match"></div>
            }

        });
        // Search Category Function End




        // Item Delete Function Start
        $('#contentStockItemTable').off('click', '#stockItemTable #stockItemDeleteTButton').on('click', '#stockItemTable #stockItemDeleteTButton', function (e) {

            e.preventDefault();

            var row = $(this).closest("tr");
            var rowData = row.find("#dataStockItemhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //assign into seprated val
            var iditem = arrayData[0];
            var ciditem = arrayData[1];

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

                        var data = {
                            iditem: iditem,
                            ciditem: ciditem
                        };

                        $.ajax({
                            url: "controllerProcessStockItem/manageStockCodeItemDelete.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000, // 10 seconds
                            success: function (datas) {

                                if (datas.trim() === 'Success') {

                                    $("#contentStockItemTable").load("manageStockCodeItemTable.jsp");

                                    bootbox.alert({
                                        message: "Stock Item is Deleted Successful",
                                        title: "Process Result",
                                        backdrop: true
                                    });

                                } else if (datas.trim() === 'Failed') {

                                    bootbox.alert({
                                        message: "Stock Item Delete Failed",
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
        // Item Delete Function End









        // Clone Item Function Start

        // Clone Item Button Click Function Start
        $('#STOCKITEMClone_btnClone').on('click', function () {
            STOCKITEMCloneReset();
            createSTOCKITEMCodeList();
        });
        // Clone Item Button Click Function End


        // Clone Item Reset Function Start
        function STOCKITEMCloneReset() {
            document.getElementById("STOCKITEMClone_Form").reset();
        }
        // Clone Item Reset Function End


        // Clone Item Create List Function Start
        function createSTOCKITEMCodeList() {

            $('#STOCKITEM_Code').multiSelect('destroy');
            $('<div class="loading">Loading</div>').appendTo('#stockItemCloneModal');

            $.ajax({
                type: 'POST',
                url: "controllerProcessStockItem/manageStockCodeItemCloneDrugList.jsp",
                success: function (data, textStatus, jqXHR) {

                    $('#STOCKITEM_Code').html(data);
                    $('#STOCKITEM_Code').multiSelect({
                        selectableHeader: "<div style='display:block; color:white; background-color:#2196f3; '>Selectable Item Code</div>",
                        selectionHeader: "<div style='display:block; color:white; background-color:#2196f3'>Selected Item Code</div>",
                        keepOrder: true
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });

        }
        // Clone Item Create List Function End



        // Clone Item Clone Function Start
        $('#STOCKITEM_btnClone').on('click', function () {

            var arraySelect = [];
            $("#STOCKITEM_Code option:selected").each(function () {
                arraySelect.push($(this));
            });

            var strSTOCKITEMClone = arraySelect.map(function (elem) {
                return elem.val();
            }).join("|");

            console.log(strSTOCKITEMClone);

            if (strSTOCKITEMClone === "") {

                bootbox.alert("Select at least one item to be cloned");

            } else {

                $('<div class="loading">Loading</div>').appendTo('#stockItemCloneModal');

                var data = {
                    strSTOCKITEMClone: strSTOCKITEMClone
                };

                $.ajax({
                    url: "controllerProcessStockItem/manageStockCodeItemCloneDrugListInsert.jsp",
                    type: "post",
                    data: data,
                    timeout: 15000,
                    success: function (datas) {

                        console.log(datas.trim());

                        if (datas.trim() === 'Success') {

                            $("#contentStockItemTable").load("manageStockCodeItemTable.jsp");
                            $('#stockItemCloneModal').modal('hide');

                            bootbox.alert({
                                message: "Stock Item is successfully cloned",
                                title: "Process Result",
                                backdrop: true
                            });

                            STOCKITEMCloneReset();

                        } else if (datas.trim() === 'Failed') {

                            bootbox.alert("Insertion failed!");

                            STOCKITEMCloneReset();

                        } else {

                            bootbox.alert(datas.trim());
                            $('#STOCKITEM_Code').val("");

                        }

                    },
                    error: function (err) {
                        console.log("Ajax Is Not Success");
                    },
                    complete: function (jqXHR, textStatus) {
                        $('.loading').hide();
                    }

                });
            }

        });
        // Clone Item Clone Function End


        // Clone Item Select All Function Start
        $('#STOCKITEM_Code_selectAll').on('click', function (e) {
            e.preventDefault();
            $('#STOCKITEM_Code').multiSelect('select_all');
            return false;
        });
        // Clone Item Select All Function End


        // Clone Item Un-Select All Function Start
        $('#STOCKITEM_Code_deselectAll').on('click', function (e) {
            e.preventDefault();
            $('#STOCKITEM_Code').multiSelect('deselect_all');
            return false;
        });
        // Clone Item Un-Select All Function End

        // Clone Item Function End



        // Summary MDC Function Start

        // Summary MDC Button Function Start
        $('#STOCKITEM_btnSummary').on('click', function () {
            createSTOCKITEMSummaryStock();
        });
        // Summary MDC Button Function End



        // Summary MDC Stock Function Start
        function createSTOCKITEMSummaryStock() {

            $.ajax({
                type: 'POST',
                url: "controllerProcessStockItem/stockItemSummaryItemStock.jsp",
                success: function (data, textStatus, jqXHR) {
                    
                    $('#stockItemStockSummary').html(data);
                    
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Opps! " + errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    $('.loading').hide();
                }
            });

        }
        // Summary MDC Stock Function Start



    });

</script>

