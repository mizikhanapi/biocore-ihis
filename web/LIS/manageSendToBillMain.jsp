<%-- 
    Document   : manageSendToBillMain
    Created on : Jan 18, 2018, 8:15:19 PM
    Author     : Shammugam
--%>

<h4>Post Completed Order to Billing</h4>

<div class="form-horizontal" align="center">

    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">ID Type</label>
        <div class="col-md-4">

            <select id="orderType" name="orderType" class="form-control" required="">

                <option selected="" disabled="" value="-"> Please select ID type</option>
                <option value="002">IC No. (NEW)</option>
                <option value="003">IC No. (OLD)</option>
                <option value="004">Order No.</option>
                <option value="005">Date</option>

            </select>

        </div>
    </div>

    <!-- Text input-->
    <div class="form-group" id="ic" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">IC No. / ID No.</label>
        <div class="col-md-4">
            <input type="text" class="form-control input-md" id="idIC" name="idIC" placeholder="ID" >
        </div>

    </div>

    <!-- Text input-->
    <div class="form-group" id="order_noText" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">Order No.</label>
        <div class="col-md-4">
            <input type="text" class="form-control input-md" id="order_no" name="order_no" placeholder="Order No.">
        </div>

    </div>

    <div class="form-group" id="date" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">From</label>
        <div class="col-md-2">
            <input type="text" id="DateFrom" class="form-control input-md Datepicker" placeholder="YYYY-MM-DD">
        </div>

        <label class="col-md-1 control-label" for="textinput">To</label>
        <div class="col-md-2">
            <input type="text" id="DateTo" class="form-control input-md Datepicker" placeholder="YYYY-MM-DD">
        </div>

    </div>

    <!-- Text input-->
    <div class="text-center">

        <button class="btn btn-primary" type="button" id="searchOrder" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>
        <button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>

    </div>



    <hr class="pemisah">

    <div id="viewBill" class="table-guling">

    </div>



</div>



<script>

    $(document).ready(function () {


        $(function () {


            // Date From Datepicker Start
            $("#DateFrom").datepicker({
                dateFormat: 'yy-mm-dd',
                yearRange: '1999:c+1',
                changeMonth: true,
                changeYear: true,
                minDate: new Date(1999, 10 - 1, 25),
                maxDate: '+30Y'
            });
            // Date From Datepicker End


            // Date To Datepicker Start
            $("#DateTo").datepicker({
                dateFormat: 'yy-mm-dd',
                yearRange: '1999:c+1',
                changeMonth: true,
                changeYear: true,
                minDate: new Date(1999, 10 - 1, 25),
                maxDate: '+30Y'
            });
            // Date To Datepicker End


        });


        // Choose ID Type Based on Preference Start
        $('#orderType').on('change', function () {


            if (this.value === '002' || this.value === '003') {

                $("#ic").show();

                $("#order_noText").hide();
                document.getElementById("order_no").value = "";

                $("#date").hide();
                document.getElementById("DateFrom").value = "";
                document.getElementById("DateTo").value = "";

            } else if (this.value === '004') {

                $("#order_noText").show();

                $("#ic").hide();
                document.getElementById("idIC").value = "";

                $("#date").hide();
                document.getElementById("DateFrom").value = "";
                document.getElementById("DateTo").value = "";

            } else if (this.value === '005') {

                $("#date").show();

                $("#ic").hide();
                document.getElementById("idIC").value = "";

                $("#order_noText").hide();
                document.getElementById("order_no").value = "";

            }


        });
        // Choose ID Type Based on Preference End


        // Search Record Button Function Start
        $("#searchOrder").click(function () {
            loadBillTable();
        });
        // Search Record Button Function End



    });

    // Search Record Function Start
    function loadBillTable() {


        // Getting Variable
        var orderType = $("#orderType").val();

        // Getting Variable Value
        if (orderType === '002' || orderType === '003') {

            var ic = $("#idIC").val();

            var order_no = "";
            var DateFrom = "";
            var DateTo = "";

        } else if (orderType === '004') {

            var order_no = $("#order_no").val();

            var ic = "";
            var DateFrom = "";
            var DateTo = "";

        } else if (orderType === '005') {

            //var DateFrom = new Date($('#DateFrom').val());
            var DateFrom1 = $("#DateFrom").datepicker("getDate");
            var DateFrom = $.datepicker.formatDate("yy-mm-dd", DateFrom1);
            var DateTo1 = $("#DateTo").datepicker("getDate");
            var DateTo = $.datepicker.formatDate("yy-mm-dd", DateTo1);

            var order_no = "";
            var ic = "";

        }


        var data = {
            ic: ic,
            order_no: order_no,
            DateFrom: DateFrom,
            DateTo: DateTo
        };

        console.log(data);

        $.ajax({
            url: "controllerProcessSendToBilling/manageSendToBillDetail.jsp",
            type: "post",
            data: data,
            success: function (orderDetail) {

                $('#viewBill').html(orderDetail);


            },
            error: function (err) {
                alert("Error update!");
            }
        });

    }
    // Search Record Function End


</script>
