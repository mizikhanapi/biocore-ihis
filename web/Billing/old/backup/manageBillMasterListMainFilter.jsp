<%-- 
    Document   : manageBillMasterListMainFilter
    Created on : Oct 24, 2017, 6:47:44 PM
    Author     : Shammugam
--%>
<div style="margin-bottom: 50px">
    <h4><b>MANAGE BILL</b></h4>
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
</div>


<script>


// ====================================================================== Bill Master Order List Page ====================================================================== //




// --------------------------------------------------------------- Status Button On Off --------------------------------------------------------------- //




    $('#manageBillMasterListMainFilterStatus a').on('click', function () {

        var sel = $(this).data('title');
        var tog = $(this).data('toggle');

        $('#' + tog).prop('value', sel);

        $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
        $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');

    });




// --------------------------------------------------------------- Status Button On Off --------------------------------------------------------------- //






// --------------------------------------------------------------- Load Data In Master Table --------------------------------------------------------------- //




    $('#manageBillMasterOrderListMain').off('click', '#manageBillMasterListMainFilterSearchBillBtn').on('click', '#manageBillMasterListMainFilterSearchBillBtn', function (e) {


        var ic = document.getElementById('manageBillMasterListMainFilterIC').value;
        var status = $('#manageBillMasterListMainFilterStatus a.active').html();
        status = String(status).toLowerCase();

        if (ic === "") {

            bootbox.alert("Please Insert The IC Number !!!");

        } else {

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
                    $('#manageBillMasterListMainFilterIC').val('');

                },
                error: function (jqXHR, textStatus, errorThrown) {

                    bootbox.alert('Opps! ' + errorThrown);

                },
                complete: function (jqXHR, textStatus) {

                    $('.loading').hide();

                }

            });


        }


    });




// --------------------------------------------------------------- Load Data In Master Table --------------------------------------------------------------- //





// ====================================================================== Bill Master Order List Page ====================================================================== //











// ====================================================================== Bill Detail Order List Page ====================================================================== //




// --------------------------------------------------------------- View Bill View Function --------------------------------------------------------------- //




    $('#manageBillMasterOrderListContent').off('click', '#manageBillMasterOrderListTable #manageBillViewBillDetailBtn').on('click', '#manageBillMasterOrderListTable #manageBillViewBillDetailBtn', function (e) {

        e.preventDefault();


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
        var status = $('#manageBillMasterListMainFilterStatus a.active').html();
        status = String(status).toLowerCase();

        var statusCheck = $('#dataManageBillMasterOrderListhiddenStatus').val();
        statusCheck = String(statusCheck).toLowerCase();


        if (status !== statusCheck) {
            bootbox.alert("Please Press Search Button As The Result Shown Is Not Valid For Your Preference !!!");
        } else {

            $('<div class="loading">Loading</div>').appendTo('body');

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
                url: "manageBillGenerateBillDetailUnpaidPaid.jsp",
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

        }

    });




// --------------------------------------------------------------- View Bill View Function --------------------------------------------------------------- //




// --------------------------------------------------------------- View Bill Cancel Function --------------------------------------------------------------- //




    $('#manageBillDetailOrderDetailContent').off('click', '#manageBillViewBillDetailsButtonRightDiv #manageBillViewBillDetailsCancelBtn').on('click', '#manageBillViewBillDetailsButtonRightDiv #manageBillViewBillDetailsCancelBtn', function (e) {

        e.preventDefault();

        location.reload();

    });




// --------------------------------------------------------------- View Bill Cancel Function --------------------------------------------------------------- //





// --------------------------------------------------------------- View Bill Delete Function --------------------------------------------------------------- //




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

        var dataDelete = {
            custID: custID,
            txtDateDel: txtDateDel,
            billNoDel: billNoDel,
            orderNoDel: orderNoDel,
            itemQtyDel: itemQtyDel,
            itemAmtDel: parseFloat(itemAmtDel).toFixed(2),
            itemCDDel: itemCDDel
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
                        url: "manageBillGenerateBillDetailUnpaidPaidDelete.jsp",
                        type: "post",
                        data: dataDelete,
                        timeout: 10000,
                        success: function (data) {

                            if (data.trim() === "Success") {

                                document.getElementById('messageHeader').innerHTML = "Success!";
                                document.getElementById('messageContent').innerHTML = "Item Deleted.";

                                $.ajax({
                                    url: "manageBillGenerateBillDetailUnpaidPaid.jsp",
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




// --------------------------------------------------------------- View Bill Delete Function --------------------------------------------------------------- //






// --------------------------------------------------------------- View Bill Add Function --------------------------------------------------------------- //




//   --------------------------   Comment   --------------------------   //
//    
//    This Function is define in manageBillMasterListMainFilter.jsp
//    
//   --------------------------   Comment   --------------------------   //




// --------------------------------------------------------------- View Bill Add Function --------------------------------------------------------------- //





// --------------------------------------------------------------- View Bill Payment Function --------------------------------------------------------------- //




//   --------------------------   Comment   --------------------------   //
//    
//    This Function is define in manageBillMasterListMainFilter.jsp
//    
//   --------------------------   Comment   --------------------------   //




// --------------------------------------------------------------- View Bill Payment Function --------------------------------------------------------------- //





// --------------------------------------------------------------- Single Number Only Restriction --------------------------------------------------------------- //



    $('.singleNumbersOnly').keyup(function () {
    if (this.value !== this.value.replace(/[^0-9]/g, '')) {
    this.value = this.value.replace(/[^0-9]/g, '');
    }
    });
    
    
    
// --------------------------------------------------------------- Single Number Only Restriction --------------------------------------------------------------- //






// ====================================================================== Bill Detail Order List Page ====================================================================== //






</script>