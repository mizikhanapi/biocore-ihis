<%-- 
    Document   : dataAnaysisMain
    Created on : Apr 16, 2017, 5:04:52 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <title> Data Analysis</title>
        <%@include file = "../assets/header.html" %>
    </head>
    <body>
        <!-- side bar -->
        <%@ include file ="libraries/reportSideMenus.jsp" %>
        <!-- side bar -->
        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->

            <div class="container-fluid">
                <div class="row">      
                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h2 style="margin: 0px;"> Data Analysis </h2>
                            <hr class="pemisah" />
                            <div class="row">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">Category:</label>
                                        <div class="col-md-4">
                                            <select class="form-control" name="daType" id="daType">
                                                <option value="0" >Please Select</option>
                                                <!--                                        <option value="refferal" >outpatient referral source</option>-->
                                                <option value="list" >outpatient list</option>
                                                <option value="mix" >total outpatient list based on age, sex and race</option>
                                                <option value="patientreg" >patient registration</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="textinput">From:</label>
                                        <div class="form-inline col-md-4">
                                            <div class="form-group">
                                                <div class="col-md-4">
                                                    <input id="startDate" name="startDate" type="text" class="form-control datepicker" placeholder="YYYY/MM/DD" readonly>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-4 control-label" for="textinput">To:</label>
                                                <div class="col-md-4">
                                                    <input id="endDate" name="endDate" type="text" class="form-control datepicker" placeholder="" readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <hr/>

                            <div class="text-right">
                                <button id="clearSearch" name="clearSearch" type="clear" class="btn btn-link ">Clear</button>
                                <button type="submit" class="btn btn-success " role="button" id="dataReport">Generate Report</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>


    </body>
</html>

<script>

    $(document).ready(function () {

        $("#startDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
        });
        $("#endDate").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd',
        });
        $('#dataReport').on('click', function () {

            if ($('#startDate').val() === "" || $('#endDate').val() === " ") {
                //if the id/ic input is empty
                alert('Please choose date to prooceed');
            } else {

                var startDate = document.getElementById("startDate").value;
                var endDate = document.getElementById("endDate").value;
                var daType = document.getElementById("daType").value;


                console.log(startDate);
                console.log(endDate);
                console.log(daType);

                window.open("dataAnalysisReport.jsp?daType=" + daType + "&startDate=" + startDate + "&endDate=" + endDate);
            }

        });

        $('#dataChart').on('click', function () {

            var startDate = document.getElementById("startDate").value;
            var endDate = document.getElementById("endDate").value;
            var daType = document.getElementByID("daType").value;


            console.log(startDate);
            console.log(endDate);
            console.log(daType);

            window.open("chartquery.jsp?daType=" + daType + "&startDate=" + startDate + "&endDate=" + endDate);


        });
        $('#clearSearch').click(function () {
            $('#daType').prop('readonly', false);
            $('#startDate')[0].reset();
            $('#endDate')[0].reset();
        });


    });


</script>
