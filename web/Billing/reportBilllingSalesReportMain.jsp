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
                    <option value="0" selected="true">-- Select A Day --</option>
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
                    <option value="0" selected="true">-- Select A Month --</option>
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
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
                    <option value="0" selected="true">-- Select A Year --</option>
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

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

      
    });

</script>