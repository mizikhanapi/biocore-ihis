<%-- 
    Document   : billMasterOrderListMain
    Created on : Oct 11, 2017, 11:09:52 AM
    Author     : Shammugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    MASTER LIST
</h4>

<div style="width:50%; margin: auto;">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput">Show Bill For : </label>
            <div class="col-md-3">
                <select class="form-control"  id="BILL_MasterOrderRefreshSelect">
                    <option value="all">All</option>
                    <option value="today">Today</option>
                    <option value="yesterday">Yesterday</option>
                    <option value="7day">7 Days</option>
                    <option value="30day">30 Days</option>
                    <option value="60day">60 Days</option>
                    <option value="custom">Select date</option>
                </select>
            </div>
            <div class="col-md-2">
                <button id="BILL_MasterOrderRefreshBtn" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
            </div>
        </div>

        <div class="form-group" id="BILL_MasterOrderSelectAssessmentStartEnd">
            <div class="col-md-5">
                <label class="col-md-3 control-label" for="textinput">Start : </label>
                <div class="col-md-9">
                    <input type="text" class="form-control input-md" id="BILL_MasterOrderSelectAssessmentStart" placeholder="14/06/2017" readonly>
                </div>
            </div>
            <div class="col-md-5">
                <label class="col-md-3 control-label" for="textinput">End : </label>
                <div class="col-md-9">
                    <input type="text" class="form-control input-md" id="BILL_MasterOrderSelectAssessmentEnd" placeholder="14/06/2017" readonly>
                </div>
            </div>
        </div>

    </div>
</div>


<script>

// Disabling Start And End Date OnLoad
    $("#BILL_MasterOrderSelectAssessmentStartEnd").hide();

// ---------------------------------------------------------------------------- Date ------------------------------------------------------------------------------------------- //


    // Date Functions Start
    // Date Picker For Initial Start
    $("#BILL_MasterOrderSelectAssessmentStart").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    // Date Picker For Initial End


    // Date Picker For Final Start
    $('#BILL_MasterOrderSelectAssessmentStart').on('change', function () {

        $("#BILL_MasterOrderSelectAssessmentEnd").datepicker("destroy");
        $('#BILL_MasterOrderSelectAssessmentEnd').val('');
        var fromDate = $("#BILL_MasterOrderSelectAssessmentStart").datepicker("getDate");

        $('#BILL_MasterOrderSelectAssessmentEnd').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });

    });
    // Date Picker For Final Start
    // Date Functions End


// ---------------------------------------------------------------------------- Date ------------------------------------------------------------------------------------------- //






// ====================================================================== Bill Master Order List Main Page ====================================================================== //




// ---------------------------------------------------------------------------- Date On Change ------------------------------------------------------------------------------------------- //


    $('#billMasterOrderListMain').on('change', '#BILL_MasterOrderRefreshSelect', function (e) {

        var process = $('#BILL_MasterOrderRefreshSelect').val();

        if (process === "custom") {
            $("#BILL_MasterOrderSelectAssessmentStartEnd").show();
        } else {
            $("#BILL_MasterOrderSelectAssessmentStartEnd").hide();
        }

    });


// ---------------------------------------------------------------------------- Date On Change ------------------------------------------------------------------------------------------- //




// --------------------------------------------------------------- Load Data In Master Table --------------------------------------------------------------- //


    $('#billMasterOrderListMain').off('click', '#BILL_MasterOrderRefreshBtn').on('click', '#BILL_MasterOrderRefreshBtn', function (e) {

        $('#billMasterOrderListContent').html('<div class="loading">Loading</div>');

        var process = $('#BILL_MasterOrderRefreshSelect').val();

        var longString, todayDate;

        longString = "";

        var enDate = new Date();
        var dd = ("0" + enDate.getDate()).slice(-2);
        var mm = ("0" + (enDate.getMonth() + 1)).slice(-2);
        var yy = enDate.getFullYear();

        todayDate = yy + "-" + mm + "-" + dd;

        if (process === "today") {
            longString = "today|" + todayDate;
        } else if (process === "yesterday") {
            longString = "yesterday|" + todayDate;
        } else if (process === "7day") {
            longString = "7day|" + todayDate;
        } else if (process === "30day") {
            longString = "30day|" + todayDate;
        } else if (process === "60day") {
            longString = "60day|" + todayDate;
        } else if (process === "custom") {

            var strtDate = $('#BILL_MasterOrderSelectAssessmentStart').val();
            var endDate = $('#BILL_MasterOrderSelectAssessmentEnd').val();

            var sDate = strtDate.split('/');
            var SnewDate = sDate[2] + "-" + sDate[1] + "-" + sDate[0];

            var eDate = endDate.split('/');
            var EnewDate = eDate[2] + "-" + eDate[1] + "-" + eDate[0];

            longString = "custom|" + SnewDate + "^" + EnewDate;

        } else if (process === "all") {
            longString = "all|" + todayDate;
        }


        var data = {
            longString: longString
        };

        console.log(data);


        $.ajax({
            type: 'POST',
            url: "billMasterOrderListTable.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {
                $('#billMasterOrderListContent').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert('Opps! ' + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                $('.loading').hide();
            }

        });

    });


// --------------------------------------------------------------- Load Data In Master Table --------------------------------------------------------------- //




// ====================================================================== Bill Master Order List Main Page ====================================================================== //







// ====================================================================== Bill Detail Order List Main Page ====================================================================== //



// --------------------------------------------------------------- Load Data In Details Table --------------------------------------------------------------- //


// Move to Order Details Fetch Details Start
    $('#billMasterOrderListContent').off('click', '#billMasterOrderListTable #moveToBillDetailsTButton').on('click', '#billMasterOrderListTable #moveToBillDetailsTButton', function (e) {

        $('<div class="loading">Loading</div>').appendTo('body');

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataBillMasterOrderListhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        //Assign Array into seprated val
        var patientpmino = arrayData[0];
        var patientName = arrayData[1];
        var patientnic = arrayData[2];

        var data = {
            patientnic: patientnic,
            patientpmino: patientpmino
        };

        $.ajax({
            url: "billDetailOrderListTable.jsp",
            type: "post",
            timeout: 3000,
            data: data,
            success: function (returnDataBillDetailList) {

                $('#billDetailOrderDetailContent').html(returnDataBillDetailList);
                $('.nav-tabs a[href="#tab_default_2"]').tab('show');

            }
        });


    });
// Move to Order Details Fetch Details End


// --------------------------------------------------------------- Load Data In Details Table --------------------------------------------------------------- //




// --------------------------------------------------------------- Generate Individual Bill View Function --------------------------------------------------------------- //


    $('#billDetailOrderDetailContent').off('click', '#billDetailOrderListTable #generateBillDetailSingleRecordBtn').on('click', '#billDetailOrderListTable #generateBillDetailSingleRecordBtn', function (e) {

        e.preventDefault();

        $('<div class="loading">Loading</div>').appendTo('body');


        var row = $(this).closest("tr");
        var rowData = row.find("#dataBillDetailsOrderListhidden").val();
        var arrayData = rowData.split("|");

        var orderNo = arrayData[7];
        var pmiNo = arrayData[0];
        var icNo = arrayData[2];
        var txtDate = arrayData[6];
        var pName = arrayData[1];
        var address = arrayData[4];
        var phoneNo = arrayData[5];
        var otherID = arrayData[3];

        var data = {
            orderNo: orderNo,
            pmiNo: pmiNo,
            icNo: icNo,
            address: address,
            phoneNo: phoneNo,
            otherID: otherID,
            pName: pName,
            txtDate: txtDate
        };

        console.log(data);

        $.ajax({
            url: "billGenerateBillDetailSingle.jsp",
            type: "post",
            data: data,
            timeout: 10000,
            success: function (data) {

                $('#billDetailOrderDetailContent').html(data);
                $('.loading').hide();

            },
            error: function (err) {
            }
        });


    });


// --------------------------------------------------------------- Generate Individual Bill View Function --------------------------------------------------------------- //




// --------------------------------------------------------------- Generate Individual Bill Confirm Function --------------------------------------------------------------- //


    $('#billDetailOrderDetailContent').off('click', '#viewBillGenereteBillDetailsButtonRightDiv #btnViewBillGenereteBillDetailsConfirmBtn').on('click', '#viewBillGenereteBillDetailsButtonRightDiv #btnViewBillGenereteBillDetailsConfirmBtn', function (e) {

        e.preventDefault();

        var orderNo = document.getElementById('orderNo').value;
        var pmiNo = document.getElementById('pmiNo').value;
        var billNo = document.getElementById('billNo').value;
        var txnDate = document.getElementById('txnDate').value;
        var patientName = document.getElementById('patientName').value;
        var grandTotal = document.getElementById('grandTotal').value;
        var tableItem;
        tableItem = new Array();

        $('#tableItems tr').each(function (row, tr) {
            tableItem[row] = {
                "itemCode": $(tr).find('td:eq(0)').text()
                , "itemDesc": $(tr).find('td:eq(1)').text()
                , "itemQty": $(tr).find('td:eq(2)').text()
                , "unitPrice": $(tr).find('td:eq(3)').text()
                , "totalPrice": $(tr).find('td:eq(4)').text()
            };
        });
        tableItem.shift();  // first row will be empty - so remove
        tableItem = JSON.stringify(tableItem);


        var data = {
            pmiNo: pmiNo,
            billNo: billNo,
            orderNo: orderNo,
            txnDate: txnDate,
            patientName: patientName,
            tableItem: tableItem,
            grandTotal: grandTotal
        };


        console.log(data);


        bootbox.confirm({
            message: "Are you sure want to confirm this bill ?",
            title: "Confirm Bill?",
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

                    $('<div class="loading">Loading</div>').appendTo('body');

                    $.ajax({
                        url: "billGenerateBilManageCustomerTables.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (data) {

                            var d = data.split("|");

                            $('.loading').hide();

                            if (d[1] === "1") {
                                $('#btnViewBillGenereteBillDetailsCancelBtn').prop('disabled', true);
                                $('#btnViewBillGenereteBillDetailsConfirmBtn').prop('disabled', true);

                                document.getElementById('messageHeader').innerHTML = "Success!";
                                document.getElementById('messageContent').innerHTML = "Bill created.";

                                $("#alertMessage").modal();

                                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                            } else {

                                document.getElementById('messageHeader').innerHTML = "Error!";
                                document.getElementById('messageContent').innerHTML = d[2];

                                $("#alertMessage").modal();

                            }

                        },
                        error: function (err) {
                        }
                    });

                } else {
                    console.log("Process Is Canceled");
                }

            }
        });





    });


// --------------------------------------------------------------- Generate Individual Bill Confirm Function --------------------------------------------------------------- //




// --------------------------------------------------------------- Generate Individual Bill Cancel Function --------------------------------------------------------------- //


    $('#billDetailOrderDetailContent').off('click', '#viewBillGenereteBillDetailsButtonRightDiv #btnViewBillGenereteBillDetailsCancelBtn').on('click', '#viewBillGenereteBillDetailsButtonRightDiv #btnViewBillGenereteBillDetailsCancelBtn', function (e) {

        e.preventDefault();

        location.reload();

    });


// --------------------------------------------------------------- Generate Individual Bill Cancel Function --------------------------------------------------------------- //





// --------------------------------------------------------------- Generate Group Bill View Function --------------------------------------------------------------- //


    $('#billDetailOrderDetailContent').off('click', '#viewBillGenereteBillMasterButtonRightDiv #btnViewBillGenereteBillMasterGenerateSelected').on('click', '#viewBillGenereteBillMasterButtonRightDiv #btnViewBillGenereteBillMasterGenerateSelected', function (e) {
        e.preventDefault();


        var longString = "";

        var table = $("#billDetailOrderListTable tbody");

        var masterPMIANDIC = $('#viewBillGenereteBillMasterButtonRightDivPMIPatientHidden').val();
        var arrayData = masterPMIANDIC.split("|");
        var pmiNoDetail = arrayData[1];
        var icNoDetail = arrayData[0];

        var billChecked, episodeDate, orderNo, pmiNo, ic;

        var generateBillOrderList = [];

        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            // Get The Data
            billChecked = $(this).find("#generateBillChecked").is(':checked');
            episodeDate = $tds.eq(1).text();
            orderNo = $tds.eq(2).text();
            pmiNo = $tds.eq(3).text();
            ic = $tds.eq(4).text();
            var icData = ic.split(" / ");
            var icNew = icData[0];

            if (billChecked === true) {

                generateBillOrderList.push(pmiNo + "^" + orderNo + "^" + episodeDate + "^" + icNew);
                longString = generateBillOrderList.join("|");

            }

        });

        console.log(longString);

        if (longString === "") {
            bootbox.alert("Please Select At Least A Record To Generate The Billing Details !");
        } else {

            bootbox.confirm({
                message: "Are you sure that you want to generate bill for the selected record ?",
                title: "Archive Order ?",
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

                        $('<div class="loading">Loading</div>').appendTo('body');

                        var data = {
                            pmiNo: pmiNoDetail,
                            icNo: icNoDetail,
                            longString: longString
                        };

                        console.log(data);

                        $.ajax({
                            url: "billGenerateBillDetailGroup.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000,
                            success: function (data) {

                                $('#billDetailOrderDetailContent').html(data);
                                $('.loading').hide();

                            },
                            error: function (err) {

                                console.log("Error Ajax");

                            }
                        });


                    } else {
                        console.log("Process Is Canceled");
                    }

                }
            });


        }

    });


// --------------------------------------------------------------- Generate Group Bill View Function --------------------------------------------------------------- //






// --------------------------------------------------------------- Generate Group Bill Confirm Function --------------------------------------------------------------- //


    $('#billDetailOrderDetailContent').off('click', '#viewBillGenereteBillDetailsGroupButtonRightDiv #btnViewBillGenereteBillDetailsGroupConfirmBtn').on('click', '#viewBillGenereteBillDetailsGroupButtonRightDiv #btnViewBillGenereteBillDetailsGroupConfirmBtn', function (e) {

        e.preventDefault();

        var orderNo = document.getElementById('orderNo').value;
        var pmiNo = document.getElementById('pmiNo').value;
        var billNo = document.getElementById('billNo').value;
        var txnDate = document.getElementById('txnDate').value;
        var patientName = document.getElementById('patientName').value;
        var grandTotal = document.getElementById('grandTotal').value;
        var tableOrder = "";

        var table = $("#tableMasterItems tbody");

        var masterOrderNo, masterEpisodeDate, masterItemDesc, masterItemAmnt, masterItemQuantity;

        var generateMasterBillDetailsList = [];

        table.find('tr').each(function (i) {

            var $tds = $(this).find('td');

            // Get The Data
            masterOrderNo = $tds.eq(0).text();
            masterEpisodeDate = $tds.eq(1).text();
            masterItemDesc = $tds.eq(2).text();
            masterItemAmnt = $tds.eq(3).text();
            masterItemQuantity = $tds.eq(4).text();

            generateMasterBillDetailsList.push(masterOrderNo + "^" + masterEpisodeDate + "^" + masterItemDesc + "^" + masterItemAmnt+ "^" + masterItemQuantity);
            tableOrder = generateMasterBillDetailsList.join("|");

        });

        var tableItem;
        tableItem = new Array();
        $('#listOfItems #tableItems tr').each(function (row, tr) {
            tableItem[row] = {
                "itemOrderNo": $(tr).find('td:eq(0)').text()
                , "itemEpisodeDate": $(tr).find('td:eq(1)').text()
                , "itemCode": $(tr).find('td:eq(2)').text()
                , "itemDesc": $(tr).find('td:eq(3)').text()
                , "itemQty": $(tr).find('td:eq(4)').text()
                , "unitPrice": $(tr).find('td:eq(5)').text()
                , "totalPrice": $(tr).find('td:eq(6)').text()
            };
        });
        tableItem.shift();  // first row will be empty - so remove
        tableItem = JSON.stringify(tableItem);


        var data = {
            pmiNo: pmiNo,
            billNo: billNo,
            orderNo: orderNo,
            txnDate: txnDate,
            patientName: patientName,
            tableOrder: tableOrder,
            tableItem: tableItem,
            grandTotal: grandTotal
        };


        console.log(data);


        bootbox.confirm({
            message: "Are you sure want to confirm this bills ?",
            title: "Confirm Bills?",
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

                    $('<div class="loading">Loading</div>').appendTo('body');

                    $.ajax({
                        url: "billGenerateBilManageCustomerTablesGroup.jsp",
                        type: "post",
                        data: data,
                        timeout: 10000,
                        success: function (data) {

                            var d = data.split("|");

                            $('.loading').hide();

                            if (d[1] === "1") {
                                $('#btnViewBillGenereteBillDetailsGroupCancelBtn').prop('disabled', true);
                                $('#btnViewBillGenereteBillDetailsGroupConfirmBtn').prop('disabled', true);

                                document.getElementById('messageHeader').innerHTML = "Success!";
                                document.getElementById('messageContent').innerHTML = "Bill created.";

                                $("#alertMessage").modal();

                                $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                            } else {

                                document.getElementById('messageHeader').innerHTML = "Error!";
                                document.getElementById('messageContent').innerHTML = d[2];

                                $("#alertMessage").modal();

                            }

                        },
                        error: function (err) {
                        }
                    });

                } else {
                    console.log("Process Is Canceled");
                }

            }
        });





    });


// --------------------------------------------------------------- Generate Group Bill Confirm Function --------------------------------------------------------------- //












// --------------------------------------------------------------- Generate Group Bill Cancel Function --------------------------------------------------------------- //


    $('#billDetailOrderDetailContent').off('click', '#viewBillGenereteBillDetailsGroupButtonRightDiv #btnViewBillGenereteBillDetailsGroupCancelBtn').on('click', '#viewBillGenereteBillDetailsGroupButtonRightDiv #btnViewBillGenereteBillDetailsGroupCancelBtn', function (e) {

        e.preventDefault();

        location.reload();

    });


// --------------------------------------------------------------- Generate Group Bill Cancel Function --------------------------------------------------------------- //








// ====================================================================== Bill Detail Order List Main Page ====================================================================== //






</script>