<%-- 
    Document   : reportBilllingItemSalesReportMain
    Created on : Feb 22, 2018, 9:39:49 AM
    Author     : Shammugam
--%>

<%@page import="BILLING_helper.ReportBilling"%>
<%@page import="java.util.ArrayList"%>
<%

    ReportBilling rb = new ReportBilling();
    ArrayList<Integer> rangeList = new ArrayList<Integer>();
    rangeList = rb.getRange();

%>

<div class="form-horizontal" >

    <div class="form-group" >
        <label class="col-md-4 control-label">Day</label>
        <div class="col-md-4" style="margin-bottom: 10px">
            <select id="billingReportItemSalesReportDay" class="form-control">
                <option value="-" selected="true">-- Select A Day --</option>
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
            </select>
        </div>
    </div>

    <div class="form-group" >
        <label class="col-md-4 control-label">Month</label>
        <div class="col-md-4" style="margin-bottom: 10px">
            <select id="billingReportItemSalesReportMonth" class="form-control">
                <option value="-" selected="true">-- Select A Month --</option>
                <option value="01">January</option>
                <option value="02">February</option>
                <option value="03">March</option>
                <option value="04">April</option>
                <option value="05">May</option>
                <option value="06">June</option>
                <option value="07">July</option>
                <option value="08">August</option>
                <option value="09">September</option>
                <option value="10">October</option>
                <option value="11">November</option>
                <option value="12">December</option>
            </select>
        </div>
    </div>

    <div class="form-group" >
        <label class="col-md-4 control-label">Year</label>
        <div class="col-md-4" style="margin-bottom: 10px">
            <select id="billingReportItemSalesReportYear" class="form-control">
                <option value="-" selected="true">-- Select A Year --</option>
                <%                        int size3 = rangeList.size();
                    for (int i = 0; i < size3; i++) {
                %>
                <option value="<%= rangeList.get(i)%>"> <%= rangeList.get(i)%> </option>
                <%
                    }
                %>
            </select>
        </div>
    </div>

    <div class="text-right" style="margin-bottom: 10px;width: 100%;">
        <button id="billingReportItemSalesReportDailySalesBtn" class="btn btn-default" >Daily Sales Report</button>
        <button id="billingReportItemSalesReportMonthlySalesBtn" class="btn btn-default" >Monthly Sales Report</button>
        <button id="billingReportItemSalesReportYearlySalesBtn" class="btn btn-default" >Yearly Sales Report</button>
    </div>
</div>

<br>
<hr>
<br>

<div id="reportBilllingItemSalesReportTableDIV">

    <table class="table table-bordered" id="reportBilllingItemSalesReportTable" style="width: 100%">
        <thead>
        <th width="10%">No.</th>
        <th width="20%">Item Code</th>
        <th width="50%">Item Name</th>
        <th width="15%">Quantity</th>
        <th width="15%">Total Sales</th>
        </thead>
        <tbody>
            <tr>
                <td colspan="5" align="center">Please Select Correct Filter And Press The Preferred Search Button</td>
            </tr> 
        </tbody>
    </table>

</div>

<script type="text/javascript" charset="utf-8">


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



//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


        // Function Daily Statement Start
        $('#reportBilllingItemSalesReportMainDIV').off('click', '#billingReportItemSalesReportDailySalesBtn').on('click', '#billingReportItemSalesReportDailySalesBtn', function (e) {

            var day = document.getElementById('billingReportItemSalesReportDay').value;
            var month = document.getElementById('billingReportItemSalesReportMonth').value;
            var year = document.getElementById('billingReportItemSalesReportYear').value;
            var monthString = $("#billingReportItemSalesReportMonth option:selected").text();


            if (day === "-") {

                document.getElementById('messageHeader').innerHTML = "Information";
                document.getElementById('messageContent').innerHTML = "Please select statement day";
                $("#alertMessage").modal();

            } else if (month === "-") {

                document.getElementById('messageHeader').innerHTML = "Information";
                document.getElementById('messageContent').innerHTML = "Please select statement Month";
                $("#alertMessage").modal();

            } else if (year === "-") {

                document.getElementById('messageHeader').innerHTML = "Information";
                document.getElementById('messageContent').innerHTML = "Please select statement Year";
                $("#alertMessage").modal();

            } else {


                var data = {
                    day: day,
                    month: month,
                    monthString: monthString,
                    year: year
                };

                console.log(data);

                $('<div class="loading">Loading</div>').appendTo('body');

                $.ajax({
                    url: "controllerProcessReport/reportBillingSalesReportGetDailyItemSalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#reportBilllingItemSalesReportTableDIV').html(datas);
                        $('.loading').hide();


                    },
                    error: function (err) {

                    }
                });


            }
        });
        // Function Daily Statement End



        // Function Daily Statement Start
        $('#reportBilllingItemSalesReportMainDIV').off('click', '#billingReportItemSalesReportMonthlySalesBtn').on('click', '#billingReportItemSalesReportMonthlySalesBtn', function (e) {

            var day = document.getElementById('billingReportItemSalesReportDay').value;
            var month = document.getElementById('billingReportItemSalesReportMonth').value;
            var year = document.getElementById('billingReportItemSalesReportYear').value;
            var monthString = $("#billingReportItemSalesReportMonth option:selected").text();


            if (month === "-") {

                document.getElementById('messageHeader').innerHTML = "Information";
                document.getElementById('messageContent').innerHTML = "Please select statement Month";
                $("#alertMessage").modal();

            } else if (year === "-") {

                document.getElementById('messageHeader').innerHTML = "Information";
                document.getElementById('messageContent').innerHTML = "Please select statement Year";
                $("#alertMessage").modal();

            } else {


                var data = {
                    day: day,
                    month: month,
                    monthString: monthString,
                    year: year
                };

                console.log(data);

                $('<div class="loading">Loading</div>').appendTo('body');

                $.ajax({
                    url: "controllerProcessReport/reportBillingSalesReportGetMonthlyItemSalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#reportBilllingItemSalesReportTableDIV').html(datas);
                        $('.loading').hide();


                    },
                    error: function (err) {

                    }
                });


            }
        });
        // Function Daily Statement End



        // Function Daily Statement Start
        $('#reportBilllingItemSalesReportMainDIV').off('click', '#billingReportItemSalesReportYearlySalesBtn').on('click', '#billingReportItemSalesReportYearlySalesBtn', function (e) {

            var day = document.getElementById('billingReportItemSalesReportDay').value;
            var month = document.getElementById('billingReportItemSalesReportMonth').value;
            var year = document.getElementById('billingReportItemSalesReportYear').value;
            var monthString = $("#billingReportItemSalesReportMonth option:selected").text();


            if (year === "-") {

                document.getElementById('messageHeader').innerHTML = "Information";
                document.getElementById('messageContent').innerHTML = "Please select statement Year";
                $("#alertMessage").modal();

            } else {


                var data = {
                    day: day,
                    month: month,
                    monthString: monthString,
                    year: year
                };

                console.log(data);

                $('<div class="loading">Loading</div>').appendTo('body');

                $.ajax({
                    url: "controllerProcessReport/reportBillingSalesReportGetYearlyItemSalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#reportBilllingItemSalesReportTableDIV').html(datas);
                        $('.loading').hide();


                    },
                    error: function (err) {

                    }
                });


            }
        });
        // Function Daily Statement End


    });

</script>