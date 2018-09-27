<%-- 
    Document   : WaitingTimeMain
    Created on : Sep 27, 2018, 1:43:02 AM
    Author     : user
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

    <h4> <b>Please Choose the "Year" Then Press The "Generate Report" Button</b> </h4>

    <select id="waitingTimeReportYear" class="form-control">
        <%                int size3 = rangeList.size();
            for (int i = 0; i < size3; i++) {
        %>
        <option value="<%= rangeList.get(i)%>"> <%= rangeList.get(i)%> </option>
        <%
            }
        %>
    </select>

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


        $('#reportWaitingTimeMainDIV').off('click', '#waitingTimeReportSearchDiv #waitingTimeReportBtn').on('click', '#waitingTimeReportSearchDiv #waitingTimeReportBtn', function (e) {

            $('<div class="loading">Loading</div>').appendTo('body');

            var reportYear = document.getElementById("waitingTimeReportYear").value;

            var data = {
                year: reportYear
            };

            $.ajax({
                type: "POST",
                url: "WaitingTimeTable.jsp",
                data: data,
                timeout: 60000,
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