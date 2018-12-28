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





<h4>Find completed order</h4>
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
    <jsp:include page="../RIS/libraries/dateSelect.jsp"/>
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
            <input type="text" id="DateFrom" class="form-control input-md Datepicker" placeholder="DD/MM/YYYY" readonly>
        </div>

        <label class="col-md-1 control-label" for="textinput">To</label>
        <div class="col-md-2">
            <input type="text" id="DateTo" class="form-control input-md Datepicker" placeholder="DD/MM/YYYY" readonly>
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
        $("#divDate").hide();
        $("#refreshbuttondiv").hide();
        destroyScreenLoading();

        $(function () {
            
//            $('#DateFrom').datepicker({
//                changeMonth: true,
//                changeYear: true,
//                dateFormat: 'dd/mm/yy',
//                yearRange: '1990:+0',
//                maxDate: '+0d'
//            });
//
//
//            //--- initialise datepicker for to after changes on from ------------
//            $('#DateFrom').on('change', function () {
//
//                $("#DateTo").datepicker("destroy");
//                $('#DateTo').val('');
//
//                var fromDate = $("#DateFrom").datepicker("getDate");
//
//                $('#DateTo').datepicker({
//                    changeMonth: true,
//                    changeYear: true,
//                    dateFormat: 'dd/mm/yy',
//                    yearRange: '1990:+0',
//                    minDate: fromDate,
//                    maxDate: '+0d'
//                });
//
//            });
        });


        $('#orderType').on('change', function () {
            if (this.value === '002' || this.value === '003')
            {
                $("#ic").show();
                $("#order_noText").hide();
                document.getElementById("order_no").value = "";
                $("#date").hide();
                $("#divDate").hide();
                document.getElementById("DateFrom").value = "";
                document.getElementById("DateTo").value = "";
            } else if (this.value === '004')
            {
                $("#order_noText").show();
                $("#ic").hide();
                document.getElementById("idIC").value = "";
                $("#date").hide();
                $("#divDate").hide();
                document.getElementById("DateFrom").value = "";
                document.getElementById("DateTo").value = "";
            } else if (this.value === '005')
            {
                $("#divDate").show();
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
        var DateTo,DateFrom,order_no,dateType;
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
            //var DateFrom1 = $("#DateFrom").datepicker("getDate");
             DateFrom = $("#OM_DateFrom").val();
            //var DateTo1 = $("#DateTo").datepicker("getDate");
             DateTo = $("#OM_DateTo").val();
             order_no = "";
             ic = "";
             dateType=$("#bydateSel").val();;
        }
        var data = {
            ic: ic,
            order_no: order_no,
            DateFrom: DateFrom,
            DateTo: DateTo,
            dateType: dateType
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
