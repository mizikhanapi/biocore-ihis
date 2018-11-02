<%-- 
    Document   : WaitingTimeConsultLaboratoryMain
    Created on : Oct 26, 2018, 11:48:40 PM
    Author     : Shammugam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<%@page import="BILLING_helper.ReportBilling"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%    ReportBilling rb = new ReportBilling();
    ArrayList<Integer> rangeList = new ArrayList<Integer>();
    rangeList = rb.getRange();

%>


<div style="width:50%;margin: auto;text-align: center;padding-top: 20px;padding-bottom: 20px;" id="waitingTimeReportSearchDiv">

    <h4> <b>Please Choose the The Preferred Filter. Insert the Required Details Then Press The "Generate Report" Button</b> </h4>

    <select id="waitingTimeReportFilter" class="form-control" style="text-align:center;">
        <option value="month">Month</option>
        <option value="date">Date</option>
    </select>


    <div id="waitingTimeReportMonthHolder"> 

        <select id="waitingTimeReportMonth" class="form-control" style="text-align:center;">
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

        <select id="waitingTimeReportYear" class="form-control" style="text-align:center;">
            <%                int size3 = rangeList.size();
                for (int i = 0; i < size3; i++) {
            %>
            <option value="<%= rangeList.get(i)%>"> <%= rangeList.get(i)%> </option>
            <%
                }
            %>
        </select>

    </div>


    <div id="waitingTimeReportDateHolder"> 

        <div class="form-horizontal">
            <div class="form-group">
                <label class="col-md-2 control-label" for="textinput">Start Date</label>
                <div class="col-md-4">
                    <input id="waitingTimeReportStartDate" name="startDate"  type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly>
                </div>
                <label class="col-md-2 control-label" for="textinput">To</label>
                <div class="col-md-4">
                    <input id="waitingTimeReportYearEndDate" name="endDate" type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly>
                </div>
            </div>
        </div>

    </div>

    <button id="waitingTimeReportBtn" type="submit" class="btn btn-success btn-block" >Generate Report</button><br>

</div>


<hr class="pemisah" />


<div id="WaitingTimeTableDiv" class="table-guling">
    <table class="table table-bordered" id="WaitingTimeTable" style="width: 100%">
        <thead>
        <th>Month</th>
        <th>PMI</th>
        <th>Patient Name</th>
        <th>Dr Name</th>
        <th>Nurse Name</th>
        <th>Duration (Minutes)</th>
        </thead>
        <tbody>
            <tr>
                <td colspan="6" align="center">No Record To Show<br>Please Generate The Report</td>
            </tr>
        </tbody>
    </table>
</div>


<script>

    $(document).ready(function () {

        $("#waitingTimeReportStartDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

        $("#waitingTimeReportYearEndDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'
        });

        $('#waitingTimeReportMonthHolder').show();
        $('#waitingTimeReportDateHolder').hide();


        $('#reportWaitingTimeMainDIV').off('change', '#waitingTimeReportSearchDiv #waitingTimeReportFilter').on('change', '#waitingTimeReportSearchDiv #waitingTimeReportFilter', function (e) {

            var filter = document.getElementById("waitingTimeReportFilter").value;

            if (filter === "date") {

                $('#waitingTimeReportMonthHolder').hide();
                $('#waitingTimeReportDateHolder').show();

            } else {

                $('#waitingTimeReportMonthHolder').show();
                $('#waitingTimeReportDateHolder').hide();

            }

        });


        $('#reportWaitingTimeMainDIV').off('click', '#waitingTimeReportSearchDiv #waitingTimeReportBtn').on('click', '#waitingTimeReportSearchDiv #waitingTimeReportBtn', function (e) {

            $('<div class="loading">Loading</div>').appendTo('body');

            var filter = document.getElementById("waitingTimeReportFilter").value;
            var reportMonth = document.getElementById("waitingTimeReportMonth").value;
            var reportYear = document.getElementById("waitingTimeReportYear").value;
            var startDate = document.getElementById("waitingTimeReportStartDate").value;
            var endDate = document.getElementById("waitingTimeReportYearEndDate").value;
            var monthString = $("#waitingTimeReportMonth option:selected").text();

            var temp = startDate.split("/");
            startDate = temp[2] + "-" + temp[1] + "-" + temp[0];

            temp = endDate.split("/");
            endDate = temp[2] + "-" + temp[1] + "-" + temp[0];
            
            var data = {
                filter: filter,
                month: reportMonth,
                year: reportYear,
                startDate: startDate,
                endDate: endDate,
                monthString: monthString
            };

            $.ajax({
                type: "POST",
                url: "WaitingTimeConsultLaboratoryTable.jsp",
                data: data,
                timeout: 10000000,
                success: function (list) {
                    $('#WaitingTimeTableDiv').html(list);
                },
                error: function (xhr, status, error) {
                    bootbox.alert("Oops! " + error);
                },
                complete: function (jqXHR, textStatus) {

                }
            });

        });


    });


</script>