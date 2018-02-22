<%-- 
    Document   : reportBilllingSalesReportMain
    Created on : Nov 27, 2017, 5:15:19 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="BILLING_helper.ReportBilling"%>
<%

    ReportBilling rb = new ReportBilling();
    ArrayList<Integer> rangeList = new ArrayList<Integer>();
    rangeList = rb.getRange();

%>

<div class="thumbnail">
    <h4>Sales Report</h4>
    <hr/>
    <div class="form-horizontal" >

        <div class="form-group" >
            <label class="col-md-4 control-label">Day</label>
            <div class="col-md-4" style="margin-bottom: 10px">
                <select id="billingReportAccountSalesReportDay" class="form-control">
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
                <select id="billingReportAccountSalesReportMonth" class="form-control">
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
                <select id="billingReportAccountSalesReportYear" class="form-control">
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

        <div class="text-center" style="margin-bottom: 10px">
            <button id="billingReportAccountSalesReportDailySalesBtn" class="btn btn-info" >Daily Sales Report</button>
            <button id="billingReportAccountSalesReportMonthlySalesBtn" class="btn btn-info" >Monthly Sales Report</button>
            <button id="billingReportAccountSalesReportYearlySalesBtn" class="btn btn-info" >Yearly Sales Report</button>
        </div>
    </div>
</div>


<div id="billingReportSalesReportGenerateReportForPrint" class="hidden">

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
        $('#reportBilllingSalesReportMainDIV').off('click', '#billingReportAccountSalesReportDailySalesBtn').on('click', '#billingReportAccountSalesReportDailySalesBtn', function (e) {

            var day = document.getElementById('billingReportAccountSalesReportDay').value;
            var month = document.getElementById('billingReportAccountSalesReportMonth').value;
            var year = document.getElementById('billingReportAccountSalesReportYear').value;
            var monthString = $("#billingReportAccountSalesReportMonth option:selected").text();

            console.log(day);
            console.log(year);
            console.log(month);
            console.log(monthString);


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

                $('<div class="loading">Loading</div>').appendTo('body');

                $.ajax({
                    url: "controllerProcessReport/reportBillingSalesReportGetDailySalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#billingReportSalesReportGenerateReportForPrint').html(datas);

                        setTimeout(function () {


                            var printDiv = $("#billingReportSalesReportGenerateReportForPrint").html().trim();

                            var printWindow = window.open('', 'Daily Sales Report');

                            printWindow.document.write('<html><head><title>Daily Sales Report</title>');
                            printWindow.document.write('</head><body >');
                            printWindow.document.write(printDiv);
                            printWindow.document.write('</body></html>');
                            printWindow.document.close();
                            printWindow.focus();
                            printWindow.print();
                            printWindow.close();

                            $('.loading').hide();


                        }, 1500);




                    },
                    error: function (err) {

                    }
                });


            }
        });
        // Function Daily Statement End



        // Function Monthly Statement Start
        $('#reportBilllingSalesReportMainDIV').off('click', '#billingReportAccountSalesReportMonthlySalesBtn').on('click', '#billingReportAccountSalesReportMonthlySalesBtn', function (e) {

            var day = document.getElementById('billingReportAccountSalesReportDay').value;
            var month = document.getElementById('billingReportAccountSalesReportMonth').value;
            var year = document.getElementById('billingReportAccountSalesReportYear').value;
            var monthString = $("#billingReportAccountSalesReportMonth option:selected").text();

            console.log(day);
            console.log(year);
            console.log(month);
            console.log(monthString);


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

                $('<div class="loading">Loading</div>').appendTo('body');

                $.ajax({
                    url: "controllerProcessReport/reportBillingSalesReportGetMonthlySalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#billingReportSalesReportGenerateReportForPrint').html(datas);

                        setTimeout(function () {


                            var printDiv = $("#billingReportSalesReportGenerateReportForPrint").html().trim();

                            var printWindow = window.open('', 'Monthly Sales Report');

                            printWindow.document.write('<html><head><title>Monthly Sales Report</title>');
                            printWindow.document.write('</head><body >');
                            printWindow.document.write(printDiv);
                            printWindow.document.write('</body></html>');
                            printWindow.document.close();
                            printWindow.focus();
                            printWindow.print();
                            printWindow.close();

                            $('.loading').hide();


                        }, 1500);




                    },
                    error: function (err) {

                    }
                });

            }
        });
        // Function Monthly Statement End



        // Function Yearly Statement Start
        $('#reportBilllingSalesReportMainDIV').off('click', '#billingReportAccountSalesReportYearlySalesBtn').on('click', '#billingReportAccountSalesReportYearlySalesBtn', function (e) {


            var day = document.getElementById('billingReportAccountSalesReportDay').value;
            var month = document.getElementById('billingReportAccountSalesReportMonth').value;
            var year = document.getElementById('billingReportAccountSalesReportYear').value;
            var monthString = $("#billingReportAccountSalesReportMonth option:selected").text();

            console.log(day);
            console.log(year);
            console.log(month);
            console.log(monthString);

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

                $('<div class="loading">Loading</div>').appendTo('body');

                $.ajax({
                    url: "controllerProcessReport/reportBillingSalesReportGetYearlySalesReport.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {


                        $('#billingReportSalesReportGenerateReportForPrint').html(datas);

                        setTimeout(function () {


                            var printDiv = $("#billingReportSalesReportGenerateReportForPrint").html().trim();

                            var printWindow = window.open('', 'Yearly Sales Report');

                            printWindow.document.write('<html><head><title>Yearly Sales Report</title>');
                            printWindow.document.write('</head><body >');
                            printWindow.document.write(printDiv);
                            printWindow.document.write('</body></html>');
                            printWindow.document.close();
                            printWindow.focus();
                            printWindow.print();
                            printWindow.close();

                            $('.loading').hide();


                        }, 1500);




                    },
                    error: function (err) {

                    }
                });

            }

        });
        // Function Yearly Statement End


    });

</script>