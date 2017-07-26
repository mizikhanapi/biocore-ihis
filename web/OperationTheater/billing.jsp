<%-- 
    Document   : billing
    Created on : May 1, 2017, 7:35:28 AM
    Author     : user
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<h4>Post Completed Order to Billing</h4>
<!-- tab content -->
<div class=" form-horizontal" align="center">


    <!-- Select Basic -->
    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">ID Type</label>
        <div class="col-md-4">
            <select id="orderType" name="orderType" class="form-control" >
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
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="idIC" name="idIC" placeholder="ID" >
        </div>


    </div>
    <div class="form-group" id="order_noText" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">Order No.</label>
        <div class="col-md-3">
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

    <div class="text-center">
        <button class="btn btn-primary" type="button" id="searchOrder" name="searchPatient"><i class="fa fa-search"></i>&nbsp; Search</button>

        <!--<button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>-->
    </div>


    <div id="viewBill" class="table-guling">
    </div>

</div>


<script>

    $(document).ready(function () {

        destroyScreenLoading();

        $(function () {
            $("#DateFrom").datepicker({
                dateFormat: 'yy-mm-dd',
                yearRange: '1999:c+1',
                changeMonth: true,
                changeYear: true,
                minDate: new Date(1999, 10 - 1, 25),
                maxDate: '+30Y'
            });

            $("#DateTo").datepicker({
                dateFormat: 'yy-mm-dd',
                yearRange: '1999:c+1',
                changeMonth: true,
                changeYear: true,
                minDate: new Date(1999, 10 - 1, 25),
                maxDate: '+30Y'
            });
        });


        $('#orderType').on('change', function () {
            if (this.value === '002' || this.value === '003')
            {
                $("#ic").show();
                $("#order_noText").hide();
                document.getElementById("order_no").value = "";
                $("#date").hide();
                document.getElementById("DateFrom").value = "";
                document.getElementById("DateTo").value = "";
            } else if (this.value === '004')
            {
                $("#order_noText").show();
                $("#ic").hide();
                document.getElementById("idIC").value = "";
                $("#date").hide();
                document.getElementById("DateFrom").value = "";
                document.getElementById("DateTo").value = "";
            } else if (this.value === '005')
            {
                $("#date").show();
                $("#ic").hide();
                document.getElementById("idIC").value = "";
                $("#order_noText").hide();
                document.getElementById("order_no").value = "";
            }
        });


        $("#searchOrder").click(function () {
            loadBillTable();
        });
    });

    function loadBillTable() {
        createScreenLoading();
        var orderType = $("#orderType").val();
        if (orderType === '002' || orderType === '003')
        {
            var ic = $("#idIC").val();
            var order_no = "";
            var DateFrom = "";
            var DateTo = "";
        } else if (orderType === '004')
        {
            var order_no = $("#order_no").val();
            var ic = "";
            var DateFrom = "";
            var DateTo = "";
        } else if (orderType === '005')
        {
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

        $.ajax({
            url: "billTo.jsp",
            type: "post",
            data: data,
            success: function (orderDetail) {

                $('#viewBill').html(orderDetail);
                //$('#viewBill').trigger('contentchanged');


            },
            error: function (err) {
                alert("Error update!");
            }
        });

    }


</script>
