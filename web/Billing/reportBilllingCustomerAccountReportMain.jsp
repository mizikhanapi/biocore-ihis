<%-- 
    Document   : reportBilllingCustomerAccountReportMain
    Created on : Feb 23, 2018, 9:26:06 PM
    Author     : Shammugam
--%>

<%@page import="BILLING_helper.ReportBilling"%>
<%@page import="java.util.ArrayList"%>
<%

    ReportBilling rb = new ReportBilling();
    ArrayList<Integer> rangeList = new ArrayList<Integer>();
    rangeList = rb.getRange();

%>

<h2>ACCOUNT REPORT FOR CUSTOMER</h2>
<hr/>
<div class="form-horizontal" >

    <div class="form-group" >
        <label class="col-md-4 control-label">Patient IC No.</label>
        <div class="col-md-4" style="margin-bottom: 10px">
            <input id="billingReportAccountReportIC" type="text" class="form-control singleNumbersOnly" placeholder="IC No." maxlength="12">
        </div>
    </div>

    <div class="form-group" >
        <label class="col-md-4 control-label">Month</label>
        <div class="col-md-4" style="margin-bottom: 10px">
            <select id="billingReportAccountReportMonth" class="form-control" style="text-align:center;">
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
            <select id="billingReportAccountReportYear" class="form-control">
                <option value="-" selected="true">- Select a year -</option>
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

    <div class="text-center">
        <button id="billingReportAccountReportYearlyStatementBtn" class="btn btn-info" >Customer Account Statement</button>
        <button id="billingReportAccountReportDetailsStatementBtn" class="btn btn-info" >Customer Details Account Statement</button>
        <button id="billingReportAccountReportYearEndReportBtn" class="btn btn-info" >Year End Processing Report</button>
    </div>

</div>

<br>
<hr>
<br>

<div id="billingReportAccountReportGenerateReportForPrint" class="hidden">

</div>



<script type="text/javascript" charset="utf-8">

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


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


        // Function Customer Statement Start
        $('#reportBilllingCustomerAccountReportMainDIV').off('click', '#billingReportAccountReportYearlyStatementBtn').on('click', '#billingReportAccountReportYearlyStatementBtn', function (e) {

            var ic = document.getElementById('billingReportAccountReportIC').value;
            var year = document.getElementById('billingReportAccountReportYear').value;
            var month = document.getElementById('billingReportAccountReportMonth').value;

            console.log(ic);
            console.log(year);
            console.log(month);


            if (ic === "") {

                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please fill in patient IC No.";
                $("#alertMessage").modal();

            } else {

                var data = {
                    ic: ic
                };

                $.ajax({
                    url: "controllerProcessReport/reportBillingValidateCustomerIC.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        var d = datas.split("|");

                        if (d[1] === '1') {

                            $('<div class="loading">Loading</div>').appendTo('body');

                            $.ajax({
                                url: "controllerProcessReport/reportBillingAccountReportGetCustomerYearlyStatement.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000,
                                success: function (datas) {


                                    $('#billingReportAccountReportGenerateReportForPrint').html(datas);

                                    setTimeout(function () {


                                        var printDiv = $("#billingReportAccountReportGenerateReportForPrint").html().trim();

                                        var printWindow = window.open('', 'Customer Yearly Account Statement');

                                        printWindow.document.write('<html><head><title>Customer Yearly Account Statement</title>');
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

                        } else {

                            document.getElementById('messageHeader').innerHTML = "Failed!";
                            document.getElementById('messageContent').innerHTML = d[2];
                            $("#alertMessage").modal();

                        }

                    },
                    error: function (err) {

                        document.getElementById('messageHeader').innerHTML = "Error!";
                        document.getElementById('messageContent').innerHTML = "An error occur.\nPlease try again later.";
                        $("#alertMessage").modal();

                    }
                });
            }
        });
        // Function Customer Statement End



        // Function Customer Detail Statement Start
        $('#reportBilllingCustomerAccountReportMainDIV').off('click', '#billingReportAccountReportDetailsStatementBtn').on('click', '#billingReportAccountReportDetailsStatementBtn', function (e) {

            var ic = document.getElementById('billingReportAccountReportIC').value;
            var year = document.getElementById('billingReportAccountReportYear').value;
            var month = document.getElementById('billingReportAccountReportMonth').value;
            var monthString = $("#billingReportAccountReportMonth option:selected").text();

            console.log(ic);
            console.log(year);
            console.log(month);
            console.log(monthString);


            if (ic === "") {

                document.getElementById('messageHeader').innerHTML = "Warning!";
                document.getElementById('messageContent').innerHTML = "Please fill in patient IC No. !!!";
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
                    ic: ic,
                    month: month,
                    monthString: monthString,
                    year: year
                };

                $.ajax({
                    url: "controllerProcessReport/reportBillingValidateCustomerIC.jsp",
                    type: "post",
                    data: data,
                    timeout: 10000,
                    success: function (datas) {

                        var d = datas.split("|");

                        if (d[1] === '1') {

                            $('<div class="loading">Loading</div>').appendTo('body');

                            $.ajax({
                                url: "controllerProcessReport/reportBillingAccountReportGetCustomerDetailAccountStatement.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000,
                                success: function (datas) {


                                    $('#billingReportAccountReportGenerateReportForPrint').html(datas);

                                    setTimeout(function () {

                                        var printDiv = $("#billingReportAccountReportGenerateReportForPrint").html().trim();

                                        var printWindow = window.open('', 'Customer Detail Account Statement');

                                        printWindow.document.write('<html><head><title>Customer Detail Account Statemen</title>');
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

                        } else {

                            document.getElementById('messageHeader').innerHTML = "Failed!";
                            document.getElementById('messageContent').innerHTML = d[2];
                            $("#alertMessage").modal();

                        }
                    },
                    error: function (err) {

                        document.getElementById('messageHeader').innerHTML = "Error!";
                        document.getElementById('messageContent').innerHTML = "An error occur.\nPlease try again later.";
                        $("#alertMessage").modal();

                    }
                });
            }
        });
        // Function Customer Statement End



        // Function YER Statement Start
        $('#reportBilllingCustomerAccountReportMainDIV').off('click', '#billingReportAccountReportYearEndReportBtn').on('click', '#billingReportAccountReportYearEndReportBtn', function (e) {


            $.ajax({
                url: "controllerProcessReport/reportBillingAccountReportGetYearEndProcessing.jsp",
                type: "get",
                timeout: 10000,
                success: function (data) {

                    var d = data.split("|");

                    if (d[1] === '1') {

                        $('<div class="loading">Loading</div>').appendTo('body');

                        $.ajax({
                            url: "controllerProcessReport/reportBillingAccountGetYearEndProcessingReport.jsp",
                            type: "post",
                            data: data,
                            timeout: 10000,
                            success: function (datas) {


                                $('#billingReportAccountReportGenerateReportForPrint').html(datas);


                                setTimeout(function () {


                                    var printDiv = $("#billingReportAccountReportGenerateReportForPrint").html().trim();

                                    var printWindow = window.open('', 'Year End Processing Report');

                                    printWindow.document.write('<html><head><title>Year End Processing Report</title>');
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

                    } else {

                        document.getElementById('messageHeader').innerHTML = "Failed!";
                        document.getElementById('messageContent').innerHTML = d[2];
                        $("#alertMessage").modal();

                    }
                },
                error: function (err) {

                    document.getElementById('messageHeader').innerHTML = "Error!";
                    document.getElementById('messageContent').innerHTML = "An error occur.\nPlease try again later.";
                    $("#alertMessage").modal();

                }
            });

        });
        // Function YER Statement End


    });

</script>