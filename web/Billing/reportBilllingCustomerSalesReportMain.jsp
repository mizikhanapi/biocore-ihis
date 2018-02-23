<%-- 
    Document   : reportBilllingCustomerSalesReportMain
    Created on : Feb 23, 2018, 8:28:26 PM
    Author     : Shammugam
--%>

<%@page import="BILLING_helper.ReportBilling"%>
<%@page import="java.util.ArrayList"%>
<%

    ReportBilling rb = new ReportBilling();
    ArrayList<Integer> rangeList = new ArrayList<Integer>();
    rangeList = rb.getRange();

%>

<h2>SALES REPORT BY CUSTOMER</h2>
<hr/>
<div class="form-horizontal" >

    <div class="form-group" >
        <label class="col-md-4 control-label">Day</label>
        <div class="col-md-4" style="margin-bottom: 10px">
            <select id="billingReportCustomerSalesReportDay" class="form-control">
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
            <select id="billingReportCustomerSalesReportMonth" class="form-control">
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
            <select id="billingReportCustomerSalesReportYear" class="form-control">
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

    <div class="text-center" style="margin-bottom: 10px;width: 100%;">
        <button id="billingReportCustomerSalesReportDailySalesBtn" class="btn btn-info" >Daily Sales Report</button>
        <button id="billingReportCustomerSalesReportMonthlySalesBtn" class="btn btn-info" >Monthly Sales Report</button>
        <button id="billingReportCustomerSalesReportYearlySalesBtn" class="btn btn-info" >Yearly Sales Report</button>
    </div>
</div>

<br>
<hr>
<br>

<div id="reportBilllingCustomerSalesReportTableDIV">

    <table class="table table-bordered" id="reportBilllingCustomerSalesReportTable" style="width: 100%">
        <thead>
        <th width="10%">No.</th>
        <th width="20%">PMI NO</th>
        <th width="50%">Name</th>
        <th width="15%">Quantity</th>
        <th width="15%">Total Sales</th>
        </thead>
        <tbody>
            <tr>
                <td colspan="5" align="center">No Record To Show<br>Please Select Correct Filter And Press The Preferred Search Button</td>
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
        $('#reportBilllingCustomerSalesReportMainDIV').off('click', '#billingReportCustomerSalesReportDailySalesBtn').on('click', '#billingReportCustomerSalesReportDailySalesBtn', function (e) {

            var day = document.getElementById('billingReportCustomerSalesReportDay').value;
            var month = document.getElementById('billingReportCustomerSalesReportMonth').value;
            var year = document.getElementById('billingReportCustomerSalesReportYear').value;
            var monthString = $("#billingReportCustomerSalesReportMonth option:selected").text();


            if (day === "-") {

                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please select statement day !!!";
                $("#alertMessage").modal();

            } else if (month === "-") {

                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please select statement Month !!!";
                $("#alertMessage").modal();

            } else if (year === "-") {

                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please select statement Year !!!";
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
                    url: "controllerProcessReport/reportBillingSalesReportGetDailyCustomerSalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#reportBilllingCustomerSalesReportTableDIV').html(datas);
                        $('.loading').hide();


                    },
                    error: function (err) {

                    }
                });


            }
        });
        // Function Daily Statement End



        // Function Daily Statement Start
        $('#reportBilllingCustomerSalesReportMainDIV').off('click', '#billingReportCustomerSalesReportMonthlySalesBtn').on('click', '#billingReportCustomerSalesReportMonthlySalesBtn', function (e) {

            var day = document.getElementById('billingReportCustomerSalesReportDay').value;
            var month = document.getElementById('billingReportCustomerSalesReportMonth').value;
            var year = document.getElementById('billingReportCustomerSalesReportYear').value;
            var monthString = $("#billingReportCustomerSalesReportMonth option:selected").text();


            if (month === "-") {

                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please select statement Month !!!";
                $("#alertMessage").modal();

            } else if (year === "-") {

                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please select statement Year !!!";
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
                    url: "controllerProcessReport/reportBillingSalesReportGetMonthlyCustomerSalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#reportBilllingCustomerSalesReportTableDIV').html(datas);
                        $('.loading').hide();


                    },
                    error: function (err) {

                    }
                });


            }
        });
        // Function Daily Statement End



        // Function Daily Statement Start
        $('#reportBilllingCustomerSalesReportMainDIV').off('click', '#billingReportCustomerSalesReportYearlySalesBtn').on('click', '#billingReportCustomerSalesReportYearlySalesBtn', function (e) {

            var day = document.getElementById('billingReportCustomerSalesReportDay').value;
            var month = document.getElementById('billingReportCustomerSalesReportMonth').value;
            var year = document.getElementById('billingReportCustomerSalesReportYear').value;
            var monthString = $("#billingReportCustomerSalesReportMonth option:selected").text();


            if (year === "-") {

                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please select statement Year !!!";
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
                    url: "controllerProcessReport/reportBillingSalesReportGetYearlyCustomerSalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#reportBilllingCustomerSalesReportTableDIV').html(datas);
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