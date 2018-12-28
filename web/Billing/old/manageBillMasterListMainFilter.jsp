<%-- 
    Document   : manageBillMasterListMainFilter
    Created on : Oct 24, 2017, 6:47:44 PM
    Author     : Shammugam
--%>
<h4><b>MANAGE BILL</b></h4>


<div style="width:50%; margin: auto;">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-md-3 control-label" for="textinput">Show Bill For : </label>
            <div class="col-md-3">
                <select class="form-control"  id="MANAGEBILL_MasterOrderRefreshSelect">
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
                <button id="MANAGEBILL_MasterOrderRefreshBtn" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
            </div>
        </div>

        <div class="form-group" id="MANAGEBILL_MasterOrderSelectAssessmentStartEnd">
            <div class="col-md-5">
                <label class="col-md-3 control-label" for="textinput">Start : </label>
                <div class="col-md-9">
                    <input type="text" class="form-control input-md" id="MANAGEBILL_MasterOrderSelectAssessmentStart" placeholder="14/06/2017" readonly>
                </div>
            </div>
            <div class="col-md-5">
                <label class="col-md-3 control-label" for="textinput">End : </label>
                <div class="col-md-9">
                    <input type="text" class="form-control input-md" id="MANAGEBILL_MasterOrderSelectAssessmentEnd" placeholder="14/06/2017" readonly>
                </div>
            </div>
        </div>

    </div>
</div>



<!--<div style="width:50%;margin: auto;">
    <form class="form-horizontal" name="manageBillMasterListMainFilterForm" id="manageBillMasterListMainFilterForm" autocomplete="off">
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Bill Status</label>
            <div class="col-sm-7 col-md-7" style="margin-bottom: 10px">
                <div class="input-group">
                    <div id="manageBillMasterListMainFilterStatus" class="btn-group">
                        <a class="btn btn-primary btn-sm active" data-toggle="status" data-title="U">UNPAID</a>
                        <a class="btn btn-primary btn-sm" data-toggle="status" data-title="P">PAID</a>
                    </div>
                </div>
            </div>
        </div>
                <div id="custom-search-input">
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">IC No.</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control input-md singleNumbersOnly" id="manageBillMasterListMainFilterIC" placeholder="IC No." maxlength="12">
                        </div>
                        <button class="btn btn-primary" type="button" id="manageBillMasterListMainFilterSearchBillBtn" name="manageBillMasterListMainFilterSearchBillBtn"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
                    </div>
                </div>
    </form>
</div>-->





<script>


// ====================================================================== Bill Master Order List Page ====================================================================== //




    // Disabling Start And End Date OnLoad
    $("#MANAGEBILL_MasterOrderSelectAssessmentStartEnd").hide();



// ---------------------------------------------------------------------------- Date ------------------------------------------------------------------------------------------- //



    // Date Functions Start
    // Date Picker For Initial Start
    $("#MANAGEBILL_MasterOrderSelectAssessmentStart").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    // Date Picker For Initial End


    // Date Picker For Final Start
    $('#MANAGEBILL_MasterOrderSelectAssessmentStart').on('change', function () {

        $("#MANAGEBILL_MasterOrderSelectAssessmentEnd").datepicker("destroy");

        $('#MANAGEBILL_MasterOrderSelectAssessmentEnd').val('');

        var fromDate = $("#MANAGEBILL_MasterOrderSelectAssessmentStart").datepicker("getDate");

        $('#MANAGEBILL_MasterOrderSelectAssessmentEnd').datepicker({
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





// ---------------------------------------------------------------------------- Date On Change ------------------------------------------------------------------------------------------- //



    // Load Date Input For Range Start
    $('#manageBillMasterOrderListMain').on('change', '#MANAGEBILL_MasterOrderRefreshSelect', function (e) {


        e.preventDefault();


        var process = $('#MANAGEBILL_MasterOrderRefreshSelect').val();


        if (process === "custom") {

            $("#MANAGEBILL_MasterOrderSelectAssessmentStartEnd").show();

        } else {

            $("#MANAGEBILL_MasterOrderSelectAssessmentStartEnd").hide();

        }


    });
    // Load Date Input For Range End



// ---------------------------------------------------------------------------- Date On Change ------------------------------------------------------------------------------------------- //






// --------------------------------------------------------------- Load Data In Master Table --------------------------------------------------------------- //



    // Load Master Table Start
    $('#manageBillMasterOrderListMain').off('click', '#MANAGEBILL_MasterOrderRefreshBtn').on('click', '#MANAGEBILL_MasterOrderRefreshBtn', function (e) {

        e.preventDefault();



        $('<div class="loading">Loading</div>').appendTo('body');


        var process = $('#MANAGEBILL_MasterOrderRefreshSelect').val();

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

            var strtDate = $('#MANAGEBILL_MasterOrderSelectAssessmentStart').val();
            var endDate = $('#MANAGEBILL_MasterOrderSelectAssessmentEnd').val();

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
            url: "manageBillMasterPatientListTable.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {

                $('#manageBillMasterOrderListContent').html(data);

            },
            error: function (jqXHR, textStatus, errorThrown) {

                bootbox.alert('Opps! ' + errorThrown);

            },
            complete: function (jqXHR, textStatus) {

                $('.loading').hide();

            }

        });

    });
    // Load Master Table End



// --------------------------------------------------------------- Load Data In Master Table --------------------------------------------------------------- //








// --------------------------------------------------------------- Load Data In Order List Table --------------------------------------------------------------- //



    // Load Order List Table Start
    $('#manageBillMasterOrderListContent').off('click', '#manageBillMasterPatientListTable #manageBillMasterListMainFilterSearchBillBtn').on('click', '#manageBillMasterPatientListTable #manageBillMasterListMainFilterSearchBillBtn', function (e) {

        e.preventDefault();


        var row = $(this).closest("tr");
        var rowData = row.find("#dataManageBillMasterOrderListhidden").val();
        var arrayData = rowData.split("|");

        var ic = arrayData[2];
        var status = $('#manageBillMasterListMainFilterStatus a.active').html();
        status = String(status).toLowerCase();


        $('#manageBillMasterOrderListContent').html('<div class="loading">Loading</div>');


        var data = {
            ic: ic,
            status: status
        };


        console.log(data);


        $.ajax({
            type: 'POST',
            url: "manageBillMasterOrderListTable.jsp",
            data: data,
            success: function (data) {

                $('#manageBillMasterOrderListContent').html(data);

            },
            error: function (jqXHR, textStatus, errorThrown) {

                bootbox.alert('Opps! ' + errorThrown);

            },
            complete: function (jqXHR, textStatus) {

                $('.loading').hide();

            }

        });





    });
    // Load Order List Table End



// --------------------------------------------------------------- Load Data In Order List Table --------------------------------------------------------------- //




// ====================================================================== Bill Master Order List Page ====================================================================== //













// ====================================================================== Bill Detail Order List Page ====================================================================== //




// --------------------------------------------------------------- View Bill View Function --------------------------------------------------------------- //



    // View Bill Detail Start
    $('#manageBillMasterOrderListContent').off('click', '#manageBillMasterOrderListTable #manageBillViewBillDetailBtn').on('click', '#manageBillMasterOrderListTable #manageBillViewBillDetailBtn', function (e) {

        e.preventDefault();


        $('<div class="loading">Loading</div>').appendTo('body');


        var row = $(this).closest("tr");
        var rowData = row.find("#dataManageBillMasterOrderListhidden").val();
        var arrayData = rowData.split("|");

        var custID = arrayData[1];
        var billNo = arrayData[0];
        var txtDate = arrayData[9];
        var pName = arrayData[2];
        var address = arrayData[5];
        var icNo = arrayData[3];
        var otherID = arrayData[4];
        var phoneNo = arrayData[6];
        var status = $('#dataManageBillMasterOrderListhiddenStatus').val();
        status = String(status).toLowerCase();


        var data = {
            billNo: billNo,
            txtDate: txtDate,
            custID: custID,
            pName: pName,
            address: address,
            icNo: icNo,
            otherID: otherID,
            phoneNo: phoneNo,
            status: status
        };


        console.log(data);


        $.ajax({
            url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaid.jsp",
            type: "post",
            data: data,
            timeout: 10000,
            success: function (data) {

                $('#manageBillDetailOrderDetailContent').html(data);

                $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                $('.loading').hide();

            },
            error: function (err) {
            }
        });



    });
    // View Bill Detail End



// --------------------------------------------------------------- View Bill View Function --------------------------------------------------------------- //




// --------------------------------------------------------------- View Bill Cancel Function --------------------------------------------------------------- //



    // Cancel Bill Detail Start
    $('#manageBillDetailOrderDetailContent').off('click', '#manageBillViewBillDetailsButtonRightDiv #manageBillViewBillDetailsCancelBtn').on('click', '#manageBillViewBillDetailsButtonRightDiv #manageBillViewBillDetailsCancelBtn', function (e) {

        e.preventDefault();


        location.reload();


    });
    // Cancel Bill Detail End



// --------------------------------------------------------------- View Bill Cancel Function --------------------------------------------------------------- //





// --------------------------------------------------------------- View Bill Delete Function --------------------------------------------------------------- //



    // Delete Bill Detail Start
    $('#manageBillDetailOrderDetailContent').off('click', '#tableItems #manageBillViewBillDetailsDeleteBtn').on('click', '#tableItems #manageBillViewBillDetailsDeleteBtn', function (e) {

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataManageBillDetailOrderListhidden").val();
        var arrayData = rowData.split("|");

        var txtDateDel = arrayData[0];
        var billNoDel = arrayData[6];
        var orderNoDel = arrayData[7];
        var itemCDDel = arrayData[1];
        var itemQtyDel = arrayData[3];
        var itemAmtDel = arrayData[5];

        var billNo = $('#billNo').val();
        var txtDate = $('#txnDate').val();
        var custID = $('#custID').val();
        var pName = $('#patientName').val();
        var address = $('#address').val();
        var icNo = $('#ic').val();
        var otherID = $('#otherID').val();
        var phoneNo = $('#phone').val();
        var status = $('#dataManageBillMasterOrderListhiddenStatus').val();

        var overallItmAmnt = $('#manageBillDetailOrderDetailGrandTotal').val();
        var overallQtyTtl = $('#manageBillDetailOrderDetailTotalQuantity').val();


        var dataDelete = {
            custID: custID,
            txtDateDel: txtDateDel,
            billNoDel: billNoDel,
            orderNoDel: orderNoDel,
            itemQtyDel: itemQtyDel,
            itemAmtDel: parseFloat(itemAmtDel).toFixed(2),
            itemCDDel: itemCDDel,
            overallItmAmnt: overallItmAmnt,
            overallQtyTtl: overallQtyTtl
        };


        var dataRefresh = {
            billNo: billNo,
            txtDate: txtDate,
            custID: custID,
            pName: pName,
            address: address,
            icNo: icNo,
            otherID: otherID,
            phoneNo: phoneNo,
            status: status
        };

        console.log(dataDelete);


        bootbox.confirm({
            message: "Are you sure want to delete this item ?",
            title: "Delete Item ?",
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
                        url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidDelete.jsp",
                        type: "post",
                        data: dataDelete,
                        timeout: 10000,
                        success: function (data) {


                            console.log(data);

                            if (data.trim() === "Success") {

                                document.getElementById('messageHeader').innerHTML = "Success!";
                                document.getElementById('messageContent').innerHTML = "Item Deleted.";

                                $.ajax({
                                    url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaid.jsp",
                                    type: "post",
                                    data: dataRefresh,
                                    timeout: 10000,
                                    success: function (data) {

                                        $('#manageBillDetailOrderDetailContent').html(data);
                                        $('.nav-tabs a[href="#tab_default_2"]').tab('show');
                                        $('.loading').hide();

                                    },
                                    error: function (err) {
                                    }
                                });

                                $("#alertMessage").modal();



                            } else {

                                document.getElementById('messageHeader').innerHTML = "Error!";
                                document.getElementById('messageContent').innerHTML = "Failed to delete the item.";

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
    // Delete Bill Detail End



// --------------------------------------------------------------- View Bill Delete Function --------------------------------------------------------------- //






// --------------------------------------------------------------- View Bill Add Function --------------------------------------------------------------- //




//   --------------------------   Comment   --------------------------   //
//    
//    This Function is define in manageBillGenerateBillDetailUnpaidPaid.jsp
//    
//   --------------------------   Comment   --------------------------   //




// --------------------------------------------------------------- View Bill Add Function --------------------------------------------------------------- //






// --------------------------------------------------------------- View Bill Payment Function --------------------------------------------------------------- //




//   --------------------------   Comment   --------------------------   //
//    
//    This Function is define in manageBillGenerateBillDetailUnpaidPaid.jsp
//    
//   --------------------------   Comment   --------------------------   //




// --------------------------------------------------------------- View Bill Payment Function --------------------------------------------------------------- //






// --------------------------------------------------------------- Back Data In Master Table --------------------------------------------------------------- //



    // Load Master Table Start
    $('#manageBillMasterOrderListContent').off('click', '#manageBillMasterOrderListButtonRightDiv #manageBillMasterOrderListButtonRightDivBackBtn').on('click', '#manageBillMasterOrderListButtonRightDiv #manageBillMasterOrderListButtonRightDivBackBtn', function (e) {

        e.preventDefault();



        $('<div class="loading">Loading</div>').appendTo('body');


        var process = $('#MANAGEBILL_MasterOrderRefreshSelect').val();

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

            var strtDate = $('#MANAGEBILL_MasterOrderSelectAssessmentStart').val();
            var endDate = $('#MANAGEBILL_MasterOrderSelectAssessmentEnd').val();

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
            url: "manageBillMasterPatientListTable.jsp",
            data: data,
            success: function (data, textStatus, jqXHR) {

                $('#manageBillMasterOrderListContent').html(data);

            },
            error: function (jqXHR, textStatus, errorThrown) {

                bootbox.alert('Opps! ' + errorThrown);

            },
            complete: function (jqXHR, textStatus) {

                $('.loading').hide();

            }

        });



    });
    // Load Master Table End



// --------------------------------------------------------------- Back Data In Master Table --------------------------------------------------------------- //







// --------------------------------------------------------------- Single Number Only Restriction --------------------------------------------------------------- //



    // Single Number Restriction Start
    $('.singleNumbersOnly').keyup(function () {


        if (this.value !== this.value.replace(/[^0-9]/g, '')) {

            this.value = this.value.replace(/[^0-9]/g, '');

        }


    });
    // Single Number Restriction End



// --------------------------------------------------------------- Single Number Only Restriction --------------------------------------------------------------- //






// ====================================================================== Bill Detail Order List Page ====================================================================== //






</script>