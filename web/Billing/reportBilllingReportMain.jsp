<%-- 
    Document   : reportBilllingReportMain
    Created on : Nov 27, 2017, 5:15:04 PM
    Author     : Shammugam
--%>
<%@page import="BILLING_helper.ReportBilling"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>


<%

    ReportBilling rb = new ReportBilling();
    ArrayList<Integer> rangeList = new ArrayList<Integer>();
    rangeList = rb.getRange();

%>

<div class="thumbnail">
    <h4>Account Report</h4>
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
                    <option value="00" selected="true">All Month</option>
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
                    <option value="0" selected="true">- Select a year -</option>
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
            <button id="billingReportAccountReportYearlyStatementBtn" class="btn btn-info" >Customer Yearly Account Statement</button>
            <button id="billingReportAccountReportDetailsStatementBtn" class="btn btn-info" >Customer Details Account Statement</button>
            <button id="billingReportAccountReportYearEndReportBtn" class="btn btn-info" >Year End Processing Report</button>
        </div>

    </div>
</div>


<script type="text/javascript" charset="utf-8">

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


    var contextPath = '<%=request.getContextPath()%>';

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


        // Function yearly Statement Start
        $('#reportBilllingReportMainDIV').off('click', '#billingReportAccountReportYearlyStatementBtn').on('click', '#billingReportAccountReportYearlyStatementBtn', function (e) {

            var ic = document.getElementById('billingReportAccountReportIC').value;
            var year = document.getElementById('billingReportAccountReportMonth').value;
            var month = document.getElementById('billingReportAccountReportYear').value;

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
                    success: function (data) {

                        var d = data.split("|");

                        if (d[1] === '1') {

                            var url = contextPath + "/PdfServlet?";
                            url += "&action=" + "yearlyStatement";
                            url += "&ic=" + ic;
                            url += "&year=" + year;
                            url += "&month=" + month;

                            var win = window.open(url, '_blank');
                            win.focus();

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
        // Function yearly Statement End


    });

</script>