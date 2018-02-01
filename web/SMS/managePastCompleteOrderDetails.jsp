<%-- 
    Document   : managePastCompleteOrderDetails
    Created on : Feb 1, 2018, 3:42:51 PM
    Author     : Shammugam
--%>

<h4>Basic Info</h4>
<!--    <hr/>-->
<form class="form-horizontal" id="OD_patientForm">
    <div class="row">
        <div class="col-md-6">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">User ID.</label>
                <div class="col-md-7">
                    <input id="requestorUserID" name="patientpmino" type="text" placeholder="" readonly class="form-control input-md">
                </div>
            </div>

        </div>

        <div class="col-md-6">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Name</label>
                <div class="col-md-7">
                    <input id="requestorName" name="patientName" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>


        </div>
    </div>
</form>

<hr/>

<h4>
    Request Info
</h4>
<!--<hr/>-->
<form class="form-horizontal" id="OD_orderForm">
    <div class="row">

        <div class="col-md-6">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order No.</label>
                <div class="col-md-7">
                    <input id="OD_orderNo" type="text" placeholder=" " readonly class="form-control input-md">   
                </div>
            </div>

        </div>


        <div class="col-md-6">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-3 control-label" for="textinput">Order Date</label>
                <div class="col-md-7">
                    <input id="OD_orderDate" type="text" readonly placeholder="" class="form-control input-md">
                </div>
            </div>

        </div>

    </div>
</form>
<!--<hr/>-->
<h4>
    Order Detail
</h4>


<div id="risManageOrderDetailsListTableDiv" class="form-group table-guling">
    <table class="table table-bordered table-striped" style="width: 100%" >
        <thead>
            <tr>
                <th >Item Code</th>
                <th >Item Name</th>
                <th >Ordered Qty</th>
                <th >Released Qty</th>
                <th >Comment</th>
            </tr>
        </thead>
        <tbody id="OD_orderDetailTableBody">

        </tbody>
    </table>
</div>

<hr/>
<div class="text-left"> 
    <button class="btn btn-default " type="button" id="OD_btnClear" > <i class="fa fa-arrow-circle-left fa-lg"></i>&nbsp; Back &nbsp;</button>
</div>

<script>


    function OD_getOrderDetail(orderNo) {

        $.ajax({
            type: 'POST',
            timeout: 60000,
            url: "controllerProcessPastOrder/managePastCompleteOrderGetOrder.jsp",
            data: {orderNo: orderNo},
            success: function (data, textStatus, jqXHR) {

                $('#OD_orderDetailTableBody').html(data);

            },
            error: function (jqXHR, textStatus, errorThrown) {

                console.log("Error: " + errorThrown);

            },
            complete: function (jqXHR, textStatus) {

                $('.loading').hide();

            }
        });

    }

    $(function () {

        $('#OD_btnClear').on('click', function () {

            $('.nav-tabs a[href="#tab_default_1"]').tab('show');
            $('#OD_patientForm')[0].reset();
            $('#OD_orderForm')[0].reset();
            $('#OD_orderDetailTableBody').html("");

        });



    });

</script>